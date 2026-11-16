# `break-ui` (Emil Kowalski — Adversarial UI Stress-Testing)

[🇺🇿 O'zbekcha](../../ui-ux/break-ui.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/ui-ux/break-ui.md)

- **Source:** [emilkowalski/skills — `skills/break-ui`](https://github.com/emilkowalski/skills/tree/main/skills/break-ui)
- **Category:** `UI/UX` *(UI edge-case data stress testing)*
- **Type:** `Skill` *(`SKILL.md` + `CATALOG.md`, ~312 lines)*
- **Quality Score:** **8.0 / 10**
- **Relevance to Us:** **3.0 / 10**
- **Recommended Scope:** `Do Not Install`
- **Used Instead:** [**`impeccable`**](impeccable.md) (`harden` playbook — `reference/harden.md`)
- **Reviewed Date:** `2026-11-15`
- **Current Status:** `⛔ Rejected`

---

## 1. What It Is & How It Works

> [!IMPORTANT]
> **In Plain Words (Main Job & Value):** Shows where extreme text or empty states break a page, but injects temporary test toggles into your code and stops without fixing the bug — whereas `impeccable` (`harden`) fixes layout edge cases directly.

A skill for stress-testing UI components with realistic worst-case production payloads (`CATALOG.md`) instead of idealized `"Jane Doe"` demo strings:
- Hyphenated long names (`Aleksandra Wiśniewska-Kowalczyk`), unbreakable long emails and URLs, single-letter names (`J`), Vietnamese/Arabic (`RTL`)/CJK scripts, ZWJ emoji sequences (`👩🏽‍💻`), numbers like `0` / `1` ("1 members") / `1,284` / `0.30000000000000004`, `404` avatars, and `1,000+` row lists;
- Wires a temporary **`Demo / Worst case / Empty / One / 1,000 rows`** switch pill and fixture file into the project and checks `320px`, `200% zoom`, and `RTL`;
- Outputs a 3-part markdown report and stops without fixing anything until the user says `fix all`.

---

## 2. Strengths & Weaknesses

### Strengths
- Payloads in `CATALOG.md` reflect real production edge cases rather than synthetic `"aaaaaaaaaa"` strings.
- Provides concrete CSS/JS fixes (`min-width: 0`, `flex-shrink: 0`, `overflow-wrap: anywhere`, `tabular-nums`, `Intl.Segmenter`, and `Intl.PluralRules`).

### Weaknesses & Conflict Reasons
1. **Overlap with [`impeccable`](impeccable.md) (`harden`):** `impeccable`'s `reference/harden.md` playbook already audits and directly fixes long/short strings, `min-width: 0`, `line-clamp`, `RTL`, translation expansion (+30–40%), `Intl` formatting, empty states, and **network/API error states**.
2. **Injects unwanted fixtures and toggle UI into project code:** The skill instructs the agent to create a worst-case fixture file, mount a `Demo / Worst case` toggle pill on screen, and leave the fixture in the repository. This violates our frontend rules against adding ad-hoc test fixtures as well as [`ponytail`](../architecture/ponytail.md) / [`karpathy-guidelines`](../architecture/karpathy-guidelines.md).
3. **Two-step halt and verbose report:** Instead of fixing obvious CSS overflow issues immediately, it outputs a 3-section report and waits for `fix all`.

---

## 3. Security & Sanitization

- **Risk Level:** `Low` *(no scripts or external calls; uses safe `example.com` / `.test` domains)*
- Contains a `## Initial Response` greeting banner at the top.

---

## 4. What We Use Instead

- **Used Instead:** [**`impeccable`**](impeccable.md) (`harden [target]` command / `reference/harden.md`) — hardens CSS overflow, i18n, pluralization, and API/offline error states directly without polluting the repo with demo toggles or fixture files.

---

## 5. Best Use Cases

- **When to use:** Do not install globally — use [`impeccable`](impeccable.md) (`harden`) instead.

---

## 6. Status & Action History

| Date | Action | Status | Notes |
|---|---|---|---|
| 2026-11-15 | Audited GitHub `SKILL.md` + `CATALOG.md` and conflicts | `⛔ Rejected` | Skipped because [`impeccable`](impeccable.md) (`harden`) handles this cleanly without injecting fixture files or toggle pills into the repo. |
