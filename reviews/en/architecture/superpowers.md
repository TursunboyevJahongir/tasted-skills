# `superpowers` (Obra / Jesse Vincent)

[🇺🇿 O'zbekcha](../../architecture/superpowers.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/architecture/superpowers.md)

- **Source:** [obra/superpowers](https://github.com/obra/superpowers)
- **Category:** `Architecture` *(Workflow methodology, Brainstorming, Planning, and Mandatory TDD)*
- **Type:** `Plugin` *(14 skills + `SessionStart` hook + subagent scripts)*
- **Quality Score:** **6.5 / 10**
- **Relevance to Us:** **2.0 / 10**
- **Recommended Scope:** `Do Not Install` *(previously tested in practice and uninstalled)*
- **Used Period:** `2026-04-04 → 2026-09-01` *(tested and removed)*
- **Current Status:** `⛔ Rejected` *(🧪 Tested and removed because it slowed down real work)*

---

## 1. What It Is & How It Works

A "complete software development methodology" plugin for Claude Code, Codex, Cursor, and Antigravity consisting of 14 process skills (`using-superpowers`, `brainstorming`, `writing-plans`, `subagent-driven-development`, `executing-plans`, `test-driven-development`, `systematic-debugging`, `using-git-worktrees`, `verification-before-completion`, etc.) plus a `hooks/session-start` script.

How it operates:
- **`SessionStart` hook (`hooks/session-start`):** Injects `using-superpowers/SKILL.md` wrapped in `<EXTREMELY_IMPORTANT>` tags into every new session: *"If there is even a 1% chance a skill might apply to what you are doing, you ABSOLUTELY MUST invoke the skill. Even a simple question is a task."*
- **Mandatory pipeline:** Forces every feature or change through `brainstorming → design doc → writing-plans → using-git-worktrees → subagent-driven-development → test-driven-development (Red-Green-Refactor) → requesting-code-review`.

---

## 2. Four Major Problems Observed in Real Testing (Why It Was Removed)

When installed and tested on real tasks, it caused more friction and slowdown than value:

### 1. Chronic Overthinking
- Because `using-superpowers` enforces *"The skill is overkill → Simple things become complex. Use it"* and the *"1% chance"* rule, the agent spends turns deliberating which process skill to invoke and adding ceremony even on small, unambiguous tasks instead of writing code directly.

### 2. Unwanted `brainstorming` Auto-Triggers and Excessive Questions
- The frontmatter in `brainstorming/SKILL.md` (`"You MUST use this before any creative work - creating features, building components, adding functionality, modifying behavior..."`) is so broad that it auto-triggers on routine UI or feature additions.
- Even when given a clear specification, it halts execution to enforce a 4-step gate (`propose options → write design doc → get approval → writing-plans`) and asks unnecessary questions.
- **Our clean replacement:** [**`grill-me` / `grilling` / `grill-with-docs`**](grill-me.md) — never hijacks routine prompts uninvited; only runs when we explicitly want deep requirement questioning.

### 3. Bureaucratic Loops (`subagent-driven-development`) and Severe Slowdowns
- During plan execution, every small step spawns a separate git worktree, `.superpowers/sdd/` directory, `implementer` subagent, `task-reviewer` subagent, and `fix-loop`.
- Tasks that should finish in minutes get trapped in long subagent review loops, burning both wall-clock time and token quota.

### 4. Mandatory TDD (`test-driven-development`) Conflicts with Our Web, Mobile, and Backend Workflow
- `test-driven-development/SKILL.md` enforces `"The Iron Law: NO PRODUCTION CODE WITHOUT A FAILING TEST FIRST. Write code before the test? Delete it. Start over."`
- **On Web and Mobile (iOS / Android):** Writing failing unit tests before building UI and interactive screens is counterproductive — verifying live in the browser and simulator/emulator via [`cross-platform-qa`](../mobile/cross-platform-qa.md) ([`agent-desktop`](../developer-tools/agent-desktop.md) + [`Device Hub`](../mobile/ios-simulator-device-hub.md) + [`adb`](../mobile/adb.md)) is much faster and tests the actual rendered experience.
- **On Backend:** Writing tests upfront and then fitting implementation to them **doubles the workload (`2x` time cost)**.

---

## 3. Security & Sanitization Analysis

- **Risk Level:** `Medium` *(no malware, but uses a `SessionStart` hook and aggressive prompt injection)*
- **Audited Points:**
  1. `hooks/hooks.json` and `hooks/session-start` run automatically on every session start to override default agent behavior (`using-superpowers`).
  2. `brainstorming`, `test-driven-development`, and `writing-plans` omit `disable-model-invocation: true`, hijacking ordinary coding requests (`prompt hijack`).

---

## 4. Our Lightweight, Fast Replacements

Instead of `superpowers`, we use focused, low-overhead tools for each stage:

| Stage | Heavy Mechanism in `superpowers` | Our Fast, Clean Solution |
|---|---|---|
| **Idea & Plan Q&A** | `brainstorming` (auto-triggers on every task) | [**`grill-me` / `grilling`**](grill-me.md) (invoked only when needed) |
| **Coding Discipline (Simplicity)** | `writing-plans` + `subagent-driven-development` loops | [**`ponytail`**](ponytail.md) + [**`karpathy-guidelines`**](karpathy-guidelines.md) (minimal, surgical changes) |
| **Web / iOS / Android Verification** | `test-driven-development` (mandatory upfront unit tests) | [**`cross-platform-qa`**](../mobile/cross-platform-qa.md) (`agent-desktop` + `Device Hub` + `adb` emulator + 1 final physical device pass) |
| **Independent Code Review** | `task-reviewer` loop after every micro-task | [**`T3 Code`**](../developer-tools/t3-code.md) / `argon` / `antigravity-claude` (one focused independent review when work is complete) |

---

## 5. Best Use Cases

- **When to use:** Recommended not to install.
- **When not to use:** Daily Web, Mobile (iOS/Android), and Backend engineering — slows down delivery, asks unnecessary questions, and forces `2x` TDD overhead.

---

## 6. Status & Action History

| Date | Action | Status | Notes |
|---|---|---|---|
| 2026-04-04 | Installed globally and tested in daily engineering | `⛔ Rejected` | Over months of real tasks, `SessionStart` overthinking and uninvited `brainstorming` slowed delivery (`test-driven-development` disabled on `2026-08-14`). |
| 2026-09-01 | Removed from active workflow | `⛔ Rejected` | Replaced cleanly by [`grill-me`](grill-me.md), [`ponytail`](ponytail.md), [`karpathy-guidelines`](karpathy-guidelines.md), and `cross-platform-qa`. |
