# `karpathy-guidelines` (Multica AI / Andrej Karpathy)

[🇺🇿 O'zbekcha](../../architecture/karpathy-guidelines.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/architecture/karpathy-guidelines.md)

- **Source:** [multica-ai/andrej-karpathy-skills](https://github.com/multica-ai/andrej-karpathy-skills)
- **Category:** `Architecture` *(Guidelines to reduce common LLM coding mistakes)*
- **Type:** `Skill`
- **Quality Score:** **9.5 / 10**
- **Relevance to Us:** **9.5 / 10**
- **Recommended Scope:** `Global (-g)`
- **Reviewed Date:** `2026-11-15`
- **Current Status:** `✅ Using`

---

## 1. What It Is & How It Works

> [!IMPORTANT]
> **In Plain Words (Main Job & Value):** Prevents AI from "helpfully cleaning up" neighboring lines and accidentally breaking working features. Forces upfront assumptions instead of silent guesses and restricts edits strictly to the **exact lines your task requires**.

A compact Markdown skill (`SKILL.md`, 2.5 KB) distilling Andrej Karpathy's 4 core principles against common LLM coding pitfalls:
1. **Think Before Coding:** Surface ambiguities and assumptions explicitly instead of guessing silently.
2. **Simplicity First:** Avoid unrequested flexibility and speculative abstractions.
3. **Surgical Changes:** Never touch unrelated adjacent code, comments, or formatting.
4. **Goal-Driven Execution:** Define verifiable success criteria for every task.

---

## 2. Strengths & Weaknesses

### Strengths
- Only 2.5 KB of plain text — minimal token footprint and zero slow hooks or subagent loops.
- Prevents "collateral damage" in production codebases where agents otherwise refactor or break unrelated nearby lines.

### Weaknesses & Cost
- Zero downside.

---

## 3. Security & Pre-Install Sanitization

- **Risk Level:** `Low`
- **Audited Points:** `skillshare audit` passed clean (`0 findings`). No scripts or hooks.

---

## 4. Relevance & Compatibility with Our Existing Tools

- Pairs with [ponytail](ponytail.md) to enforce baseline coding hygiene across all agents (`Codex`, `Claude`, `Antigravity`).

---

## 5. Best Use Cases

- **When to use:** All coding, editing, refactoring, and code review tasks.

---

## 6. Status & Action History

| Date | Action | Status | Notes |
|---|---|---|---|
| 2026-11-15 | Installed via `skillshare install multica-ai/andrej-karpathy-skills -g` | `✅ Using` | Passed security audit cleanly and synced across all 5 global agent targets. |
