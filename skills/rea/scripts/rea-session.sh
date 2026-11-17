#!/usr/bin/env bash
set -euo pipefail

REA_VERSION="${REA_VERSION:-6.9.0}"
REA_WORK_ROOT="${TMPDIR:-/tmp}"
REA_WORK_ROOT="${REA_WORK_ROOT%/}/rea-ephemeral"

node_supports_rea() {
  local bin="$1"
  [[ -x "$bin" ]] || return 1
  local ver major minor patch
  ver="$("$bin" -p 'process.versions.node' 2>/dev/null || true)"
  [[ "$ver" =~ ^([0-9]+)\.([0-9]+)\.([0-9]+) ]] || return 1
  major="${BASH_REMATCH[1]}"
  minor="${BASH_REMATCH[2]}"
  patch="${BASH_REMATCH[3]}"
  if (( major == 22 && (minor > 23 || (minor == 23 && patch >= 4)) )); then return 0; fi
  if (( major == 24 && (minor > 22 || (minor == 22 && patch >= 1)) )); then return 0; fi
  if (( major == 26 && (minor > 12 || (minor == 12 && patch >= 1)) )); then return 0; fi
  if (( major > 26 )); then return 0; fi
  return 1
}

resolve_node_bin_dir() {
  local candidates=()
  [[ -x "/opt/homebrew/bin/node" ]] && candidates+=("/opt/homebrew/bin/node")
  [[ -x "/usr/local/bin/node" ]] && candidates+=("/usr/local/bin/node")
  command -v node >/dev/null 2>&1 && candidates+=("$(command -v node)")
  for d in "$HOME"/.local/share/fnm/node-versions/*/installation/bin/node "$HOME"/.nvm/versions/node/*/bin/node; do
    [[ -x "$d" ]] && candidates+=("$d")
  done

  local c
  for c in "${candidates[@]}"; do
    if node_supports_rea "$c"; then
      dirname "$c"
      return 0
    fi
  done
  return 1
}

has_real_java() {
  if [[ -x "/opt/homebrew/opt/openjdk/bin/java" ]]; then
    "/opt/homebrew/opt/openjdk/bin/java" -version >/dev/null 2>&1 && return 0
  fi
  if [[ -x "/usr/local/opt/openjdk/bin/java" ]]; then
    "/usr/local/opt/openjdk/bin/java" -version >/dev/null 2>&1 && return 0
  fi
  command -v java >/dev/null 2>&1 && java -version >/dev/null 2>&1
}

detect_ghidra_dir() {
  if [[ -n "${GHIDRA_INSTALL_DIR:-}" && -x "${GHIDRA_INSTALL_DIR}/support/analyzeHeadless" ]]; then
    printf '%s\n' "$GHIDRA_INSTALL_DIR"
    return 0
  fi
  local g
  for g in /opt/homebrew/Caskroom/ghidra/*/*/support/analyzeHeadless /usr/local/Caskroom/ghidra/*/*/support/analyzeHeadless /Applications/ghidra*/support/analyzeHeadless; do
    if [[ -x "$g" ]]; then
      dirname "$(dirname "$g")"
      return 0
    fi
  done
  if command -v ghidraRun >/dev/null 2>&1; then
    local gr
    gr="$(python3 -c 'import os,sys; print(os.path.realpath(sys.argv[1]))' "$(command -v ghidraRun)" 2>/dev/null || true)"
    if [[ -n "$gr" && -x "$(dirname "$gr")/support/analyzeHeadless" ]]; then
      dirname "$gr"
      return 0
    fi
  fi
  return 1
}

wire_environment() {
  local node_dir
  if ! node_dir="$(resolve_node_bin_dir)"; then
    printf 'ERROR: No compatible Node.js found (REA requires ^22.23.4 || ^24.22.1 || >=26.12.1).\n' >&2
    printf 'INSTALL_NODE_CMD: brew install node\n' >&2
    exit 2
  fi
  export PATH="${node_dir}:/opt/homebrew/bin:/usr/local/bin:${PATH}"

  if [[ -d "/opt/homebrew/opt/openjdk/libexec/openjdk.jdk/Contents/Home" ]]; then
    export JAVA_HOME="${JAVA_HOME:-/opt/homebrew/opt/openjdk/libexec/openjdk.jdk/Contents/Home}"
    export PATH="/opt/homebrew/opt/openjdk/bin:${PATH}"
  elif [[ -d "/usr/local/opt/openjdk/libexec/openjdk.jdk/Contents/Home" ]]; then
    export JAVA_HOME="${JAVA_HOME:-/usr/local/opt/openjdk/libexec/openjdk.jdk/Contents/Home}"
    export PATH="/usr/local/opt/openjdk/bin:${PATH}"
  fi

  local ghidra_dir
  if ghidra_dir="$(detect_ghidra_dir)"; then
    export GHIDRA_INSTALL_DIR="$ghidra_dir"
  fi
}

classify_target() {
  local target="$1"
  local lower
  lower="$(printf '%s' "$target" | tr '[:upper:]' '[:lower:]')"

  if [[ "$lower" =~ ^https?:// ]]; then
    printf 'web-url\n'
    return
  fi
  if [[ "$lower" == *.har || "$lower" == *.saz ]]; then
    printf 'web-capture\n'
    return
  fi
  if [[ "$lower" == *.asar ]]; then
    printf 'javascript-electron\n'
    return
  fi
  if [[ -d "$target" ]]; then
    if [[ "$lower" == *.app ]]; then
      if [[ -e "$target/Contents/Resources/app.asar" || -d "$target/Contents/Resources/app" ]]; then
        printf 'electron-macos-app\n'
      else
        printf 'native-macos-app\n'
      fi
      return
    fi
    if [[ -f "$target/package.json" ]] || compgen -G "$target/*.js" >/dev/null 2>&1; then
      printf 'javascript-electron\n'
      return
    fi
    printf 'directory-artifact\n'
    return
  fi

  case "$lower" in
    *.apk|*.aab|*.dex) printf 'android-apk\n'; return ;;
    *.ipa) printf 'ios-ipa\n'; return ;;
    *.wasm) printf 'wasm\n'; return ;;
    *.pcap|*.pcapng|*.cap) printf 'pcap\n'; return ;;
    *.pck|*.bundle|*.wxapkg) printf 'game-or-miniapp-archive\n'; return ;;
    global-metadata.dat) printf 'unity-il2cpp\n'; return ;;
    *.gguf|*.safetensors) printf 'model-artifact\n'; return ;;
    *.sqlite|*.sqlite3|*.db) printf 'sqlite\n'; return ;;
    *.ips) printf 'apple-ips-crash\n'; return ;;
    *.uf2|*.dfu|*.hex|*.itb|*.uimage) printf 'firmware\n'; return ;;
    *.js|*.mjs|*.cjs|*.map) printf 'javascript-electron\n'; return ;;
  esac

  if [[ -f "$target" ]]; then
    local fdesc
    fdesc="$(file -b "$target" 2>/dev/null || true)"
    if [[ "$fdesc" == *"Mono/.Net assembly"* || "$fdesc" == *".Net assembly"* ]]; then
      printf 'dotnet-assembly\n'
      return
    fi
    if [[ "$fdesc" == *"Mach-O"* || "$fdesc" == *"ELF"* || "$fdesc" == *"PE32"* ]]; then
      printf 'native-binary\n'
      return
    fi
  fi

  printf 'generic-artifact\n'
}

cmd_preflight() {
  local target="${1:-}"
  if [[ -z "$target" ]]; then
    printf 'Usage: rea-session.sh preflight <target-path-or-url>\n' >&2
    exit 1
  fi

  wire_environment
  local node_ver tclass
  node_ver="$(node -v)"
  tclass="$(classify_target "$target")"

  local brew_formulae=()
  local brew_casks=()
  local zero_install="inspect-artifact"
  local deep_cmds=""
  local notes=""

  case "$tclass" in
    javascript-electron|electron-macos-app)
      zero_install="analyze-javascript-application, audit-release-exposure, inspect-electron-fuses"
      notes="Built-in static JS/Electron parser; zero external apps needed."
      ;;
    web-url|web-capture)
      zero_install="analyze-web-bundle, export-web-scripts, capture-browser-scenario"
      if [[ ! -d "/Applications/Google Chrome.app" ]] && ! command -v google-chrome >/dev/null 2>&1 && ! command -v chromium >/dev/null 2>&1; then
        brew_casks+=("google-chrome")
      fi
      notes="Uses local Chrome-family browser for live web capture; HAR analysis is offline."
      ;;
    android-apk)
      zero_install="inspect-apk-signature, identify-flutter-build, inspect-android-jni-bindings, inspect-artifact"
      deep_cmds="inspect-android-package, inspect-android-class, inspect-android-method, decode-android-resources"
      has_real_java || brew_formulae+=("openjdk")
      command -v jadx >/dev/null 2>&1 || brew_formulae+=("jadx")
      command -v apktool >/dev/null 2>&1 || brew_formulae+=("apktool")
      notes="Signature/Flutter/JNI work immediately; Java/Kotlin decompilation & XML decoding need openjdk + jadx + apktool."
      ;;
    ios-ipa|native-macos-app|native-binary)
      zero_install="inspect-macho, inspect-binary-hardening, inspect-go-binary, inspect-rust-binary, demangle-swift, decode-interface-builder, inspect-asset-catalog"
      deep_cmds="analyze --provider ghidra, decompile --procedure <name>, function --procedure <name>, execute-rizin-command"
      local has_decompiler=false
      if detect_ghidra_dir >/dev/null 2>&1 || [[ -d "/Applications/Hopper Disassembler v4.app" ]] || [[ -d "/Applications/Hopper Disassembler.app" ]] || command -v idat64 >/dev/null 2>&1 || command -v ida64 >/dev/null 2>&1; then
        has_decompiler=true
      fi
      if [[ "$has_decompiler" == false ]]; then
        has_real_java || brew_formulae+=("openjdk")
        brew_casks+=("ghidra")
      fi
      command -v rizin >/dev/null 2>&1 || brew_formulae+=("rizin")
      notes="Headers/Swift/Go/Rust/hardening work immediately; function pseudocode decompilation uses Ghidra (or Hopper/IDA) + Rizin."
      ;;
    dotnet-assembly|unity-il2cpp|game-or-miniapp-archive|model-artifact|sqlite|apple-ips-crash)
      zero_install="inspect-managed-artifact, inspect-managed-members, inspect-il2cpp-metadata, inspect-artifact, inspect-model-artifact, inspect-sqlite-database, inspect-apple-ips"
      notes="100% built-in static parser; zero external apps needed."
      ;;
    wasm)
      zero_install="inspect-artifact"
      deep_cmds="inspect-wasm-artifact, compare-wasm-interfaces"
      command -v wasm2wat >/dev/null 2>&1 || brew_formulae+=("wabt")
      notes="Decoded WAT & interface analysis require WABT (wasm2wat)."
      ;;
    pcap)
      zero_install="inspect-pcap-client"
      deep_cmds="inspect-pcap-capture, inspect-packet-capture"
      if ! command -v tshark >/dev/null 2>&1 || ! command -v capinfos >/dev/null 2>&1; then
        brew_formulae+=("wireshark")
      fi
      notes="Packet & TLS/DNS summary requires TShark + capinfos (Wireshark CLI)."
      ;;
    firmware)
      zero_install="inspect-artifact, extract-artifact, inspect-firmware-regions"
      deep_cmds="extract-firmware"
      command -v binwalk >/dev/null 2>&1 || brew_formulae+=("binwalk")
      notes="ESP/UF2/HEX/FIT/uImage work built-in; generic firmware carving uses binwalk."
      ;;
    *)
      zero_install="inspect-artifact, audit-release-exposure"
      notes="Run inspect-artifact first to identify nested containers or binaries."
      ;;
  esac

  printf 'NODE_RUNTIME=%s (%s)\n' "$(command -v node)" "$node_ver"
  printf 'REA_PACKAGE=rea-agents@%s\n' "$REA_VERSION"
  printf 'TARGET=%s\n' "$target"
  printf 'TARGET_CLASS=%s\n' "$tclass"
  printf 'READY_NOW_COMMANDS=%s\n' "$zero_install"
  [[ -n "$deep_cmds" ]] && printf 'DEEP_ANALYSIS_COMMANDS=%s\n' "$deep_cmds"
  [[ -n "${GHIDRA_INSTALL_DIR:-}" ]] && printf 'GHIDRA_INSTALL_DIR=%s\n' "$GHIDRA_INSTALL_DIR"

  local install_parts=()
  if (( ${#brew_formulae[@]} > 0 )); then
    install_parts+=("brew install ${brew_formulae[*]}")
  fi
  if (( ${#brew_casks[@]} > 0 )); then
    install_parts+=("brew install --cask ${brew_casks[*]}")
  fi

  if (( ${#install_parts[@]} == 0 )); then
    printf 'MISSING_PREREQUISITES=none\n'
    printf 'INSTALL_CMD=none\n'
  else
    printf 'MISSING_PREREQUISITES=%s\n' "${brew_formulae[*]:-} ${brew_casks[*]:-}"
    local joined=""
    local p
    for p in "${install_parts[@]}"; do
      if [[ -z "$joined" ]]; then joined="$p"; else joined="$joined && $p"; fi
    done
    printf 'INSTALL_CMD=%s\n' "$joined"
  fi
  printf 'NOTES=%s\n' "$notes"
}

cmd_run() {
  wire_environment
  mkdir -p "$REA_WORK_ROOT"
  local run_dir
  run_dir="$(mktemp -d "${REA_WORK_ROOT}/run-XXXXXX")"
  (
    cd "$run_dir"
    npx --yes "rea-agents@${REA_VERSION}" "$@"
  )
  local status=$?
  rm -rf "$run_dir"
  return $status
}

cmd_cleanup() {
  rm -rf "$REA_WORK_ROOT"
  printf 'Cleaned temporary REA directory: %s\n' "$REA_WORK_ROOT"
}

sub="${1:-}"
shift || true
case "$sub" in
  preflight) cmd_preflight "$@" ;;
  run) cmd_run "$@" ;;
  cleanup) cmd_cleanup ;;
  *)
    printf 'Usage:\n' >&2
    printf '  rea-session.sh preflight <target-path-or-url>\n' >&2
    printf '  rea-session.sh run <rea-command> [args...]\n' >&2
    printf '  rea-session.sh cleanup\n' >&2
    exit 1
    ;;
esac
