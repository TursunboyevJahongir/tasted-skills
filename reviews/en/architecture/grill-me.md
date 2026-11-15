# `grill-me` (`grilling` + `grill-with-docs`)

[🇺🇿 O'zbekcha](../../architecture/grill-me.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/architecture/grill-me.md)

- **Source:** [aihero.dev/skills-grill-me](https://www.aihero.dev/skills-grill-me) · [mattpocock/skills](https://github.com/mattpocock/skills)
- **Category:** `Architecture` *(Planning, Decision Trees, and Requirement Sharpening)*
- **Type:** `Skill Suite` (`grill-me`, `grilling`, `grill-with-docs`)
- **Quality Score:** **9.5 / 10**
- **Relevance to Us:** **9.5 / 10**
- **Recommended Scope:** `Global (-g)`
- **Reviewed Date:** `2026-11-15`
- **Current Status:** `✅ Active` *(primary tool for stress-testing ideas and plans before writing code)*

---

## 1. What It Is & How It Works

Created by Matt Pocock, this lightweight yet powerful skill stress-tests a plan or architectural idea through **structured Q&A rounds** before any code is written:
- Treats the problem as a **design decision tree** and asks only the currently unlocked **frontier** questions in each round, numbered clearly (`❓ Q1 ... ➡️ Recommended answer`).
- **Golden Rule:** Never asks the user for *facts* that can be discovered in the codebase or filesystem — it dispatches a subagent or reads files itself, asking the user only questions that require a *decision*.
- Refuses to start coding until every branch in the decision tree is resolved.
- Its companion variant **`grill-with-docs`** works alongside `domain-modeling` to record the project ubiquitous language (`CONTEXT.md`) and Architecture Decision Records (`docs/adr/`) during the interview.

---

## 2. Strengths & Weaknesses

### Strengths
- **Ultra-compact (~28 lines):** Consumes virtually zero context while dramatically improving the agent's planning rigor.
- Provides a **recommended answer (`➡️`)** for every question, making user replies fast and effortless.
- Prevents wasted hours coding against half-baked requirements.

### Weaknesses & Limitations
- Operates as a 1-on-1 interview within a single session (when a large technical spec needs stateless multi-agent critique, pair it with [`elephant-goldfish-model`](elephant-goldfish-model.md)).

---

## 3. Security & Sanitization Status

- **Risk Level:** `Low`
- **Audited Points:** Pure Markdown with no scripts or hooks. Both `grill-me` and `grill-with-docs` set `disable-model-invocation: true`, meaning the agent never starts interrogating you unprompted — it only activates when you explicitly say "grill me" or `/grill-me`. No sanitization required.

---

## 4. Relevance & Compatibility with Our Existing Tools

- Serves as the interactive, deep-dive counterpart to [`karpathy-guidelines`](karpathy-guidelines.md) (*Think Before Coding*).
- Works seamlessly with `domain-modeling` and `task-context`: `grill-me` resolves design decisions, and `task-context` persists them for implementer and reviewer subagents.

### Audit of Remaining Skills in `mattpocock/skills` (`2026-11-16`)

We also audited all 25 skills in the upstream [mattpocock/skills](https://github.com/mattpocock/skills) repository (`skillshare audit`: `0 issues`):
- **Already active (`✅`):** `grill-me`, `grilling`, `grill-with-docs`, and `domain-modeling`.
- **Clean optional candidates (`👀 Reviewed, Not Tested`):**
  - **`diagnosing-bugs`** (`138` lines): Enforces building a fast deterministic red-capable repro loop first, ranking 3–5 falsifiable hypotheses, and tagging temporary debug logs with `[DEBUG-xxxx]` so none leak into commits.
  - **`improve-codebase-architecture`** (`71` lines, `disable-model-invocation: true` — zero auto-trigger bloat): Scans `git log` hotspots for shallow modules (*Ousterhout deep modules*), writes a visual `Before / After` Mermaid HTML report to `/tmp/architecture-review-<timestamp>.html`, and hands off to `grilling`.
- **Skipped (`⏭️`):** `tdd`, `implement`, `implement-spec`, `to-tickets`, `triage`, `setup-matt-pocock-skills` — mandatory TDD and issue-tracker ceremony add unnecessary loops to our workflow.

---

## 5. Best Use Cases

- **When to use:** Before coding a new feature, complex refactoring, database schema change, or business workflow with open design questions.
- **When not to use:** 100% clear minor bugfixes or one-line changes.

---

## 6. Status & Action History

| Date | Action | Status | Notes |
|---|---|---|---|
| 2026-11-15 | Cataloged as globally installed planning skill suite | `✅ Active` | `grilling`, `grill-me`, and `grill-with-docs` are linked globally across all agents and actively used. |
| 2026-11-16 | Audited full `mattpocock/skills` repository | `👀 Reviewed` / `⏭️ Skipped` | Highlighted `diagnosing-bugs` and `improve-codebase-architecture` as clean optional candidates; skipped heavy `tdd`/`to-tickets` workflow skills. |
