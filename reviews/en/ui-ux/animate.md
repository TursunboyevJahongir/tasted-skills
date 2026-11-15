# `animate` (Emil Kowalski — Web Motion Construction)

[🇺🇿 O'zbekcha](../../ui-ux/animate.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/ui-ux/animate.md)

- **Source:** [emilkowalski/skills — `skills/animate`](https://github.com/emilkowalski/skills/tree/main/skills/animate)
- **Category:** `UI/UX` *(Web CSS, WAAPI, and Motion library animations)*
- **Type:** `Skill` *(`SKILL.md` + `RECIPES.md`, ~410 lines)*
- **Quality Score:** **8.5 / 10**
- **Relevance to Us:** **3.0 / 10**
- **Recommended Scope:** `Do Not Install`
- **Used Instead:** [**`impeccable`**](impeccable.md) (`animate` playbook — for Web) + [**`animate-expo`**](../mobile/animate-expo.md) (for React Native / Expo)
- **Reviewed Date:** `2026-11-15`
- **Current Status:** `⏭️ Skipped (not tested)`

---

## 1. What It Is & How It Works

Emil Kowalski's web animation construction skill (`SKILL.md` 209 lines + `RECIPES.md` ready-made component patterns):
1. **`Frequency Gate`:** Bans animations on high-frequency actions used 100+ times a day (keyboard shortcuts, command palettes).
2. **Tool selection ladder:** CSS transition → CSS `@starting-style` → CSS animation → WAAPI (`element.animate()`) → `Motion` (`motion.dev`).
3. **Easing and timing standards:** `<300ms` for UI elements, no `ease-in`, strong `cubic-bezier(0.23, 1, 0.32, 1)` (`--ease-out`), and `scale(0.95) + opacity: 0` instead of `scale(0)`.
4. **Accessibility:** Pairing `prefers-reduced-motion: reduce` and `@media (hover: hover) and (pointer: fine)` together.

---

## 2. Strengths & Weaknesses

### Strengths
- Clear decision hierarchy and clean recipes in `RECIPES.md` for dropdowns, modals, drawers, toasts, and hold-to-confirm controls.
- Strong restraint principle ("zero lines of code is a success" when motion isn't needed).

### Weaknesses & Conflict Reasons
- **Direct `auto-trigger` collision with [`impeccable`](impeccable.md):** Its `description` (*"Use when asked to animate something, add motion, make a component feel alive, or build a transition"*) triggers simultaneously with `impeccable`'s main description and `reference/animate.md`, doubling context usage.
- **Rule contradiction:** `animate` strictly restricts animations to *"only `transform` and `opacity`"*, whereas `impeccable` (`craft-floor.md` and `animate.md`) allows tasteful use of `backdrop-filter`, `mask`, `clip-path`, and `View Transitions` where smooth.
- **External cross-references:** References sibling skills we don't have installed (`pick-ui-library`, `review-animations`, `improve-animations`) and includes a `## Initial Response` banner block.

---

## 3. Security & Sanitization

- **Risk Level:** `Low` *(pure Markdown, no scripts or hooks)*
- If ever used in a standalone project (`-p`), strip the `## Initial Response` block and the `../pick-ui-library/SKILL.md` reference.

---

## 4. What We Use Instead

Global installation is unnecessary because two of our active skills cover this domain cleanly without conflicts:
1. **For Web and Mobile Web animations:** [**`impeccable`**](impeccable.md) (`animate` command / `reference/animate.md`) — works in harmony with the project's overall design mode (`Operate` vs `Persuade`).
2. **For React Native and Expo animations:** [**`animate-expo`**](../mobile/animate-expo.md) — by the same author, purpose-built for `Reanimated` worklets and native gestures.

*(Sibling skills in the same repo — `animation-performance`, `improve-animations`, `remove-animations`, `review-animations`, `choreograph`, and `gestures` — were also skipped globally for the same reason, as `impeccable`'s `animate`, `quieter`, and `optimize` playbooks plus `animate-expo` cover them.)*

---

## 5. Best Use Cases

- **When to use:** Do not install globally — use [`impeccable`](impeccable.md) and [`animate-expo`](../mobile/animate-expo.md) instead.

---

## 6. Status & Action History

| Date | Action | Status | Notes |
|---|---|---|---|
| 2026-11-15 | Audited GitHub `SKILL.md` + `RECIPES.md` and conflicts | `⏭️ Skipped (not tested)` | High quality (`8.5/10`), but skipped due to `auto-trigger` and rule collisions with [`impeccable`](impeccable.md). |
