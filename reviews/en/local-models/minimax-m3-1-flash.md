# `MiniMax-M3.1-Flash` — Local Open-Weight Model (`428B` MoE / *Space Bunny*)

[🇺🇿 O'zbekcha](../../local-models/minimax-m3-1-flash.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/local-models/minimax-m3-1-flash.md)

- **Source:** [MiniMaxAI/MiniMax-M3.1-Flash (Hugging Face)](https://huggingface.co/MiniMaxAI/MiniMax-M3.1-Flash)
- **Category:** `Local Models` *(Open-Weight Multimodal MoE — local self-hosting feasibility audit)*
- **Type:** `Open-Weight LLM` *(`~428B` total / `~23B` active parameters, `MXFP8 + NVFP4`)*
- **Quality Score:** **8.0 / 10** *(as a fast budget multimodal `Flash`-tier model)*
- **Need for Us (Local):** **1.0 / 10** *(cannot fit developer machines; as a cloud API — [`👍 Good Option`](../external-apis/minimax-m3-1-flash-api.md))*
- **Recommended Scope:** `Do Not Install (Locally)` *(use strictly via [🔌 External APIs](../external-apis/minimax-m3-1-flash-api.md) when needed)*
- **Reviewed Date:** `2026-11-16`
- **Current Status:** `⛔ Rejected` *(requires `~250–285 GB` checkpoint storage and a `640+ GB VRAM` data-center GPU cluster for practical local serving)*

---

## 1. What It Is and How It Works (Video Hype vs. Reality)

Viral reels promote **MiniMax M3.1 Flash** (the stealth model formerly ranked `#1` on OpenRouter for 10 days as **`space-bunny`**) as *"stronger than Claude Opus 5.5 and GPT-5.6 and open-source so anyone can download and run it on their own server."*

**What is actually inside:**
- **Architecture:** A `~428B` total-parameter (`~23B` active per token) native multimodal (`text + image + video`) Mixture-of-Experts (`MoE`) model with a `1,000,000`-token context window, `MiniMax Sparse Attention`, and `DSpark` speculative decoding.
- **Why Hugging Face shows `220B params`:** Because the weights are stored as packed `MXFP8` and `NVFP4` (4-bit/8-bit) tensors, Hugging Face's safetensors element counter displays `220B`, while the actual checkpoint on disk is **`~250–285 GB`**.
- **Marketing distortions in the video demo:**
  1. The *"beats Opus 5.5"* claim is cherry-picked from a single office SaaS benchmark (**`Automation-Bench: 62.8%`** vs. `Opus 5.5: 57%`). On real multi-file software engineering and terminal benchmarks, it trails frontier coding models significantly: **`Terminal-Bench 4.0` = `38.1%`** *(vs. `Claude Opus 5`: `51.8%`)* and **`NL2Repo-Bench` = `61.2%`** *(vs. `Opus`: `75.3%`)*.
  2. The on-screen `$0.66` cost breakdown shown for the "medieval village" demo actually says *«Сборка пчелы»* (`MECHANICAL BEE`) — spliced B-roll from a different session.

---

## 2. Strengths, Weaknesses & Hardware Requirements

### Strengths
- Thanks to `~23B` active parameters and Sparse Attention, achieves very high throughput (`170–200+ TPS`) when hosted on enterprise GPU clusters.
- Strong multimodal (`BabyVision: 91`) and GUI computer-use performance (`OSWorld V2: 61.7`) with up to `1M` context.

### Hardware Requirements (`Minimum` vs. `Recommended for Smooth Performance`)

| Component | Minimum (Barely boots locally) | Recommended for Smooth Use (`vLLM` / `SGLang`, `100–170+ tok/s`) |
|---|---|---|
| **GPU / VRAM** | **`0–24 GB`** *(CPU/SSD offload)* **or** **`Mac Studio M3/M4 Ultra 512 GB Unified RAM`** (`$9,000+` workstation) | **`8× NVIDIA H100` (`80 GB`, `640 GB VRAM` total)** or **`4× NVIDIA B200` (`180 GB`, `720 GB VRAM` total, native `NVFP4`)** *(needs `320–400+ GB` VRAM floor; older `A100` not recommended)* |
| **CPU** | **`16–32 cores`** (`Apple Ultra` or server `AVX-512` / `AVX2`) | **`64+ cores`** (`AMD EPYC` / `Intel Xeon` server CPUs) |
| **RAM** | **`64–128 GB` RAM** *(with disk offload)* or **`≥ 320–512 GB` Unified RAM** *(fully resident)* | **`512 GB` DDR5 ECC RAM** |
| **SSD (Storage)** | **`≥ 350–500 GB` free fast NVMe** *(`~250–285 GB` checkpoint + cache)* | **`1–2 TB` PCIe Gen4/Gen5 Enterprise NVMe** |
| **Actual Speed** | **`~0.5 – 3 tok/s`** on disk offload *(unusable)*; **`~12 – 25 tok/s`** on `512 GB` Mac Studio | **`100 – 200+ tokens / second`** *(with multimodal inputs & `256K+` KV cache)* |

### Weaknesses and Cost
- Completely impossible to fit on normal `16–64 GB RAM` developer laptops or single-GPU consumer PCs (`24–32 GB VRAM` RTX 4090/5090 — short by more than `10x` VRAM).
- Noticeably weaker than our active frontier coding stack (`Claude Opus 5.5`, `Codex`, `Argon`) on deep repository-level engineering (`Terminal-Bench 38.1%`).

---

## 3. Security, Local Execution & "Free Tier" Risks

- **Risk Level:** **`High` *(Local SSD/swap wear, `custom_code` RCE surface, and private code leakage on "free" tiers)***
- **1. Local Execution Hazards:**
  - **NVMe SSD wear & OS freezes:** Forcing a `~250–285 GB` checkpoint onto a `32–64 GB RAM` laptop via `mmap` / disk offload / OS swap hammers soldered NVMe drives (`TBW` exhaustion), causes severe thermal throttling, and stalls the system.
  - **`custom_code` (`trust_remote_code=True`) risk:** Because `minimax_m3` uses custom model/parser Python code, loading unverified community quantizations or forks with `trust_remote_code=True` exposes the host machine to arbitrary code execution (`RCE`).
  - **License trap (`MiniMax Community License`):** Not MIT or Apache-2.0 — commercial products must display a prominent *"Built with MiniMax M3.1-Flash"* attribution notice and notify MiniMax (`$20M+` annual revenue requires separate prior written authorization).
- **2. ⚠️ Caution When Using "For Free" (`MiniMax Code` Daily Credits & `:free` Endpoints):**
  - **Proprietary code & `.env` secrets may be logged/trained on:** Free consumer web tiers (*`MiniMax Code` Daily check-in: 400 credits*) and OpenRouter `:free` / stealth promotional endpoints do **not** provide enterprise zero-retention guarantees; MiniMax's own public guidelines warn against submitting unreleased source code, trade secrets, or private keys into public/free demos.
  - **Wiring free endpoints into `Claude Code` leaks repo context:** Pointing local `Claude Code` or terminal agents (`ANTHROPIC_BASE_URL`) at a free third-party `M3.1-Flash` endpoint automatically transmits **local source files, directory trees, git diffs, and terminal outputs** to that external provider.

---

## 4. Fit & Compatibility with Our Existing Stack

- **As a local coding model — Not needed (`⛔ Rejected`):**
  - Our [**`T3 Code` + CLI Subagents**](../developer-tools/t3-code.md) workflow (`Claude Opus 5.5`, `Codex`, `Gemini 4 Carbon / Argon`) already delivers much stronger architectural and coding accuracy with `0 GB` local weight storage.
  - For genuine 100% offline local coding on a `32 GB RAM` Mac, **`Ollama` / `MLX` (`Qwen2.5-Coder-14B` or `Qwen3-Coder`, `~9–18 GB`, `30–65 tok/s`, Apache-2.0)** fits cleanly in RAM with zero SSD wear.
- **As an External Cloud API — Worth keeping in mind (`👍 Good Option`):** For cheap high-throughput backend bots and multimodal tasks via paid zero-retention API, see our dedicated review: [**`MiniMax M3.1 Flash API`**](../external-apis/minimax-m3-1-flash-api.md).

---

## 5. When to Use (and When Not To)

- **When to use locally:** Only if operating a dedicated on-prem `8× H100` / `4× B200` (`640+ GB VRAM`) cluster under strict air-gapped enterprise requirements (while complying with the `MiniMax Community License`).
- **When not to use:** On any developer laptop or single-GPU workstation, or by feeding private repositories into free `MiniMax Code` check-in tiers or `:free` proxies.

---

## 6. Status & Action History

| Date | Action | Status | Notes (where tested, what was sanitized, outcome) |
|---|---|---|---|
| 2026-11-16 | Audited video demo (`@aleko.so`), HuggingFace weights, `vLLM` cluster sizing, license, and free-tier privacy terms | `⛔ Rejected` | Rejected as a local model (`~250–285 GB` weights; needs `8× H100` / `640 GB VRAM` for smooth serving, plus high privacy risk on free tiers); cataloged separately as a [`👍 Good Option` under External APIs](../external-apis/minimax-m3-1-flash-api.md). |

