# 5. Multi-Agent Orchestration (`Orca`) & Unbiased Architecture / Code Review

[🇺🇿 O'zbekcha](../05-multi-agent-and-context-handoff.md) | **🇬🇧 English** | [🇷🇺 Русский](../ru/05-multi-agent-and-context-handoff.md)

⬅️ [Back to Practices Table of Contents](README.md)

- **Combined Tools:** [**Orca**](../../reviews/en/developer-tools/orca.md) (`orca orchestration`) + [**elephant-goldfish-model**](../../reviews/en/architecture/elephant-goldfish-model.md) + [**graphify**](../../reviews/en/architecture/graphify.md)
- **Target Tasks:** Complex features, parallel worktree development, single-prompt multi-AI chaining, and deep code/architecture verification.

---

## 1. Why Combine These Tools? (Overall Benefit)

1. When the same AI model writes the code and reviews its own diff, confirmation bias causes it to approve its own flawed assumptions.
2. Manually copying prompts across separate terminals (`Codex` -> `Claude Code` or `Gemini`) wastes time and context.

**What this combination delivers:**
- `Orca` spawns secondary AI workers (`orca orchestration worker-start`) with live inline cards in Chat UI and synthesizes their findings in one thread;
- You can summon a second AI model either **with task context** (`Orca` workers to verify requirement fulfillment) or **with zero prior context (*Goldfish*)** (`elephant-goldfish-model` to stress-test architecture without bias).

---

## 2. When to Use "Context-Aware Cross-AI Review" vs. "Stateless (Goldfish) Review"

Both review modes serve distinct purposes:

| Scenario | Which Combination to Use | Why It Works Best |
|---|---|---|
| **Verifying an implemented diff against user requirements** | [**Orca**](../../reviews/en/developer-tools/orca.md) (`orca orchestration worker-start` — `Codex`, `Claude Code`, `Gemini`) | The reviewer knows *what* the user asked for and *why* trade-offs were chosen, while auditing the code with a different model family (*"Codex wrote it -> Claude/Gemini verifies it"*). |
| **Auditing a design doc, system architecture, or Doc-Code drift** | [**elephant-goldfish-model**](../../reviews/en/architecture/elephant-goldfish-model.md) (`egm-review`, `egm-drift-report`) | Here conversation history is a **liability** — stateless *Goldfish* subagents read only the document and codebase cold, exposing unstated assumptions and YAGNI bloat. |

---

## 3. Additional Capabilities

### 1) Resolve "Impossible" Architecture Trade-Offs with TRIZ (`egm-brainstorm` / `inventive-catalyst`)
When a design hits a contradiction (*"improving speed degrades consistency, enforcing consistency hurts speed"*):
- The **TRIZ (`inventive_catalyst`)** subagent inside `egm-brainstorm` applies inventive problem-solving principles to eliminate the contradiction without compromise.

### 2) Map and Document an Unfamiliar Repo in 10 Minutes (`graphify` + `egm-bootstrap`)
When onboarding onto a legacy or undocumented repository:
1. Build a `0`-token local AST knowledge graph with [**graphify**](../../reviews/en/architecture/graphify.md);
2. Run `egm-bootstrap` to partition the directory tree and generate accurate module contracts (`README.md`) verified against the actual code.

### 3) Parallel Multi-Branch Development Without Simulator Collisions (`Orca` + `agent-device`)
- `Orca` isolates each task in its own git worktree while [**agent-device**](../../reviews/en/mobile/agent-device.md) and [**simslim**](../../reviews/en/mobile/simslim.md) keep simulator sessions isolated per worktree.
