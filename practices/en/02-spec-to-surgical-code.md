# 2. From Spec & Graph to Surgical Code & Independent Review

[🇺🇿 O'zbekcha](../02-spec-to-surgical-code.md) | **🇬🇧 English** | [🇷🇺 Русский](../ru/02-spec-to-surgical-code.md)

⬅️ [Back to Practices Table of Contents](README.md)

- **Combined Tools:** [**`graphify`**](../../reviews/en/architecture/graphify.md) + [**`grill-me`**](../../reviews/en/architecture/grill-me.md) + [**`ponytail`**](../../reviews/en/architecture/ponytail.md) + [**`karpathy-guidelines`**](../../reviews/en/architecture/karpathy-guidelines.md) + [**`Orca`**](../../reviews/en/developer-tools/orca.md) + [**`elephant-goldfish-model`**](../../reviews/en/architecture/elephant-goldfish-model.md)
- **Target Projects:** All Backend, Web, Mobile, and Architecture tasks.

---

## 1. Why Combine These Tools? (Overall Benefit)

Jumping straight into *"build feature X"* with an AI agent causes three classic failures:
1. The agent misses an existing helper or service in the repo and writes a duplicate;
2. Ambiguous requirements get padded into 300 lines of speculative abstraction;
3. The agent that wrote the code is blind to its own bugs due to context bias.

**What this 6-tool chain delivers:**
- Instant `0`-token AST graph lookup of every connected module before editing;
- Decisions resolved upfront along the design tree;
- Minimal, surgical YAGNI edits that leave adjacent code untouched;
- Fresh-context verification by a **different AI model** or **stateless (*Goldfish*) reviewer subagents**.

---

## 2. How to Run Them Together (4-Stage Pipeline)

### Stage 1: Locate Seams & Callers (`graphify`)
Before burning tokens on broad `grep` loops, query `graphify-out/` to trace module relationships, god nodes, and callers in seconds.

### Stage 2: Stress-Test Requirements Before Coding (`grill-me` / `domain-modeling`)
On non-trivial features or schema changes, run `grill-me` so the agent walks the decision tree with you one question at a time and locks agreed boundaries into `CONTEXT.md` or the plan.

### Stage 3: Write Minimal, Surgical Code (`ponytail` + `karpathy-guidelines`)
Both skills stay active together during implementation:
- **`karpathy-guidelines`:** Surfaces assumptions upfront and makes surgical edits without reformatting or refactoring neighboring code.
- **`ponytail`:** Rejects unrequested wrappers, factories, and "just in case" config; updates all affected callers/tests and ends with 1–2 lines naming what was skipped and any residual risk.

### Stage 4: Verify with a Second Pair of Eyes (`Orca` + `elephant-goldfish-model`)
Never let the authoring agent be the sole reviewer of complex changes:
- **Cross-Model CLI Review (`Orca`):** When `Codex` writes the implementation, spawn `Claude Opus` or `Argon` as an isolated CLI subagent to audit the diff independently.
- **Doc-Code Drift & Hostile Review (`elephant-goldfish-model`):**
  - `egm-drift-report`: Detects mismatches between `README` / `DESIGN.md` and actual code.
  - `egm-review`: Dispatches stateless *Goldfish* critics (`egm-design`, `egm-codebase-details`, `egm-zoom-out`) across 5 review angles.

---

## 3. Extra Power Practices

- **For elusive or intermittent bugs (`diagnosing-bugs`):** Stop guessing fixes after a failed first attempt — trigger `diagnosing-bugs` to run a structured 6-phase reproduction and tagged-instrumentation (`[DIAG-<id>]`) loop.
- **For tangled shallow modules (`improve-codebase-architecture`):** Use on demand to consolidate scattered pass-through helpers into clean, deep modules.
