# 1. Headless Mobile & TV QA + Maestro E2E Automation

[🇺🇿 O'zbekcha](../01-mobile-tv-headless-qa.md) | **🇬🇧 English** | [🇷🇺 Русский](../ru/01-mobile-tv-headless-qa.md)

⬅️ [Back to Practices Table of Contents](README.md)

- **Combined Tools:** [**simslim**](../../reviews/en/mobile/simslim.md) + [**avdslim**](../../reviews/en/mobile/avdslim.md) + [**agent-device**](../../reviews/en/mobile/agent-device.md) + [**adb**](../../reviews/en/mobile/adb.md) + [**xcrun simctl**](../../reviews/en/mobile/ios-simulator-device-hub.md) + [**cross-platform-qa**](../../reviews/en/mobile/cross-platform-qa.md)
- **Target Projects:** `iOS`, `Android`, `tvOS (Apple TV)`, `Android TV`, `Expo / React Native`, `Swift / Kotlin`.

---

## 1. Why Combine These Tools? (Overall Benefit)

Standard mobile development suffers from three recurring bottlenecks:
1. Running an iOS Simulator (`~4 GB`) alongside an Android Emulator (`~4.5–8.5 GB`) consumes **`8–12 GB` of RAM**, pushing macOS into swap.
2. Open simulator windows and `Maestro` / `Device Hub` GUIs clutter the screen and steal window focus.
3. Manually re-tapping core flows (Login, Map, Checkout) after every feature change is slow and error-prone.

**What this combined stack delivers:**
- **`~2x` Lower RAM Footprint:** `simslim` (iOS `1.16 GB`) + `avdslim` (Android `2.64 GB`, native Apple Metal GPU) run both emulators in **`3.80 GB` total RAM** (`~3.3–8.7 GB` saved).
- **100% Windowless (`Headless`) Execution:** Zero windows pop up on screen; your mouse cursor never moves.
- **Built-in Maestro E2E Replay Without Java:** `agent-device` includes a native `--maestro` and `.ad` replay engine, running saved regression flows in the background with zero extra JVM/Maestro installation.

### 🍏 A. Our Installed `simslim` (iOS / tvOS Simulator Optimizer): WITHOUT vs. WITH

| Metric | ❌ WITHOUT `simslim` (Stock iOS 26.5 Simulator) | ✅ WITH `simslim` (Our Feature-Safe Profile) | Difference |
|---|---|---|---|
| **Windowless (`simctl boot`) RAM** | `2,704 MB` (`~2.70 GB`) | **`1,164 MB` (`~1.16 GB`)** | **`-1.54 GB` (`-57%`)** |
| **Windowed (`Simulator.app` GUI) RAM** | `~4.0 GB` | **`~0.9 GB`** | **`-3.1 GB` (`-77.5%`)** |
| **Background Daemons (`launchctl`)** | `182` processes (`Siri`, `Apple Intelligence`, `Wallpaper`, `GameCenter`...) | **`78` processes** *(only app & QA essentials)* | **`-104` daemons (`-57%`)** |
| **SSD Disk Cleanup (`disk-clean`)** | `simctl erase` wipes installed apps & logins | **Reclaims `~1.51 GB` logs/caches without touching apps** | **`+1.51 GB` / simulator** |
| **Push, Deep Links, Photo Picker, GPS** | Works | **`100% intact`** (`--except web,photos,search --keep com.apple.apsd`) | **Zero regression (`4/4 OK`)** |

### 🤖 B. Our Installed `avdslim` (Android AVD RAM & Metal GPU Optimizer): WITHOUT vs. WITH

| Metric | ❌ WITHOUT `avdslim` (Stock API 35 AVD) | ✅ WITH `avdslim` (Metal GPU + Golden Snapshot) | Difference |
|---|---|---|---|
| **Actual RAM (`Footprint`)** | `4,413 MB` (`~4.41 GB`; `~8.5 GB` on default Studio AVDs) | **`2,640 MB` (`~2.64 GB`)** | **`-1.77 GB` (`-40.2%`, `-69%` vs Studio default)** |
| **Graphics (`OpenGL / GPU`)** | `SwiftShader LLVM` *(slow CPU software rendering)* | **Native `Apple M4 Pro GPU` (`Metal host`)** | **Smooth Mapbox/Maps & `0%` CPU GPU overhead** |
| **Windowless (`-no-window`) Boot Time** | `22.81s` *(cold boot)* | **`13.79s`** *(warm `avdslim_clean` Golden Snapshot)* | **`1.65x` faster boot** |
| **GPS (`location_mode`) & Google Maps** | Works | **`location_mode=3` (High Accuracy) + Maps preserved** (`defaults` guard) | **100% GPS & `agent-device` compatibility** |

---

## 2. How to Run Them Together (Step-by-Step)

### A. One-Time Emulator Preparation (`simslim` + `avdslim`)

When setting up a simulator or AVD, apply our feature-safe profiles **once** (keeping GPS, Push, and Universal Links intact):

```bash
# 1. iOS / tvOS Simulator (preserves Push, Universal Links, Photo Picker & Spotlight):
simslim on <IOS_UDID> --preserve-boot-state --except web,photos,search --keep com.apple.apsd
simslim doctor <IOS_UDID> --requires push,universal-links,photos,spotlight

# 2. Android AVD (permanently protects GPS location_mode=3 and Google Maps):
mkdir -p "$HOME/Library/Application Support/avdslim"
printf "%s\n" "--skip=location --keep=com.google.android.apps.maps" > "$HOME/Library/Application Support/avdslim/defaults"
ANDROID_HOME=~/Library/Android/sdk avdslim tune-avd <AVD_NAME>
ANDROID_HOME=~/Library/Android/sdk avdslim bake <AVD_NAME> --headless
```

### B. Daily `Stage 1` (Local Headless Verification)

During active coding and debugging, verify flows locally in the background without touching USB devices:

```bash
# iOS (windowless background boot, ~197ms per action):
xcrun simctl boot <IOS_UDID> 2>/dev/null || true
agent-device open <BUNDLE_ID> --platform ios --udid <IOS_UDID> --foreground
agent-device press @e5 --settle
agent-device fill @e8 "Tashkent, Uzbekistan" --settle
agent-device close

# Android (Golden Snapshot + Metal GPU headless boot, ~888ms per action):
ANDROID_HOME=~/Library/Android/sdk avdslim start <AVD_NAME> --headless --no-slim
~/Library/Android/sdk/platform-tools/adb -s emulator-5554 reverse tcp:8081 tcp:8081
agent-device open <PACKAGE_NAME> --platform android --serial emulator-5554 --foreground
agent-device press @e5 --settle
agent-device close
ANDROID_HOME=~/Library/Android/sdk avdslim stop emulator-5554 -f
```

---

## 3. Extra Power Practices (What Else You Can Do)

### 1) Run Maestro (`.yaml`) E2E Regression Suites Headlessly Without Java
You do not need to install the standalone `Maestro` JVM CLI — write standard `.yaml` flows in your repo and execute them directly through `agent-device`:

```yaml
# e2e/smoke.yaml
appId: com.example.app
---
- launchApp
- tapOn: "Sign In"
- inputText: "901234567"
- tapOn: "Continue"
- assertVisible: "Home"
```

```bash
# Run a single flow on a headless simulator:
agent-device replay ./e2e/smoke.yaml --maestro --platform ios --udid <IOS_UDID>

# Run an entire E2E folder across iOS and Android in parallel:
agent-device test ./e2e --maestro --device <IOS_UDID>,emulator-5554 --shard-all 2
```

### 2) Self-Healing `.ad` Scripts (`--save-script`)
When a UI redesign breaks an existing E2E script, run `agent-device replay <file>.ad --save-script`:
- At the diverged step, the AI agent inspects the live `@ref` tree, presses the updated control, and writes a healed `<stem>.healed.ad` script automatically.

### 3) Headless Video Proof & `contact-sheet` Frame Grids
Capture a proof video of a background test run and generate a single timestamped PNG grid (`contact-sheet.png`) showing every scene change:

```bash
agent-device record start ./proof.mp4
# ... actions ...
agent-device record stop
agent-device record contact-sheet ./proof.mp4 --out ./proof-frames.png
```

### 4) Reclaim Simulator Disk Space Without Wiping Installed Apps
Unlike `xcrun simctl erase` (which wipes installed builds and auth tokens), `simslim disk-clean` safely removes `~1.5 GB` of logs and caches per simulator while keeping your apps and logins intact:

```bash
simslim disk-plan <IOS_UDID>
simslim disk-clean --categories caches,logs,temporary --confirm <IOS_UDID>
```
