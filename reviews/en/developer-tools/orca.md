# `Orca` (`stablyai/orca`) + Multi-Agent Orchestration

[🇺🇿 O'zbekcha](../../developer-tools/orca.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/developer-tools/orca.md)

- **Source:** [stablyai/orca](https://github.com/stablyai/orca) · [orca.dev](https://orca.dev)
- **Category:** `Developer Tools` *(Multi-Agent Orchestration, Mobile Control & Cross-AI Code Review)*
- **Type:** `Desktop App + CLI (orca orchestration) + Mobile App (iOS / Android)`
- **Quality Score:** **9.5 / 10**
- **Need for Us:** **9.5 / 10**
- **Recommended Scope:** `Standalone Desktop App (/Applications/Orca.app) + Global orchestration Skill`
- **Active Since:** `2026-11-16`
- **Current Status:** `✅ Active` *(replaced T3 Code as our primary multi-agent workspace)*

---

## 1. What It Is and How It Works

**Orca (`stablyai/orca`)** is an open-source (`MIT`) multi-agent orchestrator that runs `Codex`, `Claude Code`, `Antigravity (Gemini / Argon)`, and 25+ CLI coding agents in parallel across isolated Git worktrees (in rich Chat UI or raw Terminal mode) with native mobile control.

**How we use it in practice (2 key mechanisms):**
1. **Single-prompt multi-AI chaining (`orca orchestration worker-start`):**
   - From a single prompt, the coordinator agent (e.g., `Codex` `GPT-6.1-Sol High`) spawns child worker agents (`--agent claude`, `--agent antigravity`, `--agent codex`) in parallel or sequence via `orca orchestration worker-start --worktree current` and ends its turn (`0` polling).
   - Each worker renders as a live clickable card (`Started worker ↗`, `Update from worker ↗`) directly inside the Chat UI; when a worker finishes (`worker_done`) or hits a quota/error (`escalation`), `Orca` automatically wakes the coordinator to synthesize the final result.
   - Our global `task-context`, `claude-opus`, `antigravity-claude`, and `argon` CLI skills also work seamlessly inside `Orca`.
2. **Mobile companion (`Orca IDE`) & Lock-Screen operation:**
   - Official native iOS ([App Store](https://apps.apple.com/us/app/orca-ide/id6766130217)) and Android ([Google Play](https://play.google.com/store/apps/details?id=dev.orca.app)) apps pair via QR/pairing code (`LAN / Tailscale` or `E2EE Orca Relay` with `APNs`/`FCM` push notifications).
   - Built-in `Keep computer awake: On` (`/usr/bin/caffeinate -i -s -w <pid>`) keeps the Mac awake even when the screen is locked (`Lock Screen`), preventing mobile disconnects.

---

## 2. Strengths & Weaknesses (Live Comparison vs `T3 Code`)

| Criterion | **`Orca` (`stablyai/orca` v1.4.261)** | [**`T3 Code`**](t3-code.md) *(uninstalled)* |
|---|---|---|
| **Single-prompt multi-AI chaining** | ✅ **Native `orca orchestration` DAG:** live inline worker cards (`Claude`, `Codex`, `Antigravity`) in Chat UI, automatic wakeups (`worker_done`), and instant quota/error escalations | ⚠️ External CLI subagent scripts only (no inline worker cards in UI) |
| **Mobile app reliability** | ✅ Official App Store / Play Store app (`LAN` + `E2EE Relay` + Push notifications) | ❌ Beta — disconnects frequently when the phone locks or switches networks |
| **Mac Lock-Screen operation** | ✅ Built-in `caffeinate -i -s` (`Keep computer awake: On · Active`) + background PTY daemon | ❌ Drops connection when the computer locks |
| **Live quota tracking** | ✅ Status bar shows live `✴️ Claude`, `🌀 Codex`, and `⛰️ Antigravity (Gemini)` usage percentages | ⚠️ Manual inspection required |
| **Resource footprint (`12 repos + 3 agents`)** | ✅ **`841 MB` RAM**, **`0.2%` idle CPU** | `~1.1–1.4 GB` RAM + `~3.87 GB` disk cache (`~/.t3`) |

### Weaknesses and Caveats
- Ships with `PostHog` telemetry enabled by default (must be disabled in `Settings -> Privacy & Telemetry`).
- Spawning parallel multi-agent workers consumes subscription quota from each invoked provider.

---

## 3. Security & Sanitization (Applied Configuration)

- **Risk Level:** `Low` *(MIT open-source, local runtime, passed `skillshare audit` with `0` findings)*
- **Mandatory configuration applied on install:**
  1. **Disabled telemetry (`telemetry.optedIn = false`):** Turned off `PostHog` analytics immediately on install.
  2. **Always-On Lock-Screen wake (`computerAwakeMode = "on"`):** Enabled `Keep computer awake: On` and verified live `/usr/bin/caffeinate -i -s -w <pid>`.
  3. **Coordinator worker approvals (`orchestrationCoordinatorApprovalsEnabled = true`):** Enabled *"Let coordinators approve worker permission prompts"* in `Settings -> Orchestration` so child workers do not stall waiting on interactive prompts.
  4. **Scoped `orchestration` skill (`LOCAL-COMPATIBILITY`):** Scoped our global `orchestration` skill to trigger only inside Orca workspaces (`ORCA_PANE_KEY` / `ORCA_WORKTREE_ID`) or when `Orca` workers are explicitly requested; omitted global `orca-cli` install to avoid auto-trigger overlap with `agent-desktop`.

---

## 4. Fit & Compatibility with Our Existing Stack

- `Codex`, `Claude Code`, and `Antigravity` status hooks (`orca agent hooks on`) and the `orchestration` skill integrate cleanly with `task-context`, `grill-me`, `ponytail`, `agent-desktop`, and `agent-device`.
- Uninstalled [**`T3 Code`**](t3-code.md) completely (freeing `~3.87 GB` of disk space) and migrated all 12 active repositories into `Orca`.

---

## 5. When to Use (and When Not To)

- **When to use:** All daily coding and architecture work, single-prompt multi-AI review chains (*"have Codex implement and Claude/Argon verify"*), and remote steering from `Orca IDE` on iPhone/Android while away from the desk.
- **When not to use:** Do not spawn multi-agent workers (`worker-start`) for trivial 1-line edits or simple Q&A where a single chat turn suffices.

---

## 6. Status & Action History

| Date | Action | Status | Notes |
|---|---|---|---|
| 2026-11-16 | Installed `stablyai/orca` (`v1.4.261`), disabled `PostHog`, configured `caffeinate` + `Mobile` + `Codex/Claude/Antigravity`, and verified live multi-agent run (`run_33e8e230b9fe`) | `✅ Active` | Uninstalled `T3 Code` and adopted `Orca` as our primary multi-agent orchestrator. |
