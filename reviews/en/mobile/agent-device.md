# `agent-device` (`callstack/agent-device`)

[🇺🇿 O'zbekcha](../../mobile/agent-device.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/mobile/agent-device.md)

- **Source:** [callstack/agent-device](https://github.com/callstack/agent-device) · [agent-device.dev](https://agent-device.dev/docs/agent-setup)
- **Category:** `Mobile` *(Headless accessibility-tree UI automation for iOS, Android, tvOS, and Android TV)*
- **Type:** `CLI + Skill` *(installed in pure CLI mode without MCP schema overhead)*
- **Quality Score:** **9.5 / 10**
- **Need for Us:** **9.5 / 10**
- **Recommended Scope:** `Global CLI (npm i -g agent-device) + Sanitized Global Skill (-g)`
- **Reviewed Date:** `2026-11-16`
- **Current Status:** `✅ Active` *(primary driver for mobile and TV UI verification)*

---

## 1. What It Is and How It Works

An open-source (`MIT`, `0` runtime npm dependencies) mobile and TV automation layer built by Callstack (core React Native maintainers; also powers mobile automation inside `T3 Code`).

Instead of feeding heavy screenshots or 10–40 KB raw XML dumps (`uiautomator dump`) to the model on every step:
1. **iOS & tvOS:** Uses a cached local XCUITest runner to read and act on `@e1`, `@e2` accessibility refs **100% headlessly in the background without opening any `Simulator.app` or `Device Hub` window on screen**.
2. **Android & Android TV:** Uses lightweight `snapshot-helper` (`BoundedUiAutomationConnection`) and `ime-helper` APKs to capture live animated/map screens without `uiautomator` idle hangs, and types full UTF-8 text (spaces, apostrophes, Cyrillic) cleanly.
3. **`--settle` & Differential Output:** Waits for UI animations to settle automatically and prints only changed elements (`+12 -16`) rather than re-dumping the entire screen.
4. **Git-Worktree Isolation:** Scopes device sessions per git worktree so parallel coding agents do not collide on the same simulator.

---

## 2. Live Benchmark: Why We Adopted It

Measured live on macOS against an iOS 26.5 Simulator and a connected Android tablet running a live vector-map screen:

| Metric | Raw `adb` + `Device Hub` | `mobile-mcp` | **`agent-device` (CLI)** |
|---|---|---|---|
| **Always-loaded context cost (per chat)** | `0 tokens` | `~7,580 tokens` *(34 MCP tools)* | **`0 tokens`** *(skill ~55 tokens)* |
| **iOS Simulator (100% headless, no window)** | `WINDOW_NOT_FOUND` *(requires open GUI window)* | `7,277 ms` (`~652 tokens`) | **`197 ms` (`~141 tokens`)** |
| **Android (live animated map snapshot)** | `4,033 ms` (`~2,723 tokens` XML) | `5,788 ms` (`~309 tokens`) | **`888 ms` (`~100 tokens` — 27x smaller)** |
| **Post-tap / post-scroll response** | Full re-snapshot required | Full re-list required | **`diff` (`~26–238 tokens`)** |

### Weaknesses and Cost
- **First-run warmup:** Compiles the Apple XCUITest runner once per Xcode/iOS SDK (`~15–20s`, pre-warmed via `agent-device doctor`) and installs tiny helper APKs once on Android (`~12s`); subsequent calls run in `197–888 ms`.
- Requires Node.js `>= 22.12`.

---

## 3. Security & Pre-Install Sanitization

- **Risk Level:** `Low` *(clean `MIT` codebase, zero telemetry, zero external npm dependencies)*
- **Applied sanitization & guardrails:**
  1. **Installed as CLI + Skill, NOT as an MCP server:** Keeps always-loaded MCP tool schema overhead at `0` tokens, with a `PATH`-safe `/opt/homebrew/bin/agent-device` wrapper so non-login CLI subagents always resolve `node` and `adb`.
  2. **Scoped away from `agent-desktop`:** Stripped `macOS`, `HarmonyOS`, `Vega OS`, and `Limrun` from the upstream `SKILL.md` trigger description so **Web (`Google Chrome`) and macOS desktop apps** remain exclusively handled by [**`agent-desktop`**](../developer-tools/agent-desktop.md), while `agent-device` handles **Mobile & TV (`iOS`, `Android`, `tvOS`, `Android TV`)**.
  3. **Explicit `--udid` / `--serial` safety rule:** Prevents accidental interaction with plugged-in physical phones during Stage 1 local development.

---

## 4. What Happened to Our Previously Installed Tools? (Role Split)

**None of our existing tools were removed** — because `agent-device` relies on `adb` and `xcrun simctl` under the hood and intentionally does not drive Web browsers, each tool now owns a clean, non-overlapping boundary:

| Existing Tool | Current State | How Its Role Changed |
|---|---|---|
| [**`agent-desktop`**](../developer-tools/agent-desktop.md) | `✅ Kept (Primary — Web/Desktop)` | Remains **100% primary** for **Google Chrome (Web)** and **macOS desktop** GUI windows. Mobile & TV UI flows moved to `agent-device`. |
| [**`adb`**](adb.md) | `✅ Kept (Transport + Port/Logs)` | `agent-device` still invokes `adb` underneath on Android. In addition, **`adb reverse`** (Metro/local backend port forwarding), **`adb logcat`** (crash logs), APK installs, and **`emu kill`** stay directly on `adb` — only slow `uiautomator dump` + coordinate `input tap` loops were replaced by `agent-device`. |
| [**`xcrun simctl` + `devicectl`**](ios-simulator-device-hub.md) | `✅ Kept (Boot + Physical iPhone)` | Still required for windowless simulator `boot`/`shutdown` (`simctl`) and physical iPhone build installs (`devicectl`). **`Device Hub`** is no longer opened routinely and serves strictly as a fallback. |
| [**`cross-platform-qa`**](cross-platform-qa.md) | `✅ Upgraded` | Preserves our 2-stage QA discipline with mobile/TV UI verification upgraded to `agent-device`. |

---

## 5. When to Use (and When Not To)

- **When to use:** Inspecting, tapping, typing, scrolling, and verifying React Native / Expo, native iOS/Android, Apple TV (`tvOS`), and Android TV apps headlessly.
- **When not to use:** Driving `Google Chrome` web pages or macOS desktop GUI apps (use `agent-desktop`).

---

## 6. Status & Action History

| Date | Action | Status | Notes |
|---|---|---|---|
| 2026-11-16 | Source audit, live iOS Simulator & Android tablet benchmark, sanitization, and global install | `✅ Active` | Installed `0.21.37` CLI + sanitized `agent-device` skill across all 5 agent targets and upgraded `cross-platform-qa` (`197 ms` windowless iOS, `888 ms` / `~100-token` Android snapshots). |
