# `skillshare`

[🇺🇿 O'zbekcha](../../developer-tools/skillshare.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/developer-tools/skillshare.md)

- **Source:** [runkids/skillshare](https://github.com/runkids/skillshare)
- **Category:** `Developer Tools` *(Skill, Plugin, Agent & MCP Synchronization and Security Auditing)*
- **Type:** `CLI + Global Skill`
- **Quality Score:** **9.5 / 10**
- **Need for Us:** **10.0 / 10**
- **Recommended Scope:** `Global CLI + Global Skill (-g)`
- **Reviewed Date:** `2026-11-15`
- **Current Status:** `✅ In Active Use` *(central manager for skills across all our AI coding agents)*

---

## 1. What It Is and How It Works

A CLI tool that manages and distributes skills, agents, hooks, plugins, and MCP configurations across multiple AI coding agents (**Claude Code**, **Codex**, **Antigravity**, **Cursor**, etc.) from a **single source directory (`~/.config/skillshare/`)**:
- `skillshare install` / `link` / `sync -g` — installs a skill once and automatically symlinks (or copies) it into every configured agent target directory.
- **`skillshare audit` (built-in Skill-Check / Security Scanner)** — single Go binary that scans 6 analyzers (`static`, `dataflow`, `tier`, `integrity`, `structure`, `cross-skill`) in `~0.1s` for prompt injection, hidden bidirectional Unicode, data exfiltration, malicious install commands, and cross-skill trigger collisions (`text`, `json`, `sarif`, `markdown` outputs). Crucially, it **runs automatically during `skillshare install`** and blocks `CRITICAL` findings on the spot.
- `skillshare analyze` — measures always-loaded and on-demand token/context cost per agent target.

---

## 2. Strengths and Weaknesses

### Strengths
- Eliminates manual copy-pasting and version drift across `~/.claude`, `~/.codex`, `~/.agents`, and `~/.gemini`.
- **Built-in Skill-Check (`audit`) + backup/trash recovery:** Combining `skillshare audit` with direct AI-agent source-code inspection covers daily security vetting cleanly without needing heavy standalone Python/LLM scanners like [`SkillSpector`](skillspector.md).

### Weaknesses and Limitations
- Interactive commands must be invoked with `--no-tui` or `--json` when called from non-interactive agent shells so they do not hang waiting for TUI input.

---

## 3. Security & Operating Rules

- **Risk Level:** `Low`
- **Mandatory operating rules:**
  1. Run `skillshare audit <name> -g --format json` and preview with `skillshare sync -g --dry-run` before syncing new or modified skills globally.
  2. Never blindly bypass audit blocks with `--force` without inspecting the flagged lines first.
  3. Use `skillshare uninstall` / `unlink` instead of raw `rm -rf` so uninstalled skills remain recoverable via `skillshare trash`.

---

## 4. Fit & Compatibility with Our Existing Stack

All of our global skills (including `tasted-skills`) are synced across 5 agent targets via `skillshare` — it is the backbone of our multi-agent customization setup.

---

## 5. When to Use (and When Not To)

- **When to use:** Installing, removing, auditing, measuring token footprint, and syncing skills/plugins/MCP configs across AI coding agents.

---

## 6. Status & Action History

| Date | Action | Status | Notes |
|---|---|---|---|
| 2026-11-15 | Documented as core skill management infrastructure | `✅ In Active Use` | Actively used in global mode to audit and sync 5 agent targets (`antigravity`, `antigravity-cli`, `claude`, `codex`, `codex-local`). |
