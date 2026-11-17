# `animate-expo` (Emil Kowalski — Expo & React Native Motion)

[🇺🇿 O'zbekcha](../../mobile/animate-expo.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/mobile/animate-expo.md)

- **Source:** [emilkowalski/skills (skills/animate-expo)](https://github.com/emilkowalski/skills/tree/main/skills/animate-expo)
- **Category:** `Mobile` *(React Native, Expo, Reanimated, Gesture Handler & Haptics)*
- **Type:** `Skill` *(`SKILL.md` + `RECIPES.md` + local `LOCAL-COMPATIBILITY.md` guard)*
- **Quality Score:** **9.5 / 10**
- **How Often Needed:** **9.0 / 10**
- **Recommended Scope:** `Global (-g)`
- **Active Since:** `2026-11-09`
- **Current Status:** `✅ Using`

---

## 1. What It Is and How It Works

> [!IMPORTANT]
> **In Plain Words (Main Job & Value):** Prevents animations that look fine on a fast Mac simulator but stutter on real phones by keeping sheets, gestures, press feedback, and haptics strictly on the `Reanimated` `60/120fps` UI thread.

An engineering skill for building 60/120fps animations, gestures, bottom sheets, press feedback, and haptics in React Native and Expo that hold up on real hardware (`SKILL.md` 260 lines + `RECIPES.md` patterns + `LOCAL-COMPATIBILITY.md` guard).

Core decision sequence (executed in strict order):
1. **Should it animate at all? (`Frequency Gate`):** Actions performed 100+ times/day (tab switches, keyboard toggles, fast switches) get **zero animation** (`animation: 'none'`).
2. **Which thread runs it?** Keep motion 100% on the **UI runtime / Reanimated worklets** (`useSharedValue`, `useAnimatedStyle`, `Gesture.Pan()`, `scheduleOnRN`) instead of the JS thread (`setState`, `PanResponder`, legacy `Animated`).
3. **Which properties animate?** Only `transform` and `opacity` (animating `elevation` on Android or `BlurView` intensity triggers per-frame repaints and frame drops — animate the `opacity` of a static layer instead).
4. **Spring or Timing?** Any finger-driven gesture (drag, swipe, sheet) uses a **Spring** (`{ duration: 300..400, dampingRatio: 0.8..1 }`) to preserve velocity; predetermined UI transitions use `Easing.bezier(0.23, 1, 0.32, 1)` (`ease-out`, `<300ms`).
5. **Haptics (`expo-haptics`):** At most once per interaction, fired on the exact frame of visual state change (`scheduleOnRN(Haptics.selectionAsync)`).

---

## 2. Strengths and Weaknesses

### Strengths
- Eliminates the classic mobile failure mode where an animation looks smooth in the simulator but drops to 20fps on a mid-range Android phone (`Yoga layout pass`, per-frame `runOnJS/scheduleOnRN`, animated `BlurView`).
- `RECIPES.md` provides solid patterns for press-scale, drag-to-dismiss sheets, swipe-to-delete, collapsing headers, and keyboard-synced views.
- Paired with `LOCAL-COMPATIBILITY.md` so [impeccable](../ui-ux/impeccable.md) owns overall visual hierarchy/layout while `animate-expo` implements specific React Native motion and gestures.

### Weaknesses and Cost
- Upstream recipes assume Expo Router and Reanimated 4 everywhere — mitigated by our `LOCAL-COMPATIBILITY.md` guard, which forbids unrequested framework migrations or dependency upgrades.

---

## 3. Security & Pre-Install Sanitization

- **Risk Level:** `Low`
- **Applied sanitization & compatibility fixes:**
  1. **Stripped `## Initial Response` greeting block:** Removed the forced *"I'm ready to build animations..."* reply.
  2. **Updated web animation pointer:** Pointed web motion references in `SKILL.md` to [impeccable](../ui-ux/impeccable.md) instead of the uninstalled `animate` skill.
  3. **Preserved `LOCAL-COMPATIBILITY.md` guard:** Enforces `reduced-motion` handling and prevents unrequested `package.json` architecture changes.

---

## 4. Fit & Compatibility with Our Existing Stack

- **`impeccable` + `animate-expo` + `web-to-native-mobile`** form our clean native mobile triad:
  - `web-to-native-mobile` decides how web workflows adapt to native iOS/Android;
  - [impeccable](../ui-ux/impeccable.md) owns visual design, typography, and layout hierarchy;
  - `animate-expo` writes the Reanimated worklets, gestures, sheets, and haptics.

---

## 5. When to Use (and When Not To)

- **When to use:** Bottom sheets, floating map panels, swipeable cards, button press-in/press-out feedback, haptics, and 60/120fps frame-budget fixes in Expo / React Native apps.
- **When not to use:** Web CSS animations (use [impeccable](../ui-ux/impeccable.md)'s `animate` playbook instead).

---

## 6. Status & Action History

| Date | Action | Status | Notes |
|---|---|---|---|
| 2026-11-09 | Installed globally with `LOCAL-COMPATIBILITY.md` guard | `✅ Using` | Reconciled with `impeccable` and existing React Native/Expo projects. |
| 2026-11-15 | Stripped `Initial Response`, pointed web motion to `impeccable`, and cataloged | `✅ Using` | Synced across all 5 global agent targets. |
