# `Jev` (`TypeSafe AI` — Ultra-Fast `Decision / Select` API)

[🇺🇿 O'zbekcha](../../external-apis/jev.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/external-apis/jev.md)

- **Source:** [typesafe.ai](https://typesafe.ai/) · [docs.typesafe.ai](https://docs.typesafe.ai/) · `api.typesafe.ai/v1/systemone` (`jev-1.14.0`)
- **Category:** `External APIs` *(Sub-second `true/false`, `select`, and `score` decisions over images & text)*
- **Type:** `Cloud Decision Engine API` *(`System-1`, non-generative)*
- **Quality Score:** **9.0 / 10**
- **How Often Needed:** **8.0 / 10** *(running in production across several of our backend projects)*
- **Recommended Scope:** `Backend / Server Production API (paired with <80% Confidence & Timeout Fallback)`
- **Used Since:** `2026-10` *(last updated: `2026-11-17`)*
- **Current Status:** `✅ Using` *(actively used across our media/video platform and multiple server backends for image validity checks, best-frame selection, and pre-filtering)*

---

## 1. What It Is and How It Works (Crucial Distinction: Not a Generative AI!)

> [!IMPORTANT]
> **In Plain Words (Main Job & Value):** `Jev` is **not** a chatbot, text generator, or image editor — it is an **ultra-fast, ultra-cheap decision (`judgment`) engine**. You pass an image (or text) plus specific typed questions, and in **`~0.3 seconds`** it returns **`true / false`** (`usable / unusable`) or **picks the best option from a list (`select`)** with a `0–100%` confidence score. Used strictly in its proper lane, its speed-to-cost ratio beats every generative LLM we tested.

Built by `TypeSafe AI`, **`Jev` (`System-1` foundation model)** does not stream tokens autoregressively. You send a `state` (one or more images or structured text) plus typed questions and receive calibrated probabilities in a single forward pass:
- **`Noul` (`true / false`):** *"Is this uploaded image usable?"*, *"Are the actor's eyes accidentally closed?"*, *"Does this contain external ad text?"* -> returns a `0.00–1.00` probability.
- **`Choice` (`select` one of N):** *"Which of these 6 video frames is the best cover thumbnail?"* or *"Which category fits?"* -> per-option probabilities.
- **`Score`:** Rubric-based numeric rating.

📊 **Official Docs & Pricing:** [typesafe.ai](https://typesafe.ai/) · [docs.typesafe.ai](https://docs.typesafe.ai/)

---

## 2. Our Real-World Experience: Why We Picked `Jev` (3-Way Benchmark)

In our media/video platform and other server backends, we didn't need to generate or edit images on the hot path — we needed to **verify whether an incoming image is valid/safe** and **pick the best option out of several candidates (`select`)**. We benchmarked three real approaches head-to-head:

| Dimension | Option 1: **Paid `GPT` Vision API** (`GPT-5`, etc.) | Option 2: **Server AI Subscription (`GPT-6 Luna` `Medium`)** | Option 3: ✅ **`Jev` (`TypeSafe AI`) + Fallback** |
|---|---|---|---|
| **Latency (1 image / 6 checks)** | Slow (`~4–10+ seconds`) | **At least `~9–12+ seconds`** *(even on fast `GPT-6 Luna Medium`, `p50` was `9.02s–12.4s` — users are stuck waiting!)* | **`~0.30 – 0.35 seconds` (`299–349 ms` p50)** — **`~25–30x` faster!** *(6-frame video gallery selection finishes in `~3.3s`)* |
| **Price (per `1M` tokens)** | **Expensive:** `$1.25` in · `$10.00` out *(adds up fast on image uploads)* | Included in existing AI subscription *(cheap per call, but rate-limited & slow)* | **Paid, but tiny cost:** **`$0.042` in** · **`$0.00` out (free!)** *(**`~2.4x–10x` cheaper** than `GPT-6 Luna` API `$0.10/$0.50`, and **`~30x–100x+` cheaper** than frontier GPT Vision)* |
| **Setup Effort** | Easy (plain prompt) | Moderate (server auth + queue) | **Harder** (requires schema calibration + `<80%` & timeout fallback) |
| **Outcome** | Accurate, too slow & costly at scale | Fine for background jobs, too slow for user-facing uploads | **Unbeatable for real-time validation & multi-option selection** |

**Where we run it on our servers today:**
1. **Instant upload validity & safety gate:** Validates user/editor image uploads in `~0.3–1.6s` instead of making users wait `10+` seconds.
2. **Best-of-6 video frame selection (`select`):** Evaluates 6 extracted video frames in one request — flags bad blinks/distortions for single-slot FFmpeg resampling and picks the best main thumbnail (`~3.3s`).
3. **Cheap candidate pre-filtering:** Filters out unusable candidate photos in `~349 ms` before invoking heavy models (`~43%` fewer expensive model calls).
4. **Batch schedule / catalog classification:** Classifies 14–20 text rows in `~0.8–1.0s`.

---

## 3. Weaknesses & Mandatory Production Guardrails

`Jev` is **not** a "plug it in and forget it" API. Its raw speed and price outweigh every downside **only** if you build these three engineering guardrails around it:

1. **Requires Upfront Calibration (`Shadow` Mode Testing):**
   - Typed questions must be phrased precisely and tested against tricky edge cases before going active (e.g., ensuring movie studio credits aren't misclassified as ads, and binding array items by explicit index keys).
2. **Pair It with a Stronger AI (`Confidence < 80%` Fallback):**
   - Never trust low-confidence answers blindly. Whenever `Jev` is unsure — e.g., **confidence `< 0.80` (`<80%`)** — automatically route that item to a stronger model (`GPT-6 Luna` / `Codex` / GPT API) for final judgment.
3. **Never Assume 100% Uptime (`Timeout + Connection Failover`):**
   - Occasionally `Jev` can fail to connect, return `429/529`, or stall on large images. Always enforce strict timeouts (**`3s` single-image / `6s` multi-image**) and bounded concurrency so any connection drop seamlessly falls back to your secondary AI without breaking production traffic.

---

## 4. When to Use (and When Not To)

- **✅ Ideal Sweet Spot (Use `Jev` here):**
  - Fast **`true / false`** checks on incoming images or text (validity, safety, bad-frame detection, pre-filtering);
  - **`Select` (`1-of-N`)** choices across `2–10` image or text candidates;
  - High-volume `System-1` front gate sitting in front of a slower, pricier `System-2` LLM.
- **❌ Wrong Tool (Use a Generative Model Instead):**
  - Generating, cropping, sharpening, or editing image pixels;
  - Writing text, translating, generating code, or full-document `OCR` (`use MiniMax M3.1 Flash API or GPT-6 Luna`);
  - Open-ended web research or multi-step reasoning.

---

## 5. Status & Action History

| Date | Action | Status | Notes |
|---|---|---|---|
| 2026-10-30 | Production rollout across 6 server judgment paths (`jev-1.14.0`) + benchmark vs. `GPT-6 Luna` | `✅ Using` | `~0.3s` p50 latency (vs. `~9–12s` on `GPT-6 Luna Medium`), protected by `<0.80` confidence escalation and `3–6s` timeout failover. |
| 2026-11-17 | Documented real-world architecture, cost/speed ratios, and fallback rules in catalog | `✅ Using` | Consolidated production lessons across multiple backend services. |
