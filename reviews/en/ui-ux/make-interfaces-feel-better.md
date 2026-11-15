# `make-interfaces-feel-better` (Jakub Krehel — Design Engineering Micro-Polish)

[🇺🇿 O'zbekcha](../../ui-ux/make-interfaces-feel-better.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/ui-ux/make-interfaces-feel-better.md)

- **Source:** [jakubkrehel/make-interfaces-feel-better](https://github.com/jakubkrehel/make-interfaces-feel-better)
- **Category:** `UI/UX` *(Web CSS micro-details: border radius, tabular-nums, shadows, button press)*
- **Type:** `Skill` *(6 Markdown files, 1,154 lines)*
- **Quality Score:** **7.5 / 10**
- **Relevance to Us:** **2.5 / 10**
- **Recommended Scope:** `Do Not Install` *(previously tested and uninstalled)*
- **Used Instead:** [**`impeccable`**](impeccable.md) ([pbakaus/impeccable](https://github.com/pbakaus/impeccable)) + [**`animate-expo`**](../mobile/animate-expo.md) ([emilkowalski/skills](https://github.com/emilkowalski/skills/tree/main/skills/animate-expo))
- **Reviewed Date:** `2026-11-15`
- **Current Status:** `⛔ Rejected` *(🧪 Tested and removed because `impeccable` + `animate-expo` completely supersede it)*

---

## 1. What It Is & How It Works

19 micro-rules for polishing web interfaces (`SKILL.md`, `typography.md`, `surfaces.md`, `animations.md`, `icons.md`, `performance.md`):
- Concentric border radius formula (`outerRadius = innerRadius + padding`);
- `font-variant-numeric: tabular-nums` on dynamic numbers;
- `text-wrap: balance` on headings, `text-wrap: pretty` on body copy, and `-webkit-font-smoothing: antialiased` on macOS;
- `scale(0.96)` on button active state and `44x44px` (`40x40px` desktop) hit targets on small controls;
- Banning `transition: all` and restricting `will-change`;
- Ends with a mandatory 4-table review output template (`Scope and Coverage`, `Before/After`, `Considered but Rejected`, `Verdict`).

---

## 2. Why It Was Removed (Weaknesses & Cost)

1. **Direct `Auto-trigger overlap` with [`impeccable`](impeccable.md):**
   - Its broad `description` matches almost any frontend/UI prompt, causing the agent to load both `impeccable` and `make-interfaces-feel-better` simultaneously — doubling context consumption and feeding conflicting instructions.
2. **Rigid hardcoded numbers:**
   - Forcing `scale(0.96)` on every button and `scale(0.25) + blur(4px)` on every icon swap does not always fit a project's existing design system.
3. **Verbose 4-table report that contradicts [`ponytail`](../architecture/ponytail.md):**
   - Lines `120–187` force the agent to fabricate artificial `Considered but Rejected` candidates and lengthy `Before/After` tables on every UI tweak.

---

## 3. Security & Sanitization

- **Risk Level:** `Low` *(no scripts or hooks, though its auto-trigger and output template are heavy)*

---

## 4. What We Use Instead (Full Replacements)

`make-interfaces-feel-better` was uninstalled and replaced by two stronger skills:

1. **Instead (Web + iOS + Android UI/UX & Polish):** [**`impeccable`**](impeccable.md) — [pbakaus/impeccable](https://github.com/pbakaus/impeccable)
   - Its `craft-floor.md`, `polish.md`, `animate.md`, and `typeset.md` references already include `tabular-nums`, `text-wrap: balance`, optical alignment, shadows, `44×44px` hit targets, and `will-change` discipline — covering not just Web, but native iOS and Android too.
2. **Instead (Mobile React Native / Expo animations):** [**`animate-expo`**](../mobile/animate-expo.md) — [emilkowalski/skills (`animate-expo`)](https://github.com/emilkowalski/skills/tree/main/skills/animate-expo)
   - Handles mobile press feedback, bottom sheets, springs, and haptics on the `Reanimated` UI thread (`60/120fps`).

---

## 5. Best Use Cases

- **When to use:** Do not install — use [`impeccable`](impeccable.md) and [`animate-expo`](../mobile/animate-expo.md) instead.

---

## 6. Status & Action History

| Date | Action | Status | Notes |
|---|---|---|---|
| 2026-11-15 | Uninstalled globally via `skillshare uninstall make-interfaces-feel-better -g` | `⛔ Rejected` | Removed because [`impeccable`](impeccable.md) and [`animate-expo`](../mobile/animate-expo.md) cover all its useful rules without auto-trigger collisions or 4-table report bloat. |
