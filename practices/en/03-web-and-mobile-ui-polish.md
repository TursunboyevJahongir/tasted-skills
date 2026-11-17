# 3. Web, Mobile Web & Native UI Design + Verification

[🇺🇿 O'zbekcha](../03-web-and-mobile-ui-polish.md) | **🇬🇧 English** | [🇷🇺 Русский](../ru/03-web-and-mobile-ui-polish.md)

⬅️ [Back to Practices Table of Contents](README.md)

- **Combined Tools:** [**impeccable**](../../reviews/en/ui-ux/impeccable.md) + [**mobile-native**](../../reviews/en/mobile/mobile-native.md) + [**animate-expo**](../../reviews/en/mobile/animate-expo.md) + [**asset-diet**](../../reviews/en/developer-tools/assetdiet.md) + [**agent-desktop**](../../reviews/en/developer-tools/agent-desktop.md)
- **Target Projects:** Functional web apps, admin panels, Telegram Mini Apps / PWAs, and Expo / React Native screens.

---

## 1. Why Combine These Tools? (Overall Benefit)

No single UI skill covers every layer of frontend quality:
- A visual design skill (`impeccable`) establishes hierarchy, color, and typography, but won't automatically fix iOS Safari `100vh` jumps or `Reanimated` UI-thread spring handoffs;
- Uncompressed PNG/SVG/video assets slow down initial load;
- Code-only UI edits miss overlapping elements unless inspected in a live browser.

---

## 2. How to Run Them Together (Layer by Layer)

### 1) Visual Hierarchy, UX Copy & Edge Cases (`impeccable`)
- Invoke targeted `impeccable` modes when building or refining screens:
  - **`polish` / `quieter` / `bolder`:** Strip visual noise or sharpen focal points;
  - **`clarify`:** Tighten labels, buttons, validation messages, and empty states;
  - **`harden`:** Stress-test long text (`line-clamp`), zero-data states, slow networks, and error recovery.

### 2) Platform-Native Feel (`mobile-native` vs `animate-expo`)
- **For Mobile Web / PWA / Mini Apps (`impeccable` + `mobile-native`):**
  - Applies `100dvh/svh`, `env(safe-area-inset-*)` notch/Dynamic Island padding, `>=16px` inputs (preventing iOS Safari auto-zoom), `@media (hover: hover)`, and `overscroll-behavior`.
- **For Expo / React Native (`impeccable` + `animate-expo`):**
  - Runs press feedback (`scale` + `expo-haptics`), screen transitions, and sheets on the **UI thread (`worklet`)** via `Reanimated` and `Gesture Handler`.

### 3) On-Demand Local Media Compression (`asset-diet`)
Before opening a PR or deploying, compress newly added images, SVGs, videos, or 3D assets locally with `0` permanent MCP overhead:
- `asset-diet` invokes `npx assetdiet-mcp@0.1.4` (`Sharp`, `SVGO`, `FFmpeg`, `glTF-Transform`) with full rollback support, cutting asset weight by `50–80%`.

### 4) Background Browser Verification Without Moving the Cursor (`agent-desktop`)
Verify the rendered web app inside the open `Google Chrome` window via macOS Accessibility (`AX`) without stealing window focus:
```bash
agent-desktop snapshot --app "Google Chrome" --skeleton -i --compact
agent-desktop click @<snapshot_id>:e12
```

---

## 3. Extra Power Practices

- **Greenfield marketing landing pages & lossless full-page web redesigns ([Hallmark v2](../../reviews/en/web/hallmark.md) — on demand via `-p` / `/hallmark`):** Keep `impeccable` as the daily driver for web/mobile product screens, and pull in `Hallmark v2` specifically when building a new promo/landing site or redesigning an existing page without losing a single link or form (`50` browsable themes + `755` licensed real photos + `capture.mjs` + `sloplint --before/--kept`).
