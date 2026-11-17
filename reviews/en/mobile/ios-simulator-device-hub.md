# `xcrun simctl` + Xcode `Device Hub` (`devicectl`)

[🇺🇿 O'zbekcha](../../mobile/ios-simulator-device-hub.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/mobile/ios-simulator-device-hub.md)

- **Source:** [Apple Xcode Command Line & Simulator Tools (simctl / devicectl)](https://developer.apple.com/documentation/xcode/interacting-with-simulator-from-the-command-line)
- **Category:** `Mobile` *(iOS Simulator & Physical iPhone/iPad App Control)*
- **Type:** `CLI + macOS App Bridge` *(bundled with `Xcode.app`)*
- **Quality Score:** **9.0 / 10**
- **How Often Needed:** **9.5 / 10**
- **Recommended Scope:** `Standalone Tool` *(bundled with Xcode + paired with `agent-desktop`)*
- **Active Since:** `2026-10-20`
- **Current Status:** `✅ Using` *(core toolchain for iOS simulator and physical device verification)*

---

## 1. What It Is and How It Works

> [!IMPORTANT]
> **In Plain Words (Main Job & Value):** Boots and shuts down iOS Simulators headlessly in the background (`simctl boot/shutdown`) and installs builds onto physical iPhones (`devicectl`).

Apple's official toolchain for booting, driving, and verifying iOS and Expo / React Native apps in the background on macOS:

1. **`xcrun simctl` (Local iOS Simulator Lifecycle):**
   - Boot a simulator: `xcrun simctl boot <SIMULATOR_UDID>`
   - Install and launch apps: `xcrun simctl install` / `xcrun simctl launch <SIMULATOR_UDID> <BUNDLE_ID>`
   - Open deep links (`openurl`), grant permissions (`privacy`), and capture screenshots/video (`io screenshot`).
2. **Xcode `Device Hub` (`DeviceHub.app`) + `agent-desktop` (Internal UI Automation):**
   - `Device Hub` in Xcode 26 (`open -g "/Applications/Xcode.app/Contents/Applications/DeviceHub.app"`) exposes the running iOS Simulator's internal UIKit / React Native accessibility tree directly to macOS Accessibility (`AX`).
   - This allows `agent-desktop snapshot --app "Device Hub" --compact` to inspect every button and input inside the iOS app and trigger `click` / `set-value` actions in the background without moving the cursor.
3. **`xcrun devicectl` (Final Physical iPhone/iPad Verification):**
   - Lists paired physical iOS devices (`xcrun devicectl list devices`) and installs/launches builds for final hardware verification.

---

## 2. Strengths and Weaknesses

### Strengths
- **100% headless iOS UI testing:** Combined with `open -g` and `agent-desktop`, it verifies complete iOS user flows in the background without stealing window focus.
- **No heavy external drivers required:** Works out of the box with Xcode without spinning up WebDriverAgent or Appium servers.

### Weaknesses and Pitfalls
- **`iPhone Mirroring.app` trap:** Never use `iPhone Mirroring.app` for automated UI testing — it only streams video frames (`ref_count: 0`, no internal UI elements exposed). Always use `Device Hub` + iOS Simulator.
- Available only on macOS with `Xcode.app` installed.

---

## 3. Security & Operating Rules

- **Risk Level:** `Low`
- **Mandatory operating rules:**
  1. **Two-stage QA discipline:** Use local Simulator (`simctl` + `Device Hub`) for all iterative coding and debugging; use `devicectl` on physical iPhones only for the final verification pass.
  2. **Launch in the background:** Always open `DeviceHub.app` with `open -g` so it does not steal focus from the user.
  3. **Never run `simctl erase` unprompted:** Erasing a simulator wipes logged-in test sessions and local state.

---

## 4. Fit & Compatibility with Our Existing Stack

- **`xcrun simctl` & `devicectl`:** Core iOS/tvOS lifecycle foundation underneath [agent-device](agent-device.md) (windowless simulator `boot`/`shutdown`, `privacy` grants, and physical iPhone build installs).
- **Xcode `Device Hub` + `agent-desktop`:** Now serves as a **fallback** — `Device Hub` requires a GUI window open on screen, whereas [agent-device](agent-device.md) drives booted simulators completely windowlessly in `~197ms`.

---

## 5. When to Use (and When Not To)

- **When to use:** Booting/shutting down headless simulators via `xcrun simctl`, granting permissions/deep-links, installing builds onto physical iPhones via `devicectl`, or falling back to `Device Hub` when needed.
- **When not to use:** Routine iOS/tvOS UI snapshot and tap flows (use [agent-device](agent-device.md) as the primary driver).

---

## 6. Status & Action History

| Date | Action | Status | Notes |
|---|---|---|---|
| 2026-10-20 | Installed `simctl`, `devicectl`, and `Device Hub` with Xcode | `✅ Using` | Used across local iOS Simulators and physical iPhone/iPad verification. |
| 2026-11-16 | Shifted primary iOS/tvOS UI automation to `agent-device` | `✅ Using` | `xcrun simctl` (headless boot/shutdown) and `devicectl` remain essential; `Device Hub` + `agent-desktop` moved to fallback role. |
