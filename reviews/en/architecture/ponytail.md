# `ponytail` (Dietrich Gebert)

[🇺🇿 O'zbekcha](../../architecture/ponytail.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/architecture/ponytail.md)

- **Source:** [DietrichGebert/ponytail](https://github.com/DietrichGebert/ponytail/blob/main/skills/ponytail/SKILL.md)
- **Category:** `Architecture` *(Code simplicity, YAGNI, and concise reply discipline)*
- **Type:** `Skill`
- **Quality Score:** **9.5 / 10**
- **Relevance to Us:** **9.5 / 10**
- **Recommended Scope:** `Global (-g)`
- **Reviewed Date:** `2026-11-15`
- **Current Status:** `✅ Using`

---

## 1. What It Is & How It Works

"Lazy senior dev mode" — a pure Markdown skill (`SKILL.md`, 3.5 KB) that trains the agent to make the **smallest change that fully solves the task** (YAGNI) and write a reply a busy human **understands in one read**.

Includes 3 levels (`lite`, `full` default, `ultra`) and clear engineering rules:
- Never add unrequested "future-proof" abstractions, factories, wrappers, config layers, or new dependencies for a few lines of work;
- Check all affected callers, tests, and exports before editing, and close the task with the smallest complete diff;
- Leave 1 small test or `assert` on tricky new logic; never cut corners on security, accessibility, or data safety;
- State in 1–2 lines at the end of the reply what was not verified or skipped and any remaining risk.

---

## 2. Strengths & Weaknesses

### Strengths
- Extremely lightweight (a single file, zero scripts or hooks) with near-zero context overhead.
- Cures the biggest LLM coding habit: turning a 10-line fix into a 200-line "architecture" followed by a wall-of-text essay.

### Weaknesses & Cost
- When designing a large system from scratch (`greenfield architecture`), state architectural requirements explicitly so minimalism isn't over-applied.

---

## 3. Security & Pre-Install Sanitization

- **Risk Level:** `Low`
- **Audited Points:** `skillshare audit` passed clean (`0 findings`). No external scripts, hooks, or network calls. No sanitization required.

---

## 4. Relevance & Compatibility with Our Existing Tools

- Complements [`karpathy-guidelines`](karpathy-guidelines.md): while `karpathy-guidelines` enforces surfacing assumptions and making surgical edits, `ponytail` keeps both diff size and reply length minimal.
- The direct antithesis of heavy process plugins like [`superpowers`](superpowers.md).

---

## 5. Best Use Cases

- **When to use:** Daily Web, Mobile, and Backend coding, bugfixes, and refactoring.
- **When not to use:** When explicitly asked for a long-form analytical report or comprehensive documentation.

---

## 6. Status & Action History

| Date | Action | Status | Notes |
|---|---|---|---|
| 2026-11-15 | Installed via `skillshare install DietrichGebert/ponytail/skills/ponytail -g` | `✅ Using` | Passed security audit cleanly and synced across all 5 global agent targets. |
