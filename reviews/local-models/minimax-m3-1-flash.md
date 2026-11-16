# `MiniMax-M3.1-Flash` — Lokal Ochiq Model (`428B` MoE / *Space Bunny*)

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/local-models/minimax-m3-1-flash.md) | [🇷🇺 Русский](../ru/local-models/minimax-m3-1-flash.md)

- **Manba:** [MiniMaxAI/MiniMax-M3.1-Flash (Hugging Face)](https://huggingface.co/MiniMaxAI/MiniMax-M3.1-Flash)
- **Statistika va Benchmarklar:** [Hugging Face Model Card & Benchmarks](https://huggingface.co/MiniMaxAI/MiniMax-M3.1-Flash) · [OpenRouter Live Stats (`minimax/minimax-m3.1-flash`)](https://openrouter.ai/minimax/minimax-m3.1-flash) · [Artificial Analysis Leaderboard](https://artificialanalysis.ai/leaderboards/models)
- **Turkum:** `Lokal modellar` *(Ochiq vaznli Multimodal MoE — lokal kompyuter/serverda yoqish tahlili)*
- **Turi:** `Open-Weight LLM` *(`~428B` umumiy / `~23B` aktiv parametr, `1M` kontekst, `MXFP8 + NVFP4`)*
- **Sifat bahosi:** **8.0 / 10** *(tezkor multimodal `Flash` sinfidagi model sifatida)*
- **Bizga kerakliligi (Lokalda):** **1.0 / 10** *(oddiy kompyuterlarga sig'maydi; bulut API sifatida esa — [`👍 Yaxshi variant`](../external-apis/minimax-m3-1-flash-api.md))*
- **Tavsiya etilgan ko'lam:** `O'rnatmaslik (Lokalda)` *(kerak bo'lsa [🔌 Tashqi API](../external-apis/minimax-m3-1-flash-api.md) orqali ishlatish)*
- **Tekshirilgan sana:** `2026-11-16`
- **Joriy holati:** `⛔ Rad etildi` *(lokalda `~250–285 GB` joy va normal ishlashi uchun `8× H100 / 640 GB VRAM` server klasteri talab qiladi)*

---

## 1. Nimaga mo'ljallangan va nima ish qila oladi? (Asosiy yo'nalishi)

> [!IMPORTANT]
> **Oddiy tilda (Asosiy vazifasi va foydasi):** Matn, rasm va videoni tushunadigan tezkor modelning lokal versiyasi, lekin og'irligi **`~250–285 GB`** bo'lgani uchun oddiy kompyuterlarga sig'maydi (`Min: 512 GB Mac Studio` yoki `8× H100`), murakkab kod yozishda ham asosiy model emas (`Terminal-Bench: 38.1%`). Aynan shu model kerak bo'lsa — bulutli API variantini ishlating.

**`MiniMax-M3.1-Flash`** (OpenRouter'da 10 kun **`space-bunny`** nomi bilan `#1` turgan model) — `~428B` umumiy parametrli, lekin har bir tokenda faqat **`~23B` parametri faol ishlovchi** tezkor **multimodal (`matn + rasm + video`, `1,000,000` token kontekst)** Mixture-of-Experts (`MoE`) modelidir.

**Asosiy yo'nalishi va qo'lidan keladigan ishlar:**
1. **Multimodal tahlil (`Matn + Rasm + Video`):** Skrinshot, hujjat, chek (`OCR`), sxema va videolarni o'qish hamda tahlil qilish (`BabyVision: 91`).
2. **Ofis, SaaS va brauzer avtomatizatsiyasi:** Ko'p qadamli tool-calling, jadval/hujjat to'ldirish va UI elementlarini boshqarish (`Automation-Bench: 62.8%`, `OSWorld V2: 61.7`, `BankerToolBench: 76.2%`).
3. **Katta kontekstli (`1M`) suhbat va tarjima:** Katta hajmdagi loglar, hujjatlar yoki kitoblarni bir urishda o'qib xulosa chiqarish.

---

## 2. Kod yozishga ishlaydimi?

- **Oddiy kod va skriptlarga — Ha; murakkab loyiha arxitekturasiga — Yo'q (asosiy coder emas):**
  - Bir faylli skriptlar, landing/UI prototiplar, SQL so'rovlar va avtomatizatsiya skriptlarini tez yozadi.
  - **Lekin murakkab dasturlashda asosiy frontier modellardan (`Claude Opus`, `Codex`) ancha orqada:** Real muhandislik testlarida **`Terminal-Bench 4.0` = `38.1%`** *(vs `Claude Opus 5`: `51.8%`)* va **`NL2Repo-Bench` = `61.2%`** *(vs `Opus`: `75.3%`)*.
  - **Lokalda kod yozish uchun yaroqsiz:** Modelning diskdagi hajmi **`~250–285 GB`** bo'lgani uchun oddiy `16–64 GB RAM` li MacBook yoki `24–32 GB VRAM` li GPU kompyuterga umuman sig'maydi.

---

## 3. Kompyuter Resurs Talablari (`Min` vs `Yaxshi ishlashi uchun`)

| Ko'rsatkich | Minimal (Zo'rg'a lokalda ishga tushirish) | Yaxshi ishlashi uchun (`vLLM` / `SGLang`, `100–170+ tok/s`) |
|---|---|---|
| **GPU / VRAM** | **`Mac Studio Ultra 512 GB Unified RAM`** *(yoki `0–24 GB` GPU bilan SSD offload)* | **`8× NVIDIA H100` (`640 GB VRAM`)** yoki **`4× NVIDIA B200` (`720 GB VRAM`)** |
| **CPU** | **`16–32 yadro`** | **`64+ yadro`** (`AMD EPYC` / `Intel Xeon`) |
| **RAM** | **`64–128 GB` RAM** *(disk offload)* yoki **`≥ 320–512 GB` Unified RAM** | **`512 GB` DDR5 ECC RAM** |
| **SSD (Disk)** | **`≥ 350–500 GB` bo'sh NVMe** *(`~250–285 GB` model vazni)* | **`1–2 TB` Enterprise NVMe** |
| **Haqiqiy tezlik** | Disk offload'da **`~0.5–3 tok/s`**; `512 GB` Mac Studio'da **`~12–25 tok/s`** | **`100 – 200+ token / s`** |

> ⚠️ **Eslatma:** Model `MiniMax Community License` ostida chiqqan (tijoriy mahsulotda *"Built with MiniMax M3.1-Flash"* yozuvi shart) va yuklashda `trust_remote_code=True` talab qiladi.

---

## 4. Lokal alternativa qanchalik kerak?

- **Bu modelni lokalda saqlash bizga umuman kerak emas (`1.0/10`):** `285 GB` vazn uchun `$9,000+` lik `512 GB` Mac Studio yoki `8× H100` server ushlash o'zini oqlamaydi.
- **2 ta to'g'ri alternativa:**
  1. **Aynan `MiniMax M3.1 Flash` imkoniyatlari kerak bo'lsa:** Uni lokalga tortmasdan, tayyor bulut API orqali (`$0.15 / $0.60`, `170+ tok/s`) ishlating — 👉 [**`MiniMax M3.1 Flash API`**](../external-apis/minimax-m3-1-flash-api.md).
  2. **100% lokal (oflayn) kod yozuvchi model kerak bo'lsa:** `32–64 GB` Mac RAM'iga to'liq sig'adigan **`Ollama` / `MLX` dagi `Qwen3-Coder` yoki `Qwen2.5-Coder-14B/32B`** (`~9–20 GB`, `30–65 tok/s`, Apache-2.0) ishlating.

---

## 5. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-11-16 | Model yo'nalishi, coding benchmarklari (`Terminal-Bench 38.1%`), temir talablari va lokal/API alternativalar tahlili | `⛔ Rad etildi` | Lokalda `~250–285 GB` vazn va `640 GB VRAM` talabi sabab rad etildi; bu model kerak bo'lsa [Tashqi API](../external-apis/minimax-m3-1-flash-api.md) orqali, lokal coder kerak bo'lsa `Ollama`/`MLX` (`Qwen3-Coder`) orqali ishlatiladi. |
