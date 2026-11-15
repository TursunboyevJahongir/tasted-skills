# `addy-agent-skills` (Addy Osmani)

[🇺🇿 O'zbekcha](../../architecture/addy-agent-skills.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/architecture/addy-agent-skills.md)

- **Source:** [addyosmani/agent-skills](https://github.com/addyosmani/agent-skills)
- **Category:** `Architecture` *(Full SDLC Pipeline: `/spec`, `/plan`, `/build`, `/test`, `/review`, `/ship`)*
- **Type:** `Plugin (25 skills + 9 commands + 4 personas)`
- **Quality Score:** **8.0 / 10**
- **Relevance to Us:** **2.5 / 10**
- **Recommended Scope:** `Do Not Install`
- **Used Instead:** [**`grill-me`**](grill-me.md) + [**`ponytail`**](ponytail.md) + [**`karpathy-guidelines`**](karpathy-guidelines.md) + [**`elephant-goldfish-model`**](elephant-goldfish-model.md) + [**`T3 Code`**](../developer-tools/t3-code.md)
- **Reviewed Date:** `2026-11-16`
- **Current Status:** `⛔ Rejected`

---

## 1. Brief Overview: What It Is and How It Works

Addy Osmani's pack of 25 lifecycle engineering skills (`interview-me`, `spec-driven-development`, `test-driven-development`, `doubt-driven-development`, `code-review-and-quality`, `frontend-ui-engineering`, `performance-optimization`, etc.) wired to 9 slash commands (`/spec -> /plan -> /build -> /test -> /review -> /ship`).

---

## 2. Why We Didn't Install It

Cleaner and better structured than `superpowers`, but still introduces **ceremony and overlap** across our daily stack:
- **Process friction:** Enforces strict Red-Green-Refactor TDD, ~100-line change caps, and mandatory interactive pauses in `doubt-driven-development` asking whether to escalate every decision to another CLI model.
- **Every strong idea in the pack is already covered by sharper focused tools in our stack:**
  - `interview-me` → [**`grill-me`**](grill-me.md) (`9.5/10`)
  - `doubt-driven` / `code-review` → [**`elephant-goldfish-model`**](elephant-goldfish-model.md) + [**`T3 Code`**](../developer-tools/t3-code.md)
  - `code-simplification` → [**`ponytail`**](ponytail.md) + [**`karpathy-guidelines`**](karpathy-guidelines.md)
  - `frontend-ui-engineering` → [**`impeccable`**](../ui-ux/impeccable.md)

---

## 3. Status & Action History

| Date | Action | Status | Notes |
|---|---|---|---|
| 2026-11-16 | Primary-source audit | `⛔ Rejected` | Well-written (`8.0/10`), skipped to avoid 25-skill SDLC ceremony and auto-trigger overlap with our leaner active stack. |
