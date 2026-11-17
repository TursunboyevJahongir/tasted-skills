# `mobile-native` (Emil Kowalski — Mobile Web & PWA Platform Layer)

[🇺🇿 O'zbekcha](../../mobile/mobile-native.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/mobile/mobile-native.md)

- **Source:** [emilkowalski/skills — skills/mobile-native](https://github.com/emilkowalski/skills/tree/main/skills/mobile-native)
- **Category:** `Mobile` *(Mobile Web, PWA & Mini App)*
- **Type:** `Skill` *(`SKILL.md` + local `LOCAL-COMPATIBILITY.md` guard)*
- **Quality Score:** **8.5 / 10**
- **How Often Needed:** **7.5 / 10**
- **Recommended Scope:** `Global (-g)` *(sanitized and scoped)*
- **Reviewed Date:** `2026-11-15`
- **Current Status:** `✅ Using`

---

## 1. What It Is and How It Works

> [!IMPORTANT]
> **In Plain Words (Main Job & Value):** Fixes the 11 classic mobile browser quirks (iOS input auto-zoom, jumping `100vh` bars, notch clipping, sticky hover states) so mobile web apps and Mini Apps feel truly native on a phone.

Authored by **Emil Kowalski** (creator of `Sonner` and `Vaul`, design engineer formerly at Linear and Vercel).

The skill installs no external scripts or libraries. It solves one specific job: eliminating the **11 browser/CSS platform tells that give away a mobile web app, PWA, or Mini App as "just a website in a browser"** using clean CSS declarations and `<meta>` tags:

1. **Sticky `:hover` after tap** — wrap hover rules in `@media (hover: hover) and (pointer: fine)`.
2. **Gray/blue tap highlight flash** — set `-webkit-tap-highlight-color: transparent` globally and provide explicit `:active` feedback.
3. **`100vh` overflow bug** — replace `100vh` with `100dvh` (app shells/drawers) and `100svh` (heroes/first screens).
4. **iOS Safari input auto-zoom** — never use `maximum-scale=1` (accessibility violation); set `font-size: 16px` (`@media (pointer: coarse)`), `inputmode`, and `enterkeyhint`.
5. **300ms tap delay & release-only feedback** — apply `touch-action: manipulation` and trigger feedback on `:active` / `pointerdown` (`scale(0.97)`).
6. **Pull-to-refresh & scroll chaining** — replace non-passive JS `touchmove` blockers with `overscroll-behavior: none` (app-shell root) and `overscroll-behavior: contain` (inside sheets/modals).
7. **Notch / Dynamic Island & software keyboard** — `viewport-fit=cover` + `env(safe-area-inset-*)` + `interactive-widget=resizes-content`.
8. **Long-press selecting button text** — apply `user-select: none` and `-webkit-touch-callout: none` on interactive controls only (never `body`).
9. **Horizontal carousel vertical jitter** — `touch-action: pan-y` or native `scroll-snap-type: x mandatory`.
10. **Mismatched status bar color** — dual `<meta name="theme-color" media="(prefers-color-scheme: ...)">` tags for light and dark mode.
11. **Real hardware verification rule** — Chrome DevTools device emulation cannot reproduce these bugs; explicitly state what was verified in code vs what requires a physical phone.

*(Note: some clickbait social videos falsely advertise this skill with unrelated WebGL B-roll as if it automatically redesigns broken desktop layouts into mobile UI — in reality, it is a focused mobile browser platform-layer polish skill.)*

---

## 2. Strengths and Weaknesses

### Strengths
- **Zero JS device-sniffing:** Strictly forbids broken `useIsTouchDevice()` hooks or `navigator.userAgent` checks in favor of CSS capability media queries.
- **Compact & actionable:** ~315 lines, zero scripts, includes a crisp `Never Ship` checklist, and outputs concise summaries aligned with [ponytail](../architecture/ponytail.md).
- **Preserves accessibility:** Fixes input auto-zoom via `16px` font size instead of disabling pinch-to-zoom.

### Weaknesses and Cost
- Does not restructure multi-column desktop layouts into mobile UX (use [impeccable](../ui-ux/impeccable.md)'s `adapt` playbook for responsive layout redesign).
- Global `html { overscroll-behavior: none; }` disables pull-to-refresh on standard content/catalog pages — constrained via `LOCAL-COMPATIBILITY.md` to app-shell / map / PWA surfaces only.

---

## 3. Security & Pre-Install Sanitization

- **Risk Level:** `Low` *(`0` script/network findings in `skillshare audit`)*
- **Applied sanitization & conflict guards:**
  1. **Stripped `## Initial Response` block:** Removed the forced *"I'm ready to make your web app feel native on mobile..."* greeting.
  2. **Narrowed `description` (auto-trigger guard):** Scoped strictly to end-user mobile web apps, PWAs, and mobile WebViews/Mini Apps; explicitly excluded desktop-only **admin panels**, Smart TV surfaces, and native **React Native / Expo** apps.
  3. **Replaced uninstalled sibling skill references:** Pointed `animate` and `review-animations` mentions to [impeccable](../ui-ux/impeccable.md) and added `@media (prefers-reduced-motion: reduce)` protection to the `:active` press recipe.
  4. **Added `LOCAL-COMPATIBILITY.md`:** Established clear boundaries with `impeccable`, `animate-expo`, and `ponytail`.

---

## 4. Fit & Compatibility with Our Existing Stack

Fills the exact mobile-browser platform gap without colliding with our existing skills:
- **[impeccable](../ui-ux/impeccable.md)** — owns overall UI/UX hierarchy, typography, responsive layout adaptation (`adapt`), and web motion (`animate`), while `mobile-native` handles low-level mobile browser platform rules (`dvh/svh`, `interactive-widget`, `overscroll-behavior`, `pointer: coarse`, `safe-area-inset-*`).
- **[animate-expo](animate-expo.md)** — dedicated to native React Native / Expo UI-thread animations and gestures.

---

## 5. When to Use (and When Not To)

- **When to use:** End-user mobile web apps, real-time map web views, PWAs, Telegram Mini Apps, mobile bottom sheets/drawers/carousels, and mobile web forms.
- **When not to use:** Desktop-only internal admin panels, Smart TV (WebOS) interfaces, and native (`Expo` / `Swift` / `Kotlin`) mobile apps.

---

## 6. Status & Action History

| Date | Action | Status | Notes |
|---|---|---|---|
| 2026-11-15 | Initial video + GitHub `SKILL.md` audit | `✅ Using` | Rated `8.5/10` quality and safe. |
| 2026-11-15 | Sanitized + added `LOCAL-COMPATIBILITY.md` + installed globally via `skillshare` | `✅ Using` | Stripped `Initial Response`, added admin/native exclusions and `impeccable` compatibility guard, and synced across all 5 global agent targets. |
