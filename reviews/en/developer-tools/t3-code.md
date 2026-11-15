# `T3 Code` + CLI Subagent Bridge

[🇺🇿 O'zbekcha](../../developer-tools/t3-code.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/developer-tools/t3-code.md)

- **Source:** [pingdotgg/t3code](https://github.com/pingdotgg/t3code)
- **Category:** `Developer Tools` *(Multi-Agent Orchestration & Cross-AI Code Review)*
- **Type:** `Desktop App + CLI Subagent Workflow`
- **Quality Score:** **9.0 / 10**
- **Need for Us:** **9.5 / 10**
- **Recommended Scope:** `Standalone Desktop App + Global Consult Skills`
- **Reviewed Date:** `2026-11-15`
- **Current Status:** `✅ In Active Use` *(primary environment for multi-AI collaborative coding and review)*

---

## 1. What It Is and How It Works

**T3 Code** is an open-source desktop workspace that orchestrates multiple AI coding agents (**Codex**, **Claude Code**, **Cursor**, and CLI-connected agents) across isolated Git worktrees/branches using your existing subscriptions (**BYOS — Bring Your Own Subscription**).

**How we use it in practice (Multi-AI pipeline):**
It enables combining multiple independent AI models on a single task. For example:
- When instructed *"let Codex implement and Claude review"* (or vice versa), the primary agent completes implementation and invokes the second AI **as an isolated CLI subagent**;
- Both agents share a gitignored task folder (`task-context`) with strict file-ownership rules;
- The second model performs an independent review and reports findings until the change reaches a clean `PASS`.

---

## 2. Strengths and Weaknesses

### Strengths
- **Zero extra API billing (BYOS):** Reuses your already-authenticated Codex, Claude, and Antigravity CLI subscriptions directly.
- **True Cross-Model verification:** One model often misses its own blind spots; having Claude or Argon review Codex's code (or vice versa) catches subtle bugs early.
- **Git worktree isolation:** Run parallel tasks across branches without working-tree collisions.

### Weaknesses and Cost
- Running cross-model CLI review loops consumes quota from both subscriptions and adds 1–5 minutes per review pass.

---

## 3. Security & Operating Rules

- **Risk Level:** `Low–Medium` *(spawns local CLI agents, so file ownership and permission boundaries matter)*
- **Mandatory operating rules:**
  1. **Strict file ownership (`read-only` review vs `--write`):** A subagent invoked as a reviewer must stay in `read-only` mode and never edit the same file concurrently with the implementer.
  2. **Bounded review loops:** Cap review iterations at 3 rounds (4 in exceptional cases) so agents do not burn quota in endless debate.
  3. **Redact secrets in shared task context:** Never write raw tokens, passwords, or private keys into `.agent-work/` files, and verify the folder is gitignored.

---

## 4. Fit & Compatibility with Our Existing Stack

Works seamlessly alongside our global `task-context`, `antigravity-claude`, `antigravity-consult`, `argon`, and `claude-opus` skills across both T3 Code and terminal sessions.

---

## 5. When to Use (and When Not To)

- **When to use:** Non-trivial features, complex bugfixes, cross-model implementation + independent review workflows, and parallel branch development.
- **When not to use:** Trivial 1-line fixes or read-only Q&A where a single agent is sufficient.

---

## 6. Status & Action History

| Date | Action | Status | Notes |
|---|---|---|---|
| 2026-11-15 | Documented as daily multi-agent workflow | `✅ In Active Use` | Desktop app and CLI subagent bridge (Codex ↔ Claude ↔ Antigravity) installed and used daily. |
