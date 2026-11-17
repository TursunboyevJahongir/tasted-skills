# `simslim` (`MobAI-App/simslim`)

[🇺🇿 O'zbekcha](../../mobile/simslim.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/mobile/simslim.md)

- **Source:** [MobAI-App/simslim](https://github.com/MobAI-App/simslim)
- **Category:** `Mobile` *(iOS, tvOS, watchOS & visionOS Simulator RAM and Disk Optimizer)*
- **Type:** `Standalone Go CLI` (`brew install mobai-app/tap/simslim`)
- **Quality Score:** **9.0 / 10**
- **How Often Needed:** **7.5 / 10**
- **Recommended Scope:** `Global CLI (Homebrew)` — applied once per local `iOS 18.5+` / `tvOS` simulator with a safe feature-preserving profile
- **Works Alongside:** [**agent-device**](agent-device.md) + [**xcrun simctl**](ios-simulator-device-hub.md) *(note: skip the companion closed-source `MobAI Pro` / `mobai-mcp` app — [agent-device](agent-device.md) handles all UI driving)*
- **Active Since:** `2026-11-16`
- **Current Status:** `✅ Using`

---

## 1. What It Is and How It Works

> [!IMPORTANT]
> **In Plain Words (Main Job & Value):** Disables `~150+` unneeded background Apple daemons inside iOS Simulators, **cutting headless RAM from `2.70 GB -> 1.16 GB` (`-57%`, or `4.0 GB -> 0.9 GB` in GUI)** and freeing `1.5 GB+` of disk logs/caches per device.

A clean open-source (`MIT`, zero telemetry, zero network calls) Go CLI that trims unneeded background daemons inside Apple Simulators. A stock iOS or tvOS Simulator boots `~180` background services (`Siri`, `Apple Intelligence`, `Wallpaper PosterBoard`, `Spotlight`, `photoanalysisd`, `iCloud`, `HealthKit`, `Weather`, `News`) that waste gigabytes of RAM during app development and QA.

`simslim` never touches macOS itself — it writes persistent `launchctl disable` overrides strictly into the target `<UDID>` simulator's `launchd_sim` store (on `iOS/tvOS 18.5+`, overrides survive reboots permanently with zero background daemon required).

---

## 2. Does It Interfere with Our Projects or `agent-device`?

### A. Impact on AI & QA Tooling — `0%` Interference
- Ships no MCP server, no auto-triggered skill, and no background process — consumes **`0 tokens`** of chat context.
- Source inspection of `profiles.go` confirms `com.apple.gamed` (`DTServiceHub`) and `com.apple.sharingd` are explicitly protected in `AlwaysEnabled` (*`"Required for timely XCUITest app launches"`*), so [**agent-device**](agent-device.md)'s headless XCUITest runner (`~197 ms`) works with zero regressions.

### B. Impact on Mobile & TV Apps (What Stayed On vs What Needs Flags)
- **Untouched services (work 100% out of the box):**
  - **GPS & Location (`CoreLocation`, `expo-location`, `.gpx` routes):** `com.apple.locationd` is never disabled — live map, delivery, and ride-hailing flows work 100%.
  - **Maps, GPU & Video (`Mapbox`, Metal, `AVPlayer` HLS streaming, `tvOS`):** Rendering and media pipelines remain untouched.
  - **Local Token Storage (`expo-secure-store`, local `securityd` Keychain):** Local Keychain works normally (only Apple Account / iCloud Keychain sync is disabled).
  - **Networking (`WebSocket` / `Socket.IO`, REST APIs, Metro Fast Refresh):** 100% unaffected.
- **⚠️ 3 capabilities that bare `simslim on` disables by default — and our one-line fix:**
  1. **Push Notifications (`FCM` / `APNs` / Notification Service Extensions):** bare `on` disables `com.apple.apsd` -> preserve with `--keep com.apple.apsd`.
  2. **Universal Links (`https://...` associated domains):** bare `on` disables `web` (`com.apple.swcd`, `~50 MB`) -> preserve with `--except web`.
  3. **Photo & Document Pickers (`PHPicker`, `Files Recents`):** bare `on` disables `photos` (`~60 MB`) and `search` (`~50 MB`) -> preserve with `--except photos,search`. *(Add `--except widgets,store` on sessions that test Widgets / Live Activities or StoreKit IAP).*

**Our safe production profile (disables `149` unneeded services while keeping `push + universal-links + photos + spotlight` `4/4 OK`):**
```bash
simslim on <UDID> --except web,photos,search --keep com.apple.apsd
# Pre-slim shut-down simulators offline without leaving them booted:
simslim on <UDID> --preserve-boot-state --except web,photos,search --keep com.apple.apsd
# Verify required app capabilities:
simslim doctor <UDID> --requires push,universal-links,photos,spotlight
```

---

## 3. What Changes WITHOUT vs WITH `simslim`? (Live `iOS 26.5` Benchmark)

Measured live on an `Apple M1 Max (32 GB RAM)` booting `iPhone 17 Pro (iOS 26.5)` headlessly (`xcrun simctl boot`), alongside upstream GUI Simulator measurements:

| Metric / Scenario | WITHOUT `simslim` (`Stock`) | WITH `simslim` (`Slim`) | Real Impact |
|---|---|---|---|
| **Headless boot processes & RAM** *(our safe profile)* | **`182` processes · `2.70 GB`** (`phys_footprint`) | **`78` processes · `1.16 GB`** (`149` services off) | **`-57%` processes and `-1.54 GB` RAM saved per simulator** (`4/4` `push`, `universal-links`, `photos`, `spotlight` verified OK) |
| **Full GUI Simulator boot** *(maximum `simslim on`)* | **`258` processes · `4.00 GB`** | **`70` processes · `0.90 GB`** | **`-77.5%` (`-3.1 GB`) RAM saved** |
| **`Stage 1 QA` (`Chrome` + `iOS Sim` + `Android AVD` + `Docker` together)** | Emulators alone consume `~7–8.5 GB` RAM, pushing macOS Swap to `6–9 GB` | Emulators stay around `~4.5–5 GB` RAM, preventing Swap spikes | Keeps Metro bundler, backend containers, and `agent-device` responsive |
| **Running `iPhone + iPad + Apple TV (tvOS)` concurrently** | `~8–12 GB` RAM (forces shutting one down before booting another) | **`~3.0–3.5 GB` RAM combined** | 3 Apple simulators fit in the memory budget of 1 stock simulator |
| **Idle CPU & battery drain** | `spotlightknowledged`, `photoanalysisd`, and ML daemons burn background CPU | Background indexing and ML daemons stay off | Near `0%` idle simulator CPU |
| **SSD disk cleanup (`simslim disk-plan` / `disk-clean`)** | `simctl erase` wipes installed apps and logged-in auth tokens | **`1.51 GB` safely cleanable on a single simulator** (`827 MB` logs + `557 MB` caches) | `--categories caches,logs,temporary --confirm` reclaims disk space **without touching** installed apps (`843 MB`) or auth state |
| **Rollback to factory stock** | — | `simslim off <UDID>` | Restores 100% stock state in `~17–20 seconds` |

---

## 4. Security & Sanitization

- **Risk Level:** `Low`
- **Inspected Surface (`go.mod`, `profiles.go`, `slim.go`):**
  - Depends only on 4 terminal UI/CLI libraries (`bubbletea`, `lipgloss`, `go-isatty`, `urfave/cli`) with zero `net/http` or analytics code.
  - Newly created or `simctl erase`d simulators revert to stock overrides — re-verify with `simslim verify <UDID>` or re-run `simslim on`.
  - Skip the commercial **`MobAI Pro` (`mobai-mcp`)** desktop app shown in social demos — [agent-device](agent-device.md) already covers headless UI automation for free.

---

## 5. When to Use (and When Not To)

- **When to use:** As the default baseline across all local `iOS` and `tvOS` (`18.5+`) simulators, especially during multi-emulator `Stage 1 QA` or low-disk cleanup (`disk-clean`).
- **When to bypass (`--except` / `simslim off`):** Dedicated sessions testing Siri / Speech, HealthKit, HomeKit, StoreKit IAP, or Lock Screen Widgets / Live Activities.

---

## 6. Status & Action History

| Date | Action | Status | Notes |
|---|---|---|---|
| 2026-11-16 | Go source audit, `brew install mobai-app/tap/simslim` (`v0.14.0`), live `iPhone 17 Pro (iOS 26.5)` RAM/disk benchmark, and safe-profile rollout across all 10 local simulators | `✅ Using` | Cut headless boot from `182 -> 78` processes and `2.70 GB -> 1.16 GB` RAM (`-57%`) while keeping `push`, `universal-links`, `photos`, `spotlight`, and `agent-device` 100% working. |
