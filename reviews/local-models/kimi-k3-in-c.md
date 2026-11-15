# `kimi-k3-in-c` (2.78T MoE CPU Disk-Streaming Engine)

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/local-models/kimi-k3-in-c.md) | [🇷🇺 Русский](../ru/local-models/kimi-k3-in-c.md)

- **Manba:** [FareedKhan-dev/kimi-k3-in-c](https://github.com/FareedKhan-dev/kimi-k3-in-c)
- **Turkum:** `Lokal modellar` *(Lokal LLM Inference va Disk-Streaming Eksperimenti)*
- **Turi:** `Standalone C99 CLI Engine`
- **Sifat bahosi:** **8.5 / 10** *(tizimli C99 muhandislik ishi sifatida)*
- **Bizga kerakliligi:** **1.0 / 10** *(amaliy kod yozish uchun yaroqsiz)*
- **Tavsiya etilgan ko'lam:** `O'rnatmaslik`
- **Tekshirilgan sana:** `2026-11-16`
- **Joriy holati:** `⛔ Rad etildi` *(~1.7 TB disk talabi, 1 token uchun ~24–33 soniya tezlik va SSD'ga ulkan o'qish yuklamasi sabab amaliy dasturlashda ishlatib bo'lmaydi)*

---

## 1. Nima va qanday ishlaydi?

Ijtimoiy tarmoqlarda *"2.78 trillion parametrli modelni 8 GB RAM'da GPU'siz ishlatish"* sifatida targ'ib qilinayotgan loyiha — aslida **AI coding skill yoki dasturchi agenti emas**, balki **portable C99** tilida yozilgan minimal LLM inference dvigateli (`~176 KB` kompilatsiya qilingan binar fayl; `OpenMP` + `AVX2`/`NEON` + `O_DIRECT`).

**Asosiy mexanizmi:**
- `Kimi K3` (2.78T parametrli Mixture-of-Experts modeli) odatiy usulda yuklansa `5+ TB` operativ xotira talab qiladi.
- Ushbu dvigatel har bir token uchun `896` ta ekspertdan faqat **`16` ta faol ekspertni** (`MXFP4` 4-bit ko'rinishda) bevosita NVMe diskdan o'qib oladi.
- Qolgan **`109 GB`** li doimiy zich magistral qism (`93` qatlamli dense trunk) xotirada to'liq ushlanmasdan, qatlamma-qatlam diskdan oqim (`stream`) qilib o'tkaziladi — shu sababli `PEAK RSS` `8.24 GB` atrofida qoladi.
- Repoda `src/` (`core`, `io`, `cache`, `model`, `chat`, `cli`, `tokenizer`) hamda `tools/` va `scripts/` papkalari mavjud; hech qanday `.claude`, `.codex` yoki `SKILL.md` qatlami yo'q.

---

## 2. Qanchalik yaxshi va qanchalik yomon?

### Kuchli tomonlari
- **Toza va nol-bog'liqlikli C99 muhandisligi:** Tashqi ML framework (`PyTorch`, `llama.cpp`) va BLAS kutubxonalarisiz yozilgan.
- **Baytma-bayt aniqlik (`Byte-identical`):** `8 GB` RAM rejimidan `224 GB` RAM rejimgacha bir xil promptga bir xil yakuniy matn chiqaradi — qo'shimcha RAM faqat tezlikni oshiradi.
- **Modelsiz matematik tekshiruv (`make test`):** `~45 MB` repodagi test fixture'lar orqali 1 daqiqa ichida PyTorch etaloni bilan 3 bosqichli (`teacher forcing`, `greedy decode`, `incremental KV + KDA`) aniq moslikni tekshira oladi.

### Zaif tomonlari va xarajati (disk / tezlik / resurs)
- **`~1.7 TB` bo'sh NVMe disk talabi:** `1.56 TB` model checkpoint + `109 GB` packed trunk fayllari standart `512 GB – 1 TB` dasturchi noutbuklariga umuman sig'maydi (alohida `2 TB` tezkor NVMe kerak).
- **Amaliy kod yozish uchun falokatli sekinlik (`24.2 – 32.7 s/token`):** Hatto `124` yadroli AMD EPYC serverda `8–32 GB RAM` rejimida **1 ta token chiqarishga yarim daqiqa** ketadi:
  - `"The capital of France is"` (`8` token) = **`4 daqiqa 21 soniya`**;
  - `def fibonacci(n):` (`28` tokenli oddiy 4 qatorli funksiya) hatto **`128 GB RAM`** da ham **`299.3 soniya` (~5 daqiqa)** vaqt olgan;
  - Oddiy 30–40 qatorli kod (`~500 token`) yozish uchun **~3.5–4 soat** kutishga to'g'ri keladi.
- **SSD resursini yeyishi:** Har bir token generatsiyasida diskdan `~100+ GB` ma'lumot uzluksiz o'qiladi — bitta `500` tokenlik kod javobi NVMe SSD'dan **`~50+ TB` o'qish** qiladi (disk qiziydi va resursi tez eskiradi).
- **Agentlik va IDE integratsiyasi yo'q:** Fayl o'qish/tahrirlash, terminal buyruqlarini ishga tushirish yoki ko'p-agentli code review zanjiriga ulanish imkoniyatiga ega emas; shuningdek `scripts/k3-doctor.sh` kabi yordamchi skriptlar faqat Linux'ga mo'ljallangan.

---

## 3. Xavfsizlik va O'rnatishdan oldin tozalash (Sanitarizatsiya)

- **Xavf darajasi:** `Past` *(kod xavfsizligi bo'yicha)* / `Yuqori` *(SSD disk resursi va bo'sh joy sarfi bo'yicha)*
- **Tekshirilgan nuqtalar:**
  - `src/` va `scripts/` ichida yashirin telemetriya, tashqi tracking yoki AI agent hooklari (`Stop`, `PreToolUse`, `SessionStart`) topilmadi.
  - `make test` komandasi internetsiz va modelsiz lokal fixture'lar ustida xavfsiz ishlaydi.
  - `scripts/k3-doctor.sh` `/proc/meminfo` va `O_DIRECT` ga tayangan Linux-only tekshiruv skripti (`macOS` da to'g'ridan-to'g'ri chiqib ketadi).
- **Majburiy qaror:**
  1. Kundalik ishchi kompyuterga **o'rnatmaslik va `1.56 TB` modelni yuklamaslik**.

---

## 4. Bizga qanchalik kerak va mavjud vositalar bilan mosligi

- **Amaliy kod yozish va Cross-AI review uchun umuman mos emas:**
  - Bizning asosiy *"biri kod yozsin, boshqa model (`Claude` / `Codex` / `Argon`) mustaqil tekshirsin"* ish oqimimiz uchun allaqachon [**`T3 Code` + CLI Subagent ko'prigi**](../developer-tools/t3-code.md) (`argon`, `antigravity-claude`, `antigravity-consult`, `task-context`) qo'shimcha disk va CPU yuklamasisiz soniyalar ichida ishlayapti.
  - Agar `32 GB` RAM'li Apple Silicon kompyuterda 100% lokal va bepul kod yozuvchi model sinash kerak bo'lsa, diskdan `1.7 TB` stream qilish o'rniga to'liq RAM/GPU ichiga sig'adigan **`Ollama` / `MLX` (`Qwen2.5-Coder-14B` yoki `Qwen3-Coder`, `~9–18 GB`, sekundiga `30–65 token`)** `1000x` tezroq va xavfsizroq alternativa bo'ladi.

---

## 5. Qaysi yo'nalish va vazifalarda foydali?

- **Qachon ishlatish kerak:** Faqat C99 tilida MoE modelini diskdan stream qilib inference qilish mexanizmini o'rganish uchun (modelsiz `make test` bilan o'quv maqsadida).
- **Qachon ishlatmaslik kerak:** Real dasturlash, kod yozish, refactoring, chatbot, code review va `2 TB` dan kichik SSD'li barcha ishchi mashinalarda.

---

## 6. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh (ishlatildimi, qayerda sinab ko'rildi, nima tozalandi) |
|---|---|---|---|
| 2026-11-16 | Video demo, GitHub manba kodi (`src/`, `scripts/`) va kompyuter resurslari tahlili | `⛔ Rad etildi` | `~1.7 TB` NVMe disk talabi, `~24–33 s/token` tezlik (500 token = ~3.5 soat) va SSD'ga ulkan o'qish yuklamasi sabab amaliy kod yozish uchun rad etildi. Multi-agent ish oqimi uchun `T3 Code` + CLI subagentlar ishlatiladi. |
