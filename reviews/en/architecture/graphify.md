# `graphify`

[🇺🇿 O'zbekcha](../../architecture/graphify.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/architecture/graphify.md)

- **Source:** [Graphify-Labs/graphify](https://github.com/Graphify-Labs/graphify)
- **Category:** `Architecture` *(Knowledge Graph from codebases and documents)*
- **Type:** `Skill + Python CLI (graphifyy)`
- **Quality Score:** **9.0 / 10**
- **Relevance to Us:** **9.0 / 10**
- **Recommended Scope:** `Global (-g)`
- **Reviewed Date:** `2026-11-15`
- **Current Status:** `✅ Active` *(used to quickly map and query the architecture of large codebases)*

---

## 1. What It Is & How It Works

A tool that turns any project folder (code, SQL schemas, Markdown docs, PDFs, images, and videos) into a **persistent knowledge graph (`graphify-out/graph.json`, interactive HTML, and `GRAPH_REPORT.md`)** without a vector database:
- **Deterministic local AST parsing for code files:** Consumes zero LLM tokens and runs fast.
- **Parallel subagent extraction for docs / PDFs:** Extracts semantic relationships and tags every edge honestly (`EXTRACTED`, `INFERRED`, `AMBIGUOUS`).
- Once built (`graphify-out/graph.json` exists), follow-up architectural questions are answered in seconds via `graphify query "<question>"`, `graphify path "A" "B"`, and `graphify explain` without rescanning files (`--update` refreshes only changed files).

---

## 2. Strengths & Weaknesses

### Strengths
- Answers "what connects to what, and where are the god-nodes?" in unfamiliar or massive repos without burning tokens reading files one by one.
- Can merge monorepos and multiple GitHub repositories into a single unified graph; supports Obsidian, Wiki, SVG, and Neo4j exports.

### Weaknesses & Cost
- Large `SKILL.md` (~641 lines, ~8.7K on-demand tokens when loaded).
- Initial semantic indexing on doc/PDF-heavy projects spawns multiple subagents (for code-only repos, local AST extraction is sufficient and free).

---

## 3. Security & Operating Rules (Sanitization / Restrictions)

- **Risk Level:** `Low–Medium` *(uses a Python CLI package and local scripts, requiring environment hygiene)*
- **Key Operating Rules:**
  1. **Package name and installation:** The PyPI package name is `graphifyy` (two `y`s). Because `SKILL.md` includes a `pip install --break-system-packages` fallback if the CLI is missing, pre-install it in an isolated environment via `uv tool install graphifyy` to protect system Python.
  2. **External API key awareness:** If `GEMINI_API_KEY` or `GOOGLE_API_KEY` is set in the environment, document analysis calls the Gemini API; if unset, it stays within local agent subagents. Keep this in mind on confidential document repos.
  3. **Git hygiene:** Add `graphify-out/` to `.gitignore` unless the team intentionally versions the graph.

---

## 4. Relevance & Compatibility with Our Existing Tools

- Pairs naturally with [`grill-me`](grill-me.md) (planning) and `domain-modeling` (`CONTEXT.md`) as an architectural map for large multi-service codebases.

---

## 5. Best Use Cases

- **When to use:** Exploring large repositories, tracing cross-module dependencies and flows (`path`, `query`), or mapping multiple services together.
- **When not to use:** Small 3–5 file projects or localized single-file edits where the target is already known.

---

## 6. Status & Action History

| Date | Action | Status | Notes |
|---|---|---|---|
| 2026-11-15 | Cataloged as globally installed architecture tool | `✅ Active` | Linked globally via `skillshare` and actively used for codebase analysis. |
