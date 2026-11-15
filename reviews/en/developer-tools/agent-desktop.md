# `agent-desktop`

[🇺🇿 O'zbekcha](../../developer-tools/agent-desktop.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/developer-tools/agent-desktop.md)

- **Source:** [agent-browser.dev/desktop](https://agent-browser.dev/desktop)
- **Category:** `Developer Tools` *(Desktop GUI, Web Browser & iOS Simulator Automation)*
- **Type:** `CLI + Global Skills` (`agent-desktop`, `agent-desktop-macos`, `agent-desktop-ffi`)
- **Quality Score:** **9.5 / 10**
- **Need for Us:** **10.0 / 10**
- **Recommended Scope:** `Global (-g) + Standalone CLI`
- **Reviewed Date:** `2026-11-15`
- **Current Status:** `✅ In Active Use` *(primary background driver for macOS desktop apps, Chrome, and iOS Simulator)*

---

## 1. What It Is and How It Works

A fast native CLI tool that inspects and drives desktop applications directly through the operating system's **Accessibility (`AX`) tree**. Every command returns structured JSON (`ok`, `data`, `error`).

Core workflow (`observe → act → verify`):
1. `agent-desktop snapshot --app "Google Chrome" --skeleton -i --compact` — captures a compact interactive element map of the target window;
2. `agent-desktop snapshot --root @<id>:e<N> --compact` — drills into only the relevant subtree without bloating context;
3. `agent-desktop click @<id>:e<N>` or `set-value @<id>:e<N> "<text>"` — dispatches semantic accessibility actions directly to the target element.

**Biggest advantage (`Headless` by default):** In default headless mode, it never moves the user's physical mouse cursor, never hijacks keyboard input, and never brings background windows to the front.

---

## 2. Strengths and Weaknesses

### Strengths
- **Works with the user's already-authenticated Chrome:** Instead of spawning a blank Playwright profile every time, it inspects and interacts with the user's open `Google Chrome` session in the background.
- **Drives iOS Simulator (`Device Hub`):** Reads and interacts with React Native / UIKit elements inside Xcode's `Device Hub` window via the macOS `AX` tree.
- **Safe delivery & retry semantics:** Every action returns `disposition.delivery` and `retry: safe`, preventing accidental double-clicks on non-idempotent controls.

### Weaknesses and Limitations
- Cannot see inside pure GPU/OpenGL/Metal surfaces (such as the Android Emulator screen or `<canvas>`/WebGL scenes) — use `adb` for Android and Chrome DevTools / Playwright for deep network/CPU throttling metrics.
- Requires macOS Accessibility permission (and Screen Recording permission when taking screenshots).

---

## 3. Security & Operating Rules

- **Risk Level:** `Medium` *(can control live authenticated desktop and browser sessions)*
- **Mandatory operating rules:**
  1. **Never pass `--headed` without explicit user permission:** Headed mode hijacks the physical mouse and keyboard; never silently fall back to `--headed` if a headless action fails.
  2. **Scope strictly to the authorized `--app`:** Never inspect or interact with unrelated chat, mail, or system settings windows.
  3. **Use `--skeleton` and `--compact` with `--root`:** Avoid dumping massive full-window trees into context.

---

## 4. Fit & Compatibility with Our Existing Stack

- **Web (`Google Chrome`) & macOS desktop apps:** `agent-desktop` remains our **100% primary** background UI verification tool.
- **Mobile & TV (`iOS`, `Android`, `tvOS`, `Android TV`):** Driven primarily via [`agent-device`](../mobile/agent-device.md) (`agent-desktop` + `Device Hub` remains a fallback for iOS).
- Includes the companion `agent-desktop-ffi` skill for direct C-ABI bindings from Python, Swift, Node, or Rust when needed.

---

## 5. When to Use (and When Not To)

- **When to use:** Testing local web apps in `Google Chrome` and automating macOS desktop GUI applications in the background.
- **When not to use:** Mobile and TV simulators/emulators (use [`agent-device`](../mobile/agent-device.md)) or low-level network waterfall / 6x CPU throttling benchmarks (use Chrome DevTools).

---

## 6. Status & Action History

| Date | Action | Status | Notes |
|---|---|---|---|
| 2026-11-15 | Local CLI installation and integration into daily QA workflow | `✅ In Active Use` | CLI and `agent-desktop`, `agent-desktop-macos`, `agent-desktop-ffi` skills installed globally. |
| 2026-11-16 | Clarified domain split (`Web/Desktop` vs `Mobile/TV`) | `✅ In Active Use` | Retained as primary driver for Web (`Google Chrome`) and macOS desktop apps, while mobile/TV UI flows moved to `agent-device`. |
