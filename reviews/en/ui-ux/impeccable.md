# `impeccable`

[🇺🇿 O'zbekcha](../../ui-ux/impeccable.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/ui-ux/impeccable.md)

- **Source:** [pbakaus/impeccable](https://github.com/pbakaus/impeccable)
- **Category:** `UI/UX` *(Web, Mobile Web, and Native iOS/Android design system and UX audit)*
- **Type:** `Skill` *(v4.8.1, customized with local mobile routing)*
- **Quality Score:** **9.5 / 10**
- **Relevance to Us:** **9.5 / 10**
- **Recommended Scope:** `Global (-g)`
- **Active Since:** `2026-11-09`
- **Current Status:** `✅ Active` *(primary design skill for all web and mobile UI/UX tasks)*

---

## 1. What It Is & How It Works

A comprehensive *Design Director* skill created by Paul Bakaus. Instead of generic preset color palettes, it operates in 4 distinct modes based on the page's purpose:
- **Persuade:** Landing, marketing, and pricing pages (strong visual character and conversion).
- **Operate:** Dashboards, admin panels, maps, and working web apps (clarity, scan speed, and ergonomics first).
- **Read:** Documentation, articles, and guides.
- **Experience:** Portfolios and media showcases.

Includes dedicated playbooks (`shape`, `audit`, `polish`, `simplify`, `harden`, `adapt`), a strict quality baseline (`craft-floor.md` — banning generic AI card grids, meaningless gradient text, and fake decorative chrome), and persistent product context in `PRODUCT.md` and `DESIGN.md`. Our local build is adapted for both **mobile web** and **native iOS / Android** screens.

---

## 2. Strengths & Weaknesses

### Strengths
- Works within an existing project's stack and design system without breaking them (clearly separates `Refinement` from `Redesign`).
- Requires checking real rendered dimensions in a browser or simulator after changes.
- Avoids category cliches common in template-driven tools like `ui-ux-pro-max`.

### Weaknesses & Limitations
- Because its guidance and reference library are extensive, only the relevant playbook (`adapt.md`, `audit.md`, `craft-floor.md`) should be loaded per task.

---

## 3. Security & Sanitization Status

- **Risk Level:** `Low` *(locally customized and sanitized)*
- **Applied Sanitization (important):**
  1. External `hooks` and automatic `live`/`generate` modes are disabled in our local install so it never spawns unauthorized CLI agents.
  2. Even if `live` mode is manually enabled in the future, it is restricted via `IMPECCABLE_LIVE_COPY_AGENT=chat` (or `off`).

---

## 4. Relevance & Compatibility with Our Existing Tools

- Complements [`animate-expo`](../mobile/animate-expo.md) for React Native/Expo motion and [`mobile-native`](../mobile/mobile-native.md) for mobile browser/PWA touch and viewport ergonomics.
- Because `impeccable` is installed globally, competing UI skills such as [`ui-ux-pro-max`](ui-ux-pro-max.md), [`make-interfaces-feel-better`](make-interfaces-feel-better.md), and global [`taste-skill`](../web/taste-skill.md) are unnecessary and would conflict with it.

---

## 5. Best Use Cases

- **When to use:** Designing new interfaces, refining existing web or native mobile screens, running UX/accessibility audits, and organizing design tokens.
- **When not to use:** Pure backend, database, or non-UI tasks.

---

## 6. Status & Action History

| Date | Action | Status | Notes |
|---|---|---|---|
| 2026-11-09 | Installed `v4.8.1` globally (with `mobile-routing-1` and safe hook restrictions) | `✅ Active` | Actively used across web, mobile web, and React Native screens for UI design and contrast/UX auditing. |
