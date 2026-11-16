# `kimi-k3-in-c` (2.78T MoE CPU Disk-Streaming Engine)

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/local-models/kimi-k3-in-c.md) | [🇷🇺 Русский](../ru/local-models/kimi-k3-in-c.md)

- **Manba:** [FareedKhan-dev/kimi-k3-in-c](https://github.com/FareedKhan-dev/kimi-k3-in-c)
- **Turkum:** `Lokal modellar` *(Lokal LLM Inference va Disk-Streaming Eksperimenti)*
- **Turi:** `Standalone C99 CLI Engine`
- **Sifat bahosi:** **8.5 / 10** *(tizimli C99 muhandislik ishi sifatida)*
- **Bizga kerakliligi:** **1.0 / 10** *(amaliy kod yozish uchun yaroqsiz)*
- **Tavsiya etilgan ko'lam:** `O'rnatmaslik`
- **Tekshirilgan sana:** `2026-11-16`
- **Joriy holati:** `⛔ Rad etildi` *(~1.8 TB NVMe disk talabi, 1 token uchun ~24–33 soniya tezlik va SSD umrini yeydigan ulkan o'qish yuklamasi sabab amaliy dasturlashda ishlatib bo'lmaydi)*

---

## 1. Nima va qanday ishlaydi?

Ijtimoiy tarmoqlarda *"2.78 trillion parametrli modelni 8 GB RAM'da GPU'siz ishlatish"* sifatida targ'ib qilinayotgan loyiha — aslida **AI coding skill yoki dasturchi agenti emas**, balki **portable C99** tilida yozilgan minimal LLM inference dvigateli (`~176 KB` kompilatsiya qilingan binar fayl; `OpenMP` + `AVX2`/`NEON` + `O_DIRECT`).

**Asosiy mexanizmi:**
- `Kimi K3` (`2.78T` umumiy / `~104B` aktiv parametrli Mixture-of-Experts modeli, `1M` kontekst) `MXFP4` siqilgan holatda ham **`1.56 TB`** joy oladi (odatiy FP16 da `5+ TB` xotira talab qiladi).
- Ushbu dvigatel har bir token uchun `896` ta ekspertdan faqat **`16` ta faol ekspertni** (`MXFP4` 4-bit ko'rinishda) bevosita NVMe diskdan o'qib oladi.
- Qolgan **`109 GB`** li doimiy zich magistral qism (`93` qatlamli dense trunk) xotirada to'liq ushlanmasdan, qatlamma-qatlam diskdan oqim (`stream`) qilib o'tkaziladi — shu sababli `PEAK RSS` `8.24 GB` atrofida qoladi.
- Repoda `src/` (`core`, `io`, `cache`, `model`, `chat`, `cli`, `tokenizer`) hamda `tools/` va `scripts/` papkalari mavjud; hech qanday `.claude`, `.codex` yoki `SKILL.md` qatlami yo'q.

---

## 2. Qanchalik yaxshi, qanchalik yomon va Kompyuter Resurs Talablari

### Kuchli tomonlari
- **Toza va nol-bog'liqlikli C99 muhandisligi:** Tashqi ML framework (`PyTorch`, `llama.cpp`) va BLAS kutubxonalarisiz yozilgan.
- **Baytma-bayt aniqlik (`Byte-identical`):** `8 GB` RAM rejimidan `224 GB` RAM rejimgacha bir xil promptga bir xil yakuniy matn chiqaradi — qo'shimcha RAM faqat disk kutishini kamaytiradi.
- **Modelsiz matematik tekshiruv (`make test`):** `~45 MB` repodagi test fixture'lar orqali 1 daqiqa ichida PyTorch etaloni bilan 3 bosqichli (`teacher forcing`, `greedy decode`, `incremental KV + KDA`) aniq moslikni tekshira oladi.

### Kompyuter va Server Resurs Talablari (`Min` vs `Yaxshi ishlashi uchun`)

| Ko'rsatkich | Minimal (`kimi-k3-in-c` disk-stream rejimida zo'rg'a yoqish) | Yaxshi ishlashi uchun (`vLLM` / `SGLang` da normal `30–60+ tok/s` tezlik) |
|---|---|---|
| **GPU / VRAM** | **`0 GB`** *(GPU shart emas, 100% CPU'da ishlaydi)* | **`16× NVIDIA H200` (`141 GB`, jami `~2.25 TB VRAM`, 2 node NVLink)** yoki **`8× NVIDIA B300` (`288 GB`, jami `~2.30 TB VRAM`)** *(1M to'liq kontekst uchun `32× H200`)* |
| **CPU** | **`16+ yadro`** (`AVX2` Linux x86_64 yoki `NEON`; testlar `124` yadroli EPYC'da olingan) | **`64–128 yadro`** (`AMD EPYC` / `Intel Xeon` data-center protsessorlari) |
| **RAM** | **`8–16 GB` bo'sh RAM** *(`128–224 GB RAM` bo'lsa `109 GB` trunk xotiraga sig'adi, lekin baribir sekin)* | **`512 GB – 1 TB` DDR5 ECC RAM** |
| **SSD (Disk)** | **`≥ 1.8 TB` bo'sh tezkor PCIe Gen4/Gen5 NVMe** *(`1.56 TB` model + `109 GB` packed trunk; `7+ GB/s` o'qish)* | **`4 TB` Enterprise Gen5 NVMe** *(yuqori `DWPD`/`TBW` chidamlilikka ega server diski)* |
| **Haqiqiy tezlik** | **`~24.2 – 32.7 soniya / 1 token`** (`500` token kod = **`~3.5–4 soat`**) | **`~30 – 60+ token / soniya`** *(real vaqtda kod yozish darajasi)* |

### Zaif tomonlari va xarajati
- **Standart noutbuklarga sig'maydi va falokatli sekin:** `512 GB – 1 TB` SSD'li dasturchi noutbuklariga umuman joylashmaydi; `124` yadroli serverda ham `def fibonacci(n):` (`28` token) yozishga `128 GB RAM` da **`~5 daqiqa` (`299.3s`)** ketgan.
- **Agentlik va IDE integratsiyasi yo'q:** Fayl o'qish/tahrirlash, terminal buyruqlarini ishga tushirish yoki ko'p-agentli code review zanjiriga ulanish imkoniyatiga ega emas; `scripts/k3-doctor.sh` faqat Linux uchun yozilgan.

---

## 3. Xavfsizlik, Lokal Ishlatish va "Tekin" Ishlatishdagi Xavflar

- **Xavf darajasi:** `Past` *(C99 manba kodi tozaligi bo'yicha)* / **`Yuqori` *(Lokal temir/SSD yemirilishi va "tekin" ulash xavflari bo'yicha)***
- **1. Lokal ishlatishdagi jiddiy xavflar (Hardware / SSD o'limi):**
  - **NVMe SSD umrini (`TBW`) yeb bitiradi:** Har bitta token generatsiyasida diskdan `O_DIRECT` orqali `~100+ GB` ma'lumot uzluksiz o'qiladi — bitta `500` tokenlik kod javobi SSD'dan **`~50+ TB` o'qish** qiladi. MacBook kabi SSD'si anakartga lehimlangan noutbuklarda bunday oqimli o'qish va kuchli qizish (`thermal throttling`) disk va kontroller resursini qisqa vaqtda ishdan chiqarishi mumkin.
  - **Tizim qotib qolishi va `OOM`:** Disk I/O kanali 100% band bo'lib, kompyuterdagi boshqa dasturlar (IDE, brauzer, Docker) javob bermay qoladi.
  - **Begona konvertatsiya va skriptlar xavfi:** Norasmiy repolardan `1.5 TB` lik tayyor konvertatsiya qilingan model yoki Python yuklagichlarni (`trust_remote_code=True`, `pickle`) tortganda zararli kod ishlashi xavfi bor.
- **2. ⚠️ "Tekin qilib ishlatishda" ehtiyot bo'lish kerak (Free API / Proxy xavfi):**
  - Model lokalda juda sekin bo'lgani uchun ko'pchilik uni OpenRouter `:free` yoki noma'lum bepul uchinchi tomon proxy'lari orqali `Claude Code` / IDE'ga ulashga urinadi.
  - **Tekin endpointlarga yopiq loyiha kodini ulamang:** Bepul provayderlar yuborilgan barcha promptlar, tijoriy manba kodlari, `.env` kalitlar va ichki biznes mantiqni **loglaydi hamda kelgusi modellarni o'qitish (`training`) uchun saqlab oladi**.

---

## 4. Bizga qanchalik kerak va mavjud vositalar bilan mosligi

- **Amaliy kod yozish va Cross-AI review uchun umuman mos emas:**
  - Bizning asosiy *"biri kod yozsin, boshqa model (`Claude` / `Codex` / `Argon`) mustaqil tekshirsin"* ish oqimimiz uchun allaqachon [**`T3 Code` + CLI Subagent ko'prigi**](../developer-tools/t3-code.md) (`argon`, `antigravity-claude`, `antigravity-consult`, `task-context`) qo'shimcha disk va CPU yuklamasisiz soniyalar ichida ishlayapti.
  - Agar `32 GB` RAM'li Apple Silicon kompyuterda haqiqatan xavfsiz, 100% lokal va bepul kod yozuvchi model kerak bo'lsa, diskdan `1.7 TB` stream qilish o'rniga to'liq Unified RAM/GPU ichiga sig'adigan **`Ollama` / `MLX` (`Qwen2.5-Coder-14B` yoki `Qwen3-Coder`, `~9–18 GB`, sekundiga `30–65 token`)** `1000x` tezroq va SSD'ga zararsiz alternativa bo'ladi.

---

## 5. Qaysi yo'nalish va vazifalarda foydali?

- **Qachon ishlatish kerak:** Faqat C99 tilida MoE modelini diskdan stream qilib inference qilish mexanizmini o'rganish uchun (modelsiz `make test` bilan o'quv maqsadida).
- **Qachon ishlatmaslik kerak:** Real dasturlash, kod yozish, refactoring, chatbot, code review va `2 TB` dan kichik SSD'li yoki SSD'si almashtirilmaydigan barcha ishchi kompyuterlarda.

---

## 6. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh (ishlatildimi, qayerda sinab ko'rildi, nima tozalandi) |
|---|---|---|---|
| 2026-11-16 | Video demo, GitHub kodi (`src/`, `scripts/`), `Min`/`Tavsiya` temir talablari va lokal/tekin ishlatish xavflari auditi | `⛔ Rad etildi` | `Min` rejimda `~1.8 TB` NVMe + `~24–33 s/token` + `~50 TB` SSD o'qish, yaxshi ishlashi uchun esa `16× H200` (`~2.25 TB VRAM`) klaster talab qilgani sabab rad etildi. Multi-agent ish oqimi uchun `T3 Code` + CLI subagentlar ishlatiladi. |
