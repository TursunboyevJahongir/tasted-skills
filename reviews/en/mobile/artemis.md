# `ARTEMIS` (`google/artemis`)

[🇺🇿 O'zbekcha](../../mobile/artemis.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/mobile/artemis.md)

- **Source:** [google/artemis](https://github.com/google/artemis)
- **Category:** `Mobile` *(Autonomous Android UI Testing Framework, CLI/SDK & MCP Server)*
- **Type:** `Standalone Python CLI / SDK + MCP Server`
- **Quality Score:** **8.5 / 10**
- **Need for Us:** **2.5 / 10** *(Android-only, slow per step, and requires separate paid LLM API keys)*
- **Recommended Scope:** `Standalone CLI/SDK only (uv run artemis)` — do not install as a global MCP server
- **Instead Use (Alternative):** [**`agent-device`**](agent-device.md) *(`$0` extra API cost, `iOS + Android + tvOS + Android TV`, `197–888 ms` per action)* + [**`adb`**](adb.md)
- **Reviewed Date:** `2026-11-16`
- **Current Status:** `👍 Good Option`

---

## 1. What It Is and How It Works

Google's open-source (`Apache-2.0`, Python `3.12+`) autonomous multi-agent Android automation and QA framework (reporting `99%+` task completion on Google Research's `AndroidWorld` benchmark).

Provides two execution profiles across four interfaces (`Web Console localhost:8000`, `CLI`, `MCP Server`, and `Python SDK`):
- **`Flash` profile (`~3–5 s / step`):** Single-model reactive observe-and-act loop for straightforward UI steps.
- **`Pro` profile (`~15–40 s / step`):** `LangGraph` multi-agent pipeline (`Planner -> Operator -> Explorer -> Checker`) with pre-execution XML + pixel/OCR safety checks and final verification reports for 100+ step exploratory workflows.

---

## 2. Strengths and Weaknesses

### Strengths
- **Handles custom non-accessible UIs:** Combines `Accessibility Helper` / `UIAutomator2` hierarchies with **OCR and multimodal pixel vision**, allowing it to locate controls inside custom `Canvas`, Flutter, or game screens where standard accessibility trees are empty.
- **Unattended long-horizon Android QA (`pytest` SDK):** Clean `ArtemisClient` Python SDK for running standalone multi-app exploratory or nightly stability suites in CI.

### Weaknesses and Hidden Cost (Paid API Billing / Speed / Platform)
- **💸 PAID at runtime ("Free & open-source" social demos are misleading):**
  - While the `Apache-2.0` repository code is free, **running ARTEMIS is paid**.
  - It cannot piggyback on your existing `Claude Pro/Max`, `ChatGPT`, or `Antigravity` IDE subscription: `.env` **requires a separate billed per-token LLM API key** (`GEMINI_API_KEY`, `OPENAI_API_KEY`, `ANTHROPIC_API_KEY`, `OPEN_ROUTER_API_KEY`, or `XAI_API_KEY`, plus an optional paid Google Cloud Vision `OCR_API_KEY`).
  - Because it runs an "agent-inside-an-agent" loop (`Planner`, `Operator`, `Explorer`, `Checker`, `Video Analyzer`) that sends device screenshots (multimodal image tokens) and XML trees on every step, multi-step `Pro` runs burn substantial API credits (whereas our active [**`agent-device`**](agent-device.md) costs **`$0` extra API fees** and ~100 text tokens per snapshot inside your existing coding agent).
- **Android-only (`no iOS` or `tvOS`):** `iOS Platform Expansion` remains an unchecked `[ ]` roadmap item in `README.md` — zero support for iPhone, iPad, or Apple TV.
- **`4x–45x` slower for interactive dev loops:** `3,000–5,000 ms` per step in `Flash` and `15,000–40,000 ms` per step in `Pro` (vs **`888 ms`** on Android and **`197 ms`** on iOS with [`agent-device`](agent-device.md)).
- **Context & environment weight:** Global MCP setup mounts `5` eager tools (`mobile_run_task`, etc.) plus a recommended `13.6 KB` (`~3,400 token`) `mcp_server/rules.md`, while `LangGraph + LangChain + OpenCV + FastAPI` pulls a `~1 GB+` Python `.venv`.

---

## 3. Security & Pre-Install Sanitization

- **Risk Level:** `Medium` *(external per-step API billing, `posthog` dependency, and automatic on-device APK installation)*
- **Inspected Surface (`pyproject.toml`, `.env.example`, `mcp_server/`):**
  - `pyproject.toml:66` includes `posthog>=3.5.0`.
  - Default `.env` settings automatically install the `Artemis Accessibility Helper` APK onto connected phones on the first task (`ARTEMIS_HELPER_AUTO_INSTALL=true`) and hold a wake lock (`ARTEMIS_KEEP_DEVICE_AWAKE=true`).
  - `uv run artemis mcp --install all` writes global MCP server entries and `rules.md` across all detected AI IDEs (`Antigravity`, `Claude Code`, `Codex`, `Cursor`).
- **Required safeguards if used on a dedicated Android QA project:**
  1. **Never run** `artemis mcp --install all` — skip global MCP and global `rules.md`, and invoke strictly on demand via CLI (`uv run artemis run ...`) or the `pytest` Python SDK.
  2. Enforce a hard billing/spending cap on the API key placed in `.env` (default to `--profile flash`).
  3. Set `ARTEMIS_HELPER_AUTO_INSTALL=false` and `ARTEMIS_KEEP_DEVICE_AWAKE=false` in `.env` when connecting personal or shared devices.

---

## 4. Fit & Compatibility with Our Existing Stack (Alternative)

- **Our primary zero-extra-cost alternative — [**`agent-device`**](agent-device.md) (`9.5/10`, `#8` active global essential):**
  - **Cost:** `$0` extra API keys — your active coding agent drives `@e1` accessibility refs directly in `~100 tokens`.
  - **Coverage & speed:** Covers `iOS`, `Android`, `tvOS`, and `Android TV` headlessly in `197–888 ms` with `0` MCP schema bloat and `0` telemetry.

---

## 5. When to Use (and When Not To)

- **When to use:** Only for custom Android `Canvas` / game UIs lacking accessibility trees (where OCR + pixel grounding is required) or standalone 100+ step unattended Android regression suites with a dedicated LLM API budget.
- **When not to use:** Daily cross-platform (`Web` / `iOS` / `Android` / `TV`) development, any iOS/tvOS task, or workflows where extra per-token API billing is unwanted.

---

## 6. Status & Action History

| Date | Action | Status | Notes |
|---|---|---|---|
| 2026-11-16 | Video demo (`DehEdBbgQFZ`) and primary-source audit of `google/artemis` (`pyproject.toml`, `.env.example`, `mcp_server/`) | `👍 Good Option` | Capable autonomous Android QA engine (`8.5/10`), but requires **separate paid LLM API keys**, lacks iOS/tvOS support, and runs at `3–40s/step`; our daily stack uses free, cross-platform [**`agent-device`**](agent-device.md). |
