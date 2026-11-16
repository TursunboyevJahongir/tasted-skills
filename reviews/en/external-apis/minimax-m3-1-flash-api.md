# `MiniMax M3.1 Flash API` (`MiniMax API` / `OpenRouter`)

[🇺🇿 O'zbekcha](../../external-apis/minimax-m3-1-flash-api.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/external-apis/minimax-m3-1-flash-api.md)

- **Source:** [MiniMax Platform](https://www.minimax.io/) · [OpenRouter (`minimax/minimax-m3.1-flash`)](https://openrouter.ai/)
- **Category:** `External APIs` *(Low-cost cloud multimodal LLM API for product backends, bots, and automation)*
- **Type:** `External Cloud API` *(`1M` context, `text + image + video`, OpenAI/Anthropic-compatible REST API)*
- **Quality Score:** **8.0 / 10** *(strong price / throughput / multimodal capability ratio)*
- **Need for Us:** **5.0 / 10** *(not for our coding agents, but a solid budget API option for high-volume product backend features)*
- **Recommended Scope:** `Product Backend Paid API Only (Zero-Data-Retention)`
- **Reviewed Date:** `2026-11-16`
- **Current Status:** `👍 Good Option` *(`$0.15 / $0.60` pricing and `170+ TPS` speed make it a strong cost-effective API for bots, OCR/vision/video pipelines, and SaaS automation)*

---

## 1. What It Is and How It Works

The cloud API offering of **`MiniMax M3.1 Flash`** — the model that held `#1` on OpenRouter for 10 days under the stealth codename **`space-bunny`** (its self-hosted weight package is [rejected for local developer machines under Local Models](../local-models/minimax-m3-1-flash.md)).

**Core specs and API pricing:**
- **Pricing (per `1M` tokens):** Input — **`$0.15`**, Output — **`$0.60`**, Cached Input — **`$0.015`** *(roughly `25–33x` cheaper than frontier tiers such as `Claude Opus 5.5` at `$4 / $20`)*.
- **Throughput:** Median **`170–200+ tokens/second`** (`P50 = 170+ TPS`) — low latency for live user-facing chat and multi-step background pipelines.
- **Context & Multimodality:** **`1,000,000`-token** window supporting native **text, image (`BabyVision: 91`), and video** inputs alongside structured outputs and tool calling.

---

## 2. Strengths & Weaknesses (Key Context Before Using)

### Strengths (Why It Is a Good Offer)
- **Massive unit-economics savings on high-volume workloads:** Well-suited for high-traffic customer support bots, translation, content/image moderation, receipt/document OCR, short video classification, and structured SaaS workflows (`Automation-Bench: 62.8%`, `BankerToolBench: 76.2%`).
- **Drop-in SDK compatibility:** Connects via standard `OpenAI` or `Anthropic` SDK `baseURL` settings with `$0.015/1M` prompt caching cutting repeated system-prompt costs by another `10x`.

### Weaknesses & Caveats (Where Not to Overreach)
- **Does not replace `Opus` / `Codex` for software engineering:** Despite viral claims, real engineering benchmarks (`Terminal-Bench 4.0: 38.1%` vs. `Opus 5: 51.8%`, `NL2Repo: 61.2%` vs. `Opus: 75.3%`) show substantially weaker accuracy on complex multi-file architectures. Do not swap it into `Claude Code` or `Codex` as a primary coding brain.
- **Cross-border cloud jurisdiction:** Hosted on international / Asian provider infrastructure (`MiniMax` / `Nanonoble Pte. Ltd.`) — verify data-residency compliance before sending regulated customer data.

---

## 3. Security & Caution When Using "Free" Tiers

- **Risk Level:** `Low–Medium` *(on paid Zero-Retention API)* / **`High` *(on free `MiniMax Code` check-in credits & `:free` endpoints)***
- **⚠️ Strict Caution Around "Free" Usage:**
  1. **Never send private code or user data to `MiniMax Code` free daily credits (`Daily check-in: 400 credits`) or OpenRouter `:free` endpoints:** Free consumer demos and `:free` providers **may log prompts/files and reuse them for model training** (MiniMax's own public rules explicitly warn against submitting unreleased source code, secrets, or keys to public/free environments).
  2. **Never wire free endpoints into local `Claude Code` / CLI agents:** Terminal coding agents automatically read and upload local source files, directory trees, and git diffs to the configured API host — using a free logging endpoint exposes the entire private repository.
- **Safe API Integration Rules (when adopted):**
  1. Use **paid commercial API keys only**, and enforce **`Zero Data Retention` / `Deny prompt training`** in OpenRouter routing settings (or covered commercial MiniMax API terms).
  2. Strip credentials, payment details, `.env` secrets, and raw regulated `PII` before outbound API requests.

---

## 4. Fit & Compatibility with Our Existing Stack

- **Leaves our coding & review stack untouched:** Daily engineering and cross-model code review stay on [**`T3 Code` + CLI Subagents**](../developer-tools/t3-code.md) (`Claude Opus 5.5`, `Codex`, `Gemini 4 Carbon / Argon`).
- **Fills a practical product-backend niche:** Whenever a web app, mobile app, or admin tool needs an inexpensive background LLM for high-volume chat, vision/OCR tagging, summarization, or `1M`-context log/document parsing, `M3.1 Flash API` offers strong throughput at `$0.15/$0.60`.

---

## 5. When to Use (and When Not To)

- **When to use:** High-volume product backend chatbots, image/screenshot/document vision extraction, translation/summarization pipelines, non-sensitive sandbox automation, and large-context (`1M`) text/video processing via paid Zero-Retention API.
- **When not to use:** Primary coding agent model for production repos, free `MiniMax Code` check-in chat with proprietary source code, or workloads subject to strict local `PII` residency mandates.

---

## 6. Status & Action History

| Date | Action | Status | Notes (where tested, what was sanitized, outcome) |
|---|---|---|---|
| 2026-11-16 | Audited pricing, throughput (`170+ TPS`), multimodal benchmarks, and API vs. free-tier privacy terms | `👍 Good Option` | Added under External APIs as a cost-effective backend/multimodal API option (strictly via paid Zero-Retention API keys; never use free daily-credit tiers on private code). |

