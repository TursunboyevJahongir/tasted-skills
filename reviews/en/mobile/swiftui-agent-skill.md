# `swiftui-agent-skill` / `apple-design-skill`

[🇺🇿 O'zbekcha](../../mobile/swiftui-agent-skill.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/mobile/swiftui-agent-skill.md)

- **Source:** [twostraws/swiftui-agent-skill](https://github.com/twostraws/swiftui-agent-skill) · [AvdLee/SwiftUI-Agent-Skill](https://github.com/AvdLee/SwiftUI-Agent-Skill) · [dickwu/apple-design-skill](https://github.com/dickwu/apple-design-skill)
- **Category:** `Mobile` *(Idiomatic SwiftUI & Apple HIG Guidance)*
- **Type:** `Skill`
- **Quality Score:** **8.5 / 10**
- **Need for Us:** **3.0 / 10** *(our primary mobile apps use React Native / Expo; useful only locally `-p` for pure SwiftUI targets)*
- **Recommended Scope:** `Local Only (-p)` *(strictly inside native Swift/SwiftUI repos or targets)*
- **Instead Use:** [**`impeccable`**](../ui-ux/impeccable.md) (`reference/ios.md` for Apple HIG) + [**`animate-expo`**](animate-expo.md) (for Expo / RN)
- **Reviewed Date:** `2026-11-16`
- **Current Status:** `👍 Good Option`

---

## 1. Brief Overview: What It Is and How It Works

The three main open-source skills behind "SwiftUI Expert / Apple Design" recommendations:
- **`twostraws/swiftui-agent-skill` (`swiftui-pro` by Paul Hudson)** and **`AvdLee/SwiftUI-Agent-Skill` (Antoine van der Lee):** Prevent deprecated SwiftUI APIs (`NavigationStack` over `NavigationView`, `@Observable` state flow), layout pitfalls, and VoiceOver mistakes.
- **`dickwu/apple-design-skill`:** Reviews layouts against Apple's Human Interface Guidelines (HIG).

---

## 2. Why We Didn't Install Globally

- Our core mobile stack is **Expo / React Native**, so loading SwiftUI rules globally adds idle noise.
- Cross-framework Apple HIG guidance is already built into our active [**`impeccable`**](../ui-ux/impeccable.md) setup (`reference/ios.md` and `audit.native.md`).
- **When to use:** Install `twostraws/swiftui-agent-skill` strictly at project scope (`-p`) only when building native SwiftUI targets such as iOS Widgets, Live Activities / Dynamic Island, or watchOS companions.

---

## 3. Status & Action History

| Date | Action | Status | Notes |
|---|---|---|---|
| 2026-11-16 | Primary-source review | `👍 Good Option` | Unnecessary globally on React Native / Expo; keep in reserve for `-p` project installs on native SwiftUI widgets/extensions. |
