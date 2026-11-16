# `kimi-k3-in-c` (2.78T MoE CPU Disk-Streaming Engine)

[🇺🇿 O'zbekcha](../../local-models/kimi-k3-in-c.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/local-models/kimi-k3-in-c.md)

- **Source:** [FareedKhan-dev/kimi-k3-in-c](https://github.com/FareedKhan-dev/kimi-k3-in-c)
- **Category:** `Local Models` *(Local LLM Inference & Disk-Streaming Experiment)*
- **Type:** `Standalone C99 CLI Engine`
- **Quality Score:** **8.5 / 10** *(as a pure C99 systems engineering proof-of-concept)*
- **Need for Us:** **1.0 / 10** *(unusable for practical coding)*
- **Recommended Scope:** `Do Not Install`
- **Reviewed Date:** `2026-11-16`
- **Current Status:** `⛔ Rejected` *(unusable for real software development due to ~1.8 TB NVMe requirement, ~24–33 s/token speed, and extreme SSD read wear)*

---

## 1. What It Is and How It Works

Despite viral social-media clips framing it as *"running a 2.78T parameter AI locally on 8 GB RAM without a GPU"*, `kimi-k3-in-c` is **not an AI coding skill or developer agent** — it is a portable C99 inference engine (`~176 KB` compiled binary using `OpenMP` + `AVX2`/`NEON` + `O_DIRECT`).

**Core mechanism:**
- `Kimi K3` (`2.78T` total / `~104B` active Mixture-of-Experts model, `1M` context) occupies **`1.56 TB`** on disk even in native `MXFP4` quantization (over `5 TB` in FP16).
- For every generated token, this engine reads only the **`16` active experts out of `896`** per layer (in packed `MXFP4` 4-bit form) directly from NVMe storage.
- The remaining **`109 GB`** dense trunk (`93` layers) is streamed layer-by-layer off disk instead of staying resident in RAM, keeping peak RSS around `8.24 GB`.
- The repository contains `src/` (`core`, `io`, `cache`, `model`, `chat`, `cli`, `tokenizer`), `tools/`, and `scripts/`, with zero `.claude`, `.codex`, or `SKILL.md` components.

---

## 2. Strengths, Weaknesses & Hardware Requirements

### Strengths
- **Zero-dependency C99 engineering:** Built cleanly without `PyTorch`, `llama.cpp`, or external BLAS libraries.
- **Byte-identical determinism:** Produces identical token output from `8 GB` RAM presets up to `224 GB+` workstations; extra RAM only reduces disk waits.
- **Weightless oracle validation (`make test`):** Runs a 3-gate numerical verification suite (`teacher forcing`, `greedy decode`, `incremental KV + KDA`) against PyTorch reference fixtures in under a minute with no model checkpoint.

### Hardware Requirements (`Minimum` vs. `Recommended for Smooth Performance`)

| Component | Minimum (Barely runs via `kimi-k3-in-c` disk streaming) | Recommended for Smooth Use (`vLLM` / `SGLang` at `30–60+ tok/s`) |
|---|---|---|
| **GPU / VRAM** | **`0 GB`** *(no GPU required; 100% CPU execution)* | **`16× NVIDIA H200` (`141 GB`, `~2.25 TB VRAM` across 2 NVLink nodes)** or **`8× NVIDIA B300` (`288 GB`, `~2.30 TB VRAM`)** *(`32× H200` for full `1M` context)* |
| **CPU** | **`16+ cores`** (`AVX2` Linux x86_64 or `NEON`; benchmarked on `124`-core EPYC) | **`64–128 cores`** (`AMD EPYC` / `Intel Xeon` data-center CPUs) |
| **RAM** | **`8–16 GB` free RAM** *(`128–224 GB RAM` caches the `109 GB` trunk, still slow)* | **`512 GB – 1 TB` DDR5 ECC RAM** |
| **SSD (Storage)** | **`≥ 1.8 TB` free PCIe Gen4/Gen5 NVMe** *(`1.56 TB` weights + `109 GB` packed trunk; `7+ GB/s` read)* | **`4 TB` Enterprise Gen5 NVMe** *(high `DWPD`/`TBW` data-center endurance)* |
| **Actual Speed** | **`~24.2 – 32.7 seconds / token`** (`500` tokens of code = **`~3.5–4 hours`**) | **`~30 – 60+ tokens / second`** *(usable interactive coding speed)* |

### Weaknesses and Cost
- **Does not fit standard laptops and is prohibitively slow:** Cannot fit on `512 GB – 1 TB` developer machines; even on a `124`-core server with `128 GB RAM`, generating `def fibonacci(n):` (`28` tokens) took **`~5 minutes` (`299.3s`)**.
- **No agentic or IDE capabilities:** Cannot inspect repositories, edit files, run terminal tools, or plug into multi-agent review pipelines; helper scripts like `scripts/k3-doctor.sh` are Linux-only.

---

## 3. Security, Local Execution & "Free Tier" Risks

- **Risk Level:** `Low` *(C99 source code cleanliness)* / **`High` *(Local SSD wear & "free" proxy data leakage risks)***
- **1. Local Execution Hazards (Hardware & SSD Endurance):**
  - **Destroys NVMe SSD lifespan (`TBW`):** Generating each token streams `~100+ GB` via `O_DIRECT` — a single `500`-token code reply triggers **`~50+ TB` of NVMe reads**. On laptops with soldered SSDs (such as MacBooks), sustained multi-terabyte reads and severe thermal throttling rapidly degrade drive health.
  - **System-wide I/O stalls:** Saturating NVMe bandwidth starves IDEs, browsers, and local dev servers.
  - **Unverified third-party weight/converter scripts:** Pulling repacked `1.5 TB` shards or Python conversion helpers (`trust_remote_code=True`, `pickle`) from unofficial mirrors carries arbitrary code execution risk.
- **2. ⚠️ Caution When Using "For Free" (Free API / Proxy Trap):**
  - Because local CPU streaming is unusable, developers often look for `:free` OpenRouter endpoints or unvetted free community proxies to wire Kimi K3 into `Claude Code` or IDEs.
  - **Never connect proprietary repos to free endpoints:** Free tiers routinely **log full prompts, private source files, `.env` secrets, and repository context for model training and dataset collection**.

---

## 4. Fit & Compatibility with Our Existing Stack

- **Incompatible with practical multi-agent coding:**
  - For our *"implement with one AI, review independently with Claude / Codex / Argon"* workflow, [**`T3 Code` + CLI Subagents**](../developer-tools/t3-code.md) (`argon`, `antigravity-claude`, `antigravity-consult`, `task-context`) already runs in seconds with `0 GB` local model storage overhead.
  - If a safe, 100% free offline local coder is needed on an `Apple Silicon` (`32 GB RAM`) machine, fitting **`Ollama` / `MLX`** models (`Qwen2.5-Coder-14B` or `Qwen3-Coder`, `~9–18 GB`) completely inside unified memory achieves **`30–65 tokens/s` (`~1000x` faster)** with zero SSD read wear.

---

## 5. When to Use (and When Not To)

- **When to use:** Only for studying how C99 disk-streaming MoE inference works (`make test` without downloading weights).
- **When not to use:** Daily coding, refactoring, code review, interactive chat, or any workstation with less than `2 TB` of spare storage or soldered laptop SSDs.

---

## 6. Status & Action History

| Date | Action | Status | Notes (where tested, what was sanitized, outcome) |
|---|---|---|---|
| 2026-11-16 | Video demo, GitHub source (`src/`, `scripts/`), `Min`/`Recommended` hardware sizing, and local/free-tier risk audit | `⛔ Rejected` | Rejected for practical coding: `Min` setup needs `~1.8 TB` NVMe at `~24–33 s/token` (`~50 TB` SSD reads per 500 tokens), while smooth speed requires a `16× H200` (`~2.25 TB VRAM`) cluster. Keep using `T3 Code` + CLI subagents. |
