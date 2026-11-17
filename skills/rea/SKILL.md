---
name: rea
description: >
  On-demand reverse engineering of closed-source apps, Electron `.asar` bundles,
  minified web bundles, Android `.apk`s, `.NET` / Unity `IL2CPP` / Flutter builds,
  macOS/Linux/Windows native binaries, firmware, and `.pcap` captures using
  `morluto/rea` (`rea-agents`) temporarily with zero permanent MCP context bloat.
  Automatically checks the target type first and installs required helper apps
  (`jadx`, `apktool`, `openjdk`, `ghidra`, `rizin`, `wabt`, `wireshark`) when
  needed before starting inspection. Trigger ONLY when the user explicitly says
  "rea", "/rea", "$rea", "rea bilan tekshir", or asks to reverse engineer a
  compiled binary/APK/bundle without source code.
license: MIT
---

# REA (Temporary On-Demand Reverse Engineering Workflow)

Use [morluto/rea](https://github.com/morluto/rea) (`npm: rea-agents`) **strictly on demand** through `scripts/rea-session.sh` so daily coding sessions pay **`0` tokens** instead of REA's default `~75,000+`-token (`200+`-tool) MCP schema catalog.

> **Scope boundary:** Skip `rea` when you already have the project's full source repository — use `graphify`, `ripgrep`, and `security-audit` instead. Use `rea` for **shipped/compiled artifacts without source code** (`.asar`, `.apk`, `.ipa`, `.app`, `Mach-O`/`ELF`/`PE`, minified web bundles, `.dll`, `IL2CPP`, `.wasm`, `.pcap`) or pre-release artifact exposure checks (`audit-release-exposure`).

Locate `REA_SESSION` relative to this `SKILL.md` (`<skill-dir>/scripts/rea-session.sh`). Always pass **absolute target paths** because `rea-session.sh run` executes inside an isolated `/tmp/rea-ephemeral` directory outside the target folder.

---

## 1. Mandatory Guardrails

1. **NEVER register global MCP (`npx rea-agents setup` is forbidden):** Never add unfiltered `rea` to global `~/.claude.json`, `~/.codex/config.toml`, or Antigravity MCP config.
2. **Static-first on untrusted targets:** Prefer static commands (`inspect-*`, `analyze-javascript-application`, `decompile`, `extract-artifact`). Never run dynamic execution commands (`capture-process`, `capture-electron-scenario`, `Frida`) on suspicious/unknown binaries without explicit user approval or VM isolation.
3. **Save large Evidence to `/tmp`, project summaries to stdout:** Full JS/Android/native Evidence JSON can reach `10–300 MB`. Never dump raw giant JSON into chat context — write `--evidence_output /tmp/rea-out.json` (or redirect `> /tmp/rea-out.json`) and inspect compact slices with `inspect-analysis-view`.

---

## 2. Step-by-Step Ephemeral Workflow

### Step 1: Target Preflight & Prerequisite App Installation

Before running analysis, always run `preflight` against the target path or URL:

```bash
bash "<skill-dir>/scripts/rea-session.sh" preflight "/absolute/path/to/target"
```

`preflight` automatically:
1. Selects a compatible Node runtime (`^22.23.4 || ^24.22.1 || >=26.12.1`, e.g. `/opt/homebrew/bin/node` even when `fnm`/`nvm` defaults to an older minor);
2. Wires Homebrew `openjdk` (`JAVA_HOME`) and `GHIDRA_INSTALL_DIR` automatically if installed;
3. Classifies the target and outputs `READY_NOW_COMMANDS`, `MISSING_PREREQUISITES`, and `INSTALL_CMD`.

**Act on `MISSING_PREREQUISITES` according to what the investigation needs:**
- **`MISSING_PREREQUISITES=none`** (e.g., Electron `.asar`, JS bundles, `.NET`, Unity `IL2CPP`, Godot `.pck`, `GGUF`, SQLite, APK signature/Flutter check, or tools already installed) -> start Step 2 immediately.
- **External decompiler/decoder needed for the user's question** (`INSTALL_CMD` is non-empty):
  - **Android `.apk` Java/Kotlin classes, methods & XML resources:** `brew install openjdk jadx apktool`
  - **Native `Mach-O` / `ELF` / `PE` function pseudocode & CFG:** `brew install openjdk rizin && brew install --cask ghidra` *(or lightweight `brew install rizin` alone if only disassembly/CFG is needed, or existing Hopper/IDA if present)*
  - **WASM (`.wasm`):** `brew install wabt`
  - **Network packets (`.pcap` / `.pcapng`):** `brew install wireshark`
  - **Generic firmware carving:** `brew install binwalk`
  - State which target-specific tool(s) are missing, install them via Homebrew (asking brief confirmation first if installing heavy casks like `ghidra`), re-run `preflight` to verify `MISSING_PREREQUISITES=none`, and proceed to Step 2.

---

### Step 2: Run Target-Specific Inspection (`rea-session.sh run`)

Pick the smallest command that answers the question:

- **Universal first look (any unknown file, archive, installer, or bundle):**
  ```bash
  bash "<skill-dir>/scripts/rea-session.sh" run inspect-artifact "/abs/path/target" --json
  ```
- **Electron app (`.app/Contents/Resources/app.asar` or extracted JS) & Web Bundles:**
  ```bash
  # Reconstruct modules, Electron preload/IPC boundaries, and routes (save big graph to /tmp)
  bash "<skill-dir>/scripts/rea-session.sh" run analyze-javascript-application "/abs/path/app.asar" --json > /tmp/rea-js.json
  jq -nc '{source:{kind:"evidence-file",path:"/tmp/rea-js.json"},view:{kind:"summary"}}' | \
    bash "<skill-dir>/scripts/rea-session.sh" run inspect-analysis-view -

  # Live website script recovery & bundle analysis
  bash "<skill-dir>/scripts/rea-session.sh" run analyze-web-bundle "https://example.com" --json > /tmp/rea-web.json

  # Check our own release build for leaked .map / .dSYM / internal routes
  bash "<skill-dir>/scripts/rea-session.sh" run audit-release-exposure "/abs/path/dist" --json
  ```
- **Android `.apk`:**
  ```bash
  # Zero-dependency checks (instant)
  bash "<skill-dir>/scripts/rea-session.sh" run inspect-apk-signature "/abs/path/app.apk" --json
  bash "<skill-dir>/scripts/rea-session.sh" run identify-flutter-build "/abs/path/app.apk" --json

  # Decoded AndroidManifest + resources (apktool) & Java/Kotlin decompilation (jadx + openjdk)
  bash "<skill-dir>/scripts/rea-session.sh" run decode-android-resources "/abs/path/app.apk" --json > /tmp/rea-apk-res.json
  bash "<skill-dir>/scripts/rea-session.sh" run inspect-android-package "/abs/path/app.apk" --json > /tmp/rea-apk-pkg.json
  bash "<skill-dir>/scripts/rea-session.sh" run inspect-android-class "/abs/path/app.apk" --class "com.example.MainActivity" --json
  bash "<skill-dir>/scripts/rea-session.sh" run inspect-android-method "/abs/path/app.apk" --class "com.example.MainActivity" --method "onCreate" --json
  ```
- **macOS / iOS / Linux / Windows Native Binaries (`Mach-O`, `ELF`, `PE`):**
  ```bash
  # Fast built-in static inspection (0 external tools)
  bash "<skill-dir>/scripts/rea-session.sh" run inspect-macho "/abs/path/binary" --json
  bash "<skill-dir>/scripts/rea-session.sh" run inspect-binary-hardening "/abs/path/binary" --json
  bash "<skill-dir>/scripts/rea-session.sh" run inspect-go-binary "/abs/path/binary" --json
  bash "<skill-dir>/scripts/rea-session.sh" run inspect-rust-binary "/abs/path/binary" --json

  # Deep function overview & pseudocode decompilation (Ghidra / Hopper / Rizin)
  bash "<skill-dir>/scripts/rea-session.sh" run analyze "/abs/path/binary" --provider ghidra --json > /tmp/rea-native.json
  bash "<skill-dir>/scripts/rea-session.sh" run decompile "/abs/path/binary" --provider ghidra --procedure "main" --json
  ```
- **`.NET` DLL/EXE & Unity `IL2CPP`:**
  ```bash
  bash "<skill-dir>/scripts/rea-session.sh" run inspect-managed-members "/abs/path/Assembly.dll" --detail summary --evidence_output /tmp/rea-dotnet.json --json
  bash "<skill-dir>/scripts/rea-session.sh" run inspect-il2cpp-metadata "/abs/path/global-metadata.dat" --binary "/abs/path/GameAssembly.dylib" --detail summary --evidence_output /tmp/rea-il2cpp.json --json
  ```

*(Tip: Run `bash "<skill-dir>/scripts/rea-session.sh" run <command> --help` anytime to check exact flags for any of REA's 120+ CLI commands).*

---

### Step 3: Optional Temporary Scoped MCP (Only for Multi-Turn Native Decompilation)

95% of investigations finish faster via Step 2 CLI calls. If a complex native reverse-engineering session genuinely needs an interactive persistent Ghidra/Hopper session over MCP:
1. Register MCP **temporarily** with mandatory hot/cold + narrow family scoping (keeps context under `~1.5K` tokens instead of `~75K+`):
   - `REA_MCP_TOOL_CATALOG_PROFILE=hot-cold`
   - `REA_MCP_TOOL_FAMILIES=session,application,enhanced,direct` *(or `android,apktool,session`)*
2. **Mandatory teardown:** As soon as the reverse-engineering task completes, remove the temporary MCP server entry from client config so normal coding chats stay `0`-overhead.

---

### Step 4: Evidence-Backed Report & Cleanup

1. Report findings clearly in plain language, citing concrete `evidence_id`s, recovered modules/functions, and any explicit `limitations` or `unknowns` returned by REA.
2. Delete temporary `/tmp` Evidence bundles and run cleanup when finished:
   ```bash
   rm -f /tmp/rea-*.json
   bash "<skill-dir>/scripts/rea-session.sh" cleanup
   ```
