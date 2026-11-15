# `humanizer` & `stop-slop`

[🇺🇿 O'zbekcha](../../developer-tools/humanizer-stop-slop.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/developer-tools/humanizer-stop-slop.md)

- **Source:** [blader/humanizer](https://github.com/blader/humanizer) · [hardikpandya/stop-slop](https://github.com/hardikpandya/stop-slop)
- **Category:** `Developer Tools` *(Prose Editing Skills for Removing AI Writing Tells)*
- **Type:** `Skill` (`Markdown`)
- **Quality Score:** **7.5 / 10**
- **Need for Us:** **2.0 / 10** *(built for essays and blog posts, not software engineering or product UI)*
- **Recommended Scope:** `Do Not Install`
- **Instead Use:** [**`ponytail`**](../architecture/ponytail.md) (concise engineering replies) + [**`impeccable`**](../ui-ux/impeccable.md) (`clarify` for product UX copy)
- **Reviewed Date:** `2026-11-16`
- **Current Status:** `⛔ Rejected`

---

## 1. Brief Overview: What They Are and How They Work

Two popular Markdown skills focused on stripping LLM clichés from long-form prose:
- **`blader/humanizer` (`MIT`, `~32 KB` `SKILL.md`):** Built from Wikipedia's *"Signs of AI writing"* guide to rewrite 24 common AI tells (*"delve"*, *"tapestry"*, puffery, em-dash overuse, formulaic conclusions).
- **`hardikpandya/stop-slop` (`MIT`, `~2.6 KB` `SKILL.md` + `references/`):** Bans binary contrasts (*"Not X. It's Y."*), dramatic one-line closers, and passive voice, grading prose across 5 dimensions.

---

## 2. Why We Didn't Install Them

- **Not built for code or UI:** Both target essays, newsletters, and marketing copy rather than codebases or app interfaces.
- **Context weight:** `humanizer` alone injects `~32 KB` of prose rules whenever triggered.
- **Already covered where it matters:** [**`ponytail`**](../architecture/ponytail.md) keeps agent technical responses crisp, and [**`impeccable`**](../ui-ux/impeccable.md) (`clarify`) handles in-product UI microcopy.

---

## 3. Status & Action History

| Date | Action | Status | Notes |
|---|---|---|---|
| 2026-11-16 | Primary-source audit | `⛔ Rejected` | Clean prose-editing references (`7.5/10`), skipped because our engineering reply style and UI copy are already handled by `ponytail` + `impeccable`. |
