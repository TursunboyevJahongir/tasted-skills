# 5. Multi-Agent Orchestration (`T3 Code` + CLI Subagents) & Zero-Loss Context Handoff

[🇺🇿 O'zbekcha](../05-multi-agent-and-context-handoff.md) | **🇬🇧 English** | [🇷🇺 Русский](../ru/05-multi-agent-and-context-handoff.md)

⬅️ [Back to Practices Table of Contents](README.md)

- **Combined Tools:** [**`T3 Code`**](../../reviews/en/developer-tools/t3-code.md) + `task-context` + CLI Subagents (`antigravity-claude`, `argon`, `claude-opus`, `antigravity-consult`) + [**`elephant-goldfish-model`**](../../reviews/en/architecture/elephant-goldfish-model.md)
- **Target Tasks:** Complex features, parallel worktree development, model quota handoffs, and deep code/architecture verification.

---

## 1. Why Combine These Tools? (Overall Benefit)

1. When the same AI model writes the code and reviews its own diff, confirmation bias causes it to approve its own flawed assumptions.
2. Switching mid-task from one agent to another (`Codex` -> `Claude` or `Antigravity`) normally wastes time and tokens re-explaining the task from scratch.

**What this combination delivers:**
- `task-context` maintains a gitignored task folder tracking **intent, agreed decisions, file ownership, and review status**;
- You can summon a second AI model via CLI either **with full task context** (to verify requirement fulfillment) or **with zero prior context (*Goldfish*)** (to stress-test architecture without bias).

---

## 2. When to Use "Context-Aware Review" vs "Stateless (Goldfish) Review"

Both review modes serve distinct purposes:

| Scenario | Which Combination to Use | Why It Works Best |
|---|---|---|
| **Verifying an implemented diff against user requirements** | `task-context` + **`argon` / `antigravity-claude` / `claude-opus`** (`T3 Code` CLI subagent) | The reviewer needs to know *what* the user asked for and *why* key trade-offs were chosen (`task-context`), while auditing the code with a different model family (*"Codex wrote it -> Argon/Claude verifies it"*). |
| **Auditing a design doc, system architecture, or Doc-Code drift** | [**`elephant-goldfish-model`**](../../reviews/en/architecture/elephant-goldfish-model.md) (`egm-review`, `egm-drift-report`) | Here conversation history is a **liability** — stateless *Goldfish* subagents read only the document and codebase cold, exposing unstated assumptions and YAGNI bloat. |

---

## 3. Additional Capabilities

### 1) Resolve "Impossible" Architecture Trade-Offs with TRIZ (`egm-brainstorm` / `inventive-catalyst`)
When a design hits a contradiction (*"improving speed degrades consistency, enforcing consistency hurts speed"*):
- The **TRIZ (`inventive_catalyst`)** subagent inside `egm-brainstorm` applies inventive problem-solving principles to eliminate the contradiction without compromise.

### 2) Map and Document an Unfamiliar Repo in 10 Minutes (`graphify` + `egm-bootstrap`)
When onboarding onto a legacy or undocumented repository:
1. Build a `0`-token local AST knowledge graph with [**`graphify`**](../../reviews/en/architecture/graphify.md);
2. Run `egm-bootstrap` to partition the directory tree and generate accurate module contracts (`README.md`) verified against the actual code.

### 3) Zero-Friction Quota / Stuck-Model Baton Pass (`task-context`)
If an agent hits a rate limit or loops on a stubborn bug:
- Point the next model at the gitignored `task-context` folder — it picks up the exact intent, touched files, and pending review items in seconds.

### 4) Parallel Multi-Branch Development Without Simulator Collisions (`T3 Code` + `agent-device`)
- `T3 Code` isolates each task in its own git worktree while [**`agent-device`**](../../reviews/en/mobile/agent-device.md) and [**`simslim`**](../../reviews/en/mobile/simslim.md) keep simulator sessions isolated per worktree.
