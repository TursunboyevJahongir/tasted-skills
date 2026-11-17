# `REA` (`morluto/rea` — Reverse Engineer Anything)

[🇺🇿 O'zbekcha](../../developer-tools/rea.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/developer-tools/rea.md)

- **Source:** [morluto/rea](https://github.com/morluto/rea) · [rea.tools](https://rea.tools/) · [`rea-agents` (npm)](https://www.npmjs.com/package/rea-agents)
- **Category:** `Developer Tools` *(Reverse Engineering Closed-Source Apps, APKs, Electron `.asar`s & Native Binaries)*
- **Type:** `Standalone CLI + On-Demand Skill` ([`skills/rea`](../../../skills/rea/SKILL.md)) *(MCP server disabled)*
- **Quality Score:** **9.0 / 10**
- **Need for Us:** **3.5 / 10**
- **Recommended Scope:** `On-Demand CLI + Lightweight Global rea Wrapper Skill` *(never install as global MCP)*
- **Reviewed Date:** `2026-11-17`
- **Current Status:** `👍 Good Option` *(no permanent MCP registered; runs temporarily via our `rea` skill only when explicitly signaled, checking and installing target-specific prerequisites first)*

---

## 1. What It Is and How It Works

> [!IMPORTANT]
> **In Plain Words (Main Job & Value):** Opens up **closed-source third-party apps, Electron `.asar` bundles, minified web bundles, Android `.apk`s, and native binaries without source code** to explain how a feature works with cryptographic evidence. Because its default MCP server dumps `~75,000+` tokens of tool schemas into chat context, we never register its MCP globally — instead, our lightweight [`rea`](../../../skills/rea/SKILL.md) wrapper runs it **temporarily at `0` idle token cost** only when you explicitly signal `"rea"`.

`morluto/rea` (`npm: rea-agents@6.9.0`, `MIT`) is a comprehensive local reverse-engineering CLI and MCP server written in TypeScript:
- **Zero-dependency built-in static parsers:** Reconstructs Electron `.asar` and JS bundle module/IPC/route graphs (`analyze-javascript-application`), audits release builds for leaked `.map`/`.dSYM`/debug companions (`audit-release-exposure`), and inspects `.NET` CIL (`inspect-managed-members`), `Go`/`Rust` binaries, Android `APK` signatures, `Flutter` / `Unity IL2CPP` (`global-metadata.dat`), `Godot .pck`, `Mach-O`/`ELF`/`PE` hardening flags (`inspect-binary-hardening`), `SQLite`, and `GGUF`/`safetensors`.
- **Deep decompilation via external engines:** Decompiles Android `.apk` Java/Kotlin classes & XML resources (`jadx` + `openjdk` + `apktool`), recovers native C/C++/Swift pseudocode & call graphs (`Ghidra`, `Hopper`, `IDA Pro`, or `Rizin`), decodes `WASM` (`wabt`), and summarizes `.pcap` captures (`wireshark`/`tshark`).
- Every operation emits a SHA-256-authenticated **`Evidence` (`evidence_id`, `coverage`, `limitations`, `unknowns`)** record so the agent cites verified binary/static facts instead of guessing.

---

## 2. Strengths and Weaknesses

### Strengths
- `0` telemetry and `0` cloud uploads — 100% of static and provider analysis executes locally on your machine.
- Exceptional when studying how a shipped third-party desktop/mobile/web app implements a feature or protocol so you can build a clean room version in your own project.
- `audit-release-exposure` quickly verifies what an attacker could recover from your own built artifacts before release.

### Weaknesses and Cost (Why Global MCP Registration Is Forbidden)
- **Massive MCP context tax (`~75,000+` tokens):** Running `npx rea-agents setup` or enabling `.claude-plugin` / `.codex-plugin` advertises **`200+` MCP tools across 45+ families** — even with output schemas turned off and `compact` input schemas, `tools/list` weighs `~300 KB` (**`~75,000+` tokens**). Its upstream skill bundle also carries `~10.7 KB` (`SKILL.md`) + **`~198 KB` (`~50,000` tokens)** in `references/`.
- **Heavy package & strict Node floor:** Unpacked `rea-agents@6.9.0` weighs **`189.6 MB` (`10,585` files)** and strictly requires `Node.js ^22.23.4 || ^24.22.1 || >=26.12.1` (rejecting e.g. `Node 24.20.0`).
- **Large raw outputs:** Full application Evidence JSON can reach `10–300 MB` and must be written to `/tmp` and paged with `inspect-analysis-view` rather than printed directly to stdout.

---

## 3. Security & Our On-Demand Wrapper ([`skills/rea`](../../../skills/rea/SKILL.md))

- **Risk Level:** `Low–Medium` *(static parsers do not execute target code; dynamic `capture-*`/`Frida` workflows run targets with user permissions)*
- **How we sanitized and automated it:**
  1. **Skipped upstream MCP & `200 KB` skill bundle:** `npx rea-agents setup` is never executed -> **`0` permanent token overhead** in daily sessions.
  2. **Built [`skills/rea`](../../../skills/rea/SKILL.md) + [`rea-session.sh`](../../../skills/rea/scripts/rea-session.sh):**
     - Triggers **only** when explicitly invoked (`"rea"`, `"/rea"`, `"rea bilan tekshir"`).
     - **`preflight` gate:** Automatically selects a compatible Node runtime (`v26.12.1+` / `v24.22.1+`), wires Homebrew `openjdk` (`JAVA_HOME`) and `GHIDRA_INSTALL_DIR`, classifies the target (`Electron .asar`, `Web URL`, `Android .apk`, `Native Mach-O/ELF/PE`, `.wasm`, `.pcap`), and identifies exact missing Homebrew prerequisites (`brew install openjdk jadx apktool` or `brew install --cask ghidra` / `rizin`) to install before starting deep analysis.
     - **Isolated `run` & `cleanup`:** Executes inside `/tmp/rea-ephemeral` outside target directories and cleans up temporary artifacts once finished.

---

## 4. Fit & Compatibility with Our Existing Stack

| Task | Tool to Use |
|---|---|
| **Architecture & navigation in our own source repositories** | [**`graphify`**](../architecture/graphify.md) (`0`-token AST blueprint, saves `~10x–20x` tokens) — never `REA` |
| **Pre-PR / pre-release security review of our own code** | [**`security-audit`**](../backend/security-audit-skill.md) + [**`Shannon` (`hacker-test`)**](../backend/shannon.md) |
| **Inspecting closed-source `.asar` / `.apk` / binaries without source code** | **`REA` (temporarily via our `rea` skill)** |

---

## 5. When to Use (and When Not To)

- **When to use:** Investigating how a shipped third-party desktop, mobile, or web app implements a feature/protocol without source code, or checking your own production bundle via `audit-release-exposure`.
- **When not to use:** Everyday coding, debugging, or architecture exploration inside repositories where full source code is already available.

---

## 6. Status & Action History

| Date | Action | Status | Notes |
|---|---|---|---|
| 2026-11-17 | Source, MCP schema (`~75K` tok), and CLI audit + custom `rea` wrapper skill | `👍 Good Option` | Rejected global MCP; created & globally synced `skills/rea/SKILL.md` + `scripts/rea-session.sh` (live-tested target `preflight`, Node 26 auto-selection, Mach-O analysis, and `/tmp` cleanup). |
