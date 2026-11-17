# `kimi-k3-in-c` (2.78T MoE CPU Disk-Streaming Engine)

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/local-models/kimi-k3-in-c.md) | [🇷🇺 Русский](../ru/local-models/kimi-k3-in-c.md)

- **Manba:** [FareedKhan-dev/kimi-k3-in-c](https://github.com/FareedKhan-dev/kimi-k3-in-c)
- **Statistika va Benchmarklar:** [GitHub Repo Benchmarklari](https://github.com/FareedKhan-dev/kimi-k3-in-c#benchmarks) · [Artificial Analysis LLM Leaderboard](https://artificialanalysis.ai/leaderboards/models)
- **Turkum:** `Lokal modellar` *(Lokal LLM Inference va Disk-Streaming Eksperimenti)*
- **Turi:** `Standalone C99 CLI Engine`
- **Sifat bahosi:** **8.5 / 10** *(tizimli C99 muhandislik eksperimenti sifatida)*
- **Ishda kerak bo'lishi:** **1.0 / 10** *(amaliy kod yozish va kundalik ish uchun yaroqsiz)*
- **Tavsiya etilgan ko'lam:** `O'rnatmaslik`
- **Tekshirilgan sana:** `2026-11-16`
- **Joriy holati:** `⚠️ Tavsiya etilmaydi` *(~1.8 TB NVMe joy, 1 token uchun ~24–33 soniya va ~50 TB SSD o'qish yuklamasi sabab amaliy ishlatib bo'lmaydi)*

---

## 1. Nimaga mo'ljallangan va nima ish qila oladi? (Asosiy yo'nalishi)

> [!IMPORTANT]
> **Oddiy tilda (Asosiy vazifasi va foydasi):** `2.78T` li ulkan `Kimi K3` modelini videokartasiz SSD diskdan o'qish eksperimenti — **amalda kod yozishga mutlaqo yaramaydi**: `1 ta token = ~24–33 soniya`, `500` token javob olish uchun **`~3.5 soat`** va **`~50 TB` SSD o'qish** ketib, disk umrini yeb bitiradi. Haqiqiy lokal coder kerak bo'lsa `32–64 GB` Mac'da `Ollama` / `MLX` (`Qwen3-Coder`, `30–65 tok/s`) ishlating.

- **Modelning o'zi (`Kimi K3`, `2.78T` umumiy / `~104B` aktiv parametr, `1M` kontekst):** Murakkab mantiqiy tahlil (`reasoning`), dasturlash, matematika va katta hujjatlar bilan ishlashga mo'ljallangan ulkan Mixture-of-Experts (`MoE`) til modeli.
- **`kimi-k3-in-c` dvigatelining vazifasi:** Odatda `2.25 TB` GPU VRAM talab qiladigan ushbu ulkan modelni **umuman GPU ishlatmasdan**, C99 tilida (`~176 KB` binar fayl, `O_DIRECT`) har bir token uchun `896` ta ekspertdan faqat **`16` ta faol ekspertni** va `109 GB` magistral qatlamni bevosita NVMe SSD diskdan oqim (`stream`) qilib o'qish orqali **`8–16 GB RAM`** ichida ishga tushirib ko'rsatishga mo'ljallangan ilmiy-muhandislik eksperimenti.

---

## 2. Kod yozishga ishlaydimi?

- **Model sifatida — Ha, lekin bu lokal C99 disk-stream usulida — Yo'q (`Ishlab bo'lmaydi`):**
  1. **Tezlik falokatli darajada sekin:** `1 token = ~24.2 – 32.7 soniya`. Oddiy `def fibonacci(n):` (`28` token) funksiyasini yozishga `124` yadroli serverda ham **`~5 daqiqa` (`299.3s`)**, `500` tokenlik kichik kod javobiga esa **`~3.5–4 soat`** ketadi.
  2. **SSD umrini (`TBW`) yeb bitiradi:** Bitta `500` tokenlik kod javobi uchun NVMe diskdan **`~50+ TB` ma'lumot o'qiladi** — lehimlangan SSD'li noutbuklarni qisqa vaqtda ishdan chiqaradi.
  3. **Agentlik imkoniyati yo'q:** Repozitoriy fayllarini o'qish, tahrirlash yoki terminal testlarini ishga tushira olmaydi.

---

## 3. Kompyuter Resurs Talablari (`Min` vs `Yaxshi ishlashi uchun`)

> [!WARNING]
> **SSD umrini yeyish va maxfiylik xavfi:** Bitta `500` tokenlik javob NVMe diskdan **`~50+ TB` o'qish** qilib lehimlangan noutbuk SSD umrini (`TBW`) tez tugatadi; tekin `:free` proxy'larga esa yopiq kod ulamang.

| Ko'rsatkich | Minimal (`kimi-k3-in-c` disk-stream rejimida zo'rg'a yoqish) | Yaxshi ishlashi uchun (`vLLM` / `SGLang`, `30–60+ tok/s`) |
|---|---|---|
| **GPU / VRAM** | **`0 GB`** *(100% CPU + NVMe disk)* | **`16× NVIDIA H200` (`~2.25 TB VRAM`)** yoki **`8× NVIDIA B300` (`~2.30 TB VRAM`)** |
| **CPU** | **`16+ yadro`** (`AVX2` / `NEON`; testlar `124` yadroli EPYC'da olingan) | **`64–128 yadro`** (`AMD EPYC` / `Intel Xeon`) |
| **RAM** | **`8–16 GB` bo'sh RAM** | **`512 GB – 1 TB` DDR5 ECC RAM** |
| **SSD (Disk)** | **`≥ 1.8 TB` bo'sh PCIe Gen4/Gen5 NVMe** *(`1.56 TB` model + `109 GB` trunk)* | **`4 TB` Enterprise Gen5 NVMe** |
| **Haqiqiy tezlik** | **`~24.2 – 32.7 s / token`** (`500` token = `~3.5–4 soat`) | **`~30 – 60+ token / s`** |

> ⚠️ **Xavfsizlik eslatmasi:** Lokalda juda sekin bo'lgani uchun yopiq loyiha kodini uchinchi tomon tekin `:free` proxy'lariga ulamang — bepul endpointlar prompt va kodlarni o'qitish (`training`) uchun saqlab oladi.

---

## 4. Lokal alternativa qanchalik kerak?

- **Bizga bu lokal model kerak emas (`1.0/10`):** Asosiy kod yozish va arxitektura ishlarimiz bulutdagi frontier modellar (`Claude Opus`, `Codex`, `Gemini`) orqali sekundiga o'nlab token tezlikda va `0 GB` lokal disk sarfi bilan bajariladi.
- **Agar haqiqatan 100% lokal (oflayn) kod yozuvchi model kerak bo'lsa:** Diskdan `1.8 TB` o'qiydigan `kimi-k3-in-c` o'rniga, `32–64 GB RAM` li Mac'ning Unified xotirasiga to'liq sig'adigan **`Ollama` yoki `MLX` dagi `Qwen3-Coder` / `Qwen2.5-Coder-14B/32B`** (`~9–20 GB`, **`30–65 token/s`**, SSD'ga zararsiz) ishlatish to'g'ri lokal alternativadir.

---

## 5. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-11-16 | C99 kodi, tezlik (`~24–33 s/token`), `Min`/`Tavsiya` temir talablari va lokal alternativa tahlili | `⚠️ Tavsiya etilmaydi` | `~1.8 TB` NVMe talabi va `1 token = ~30s` tezlik sabab amaliy kod yozish uchun rad etildi; oflayn lokal coder kerak bo'lsa RAM ichida ishlovchi `Ollama`/`MLX` (`Qwen3-Coder`) tavsiya etiladi. |
