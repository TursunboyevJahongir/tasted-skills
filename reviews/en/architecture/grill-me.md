# `grill-me` (`grilling` + `grill-with-docs`)

[🇺🇿 O'zbekcha](../../architecture/grill-me.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/architecture/grill-me.md)

- **Source:** [aihero.dev/skills-grill-me](https://www.aihero.dev/skills-grill-me) · [mattpocock/skills](https://github.com/mattpocock/skills)
- **Category:** `Architecture` *(Planning, Decision Trees, and Requirement Sharpening)*
- **Type:** `Skill Suite` (`grill-me`, `grilling`, `grill-with-docs`, `domain-modeling`, `diagnosing-bugs`, `improve-codebase-architecture`)
- **Quality Score:** **9.5 / 10**
- **Relevance to Us:** **9.5 / 10**
- **Recommended Scope:** `Global (-g)`
- **Active Since:** `2026-05-23` *(last updated: `2026-11-16`)*
- **Current Status:** `✅ Using` *(primary tool for stress-testing ideas and plans before writing code)*

---

## 1. What It Is & How It Works

> [!IMPORTANT]
> **In Plain Words (Main Job & Value):** Helps you think a task all the way through before coding — instead of blindly tossing a *"do this task"* prompt at AI, short focused Q&A rounds align both you and the agent on one exact plan. Prevents going down the wrong path and rewriting/re-testing the same feature 2–3 times (**saving `~2–3x` in time and tokens**) while surfacing edge cases you hadn't considered yet.

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
- Operates as a 1-on-1 interview within a single session (when a large technical spec needs stateless multi-agent critique, pair it with [elephant-goldfish-model](elephant-goldfish-model.md)).

---

## 3. Security & Sanitization Status

- **Risk Level:** `Low`
- **Audited Points:** Pure Markdown with no scripts or hooks. Both `grill-me` and `grill-with-docs` set `disable-model-invocation: true`, meaning the agent never starts interrogating you unprompted — it only activates when you explicitly say "grill me" or `/grill-me`. No sanitization required.

---

## 4. Relevance & Compatibility with Our Existing Tools

- Serves as the interactive, deep-dive counterpart to [karpathy-guidelines](karpathy-guidelines.md) (*Think Before Coding*).
- Works seamlessly with `domain-modeling` to lock resolved architectural decisions directly into `CONTEXT.md` and `docs/adr/`.

### Additional Skills Adopted from `mattpocock/skills` (`2026-11-16`)

After auditing all skills in [mattpocock/skills](https://github.com/mattpocock/skills), we sanitized and globally installed **2 additional on-demand skills (`✅ Using`)**:
- **`diagnosing-bugs` (`✅ Using` — scoped strictly to elusive/flaky bugs & perf regressions):** Narrowed its trigger description so trivial typos stay fast under `ponytail`, stripped the blocking interactive `scripts/hitl-loop.template.sh` script, and wired UI repro loops to our `agent-desktop` / `agent-device` / `sentry` stack (`skillshare audit`: `0 issues`).
- **`improve-codebase-architecture` (`✅ Using` — `disable-model-invocation: true`):** Fires strictly on explicit request; embeds the 8-term deep-module vocabulary inside a self-contained `CODEBASE-DESIGN.md` (avoiding global `codebase-design` auto-trigger noise), aligns with `CONTEXT.md` (`domain-modeling`), renders a visual `Before / After` Mermaid HTML report to `/tmp/architecture-review-<timestamp>.html`, and hands off to `grilling` (`skillshare audit`: `0 issues`).
- **Rejected (`⛔ Rejected`):** `tdd`, `implement`, `implement-spec`, `to-tickets`, `triage`, `setup-matt-pocock-skills` — mandatory TDD and issue-tracker ceremony add unnecessary loops.

---

## 5. Best Use Cases

- **When to use:** Before coding features or refactors with open design choices (`grill-me`), when hunting elusive/flaky bugs or perf regressions (`diagnosing-bugs`), and when auditing hotspots for module deepening (`improve-codebase-architecture`).
- **When not to use:** 100% clear minor bugfixes or one-line changes.

---

## 6. Status & Action History

| Date | Action | Status | Notes |
|---|---|---|---|
| 2026-05-23 | Initial installation (`grill-me` + `grill-with-docs`) | `✅ Using` | Adopted for pre-coding decision-tree planning (`2026-10-31` unified into `skillshare` across all agents). |
| 2026-11-16 | Sanitized & globally synced `diagnosing-bugs` and `improve-codebase-architecture` | `✅ Using` | Configured for strict on-demand activation (`hitl-loop.template.sh` removed, `CODEBASE-DESIGN.md` bundled, `0/100` audit risk) and synced across all 5 agent targets; rejected heavy `tdd`/`to-tickets` skills (`⛔ Rejected`). |
