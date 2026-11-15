# `SkillSpector` (NVIDIA)

[🇺🇿 O'zbekcha](../../developer-tools/skillspector.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/developer-tools/skillspector.md)

- **Source:** [NVIDIA/SkillSpector](https://github.com/NVIDIA/SkillSpector)
- **Category:** `Developer Tools` *(Security Scanner for AI Agent Skills and MCP Servers)*
- **Type:** `Python CLI + MCP Server + Skill (skill-inspector)`
- **Quality Score:** **9.0 / 10**
- **Need for Us:** **3.5 / 10** *(adds an extra cycle in daily work — `skillshare audit` + direct AI agent code review already cover this)*
- **Recommended Scope:** `Do not install permanently` *(optional one-off `uvx ... --no-llm` scan only for large, untrusted MCP servers)*
- **Instead Use:** [**`skillshare`**](skillshare.md) (`skillshare audit`) + **AI agent primary-source code inspection**
- **Reviewed Date:** `2026-11-16`
- **Current Status:** `⏭️ Skipped (Not Tested)` *(source code audited; not installed because our lighter built-in workflow already covers daily skill vetting)*

---

## 1. Brief Overview: What It Is and How It Works

An open-source security scanner by NVIDIA (`Python 3.12 + LangGraph`) designed to vet AI agent skills and MCP servers in **two stages** before installation:
1. **Static analysis (`--no-llm`):** Checks `71+` patterns across `17` categories using Python/JS AST, taint tracking (source-to-sink secret exfiltration chains), YARA malware signatures, live `OSV.dev` CVE lookups, and MCP Tool Poisoning / Registry Diff checks.
2. **Optional LLM semantic pass:** Compares whether the implementation actually matches what `SKILL.md` claims (via API keys or local `claude_cli` / `gemini_cli` / `ollama`).

---

## 2. Why We Didn't Install It (Comparison with Our Alternative)

`SkillSpector` is well-engineered for automated marketplace pipelines scanning thousands of untrusted skills at scale, but in a curated developer workflow it introduces an **unnecessary extra loop**:

- **We already have a fast, zero-friction alternative — [`skillshare`](skillshare.md) (`skillshare audit`):** A single lightweight Go binary runs `static`, `dataflow`, `tier`, `integrity`, `structure`, and `cross-skill` security checks in `~0.1s` and **executes automatically during `skillshare install`** (no heavy `Python 3.12 + LangGraph + YARA + boto3` stack to maintain).
- **Direct AI agent code review is sharper and avoids double work:** Before installing any skill or MCP server, we already have our AI coding agent read the primary source files (`SKILL.md`, scripts, hooks, network/env calls) directly. Spawning Python/LangGraph from inside an agent just to open *another* LLM session to ask *"does the code match SKILL.md?"* duplicates both latency and quota.
- **Static score false-positive noise:** Legitimate CLI skills that invoke `subprocess` and read config/env variables quickly cross `SkillSpector`'s `DO NOT INSTALL` score multiplier, creating manual triage work on clean tools.

> **Recommendation for you too:** Never install third-party skills, plugins, or MCP servers blindly based on READMEs or GitHub stars — ask your AI coding agent to read and audit the actual repository files first, then gate installation with `skillshare audit`.

---

## 3. When Might You Still Use It?

Not needed for everyday Markdown/CLI skills. If you ever need to inspect a massive, unfamiliar third-party MCP server with thousands of lines of JS/Python, run it ephemerally without installing anything permanently:

```bash
uvx --python 3.12 --from git+https://github.com/NVIDIA/skillspector.git skillspector scan <repo-or-dir> --no-llm
```

---

## 4. Status & Action History

| Date | Action | Status | Notes |
|---|---|---|---|
| 2026-11-16 | Primary-source audit | `⏭️ Skipped (Not Tested)` | Strong scanner (`9.0/10`), skipped to avoid redundant workflow cycles since [`skillshare`](skillshare.md) (`audit`) + direct AI agent code review already handle our vetting. |
