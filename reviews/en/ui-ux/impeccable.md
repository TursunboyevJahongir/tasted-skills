# `impeccable`

[🇺🇿 O'zbekcha](../../ui-ux/impeccable.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/ui-ux/impeccable.md)

- **Source:** [pbakaus/impeccable](https://github.com/pbakaus/impeccable)
- **Category:** `UI/UX` *(Web, Mobile Web, and Native iOS/Android design system and UX audit)*
- **Type:** `Skill` *(v4.8.1, customized with local `mobile-routing-1+apca-contrast-1` adaptation)*
- **Quality Score:** **9.5 / 10**
- **Relevance to Us:** **9.5 / 10**
- **Recommended Scope:** `Global (-g)`
- **Active Since:** `2026-11-09`
- **Current Status:** `✅ Using` *(primary design skill for all web and mobile UI/UX tasks)*

---

## 1. What It Is & How It Works

> [!IMPORTANT]
> **In Plain Words (Main Job & Value):** Eliminates generic "AI-slop" layouts and designs, audits, and polishes Web, mobile web, and native iOS/Android interfaces (`polish`, `clarify`, `harden`). Our local **`APCA` (`|Lc| ≥ 60`) contrast patch** also protects crisp white labels on colored brand buttons from being ruined by outdated `WCAG 2` math.

A comprehensive *Design Director* skill created by Paul Bakaus. Instead of generic preset color palettes, it operates in 4 distinct modes based on the page's purpose:
- **Persuade:** Landing, marketing, and pricing pages (strong visual character and conversion).
- **Operate:** Dashboards, admin panels, maps, and working web apps (clarity, scan speed, and ergonomics first).
- **Read:** Documentation, articles, and guides.
- **Experience:** Portfolios and media showcases.

Includes dedicated playbooks (`shape`, `audit`, `polish`, `simplify`, `harden`, `adapt`), a strict quality baseline (`craft-floor.md` — banning generic AI card grids, meaningless gradient text, and fake decorative chrome), and persistent product context in `PRODUCT.md` and `DESIGN.md`. Our local build is adapted for both **mobile web** and **native iOS / Android** screens and patched with **`APCA` perceptual contrast** guards.

---

## 2. Strengths & Weaknesses

### Strengths
- Works within an existing project's stack and design system without breaking them (clearly separates `Refinement` from `Redesign`).
- Requires checking real rendered dimensions in a browser or simulator after changes.
- Avoids category cliches common in template-driven tools like `ui-ux-pro-max`.

### Weaknesses & Limitations
- Because its guidance and reference library are extensive, only the relevant playbook (`adapt.md`, `audit.md`, `craft-floor.md`) should be loaded per task.
- Upstream (`v4.8.1`) checks contrast solely via legacy **`WCAG 2` (`4.5:1`)** ratios — on mid-tone brand buttons this falsely rejects crisp white text and pushes AI agents toward muddy dark text or dulled brand colors (resolved via our local `apca-contrast-1` patch below).

---

## 3. Security, Sanitization & Local Adaptations

- **Risk Level:** `Low` *(locally customized and sanitized)*
- **Applied Sanitization (important):**
  1. External `hooks` and automatic `live`/`generate` modes are disabled in our local install so it never spawns unauthorized CLI agents.
  2. Even if `live` mode is manually enabled in the future, it is restricted via `IMPECCABLE_LIVE_COPY_AGENT=chat` (or `off`).

<a id="apca-contrast"></a>

### Local `APCA` Perceptual Contrast Patch (`apca-contrast-1` — Exact `Old -> New` Changes)

**Why is this worth adding?**
`WCAG 2` (2008) divides relative luminance `(L1 + 0.05) / (L2 + 0.05)` without accounting for polarity (light-on-dark vs. dark-on-light human perception) or font weight. On mid-tone brand accent fills (`L > 0.18` — **orange, iOS blue `#007AFF`, green, red** buttons and badges):
- **Orange or iOS blue button + white text:** `WCAG 2 = 3.81–4.02` ❌ *(fails)*, whereas **`APCA = Lc 70–72` ✅** *(needs `60`; reads crisp and clean to the human eye)*.
- **Orange button + black text:** `WCAG 2 = 4.63` ✅ *(passes)*, whereas **`APCA = Lc 38` ❌** *(looks muddy and hard to read)*.

Instead of installing a separate contrast skill (which would collide on auto-triggers and bloat context), we patched 6 internal files inside `impeccable` (`Old -> New`):

1. **`SKILL.md` (`metadata.local-adaptation`, line 9):**
   - **Old:** `local-adaptation: mobile-routing-1`
   - **New:** `local-adaptation: mobile-routing-1+apca-contrast-1`

2. **`reference/craft-floor.md` (line 9 — primary baseline loaded right before every UI edit):**
   - **Old:**
     ```markdown
     - **Contrast:** body and placeholder text ≥4.5:1, large text ≥3:1. On colored surfaces tint secondary text from that hue or the foreground; never gray.
     ```
   - **New:**
     ```markdown
     - **Contrast:** body and placeholder text ≥4.5:1 (APCA |Lc| ≥75 body, ≥60 secondary), large text ≥3:1. On mid-tone brand fills (orange, blue, green, red buttons/badges), check both WCAG 2 and APCA: keep crisp light text when APCA |Lc| ≥60 (14px+ medium/semibold) instead of flipping to muddy dark text or dulling the brand hue just to chase WCAG 4.5:1; reject dark-on-accent pairs that pass WCAG 2 but fail APCA (|Lc| <60). On colored surfaces tint secondary text from that hue or the foreground; never gray.
     ```

3. **`reference/colorize.md` (`## Contrast and perception`, lines 53–63):**
   - **Old:** 2-column `WCAG AA minimum` table only (`body text: 4.5:1`, `large text: 3:1`, `controls, icons, focus indicators: 3:1`).
   - **New:** 3-column `WCAG AA minimum` + `APCA perceptual floor` table plus mid-tone accent button rule:
     ```markdown
     Verify computed foreground/background pairs with both WCAG 2 and perceptual APCA (`|Lc|`):

     | Content | WCAG AA minimum | APCA perceptual floor |
     |---|---|---|
     | body text | 4.5:1 | `\|Lc\| ≥ 75` (`≥ 60` secondary) |
     | large text / button & badge labels (`14px+` medium/semibold) | 3:1 (4.5:1 if strict legal WCAG AA applies) | `\|Lc\| ≥ 60` |
     | controls, icons, focus indicators | 3:1 | `\|Lc\| ≥ 45` |

     On mid-tone brand fills (vivid orange, iOS blue, green, red CTAs/badges), WCAG 2 luminance math favors dark text (`~4.6:1`, APCA `~38`) over crisp white text (`~3.8–4.1:1`, APCA `70+`). Unless strict legal WCAG 2 AA compliance is explicitly required, keep white text when `APCA |Lc| ≥ 60` rather than switching to low-perceptual dark text or muddying the brand color; fix pairs that fail both (`WCAG < 4.5:1` and `APCA |Lc| < 60`).
     ```

4. **`reference/audit.md` (`### 1. Accessibility`, line 14):**
   - **Old:**
     ```markdown
     - **Contrast issues**: Text contrast ratios < 4.5:1, or < 3:1 for large text (or 7:1 for AAA)
     ```
   - **New:**
     ```markdown
     - **Contrast issues**: Body/secondary text < 4.5:1 (`APCA |Lc| < 60`), or large text < 3:1. On mid-tone brand buttons/badges (`14px+` medium/semibold), evaluate both WCAG 2 and APCA: white text with `APCA |Lc| ≥ 60` (`WCAG ~3.5–4.4:1`) is perceptually legible (note only as an advisory if strict legal WCAG AA is required, not a P1 defect), whereas dark text on mid-tone accents with `APCA |Lc| < 60` is a real contrast failure even if `WCAG ≥ 4.5:1`
     ```

5. **`reference/audit.native.md` (`### 1. Accessibility`, line 17):**
   - **Old:**
     ```markdown
     - **Contrast**: text failing contrast in either appearance, light or dark
     ```
   - **New:**
     ```markdown
     - **Contrast**: text failing contrast in either appearance, light or dark (check both WCAG 2 and perceptual APCA `|Lc| ≥ 60` on mid-tone brand/system tint buttons such as iOS `#007AFF`, orange, or green fills so crisp white button labels aren't falsely flagged or flipped to muddy dark text)
     ```

6. **`reference/critique.md` (`Sam` accessibility persona, lines 734 & 741):**
   - **Old:** `Needs adequate color contrast (4.5:1 minimum)` and `Is color contrast WCAG AA compliant (4.5:1 for text)?`
   - **New:** `Needs adequate color contrast (4.5:1 body text; APCA |Lc| ≥ 60 on mid-tone accent buttons/badges)` and `Is color contrast legible across both WCAG AA (4.5:1 body) and perceptual APCA (|Lc| ≥ 60 on colored controls)?`

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
| 2026-11-09 | Installed `v4.8.1` globally (with `mobile-routing-1` and safe hook restrictions) | `✅ Using` | Actively used across web, mobile web, and React Native screens for UI design and contrast/UX auditing. |
| 2026-11-16 | Added `apca-contrast-1` perceptual contrast patch and ran `skillshare sync -g` | `✅ Using` | Patched `SKILL.md`, `craft-floor.md`, `colorize.md`, `audit.md`, `audit.native.md`, and `critique.md` to check both `WCAG 2` and `APCA (\|Lc\| ≥ 60)`, preventing false failures on crisp white text over mid-tone brand buttons. |
