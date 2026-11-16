# `adb` (Android Debug Bridge — Platform Tools)

[🇺🇿 O'zbekcha](../../mobile/adb.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/mobile/adb.md)

- **Source:** [Android SDK Platform-Tools (`adb`)](https://developer.android.com/tools/adb)
- **Category:** `Mobile` *(Android Emulator & Physical Android Device Control)*
- **Type:** `CLI / Runtime Tool` *(official Android SDK utility)*
- **Quality Score:** **9.5 / 10**
- **Need for Us:** **10.0 / 10**
- **Recommended Scope:** `Standalone Tool` *(installed globally in PATH + governed by QA skills)*
- **Active Since:** `2026-09-07`
- **Current Status:** `✅ Using` *(core tool for Android emulator and physical device testing)*

---

## 1. What It Is and How It Works

> [!IMPORTANT]
> **In Plain Words (Main Job & Value):** Core low-level bridge for Android port forwarding (`adb reverse`), reading native crash logs (`logcat`), and installing APKs across emulators and physical phones.

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

Complements [`agent-device`](agent-device.md) and [`agent-desktop`](../developer-tools/agent-desktop.md):
- **Interactive Android & Android TV UI flows (`snapshot`, `@ref`, `press`, UTF-8 `fill`):** now driven primarily via [`agent-device`](agent-device.md) (which uses `adb` under the hood, running `4.5x` faster with `27x` fewer tokens than raw `uiautomator dump`);
- **Low-level Android operations (`adb reverse`, `adb logcat`, `emu kill`, APK installs, fallback `screencap`):** handled directly by **`adb`**;
- Together they power the Android wing of [`cross-platform-qa`](cross-platform-qa.md).

---

## 5. When to Use (and When Not To)

- **When to use:** Forwarding ports (`adb reverse`), inspecting crash logs (`adb logcat`), installing APKs, managing `-no-window` emulators (`emu kill`), and serving as the underlying transport/fallback for `agent-device`.
- **When not to use:** Routine interactive UI tapping and form filling (use [`agent-device`](agent-device.md) instead) or pure Web/iOS tasks.

---

## 6. Status & Action History

| Date | Action | Status | Notes |
|---|---|---|---|
| 2026-09-07 | Installed Android SDK `platform-tools/adb` (`2026-11-15` symlinked into global `PATH` & headless QA gate) | `✅ Using` | Active across `-no-window` emulators and physical Android phones. |
| 2026-11-16 | Delegated UI tree/input layer to `agent-device`, retained as core transport/log CLI | `✅ Using` | Kept active: `agent-device` depends on `adb` underneath, while `adb` directly handles `reverse`, `logcat`, `install`, and `emu kill`. |
