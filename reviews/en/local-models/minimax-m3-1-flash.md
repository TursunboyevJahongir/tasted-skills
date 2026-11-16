# `MiniMax-M3.1-Flash` — Local Open-Weight Model (`428B` MoE / *Space Bunny*)

[🇺🇿 O'zbekcha](../../local-models/minimax-m3-1-flash.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/local-models/minimax-m3-1-flash.md)

- **Source:** [MiniMaxAI/MiniMax-M3.1-Flash (Hugging Face)](https://huggingface.co/MiniMaxAI/MiniMax-M3.1-Flash)
- **Statistics & Benchmarks:** [Hugging Face Model Card & Benchmarks](https://huggingface.co/MiniMaxAI/MiniMax-M3.1-Flash) · [OpenRouter Live Stats (`minimax/minimax-m3.1-flash`)](https://openrouter.ai/minimax/minimax-m3.1-flash) · [Artificial Analysis Leaderboard](https://artificialanalysis.ai/leaderboards/models)
- **Category:** `Local Models` *(Open-Weight Multimodal MoE — local self-hosting audit)*
- **Type:** `Open-Weight LLM` *(`~428B` total / `~23B` active parameters, `1M` context, `MXFP8 + NVFP4`)*
- **Quality Score:** **8.0 / 10** *(as a fast multimodal `Flash`-tier model)*
- **Need for Us (Local):** **1.0 / 10** *(does not fit normal developer machines; as a cloud API — [`👍 Good Option`](../external-apis/minimax-m3-1-flash-api.md))*
- **Recommended Scope:** `Do Not Install (Locally)` *(use via [🔌 External APIs](../external-apis/minimax-m3-1-flash-api.md) when needed)*
- **Reviewed Date:** `2026-11-16`
- **Current Status:** `⛔ Rejected` *(requires `~250–285 GB` disk space and an `8× H100 / 640 GB VRAM` cluster for smooth local serving)*

---

## 1. What Is It Designed For & What Can It Do? (Primary Direction)

> [!IMPORTANT]
> **In Plain Words (Main Job & Value):** Local weights for the fast `text + image + video` model, rejected for local hosting because its **`~250–285 GB` checkpoint** cannot fit normal workstations (`Min: 512 GB Mac Studio` or `8× H100`) and it isn't a top repo coder (`Terminal-Bench: 38.1%`). Use its cloud API instead if needed.

**`MiniMax-M3.1-Flash`** (the model that ranked `#1` on OpenRouter for 10 days as **`space-bunny`**) is a `~428B` total-parameter Mixture-of-Experts (`MoE`) model that activates only **`~23B` parameters per token** and natively processes **text, images, and video across a `1,000,000`-token context window**.

**Primary capabilities:**
1. **Multimodal understanding (`Text + Image + Video`):** Reading screenshots, documents, receipts (`OCR`), diagrams, and video clips (`BabyVision: 91`).
2. **Office, SaaS, and GUI automation:** Multi-step tool calling, form/spreadsheet workflows, and desktop/browser control (`Automation-Bench: 62.8%`, `OSWorld V2: 61.7`, `BankerToolBench: 76.2%`).
3. **Long-context (`1M`) chat & translation:** Summarizing and querying massive logs or document bundles in a single pass.

---

## 2. Does It Work for Writing Code?

- **For simple scripts & UI prototypes — Yes; for complex repository engineering — No (not a primary coder):**
  - Quickly generates single-file scripts, UI/landing prototypes, SQL queries, and automation glue code.
  - **Trails frontier coding models (`Claude Opus`, `Codex`) on deep engineering:** Scores **`Terminal-Bench 4.0` = `38.1%`** *(vs. `Claude Opus 5`: `51.8%`)* and **`NL2Repo-Bench` = `61.2%`** *(vs. `Opus`: `75.3%`)*.
  - **Impractical to run locally for coding:** Its **`~250–285 GB`** checkpoint cannot fit on `16–64 GB RAM` laptops or single-GPU (`24–32 GB VRAM`) workstations.

---

## 3. Hardware Requirements (`Minimum` vs. `Recommended`)

| Component | Minimum (Barely boots locally) | Recommended for Smooth Use (`vLLM` / `SGLang`, `100–170+ tok/s`) |
|---|---|---|
| **GPU / VRAM** | **`Mac Studio Ultra 512 GB Unified RAM`** *(or `0–24 GB` GPU with SSD offload)* | **`8× NVIDIA H100` (`640 GB VRAM`)** or **`4× NVIDIA B200` (`720 GB VRAM`)** |
| **CPU** | **`16–32 cores`** | **`64+ cores`** (`AMD EPYC` / `Intel Xeon`) |
| **RAM** | **`64–128 GB` RAM** *(disk offload)* or **`≥ 320–512 GB` Unified RAM** | **`512 GB` DDR5 ECC RAM** |
| **SSD (Storage)** | **`≥ 350–500 GB` free NVMe** *(`~250–285 GB` weights)* | **`1–2 TB` Enterprise NVMe** |
| **Actual Speed** | **`~0.5–3 tok/s`** on disk offload; **`~12–25 tok/s`** on `512 GB` Mac Studio | **`100 – 200+ tokens / s`** |

> ⚠️ **Note:** Released under the `MiniMax Community License` (commercial apps must display *"Built with MiniMax M3.1-Flash"*) and requires `trust_remote_code=True` when loading custom architecture code.

---

## 4. How Much Do We Need a Local Alternative?

- **We do not need to self-host this model locally (`1.0/10`):** Maintaining a `$9,000+` `512 GB` Mac Studio or `8× H100` cluster for a `285 GB` Flash model makes no sense for our team.
- **Two practical alternatives:**
  1. **If you want `MiniMax M3.1 Flash` itself:** Call it via cloud API (`$0.15 / $0.60`, `170+ tok/s`) with zero local hardware overhead — 👉 [**`MiniMax M3.1 Flash API`**](../external-apis/minimax-m3-1-flash-api.md).
  2. **If you want a 100% offline local coding model:** Run **`Qwen3-Coder` or `Qwen2.5-Coder-14B/32B` via `Ollama` / `MLX`** (`~9–20 GB`, `30–65 tok/s`, Apache-2.0), which fits cleanly inside `32–64 GB` Mac RAM.

---

## 5. Status & Action History

| Date | Action | Status | Notes |
|---|---|---|---|
| 2026-11-16 | Audited model purpose, coding benchmarks (`Terminal-Bench 38.1%`), hardware sizing, and local/API alternatives | `⛔ Rejected` | Rejected for local installation (`~250–285 GB` weights, `640 GB VRAM` cluster); use [External APIs](../external-apis/minimax-m3-1-flash-api.md) for cloud access or `Ollama`/`MLX` (`Qwen3-Coder`) for offline local coding. |
