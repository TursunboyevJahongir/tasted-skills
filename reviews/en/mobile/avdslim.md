# `avdslim` (`kdbhalala/avdslim`)

[🇺🇿 O'zbekcha](../../mobile/avdslim.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/mobile/avdslim.md)

- **Source:** [kdbhalala/avdslim](https://github.com/kdbhalala/avdslim)
- **Category:** `Mobile` *(Android Emulator RAM, Metal GPU & Golden Snapshot Optimizer)*
- **Type:** `Standalone Go CLI` (`0` external dependencies, `100%` Go stdlib)
- **Quality Score:** **9.0 / 10**
- **How Often Needed:** **7.5 / 10**
- **Recommended Scope:** `Global CLI (/opt/homebrew/bin/avdslim)` — applied across local Android AVDs via `tune-avd` + `bake --headless` with GPS-preserving `defaults` (no SDK `install-shim` needed)
- **Works Alongside:** [**agent-device**](agent-device.md) + [**adb**](adb.md) + [**simslim**](simslim.md)
- **Active Since:** `2026-11-16`
- **Current Status:** `✅ Using`

---

## 1. What It Is and How It Works

> [!IMPORTANT]
> **In Plain Words (Main Job & Value):** Switches Android Emulator graphics from slow CPU rendering onto **Apple Metal GPU (`host`)** and **cuts RAM from `4.41 GB -> 2.64 GB` (`-69%` vs. Android Studio's `8.5 GB` default)** with `14s` Golden Snapshot boots.

An open-source (`MIT`, `45-byte` `go.mod` — zero third-party packages, zero network calls) Android Virtual Device (`AVD`) optimizer inspired by [**simslim**](simslim.md). Fixes the four root causes that make Android emulators consume `4.5 GB – 8.5 GB` of host RAM on Apple Silicon and Linux:

1. **Eliminates the `Lavapipe / SwiftShader` CPU rendering trap (`-gpu host`):** Android Studio AVDs often default to `hw.gpu.mode=auto` / `hw.gpu.enabled=no`, falling back to CPU software rasterization (`SwiftShader LLVM` / `lavapipe`). `avdslim tune-avd` switches rendering to native **Apple Silicon Metal GPU (`host`)**.
2. **QEMU `-lowram` & `1536 MB` allocation:** Bypasses QEMU's default 4 GB floor and boots the Android guest in low-RAM mode (automatically saving `config.ini.bak`).
3. **Disables 22–45+ background bloat packages (`pm disable-user --user 0`):** Silences Assistant, Wellbeing, PrintSpooler, LiveWallpaper, and Dialer/MMS daemons while preserving `FCM Push`, `Firebase Auth`, `System WebView`, `Maps SDK`, and `localhost` sockets.
4. **Immutable `avdslim_clean` Golden Snapshot (`bake`):** Cold-boots once, prunes bloat, compacts guest caches, and saves a clean snapshot restored with `-no-snapshot-save` so dev sessions never corrupt it.

---

## 2. Does It Interfere with Our Projects? (Critical `location_mode` Catch & Fix)

Line-by-line source inspection (`internal/adb/client.go`, `internal/config/tuner.go`, `internal/shim/shim.go`) verified:

- **Never touches physical USB devices:** Filters strictly for `emulator-*` serials — plugged-in physical Android phones and tablets are never touched.
- **100% compatible with `agent-device` & `adb`:** `adb reverse`, `logcat`, `@e1` accessibility snapshots, and UTF-8 input work without regression.
- **⚠️ One essential safeguard for GPS & map apps (`--skip=location`):**
  - Source audit of `internal/adb/client.go:49` revealed that bare `avdslim on` sets **`location_mode = 0` (disables Android GPS)** and disables `com.google.android.apps.maps` by default.
  - To keep live location and map apps working 100%, we wrote a persistent defaults file at `~/Library/Application Support/avdslim/defaults` (`~/.config/avdslim/defaults` on Linux):
    ```text
    --skip=location --keep=com.google.android.apps.maps
    ```
  - Every `start`, `bake`, and `on` run automatically honors this file and keeps **`location_mode = 3` (High Accuracy GPS)** enabled. *(Re-enable audio or camera emulation anytime via `avdslim enable audio <AVD>` or `avdslim enable camera <AVD>`).*
- **No SDK binary mutation:** We skipped `avdslim install-shim` (which wraps the SDK `emulator` binary) in favor of clean `avdslim start <AVD> --headless` CLI launches.

---

## 3. What Changes WITHOUT vs WITH `avdslim`? (Live `API 35` Headless Benchmark)

Measured live on an `Apple M1 Max (32 GB RAM)` running our `Android 15 (API 35, arm64)` phone AVD headlessly (`-no-window`):

| Metric / Scenario | WITHOUT `avdslim` (Previous Setup) | WITH `avdslim` (`v1.0.16` + Golden Snapshot) | Real Impact |
|---|---|---|---|
| **Activity Monitor memory (`phys_footprint`)** | **`4,413 MB` (`4.41 GB`)** *(stock Studio Pixel AVDs hit `~8.5 GB`)* | **`2,640 MB` (`2.64 GB`)** | **`-1,773 MB` (`-40.2%` RAM saved; `-69%` vs stock 8.5 GB Studio AVDs)** |
| **Resident physical RAM (`RSS`)** | **`4,029 MB` (`4.03 GB`)** | **`2,544 MB` (`2.54 GB`)** | **`-1,485 MB` (`-36.9%`) physical RAM freed** |
| **GPU rendering backend** | `SwiftShader LLVM` *(slow CPU software rasterization)* | **`host` (Apple Silicon Metal GPU)** | Vector maps (`Mapbox`) and animations render on hardware GPU with zero CPU heat |
| **Boot time & snapshot stability** | Corrupted `default_boot` (`Error -5: goldfish_pipe`), cold boot **`22.81 s`** | Clean `avdslim_clean` Golden Snapshot (**`13.79 s`** full start, immune to corruption via `-no-snapshot-save`) | Fast, deterministic clean-state boot every run |
| **Background bloat packages** | All active | **`22` system bloat packages disabled** (`45+` on Google Play images) | Caps background churn (`max_cached_processes=4`) |
| **GPS (`location_mode`), FCM Push & `agent-device`** | Working | **`location_mode = 3`**, installed debug APK preserved, `agent-device` 100% working | **0% interference** with project workflows |

### Combined `simslim` (iOS) + `avdslim` (Android) `Stage 1 QA` Result
Running both a headless iOS Simulator and a headless Android Emulator concurrently dropped combined RAM usage from **`7.11 GB` (`2.70 + 4.41 GB`) down to `3.80 GB` (`1.16 + 2.64 GB`)** — saving **`~3.31 GB` of RAM** per dual-platform QA run (and up to `~8.7 GB` vs stock GUI/Studio defaults).

---

## 4. Security & Sanitization

- **Risk Level:** `Low`
- **Inspected Surface:**
  - Zero external Go dependencies (`go.mod` = `45 bytes`), SHA-256 verified release binary, zero telemetry, zero outbound HTTP calls.
  - When creating new AVDs, always select **`Google APIs` (standard 4 KB page size)** — avoid `Google Play` and `16 KB Page Size (ps16k)` images, which hardcode a `4,096 MB` QEMU RAM floor.
  - Full rollback: `avdslim off` restores all guest packages/settings, `avdslim unbake <AVD>` removes the Golden Snapshot, and `config.ini.bak` preserves original AVD settings.

---

## 5. Status & Action History

| Date | Action | Status | Notes |
|---|---|---|---|
| 2026-11-16 | Full Go source audit, installed `v1.0.16`, configured GPS-safe `defaults` (`--skip=location --keep=com.google.android.apps.maps`), tuned all 4 AVDs, and baked headless Golden Snapshots on `API 35` phone & tablet AVDs | `✅ Using` | Verified `4,413 MB -> 2,640 MB` (`-40.2%` Footprint) and `SwiftShader -> Apple Metal GPU` upgrade. |
