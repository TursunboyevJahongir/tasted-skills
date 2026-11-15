# `adb` (Android Debug Bridge — Platform Tools)

[🇺🇿 O'zbekcha](../../mobile/adb.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/mobile/adb.md)

- **Source:** [Android SDK Platform-Tools (`adb`)](https://developer.android.com/tools/adb)
- **Category:** `Mobile` *(Android Emulator & Physical Android Device Control)*
- **Type:** `CLI / Runtime Tool` *(official Android SDK utility)*
- **Quality Score:** **9.5 / 10**
- **Need for Us:** **10.0 / 10**
- **Recommended Scope:** `Standalone Tool` *(installed globally in PATH + governed by QA skills)*
- **Reviewed Date:** `2026-11-15`
- **Current Status:** `✅ In Active Use` *(core tool for Android emulator and physical device testing)*

---

## 1. What It Is and How It Works

Google's official **Android Debug Bridge (`adb`)** command-line utility. It allows AI agents to inspect, tap, and verify mobile apps (React Native, Expo, Kotlin/Java, Flutter) on both local emulators and USB-connected physical Android devices.

**Why it is essential (technical reason):**
On macOS, iOS Simulator (`Device Hub` + `xcrun simctl`) exposes internal UI elements to the macOS Accessibility tree, whereas **Android Emulator (`qemu`)** renders its entire screen as a single OpenGL/Metal surface — desktop accessibility tools (`agent-desktop`) cannot see internal Android buttons or text. `adb` queries the Android runtime directly for its native UI hierarchy and input controls:

- **Dump UI hierarchy & coordinates:** `adb -s <serial> shell "uiautomator dump /sdcard/uidump.xml && cat /sdcard/uidump.xml"`
- **Tap, swipe & type:** `input tap <X> <Y>`, `input swipe`, `input text`, `input keyevent` (Back, Home, Enter)
- **Fast screenshot capture:** `adb -s <serial> exec-out screencap -p > /tmp/android_screen.png`
- **Port forwarding & logs:** `adb reverse tcp:8081 tcp:8081` (for Metro/local backends), `adb logcat -b crash`, APK installation (`adb install -r`)
- **Headless background testing:** Launch the emulator with `-no-window` and run full UI tests in the background without touching the user's screen or cursor.

---

## 2. Strengths and Weaknesses

### Strengths
- **No heavy middleware required:** Works directly without Appium or bloated MCP wrappers.
- **Unified interface for emulators and physical phones:** Identical commands work on `emulator-5554` during development and on a real USB phone during final verification.
- **Zero context footprint:** Pure CLI binary with zero prompt bloat.

### Weaknesses and Limitations
- `uiautomator dump` can occasionally time out on screens with continuous infinite animations — pair it with `exec-out screencap -p` for visual inspection when needed.
- `input text` requires escaping spaces (`%s`) and special shell characters.

---

## 3. Security & Operating Rules

- **Risk Level:** `Low–Medium` *(official Google binary, but has full shell control over connected Android devices)*
- **Mandatory safety rules:**
  1. **Always pass an explicit `-s <serial>`:** Run `adb devices -l` first to distinguish emulators (`emulator-*`) from physical phones so iterative dev commands never hit the user's personal phone by mistake.
  2. **Two-stage workflow:** Run all iterative development and debugging on the local emulator; run a single final verification pass on the physical USB device right before completion.
  3. **No destructive commands on physical devices:** Never run `pm clear`, `adb uninstall` on unrelated packages, `rm`, or system setting mutations on a physical phone unless explicitly requested.
  4. **Cleanup:** Kill any agent-launched headless emulator (`adb -s emulator-5554 emu kill`) when finished and write temporary screenshots only to `/tmp/`.

---

## 4. Fit & Compatibility with Our Existing Stack

Complements [`agent-desktop`](../developer-tools/agent-desktop.md) 100%:
- Web (`Google Chrome`) and iOS Simulator (`Device Hub` + `xcrun simctl`) → driven via `agent-desktop`;
- Android Emulator and physical Android devices → driven via **`adb`**;
- Together they power our [`cross-platform-qa`](cross-platform-qa.md) workflow.

---

## 5. When to Use (and When Not To)

- **When to use:** Verifying UI changes, tapping through flows, capturing screenshots, forwarding ports (`adb reverse`), and inspecting crash logs in React Native / Expo and native Android apps.
- **When not to use:** Pure web or iOS-only tasks (use `agent-desktop` and `xcrun simctl`).

---

## 6. Status & Action History

| Date | Action | Status | Notes |
|---|---|---|---|
| 2026-11-15 | Symlinked into global PATH and integrated into mobile QA workflow | `✅ In Active Use` | Used in Stage 1 for headless Android emulator testing (`-no-window`, `uiautomator dump`, `screencap`) and Stage 2 for final USB device verification. |
