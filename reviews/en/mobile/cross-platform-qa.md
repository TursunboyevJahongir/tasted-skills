# `cross-platform-qa` (Local Emulator → Final Physical Device QA Workflow)

[🇺🇿 O'zbekcha](../../mobile/cross-platform-qa.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/mobile/cross-platform-qa.md)

- **Source:** Internal global skill (`skills/cross-platform-qa/SKILL.md`)
- **Category:** `Mobile` *(Web + iOS + Android 2-Stage Verification Rule)*
- **Type:** `Skill`
- **Quality Score:** **9.5 / 10**
- **Need for Us:** **9.5 / 10**
- **Recommended Scope:** `Global (-g)`
- **Reviewed Date:** `2026-11-15`
- **Current Status:** `✅ In Active Use`

---

## 1. What It Is and How It Works

A custom 2-stage global QA skill designed to verify Web, iOS, and Android changes rapidly against live UI **without writing upfront unit tests (TDD)**:

1. **Stage 1 (Iterative Development — 100% Local on Mac):**
   - Never repeatedly install builds onto a physical phone/tablet during active coding and debugging.
   - **Web (`Google Chrome`):** Verified in the background against the open authenticated browser via [`agent-desktop`](../developer-tools/agent-desktop.md) (`AXPress`, `~0.2–0.3s`).
   - **iOS (`Device Hub` / iOS Simulator):** Booted with `xcrun simctl` and driven in the background via Xcode `Device Hub` + `agent-desktop` using `@ref` handles (`~0.3–0.8s`).
   - **Android (Local Android Emulator):** Booted headlessly with `emulator -avd ... -no-window` and verified via [`adb`](adb.md) `-s emulator-5554` (`uiautomator dump`, `input tap`, `screencap`).
2. **Stage 2 (Final "Done" Gate — Single Pass on Physical Hardware):**
   - Once all local checks pass and right before marking the task **Done**, run **one final verification pass** on the USB-connected physical phone/tablet (`adb devices` / `devicectl`).

---

## 2. Strengths and Weaknesses

### Strengths
- Eliminates slow USB build loops during iterative coding.
- Tests real maps, buttons, and screens live instead of writing brittle UI unit tests, while still guaranteeing real-hardware confidence at the end.

### Weaknesses and Cost
- Tiny footprint (`~3.4 KB` Markdown) with zero extra token bloat.

---

## 3. Security & Pre-Install Sanitization

- **Risk Level:** `Low`
- **Inspected surface:** Authored in-house; enforces explicit `-s <serial>` targeting in `adb` and mandatory shutdown of temporary headless emulators upon completion.

---

## 4. Fit & Compatibility with Our Existing Stack

- Unifies [`agent-desktop`](../developer-tools/agent-desktop.md), [`adb`](adb.md), and [`xcrun simctl` + `Device Hub`](ios-simulator-device-hub.md) into a single disciplined workflow.

---

## 5. When to Use (and When Not To)

- **When to use:** Any UI or feature change across Web, iOS, Android, or React Native / Expo projects.

---

## 6. Status & Action History

| Date | Action | Status | Notes |
|---|---|---|---|
| 2026-11-15 | Created via `skillshare new cross-platform-qa -g` and synced | `✅ In Active Use` | Linked across all 5 global agent targets. |
