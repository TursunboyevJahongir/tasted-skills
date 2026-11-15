# `kimi-k3-in-c` (2.78T MoE CPU Disk-Streaming Engine)

[🇺🇿 O'zbekcha](../../local-models/kimi-k3-in-c.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/local-models/kimi-k3-in-c.md)

- **Source:** [FareedKhan-dev/kimi-k3-in-c](https://github.com/FareedKhan-dev/kimi-k3-in-c)
- **Category:** `Local Models` *(Local LLM Inference & Disk-Streaming Experiment)*
- **Type:** `Standalone C99 CLI Engine`
- **Quality Score:** **8.5 / 10** *(as a pure C99 systems engineering proof-of-concept)*
- **Need for Us:** **1.0 / 10** *(unusable for practical coding)*
- **Recommended Scope:** `Do Not Install`
- **Reviewed Date:** `2026-11-16`
- **Current Status:** `⛔ Rejected` *(unusable for real software development due to ~1.7 TB storage requirement, ~24–33 s/token speed, and extreme SSD read wear)*

---

## 1. What It Is and How It Works

Despite viral social-media clips framing it as *"running a 2.78T parameter AI locally on 8 GB RAM without a GPU"*, `kimi-k3-in-c` is **not an AI coding skill or developer agent** — it is a portable C99 inference engine (`~176 KB` compiled binary using `OpenMP` + `AVX2`/`NEON` + `O_DIRECT`).

**Core mechanism:**
- Normally, loading `Kimi K3` (2.78 trillion parameters) requires over `5 TB` of RAM.
- For every generated token, this engine reads only the **`16` active experts out of `896`** per layer (in packed `MXFP4` 4-bit form) directly from NVMe storage.
- The remaining **`109 GB`** dense trunk (`93` layers) is streamed layer-by-layer off disk instead of staying resident in RAM, keeping peak RSS around `8.24 GB`.
- The repository contains `src/` (`core`, `io`, `cache`, `model`, `chat`, `cli`, `tokenizer`), `tools/`, and `scripts/`, with zero `.claude`, `.codex`, or `SKILL.md` components.

---

## 2. Strengths and Weaknesses

### Strengths
- **Zero-dependency C99 engineering:** Built cleanly without `PyTorch`, `llama.cpp`, or external BLAS libraries.
- **Byte-identical determinism:** Produces identical token output from `8 GB` RAM presets up to `224 GB+` workstations; extra RAM only reduces disk waits.
- **Weightless oracle validation (`make test`):** Runs a 3-gate numerical verification suite (`teacher forcing`, `greedy decode`, `incremental KV + KDA`) against PyTorch reference fixtures in under a minute with no model checkpoint.

### Weaknesses and Cost (Storage / Latency / Hardware Wear)
- **`~1.7 TB` free NVMe storage required:** `1.56 TB` model checkpoint + `109 GB` packed trunk cannot fit on standard `512 GB – 1 TB` developer laptops without a dedicated `2 TB+` NVMe drive.
- **Prohibitively slow for coding (`24.2 – 32.7 s/token`):** Even on a `124`-core AMD EPYC test server under `8–32 GB` presets, **one token takes roughly half a minute**:
  - `"The capital of France is"` (`8` tokens) took **`4m 21s`**;
  - `def fibonacci(n):` (`28` tokens — a 4-line function) took **`299.3s` (~5 minutes)** even at **`128 GB RAM`**;
  - Writing a modest 30–40 line code change (`~500` tokens) would take **~3.5–4 hours**.
- **Severe SSD read wear:** Generating a single token streams `~100+ GB` through `O_DIRECT` reads — a single `500`-token response triggers **`~50+ TB` of NVMe reads**, throttling laptops and wearing out SSD endurance.
- **No agentic or IDE capabilities:** Cannot inspect repositories, edit files, run terminal tools, or plug into multi-agent review pipelines; helper scripts like `scripts/k3-doctor.sh` are Linux-only.

---

## 3. Security & Pre-Install Sanitization

- **Risk Level:** `Low` *(source code safety)* / `High` *(storage capacity and SSD endurance)*
- **Inspected Surface:**
  - No hidden telemetry, outbound tracking, or agent lifecycle hooks (`Stop`, `PreToolUse`, `SessionStart`) exist in `src/` or `scripts/`.
  - `make test` executes offline against small repository fixtures.
  - `scripts/k3-doctor.sh` relies on `/proc/meminfo` and Linux-specific `stat`/`df` flags (exits immediately on non-Linux hosts).
- **Mandatory decision:**
  1. **Do not install or download the `1.56 TB` checkpoint** on daily developer machines.

---

## 4. Fit & Compatibility with Our Existing Stack

- **Incompatible with practical multi-agent coding:**
  - For our *"implement with one AI, review independently with Claude / Codex / Argon"* workflow, [**`T3 Code` + CLI Subagents**](../developer-tools/t3-code.md) (`argon`, `antigravity-claude`, `antigravity-consult`, `task-context`) already runs in seconds with `0 GB` local model storage overhead.
  - If a 100% free, offline local coder is desired on an `Apple Silicon` (`32 GB RAM`) machine, fitting **`Ollama` / `MLX`** models (`Qwen2.5-Coder-14B` or `Qwen3-Coder`, `~9–18 GB`) inside unified memory achieves **`30–65 tokens/s` (`~1000x` faster)** without hammering the SSD.

---

## 5. When to Use (and When Not To)

- **When to use:** Only for studying how C99 disk-streaming MoE inference works (`make test` without downloading weights).
- **When not to use:** Daily coding, refactoring, code review, interactive chat, or any workstation with less than `2 TB` of spare NVMe storage.

---

## 6. Status & Action History

| Date | Action | Status | Notes (where tested, what was sanitized, outcome) |
|---|---|---|---|
| 2026-11-16 | Video demo, GitHub source (`src/`, `scripts/`), and hardware feasibility audit | `⛔ Rejected` | Rejected for practical coding due to `~1.7 TB` NVMe requirement, `~24–33 s/token` throughput (~3.5h per 500 tokens), and massive SSD read amplification. Keep using `T3 Code` + CLI subagents for multi-AI workflows. |
