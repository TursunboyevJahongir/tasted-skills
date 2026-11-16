# `MiniMax-M3.1-Flash` — Lokal Ochiq Model (`428B` MoE / *Space Bunny*)

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/local-models/minimax-m3-1-flash.md) | [🇷🇺 Русский](../ru/local-models/minimax-m3-1-flash.md)

- **Manba:** [MiniMaxAI/MiniMax-M3.1-Flash (Hugging Face)](https://huggingface.co/MiniMaxAI/MiniMax-M3.1-Flash)
- **Turkum:** `Lokal modellar` *(Ochiq vaznli Multimodal MoE — lokal server / kompyuterda yoqish tahlili)*
- **Turi:** `Open-Weight LLM` *(`~428B` umumiy / `~23B` aktiv parametr, `MXFP8 + NVFP4`)*
- **Sifat bahosi:** **8.0 / 10** *(arzon multimodal `Flash` sinfidagi model sifatida)*
- **Bizga kerakliligi (Lokalda):** **1.0 / 10** *(ishchi kompyuterlarga sig'maydi; tashqi API sifatida esa — [`👍 Yaxshi variant`](../external-apis/minimax-m3-1-flash-api.md))*
- **Tavsiya etilgan ko'lam:** `O'rnatmaslik (Lokalda)` *(faqat [🔌 Tashqi API](../external-apis/minimax-m3-1-flash-api.md) sifatida ishlatish)*
- **Tekshirilgan sana:** `2026-11-16`
- **Joriy holati:** `⛔ Rad etildi` *(lokal yoqish uchun `~250–285 GB` vazn va normal tezlik uchun `640+ GB VRAM` data-center klaster talab qiladi)*

---

## 1. Nima va qanday ishlaydi? (Video reklamasi vs Asl haqiqat)

Ijtimoiy tarmoqlardagi videolarda OpenRouter'da 10 kun **`space-bunny`** laqabi ostida `#1` turgan model sifatida *"Claude Opus 5.5 va GPT-5.6 dan kuchli hamda ochiq kodli — har kim o'z serverida bepul yoqib oladi"* deb targ'ib qilinmoqda.

**Aslida ichida nima bor?**
- **Arxitekturasi:** `~428 milliard` umumiy parametrli (`har tokenda ~23B aktiv`), `1,000,000` token kontekstga ega native multimodal (`matn + rasm + video`) Mixture-of-Experts (`MoE`) modeli (`MiniMax Sparse Attention` + `DSpark` spekulyativ dekodlash bilan).
- **Nega HuggingFace'da `220B params` deb ko'rinadi?** Model `MXFP8` va `NVFP4` (4-bit/8-bit) siqilgan tensorlarda joylangani uchun HF safetensors hisoblagichi `220B` tensor ko'rsatadi, lekin diskdagi haqiqiy hajmi **`~250–285 GB`**.
- **Video reklamalaridagi hiylalar:**
  1. *"Opus 5.5 dan kuchli"* degan da'vo faqat bitta ofis SaaS benchmarkidan (**`Automation-Bench: 62.8%`** vs `Opus 5.5: 57%`) tanlab olingan. Haqiqiy murakkab dasturlash testlarida u `Opus` dan ancha orqada: **`Terminal-Bench 4.0` = `38.1%`** *(vs `Claude Opus 5`: `51.8%`)*, **`NL2Repo-Bench` = `61.2%`** *(vs `Opus`: `75.3%`)*.
  2. Videoda ko'rsatilgan *"qishloq `$0.66` ga tushdi"* degan chek (`Сборка пчелы`) aslida boshqa demo (`MECHANICAL BEE`) logidan kesib qo'yilgan B-roll.

---

## 2. Qanchalik yaxshi, qanchalik yomon va Kompyuter Resurs Talablari

### Kuchli tomonlari
- `~23B` aktiv parametr va Sparse Attention evaziga data-center GPU klasterida juda tez (`170–200+ TPS`) ishlaydi.
- `1M` kontekstda matn, rasm (`BabyVision: 91`) va video kirishlarni hamda brauzer/kompyuter boshqaruvini (`OSWorld V2: 61.7`) yaxshi bajaradi.

### Kompyuter va Server Resurs Talablari (`Min` vs `Yaxshi ishlashi uchun`)

| Ko'rsatkich | Minimal (Zo'rg'a lokalda ishga tushirish) | Yaxshi ishlashi uchun (`vLLM` / `SGLang`, `100–170+ tok/s` tezlik) |
|---|---|---|
| **GPU / VRAM** | **`0–24 GB`** *(CPU/SSD offload rejimida)* **yoki** **`Mac Studio M3/M4 Ultra 512 GB Unified RAM`** (`$9,000+` ish stansiyasi) | **`8× NVIDIA H100` (`80 GB`, jami `640 GB VRAM`)** yoki **`4× NVIDIA B200` (`180 GB`, jami `720 GB VRAM`, native `NVFP4`)** *(kamida `320–400+ GB` VRAM hovuzi shart; eski `A100` tavsiya etilmaydi)* |
| **CPU** | **`16–32 yadro`** (`Apple Ultra` yoki server `AVX-512` / `AVX2`) | **`64+ yadro`** (`AMD EPYC` / `Intel Xeon` server protsessorlari) |
| **RAM** | **`64–128 GB` RAM** *(disk offload bilan)* yoki **`≥ 320–512 GB` Unified RAM** *(xotiraga to'liq sig'ishi uchun)* | **`512 GB` DDR5 ECC RAM** |
| **SSD (Disk)** | **`≥ 350–500 GB` bo'sh tezkor NVMe** *(`~250–285 GB` model checkpoint + kesh)* | **`1–2 TB` PCIe Gen4/Gen5 Enterprise NVMe** |
| **Haqiqiy tezlik** | Disk offload'da **`~0.5 – 3 tok/s`** *(ishlab bo'lmaydi)*; `512 GB` Mac Studio'da **`~12 – 25 tok/s`** | **`100 – 200+ token / soniya`** *(to'liq multimodal va `256K+` kontekst bilan)* |

### Zaif tomonlari va xarajati
- Oddiy `16 GB – 64 GB RAM` li MacBook Pro yoki GPU'li dasturchi kompyuterlariga (`24–32 GB VRAM` RTX 4090/5090) **umuman sig'maydi** (`10x` ko'p VRAM kerak).
- Murakkab ko'p-faylli kod bazasi va terminal agentlik ishlarida (`Terminal-Bench 38.1%`) asosiy frontier modellarimiz (`Claude Opus 5.5`, `Codex`, `Argon`) darajasiga yetmaydi.

---

## 3. Xavfsizlik, Lokal Ishlatish va "Tekin" Ishlatishdagi Xavflar

- **Xavf darajasi:** **`Yuqori` *(Lokal disk/swap yemirilishi, `custom_code` RCE va "tekin" rejimda maxfiy kod chiqib ketishi bo'yicha)***
- **1. Lokal ishlatishdagi jiddiy xavflar:**
  - **SSD emirilishi va tizim qotishi:** `~250–285 GB` og'irlikdagi modelni `32–64 GB RAM` kompyuterda `mmap` / disk-offload / swap orqali majburlab yoqish NVMe SSD'dan har soniyada o'nlab gigabayt o'qishga, kuchli qizishga va lehimlangan MacBook SSD umrining (`TBW`) tez tugashiga olib keladi.
  - **`custom_code` (`trust_remote_code=True`) xavfi:** Model yangi `minimax_m3` arxitekturasida bo'lgani uchun yuklashda tashqi Python kodlarini bajarishni so'raydi — norasmiy fork yoki uchinchi tomon kvantlangan repolaridan tortish kompyuterda zararli kod ishlashiga (`RCE`) yo'l ochadi.
  - **Litsenziya tuzog'i (`MiniMax Community License`):** MIT yoki Apache-2.0 emas! Tijoriy mahsulotda ishlatsangiz sayt yoki ilova interfeysida ko'rinadigan qilib *"Built with MiniMax M3.1-Flash"* deb yozish va MiniMax'ga rasmiy bildirishnoma yuborish shart (`$20M+` yillik daromadda alohida yozma ruxsatnoma kerak).
- **2. ⚠️ "Tekin qilib ishlatishda" ehtiyot bo'lish kerak (`MiniMax Code` kunlik kreditlari va `:free` API'lar):**
  - **Yopiq manba kodi va `.env` sirlar o'qitishga (`training`) ketib qoladi:** Videoda reklama qilingan `MiniMax Code` veb-agentidagi bepul kreditlar (*Daily check-in: 400 credits*) va OpenRouter `:free` / stealth rejimlarida kiritilgan promptlar va fayllar **loglanishi hamda model o'qitishda ishlatilishi mumkin** (MiniMax ommaviy shartlarida ham bepul/demo muhitga yopiq kod, parol va maxfiy kalitlarni kiritmaslik alohida ogohlantirilgan).
  - **`Claude Code` ga tekin endpoint ulash xavfi:** Agar lokal `Claude Code` yoki boshqa terminal agentiga `ANTHROPIC_BASE_URL` orqali tekin/uchinchi tomon `M3.1-Flash` serverini ulasangiz, agent avtomatik ravishda **butun repozitoriy fayllari, git tarixi va muhit ma'lumotlarini o'qib o'sha tashqi serverga jo'natadi**.

---

## 4. Bizga qanchalik kerak va mavjud vositalar bilan mosligi

- **Lokal kodlash modeli sifatida — kerak emas (`⛔ Rad etildi`):**
  - Kundalik dasturlash va mustaqil Cross-AI tekshiruv uchun bizda [**`T3 Code` + CLI Subagentlar**](../developer-tools/t3-code.md) (`Claude Opus 5.5`, `Codex`, `Gemini 4 Carbon / Argon`) `0 GB` disk sarfi bilan ancha kuchli va xavfsiz ishlayapti.
  - Agar `32 GB RAM` MacBook'da 100% oflayn va xavfsiz lokal model kerak bo'lsa, xotiraga to'liq sig'adigan **`Ollama` / `MLX` (`Qwen2.5-Coder-14B` yoki `Qwen3-Coder`, `~9–18 GB`, `30–65 tok/s`, Apache-2.0)** to'g'ri tanlovdir.
- **Tashqi API sifatida — foydali (`👍 Yaxshi variant`):** Modelni o'z kompyuteringizga o'rnatmasdan, mahsulot backendidagi ommaviy bot va multimodal vazifalar uchun pullik API orqali ishlatish tafsilotlari alohida sharhda: [**`MiniMax M3.1 Flash API`**](../external-apis/minimax-m3-1-flash-api.md).

---

## 5. Qaysi yo'nalish va vazifalarda foydali?

- **Qachon lokalda ishlatish kerak:** Faqat kompaniyaning shaxsiy `8× H100` / `4× B200` (`640+ GB VRAM`) GPU klasteri bo'lib, ma'lumotlarni ichki tarmoqdan chiqarmaslik talab qilingan korporativ holatlarda (`MiniMax Community License` shartlariga rioya qilgan holda).
- **Qachon ishlatmaslik kerak:** Barcha dasturchi noutbuklari va oddiy single-GPU kompyuterlarda, shuningdek yopiq loyihalarni `MiniMax Code` tekin veb-chatiga yoki `:free` proxy'larga ulashda.

---

## 6. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh (ishlatildimi, qayerda sinab ko'rildi, nima tozalandi) |
|---|---|---|---|
| 2026-11-16 | Video demo (`@aleko.so`), HuggingFace model kartasi, `vLLM` klaster talablari va maxfiylik/litsenziya auditi | `⛔ Rad etildi` | Lokalda `~250–285 GB` vazn va yaxshi ishlashi uchun `8× H100` (`640 GB VRAM`) talab qilgani hamda tekin rejimlarida maxfiylik xavfi borligi uchun lokal model sifatida rad etildi; arzon bulut varianti sifatida [Tashqi API'lar](../external-apis/minimax-m3-1-flash-api.md) bo'limiga kiritildi. |

