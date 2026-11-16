# `MiniMax M3.1 Flash API` (`MiniMax API` / `OpenRouter`)

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/external-apis/minimax-m3-1-flash-api.md) | [🇷🇺 Русский](../ru/external-apis/minimax-m3-1-flash-api.md)

- **Manba:** [MiniMax Platform](https://www.minimax.io/) · [OpenRouter (`minimax/minimax-m3.1-flash`)](https://openrouter.ai/)
- **Turkum:** `Tashqi API'lar` *(Mahsulot backendi, botlar va multimodal avtomatizatsiya uchun arzon bulut LLM API)*
- **Turi:** `External Cloud API` *(`1M` kontekst, `matn + rasm + video`, OpenAI/Anthropic-mos REST API)*
- **Sifat bahosi:** **8.0 / 10** *(narx / tezlik / multimodal sifat nisbati bo'yicha)*
- **Bizga kerakliligi:** **5.0 / 10** *(kod yozish agentimiz uchun emas, balki mahsulot backendidagi ommaviy AI vazifalar uchun zaxira API)*
- **Tavsiya etilgan ko'lam:** `Faqat mahsulot backendida Pullik API (Zero-Data-Retention) sifatida`
- **Tekshirilgan sana:** `2026-11-16`
- **Joriy holati:** `👍 Yaxshi variant` *(`$0.15 / $0.60` narx va `170+ TPS` tezlik bilan katta oqimli bot, OCR/rasm/video tahlili va ofis avtomatizatsiyasida juda tejamkor taklif)*

---

## 1. Nima va qanday ishlaydi?

OpenRouter'da 10 kun davomida **`space-bunny`** nomi ostida `#1` o'rinni egallagan **`MiniMax M3.1 Flash`** modelining bulut API ko'rinishi (lokal kompyuterga sig'masligi sababli lokal versiyasi [Lokal modellar bo'limida rad etilgan](../local-models/minimax-m3-1-flash.md)).

**Asosiy texnik ko'rsatkichlari va narxi:**
- **Narxi (`1M` token uchun):** Input — **`$0.15`**, Output — **`$0.60`**, Cached Input — **`$0.015`** *(masalan, `Claude Opus 5.5` `$4 / $20` narxidan `~25–33 baravar` arzon)*.
- **Tezligi:** O'rtacha **`170–200+ token/soniya`** (`P50 = 170+ TPS`) — real vaqt chatlari va ko'p qadamli pipeline'larda javobni deyarli kuttirmaydi.
- **Kontekst va Multimodallik:** **`1,000,000` token** oyna; bir vaqtning o'zida **matn, rasm (`BabyVision: 91`) va video** qabul qiladi hamda `tool-calling` / `structured output` qo'llab-quvvatlaydi.

---

## 2. Qanchalik yaxshi va qanchalik yomon? (Qo'shimcha muhim ma'lumotlar)

### Kuchli tomonlari (Nega yaxshi taklif?)
- **Ommaviy servis va botlarda juda katta tejamkorlik:** Kuniga yuz minglab so'rov bo'ladigan mijozlarni qo'llab-quvvatlash botlari, tarjima, moderatsiya, chek/hujjat/rasm o'qish (`OCR`), qisqa video-kadr tasnifi va ofis SaaS integratsiyalarida (`Automation-Bench: 62.8%`, `BankerToolBench: 76.2%`) yuqori natija beradi.
- **Standart SDK mosligi:** Qo'shimcha kutubxona o'rnatmasdan, standart `OpenAI` yoki `Anthropic` SDK `baseURL` orqali ulab ketish mumkin (`Cached input $0.015` katta tizimli promptlarda xarajatlarni yana `10x` qisqartiradi).

### Zaif tomonlari va chegaralari (Qayerda adashmaslik kerak?)
- **Asosiy dasturlash agentlarida `Opus` / `Codex` o'rnini bosmaydi:** Videolarda *"Opus'dan kuchli"* deb maqtalsa ham, haqiqiy muhandislik va repozitoriy benchmarklarida (`Terminal-Bench 4.0: 38.1%` vs `Opus 5: 51.8%`, `NL2Repo: 61.2%` vs `Opus: 75.3%`) murakkab full-stack / mobil arxitekturada ko'proq xato qiladi. Uni `Claude Code` yoki `Codex` ichida asosiy dasturchi modeli qilib ulamaslik kerak.
- **Tashqi bulut yurisdiksiyasi:** Provayder xalqaro / Osiyo (`MiniMax` / `Nanonoble Pte. Ltd.`) serverlarida ishlaydi — foydalanuvchi shaxsiy ma'lumotlari (`PII`) mamlakat ichida qolishi qat'iy talab etiladigan loyihalarda buni oldindan hisobga olish zarur.

---

## 3. Xavfsizlik va "Tekin" Rejimlarda Ehtiyot Choralari

- **Xavf darajasi:** `Past–O'rta` *(pullik Zero-Retention API'da)* / **`Yuqori` *(`MiniMax Code` tekin kreditlari va `:free` endpointlarda)***
- **⚠️ "Tekin qilib ishlatishda" qat'iy ehtiyot bo'ling:**
  1. **`MiniMax Code` kunlik tekin kreditlari (`Daily check-in: 400 credits`) va OpenRouter `:free` endpointlariga yopiq ma'lumot bermang:** Bepul rejimlar va promo-chatlarda kiritilgan kodlar, foydalanuvchi ma'lumotlari va promptlar **loglanishi hamda modelni o'qitish (`training`) uchun ishlatilishi mumkin** (MiniMax'ning o'z shartlarida ham bepul/ommaviy demoga yopiq kod, sirlar va kalitlarni yubormaslik yozilgan).
  2. **Lokal `Claude Code` / CLI agentga tekin API ulamang:** Terminal agenti ishga tushganda lokal fayllar, git tarixi va loyiha strukturasini avtomatik o'qib API serverga uzatadi — bepul endpointda bu butun yopiq repozitoriyning tashqariga chiqib ketishini anglatadi.
- **Xavfsiz ulash qoidalari (ishlatilsa):**
  1. Faqat **pullik API kalit** orqali ulang; OpenRouter ishlatilsa akkaunt sozlamalarida **`Zero Data Retention` / `Do not allow providers to train on prompts`** rejimini majburiy yoqing.
  2. API'ga foydalanuvchi parollari, to'lov rekvizitlari, `.env` sirlari va tozalanmagan `PII` yubormang.

---

## 4. Bizga qanchalik kerak va mavjud vositalar bilan mosligi

- **Kod yozish va Review zanjirimizga tegmaydi:** Dasturlash, arxitektura va mustaqil code review uchun [**`T3 Code` + CLI Subagentlar**](../developer-tools/t3-code.md) (`Claude Opus 5.5`, `Codex`, `Gemini 4 Carbon / Argon`) o'zgarishsiz asosiy vosita bo'lib qoladi.
- **Mahsulot ichidagi AI funksiyalar uchun toza bo'shliqni to'ldiradi:** Agar biror web-app, mobil ilova yoki admin panel ichida arzon AI yordamchi, kontent/rasm moderatsiyasi, avto-kategoriyalash yoki katta matn/video tahlili kerak bo'lsa, qimmat frontier API o'rniga `$0.15/$0.60` narxda kuchli ishchi ot vazifasini bajaradi.

---

## 5. Qaysi yo'nalish va vazifalarda foydali?

- **Qachon ishlatish kerak:** Mahsulot backendidagi ommaviy chatbotlar, rasm/skrinshot/hujjat o'qish (`vision`), tarjima va xulosalash (`summarization`), test/sandbox avtomatizatsiyasi hamda `1M` kontekstli katta log/matn tahlilida (faqat pullik Zero-Retention API orqali).
- **Qachon ishlatmaslik kerak:** Asosiy dasturlash agentida murakkab kod yozdirishda, yopiq repozitoriylarni `MiniMax Code` bepul rejimiga ulashda va qat'iy lokal `PII` talabi bor ma'lumotlarda.

---

## 6. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh (ishlatildimi, qayerda sinab ko'rildi, nima tozalandi) |
|---|---|---|---|
| 2026-11-16 | Narx, tezlik (`170+ TPS`), multimodal benchmarklar va API maxfiylik shartlari auditi | `👍 Yaxshi variant` | Mahsulot backendi va botlar uchun tejamkor tashqi API sifatida katalogga qo'shildi (faqat pullik Zero-Retention API bilan ishlatish, bepul kredit rejimlariga yopiq kod bermaslik sharti bilan). |

