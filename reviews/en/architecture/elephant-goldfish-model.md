# `elephant-goldfish-model` (Google EGM)

[🇺🇿 O'zbekcha](../../architecture/elephant-goldfish-model.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/architecture/elephant-goldfish-model.md)

- **Source:** [google/elephant-goldfish-model](https://github.com/google/elephant-goldfish-model)
- **Category:** `Architecture` *(Spec-Driven Development, Architecture, and Code/Doc Auditing)*
- **Type:** `Plugin` *(7 skills + 10 specialized subagents + document standards)*
- **Quality Score:** **9.5 / 10**
- **Relevance to Us:** **9.5 / 10**
- **Recommended Scope:** `Global Plugin (-g / scope: user)` *(keeping `disable-model-invocation: true` across all skills)*
- **Reviewed Date:** `2026-11-15`
- **Current Status:** `✅ Using` *(installed globally across Antigravity, agy CLI, Claude Code, and Codex, and verified on real multi-repo systems)*

---

## 1. What It Is & How It Works

> [!IMPORTANT]
> **In Plain Words (Main Job & Value):** When the same AI writes a plan/code and reviews its own work, it rubber-stamps its own blind spots. This plugin spawns fresh-memory *Goldfish* critic subagents with zero chat history to audit specs, code, and doc-to-code drift (`egm-drift-report`) objectively from scratch.

An open-source (`Apache-2.0`) multi-agent design and review plugin released by Google engineers.

**Core Problem Solved:** When you brainstorm, draft a plan, and review it with the same agent in a single chat thread, the conversation history fills with shared assumptions (*confirmation bias*), causing the model to rubber-stamp its own mistakes. EGM separates roles into two personas:
- **Elephant (Stateful Architect with memory):** Holds project history, requirements, and chat context while authoring the technical design document (`docs/designs/<feature>.md`).
- **Goldfish (Stateless Critics without memory):** A swarm of `read-only`, `fresh-context` subagents that **never see the prior conversation** and only read the written document and actual codebase. They expose hidden assumptions, over-engineering (YAGNI), and scaling risks.

Includes **7 skills**:
1. `egm-brainstorm` — Stress-tests an idea from 7 angles (including `inventive_catalyst`, which applies **TRIZ** inventive principles to eliminate false trade-offs) and writes `concepts_brief.md`.
2. `egm-draft` — Writes a section-by-section technical spec (`design_draft.md`) without flooding the chat window.
3. `egm-review` — 5-stage review pipeline: *Zoom Out (YAGNI/simplicity) → Comprehension (naive reader test) → Design Critic (architecture/load) → Second Zoom Out → Implementation Readiness (files, signatures, tests)*.
4. `egm-resolve` — Interactive walkthrough to accept or reject each finding one by one.
5. `egm-review-loop` — Custom document review with a selected subset of Goldfish critics.
6. `egm-drift-report` — Compares `docs/designs/` or `README.md` documents against the **actual live codebase** to find where implementation drifted from or left specs unfinished.
7. `egm-bootstrap` — Generates module contracts and architectural maps (`README.md` / `EGM.md`) across directories of an existing codebase.

---

## 2. Strengths & Weaknesses

### Strengths
- **Zero Flattery (`No Glazing`, `Critique First`):** Bans hollow praise (*"Great/Brilliant idea"*) and apologies — the agent must state the weakest point first.
- **True Context Isolation:** Spawns genuinely isolated subagents in Antigravity (`invoke_subagent`), Claude Code (`Agent`), and Codex (`spawn_agent`); halts honestly if subagent spawning is unavailable.
- **Zero Interference with Daily Work:** All 7 skills set `disable-model-invocation: true`, so they only run when explicitly invoked via `/egm-...`.
- **`egm-drift-report` and TRIZ Analysis:** Deliver high engineering value rarely found in standard review skills.

### Weaknesses & Cost
- **High Token and Quota Usage:** A single brainstorm or full review launches 5–7+ parallel subagents, making it overkill for small or routine tasks.
- **Cannot Be Copied as a Standalone `SKILL.md`:** Skills read `agents/` and `resources/document_standards/` at runtime, requiring the full plugin directory structure.

---

## 3. Security & Pre-Install Sanitization

- **Risk Level:** `Low`
- **Audited Points:** Official Google open-source package with no malicious scripts or hidden `Stop` hooks; Goldfish subagents run strictly `read-only` and are forbidden from committing.
- **Installation & Hygiene Rules:**
  1. **Install runtime files only:** Omit repo website and CI folders (`site/`, `tests/`, `.github/`, `adapters/`) and install only `plugin.json`, `skills/`, `agents/`, `resources/`, `docs/`, and `assets/` (`agy plugin install`, `claude plugin`, and `codex plugin` handle this automatically).
  2. **Keep `disable-model-invocation: true`:** Never enable auto-triggering, or simple prompts will spawn subagent swarms and burn quota.
  3. **Draft artifact hygiene:** Point temporary drafts to `EGM artifact directory: .dev/docs` and add `.dev/docs` to `.gitignore` so project roots stay clean.

---

## 4. Relevance & Compatibility with Our Existing Tools

- [grill-me](grill-me.md) / `grill-with-docs` + `domain-modeling` are lightweight and ideal for fast 1-on-1 questioning in a single chat; EGM provides deep multi-agent verification for complex architectures.
- `task-context` shares context with implementer and reviewer subagents **during coding**, whereas EGM intentionally withholds chat context (Goldfish) **before coding** to stress-test the architecture. Both stages complement each other.
- None of our other skills replicate `egm-drift-report`.

---

## 5. Best Use Cases

- **When to use:** Designing a new microservice, real-time streaming/socket architecture, payment/billing logic, complex DB migrations, or auditing doc-to-code drift (`egm-drift-report`) in large repositories.
- **When not to use:** Simple UI tweaks, minor bugfixes, or routine CRUD tasks.

---

## 6. Status & Action History

| Date | Action | Status | Notes |
|---|---|---|---|
| 2026-11-15 | Audited architecture, subagent prompts, and harness compatibility | `✅ Using` | Verified as a high-quality plugin; recommended installing as a full plugin for major architectural work. |
| 2026-11-15 | Installed globally across all 4 agent environments (`Antigravity`, `agy CLI`, `Claude Code`, `Codex`) and ran deep Goldfish trials on 2 real systems (a monorepo and a 7-repo cross-platform ecosystem) | `✅ Using` | 4 parallel stateless Goldfish subagents (`egm-drift-report`, `egm-codebase-details`, `egm-design`, `egm-zoom-out`) uncovered 38 critical (`Blocker`) discrepancies and real production bugs on the first pass (YAGNI plans targeting deprecated libraries, mobile background quota storms, cross-platform player/auth header and status-code mismatches, and stale `AGENTS.md` instructions) with exact file and line citations. |
