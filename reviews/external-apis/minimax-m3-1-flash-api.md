# `MiniMax M3.1 Flash API` (`MiniMax API` / `OpenRouter`)

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/external-apis/minimax-m3-1-flash-api.md) | [🇷🇺 Русский](../ru/external-apis/minimax-m3-1-flash-api.md)

- **Manba:** [MiniMax Platform](https://www.minimax.io/) · [OpenRouter (minimax/minimax-m3.1-flash)](https://openrouter.ai/minimax/minimax-m3.1-flash)
- **Statistika va Benchmarklar:** [OpenRouter Live Stats & Throughput](https://openrouter.ai/minimax/minimax-m3.1-flash) · [Hugging Face Benchmarks](https://huggingface.co/MiniMaxAI/MiniMax-M3.1-Flash) · [Artificial Analysis Leaderboard](https://artificialanalysis.ai/leaderboards/models)
- **Turkum:** `Tashqi API'lar` *(Mahsulot backendi, botlar va multimodal avtomatizatsiya uchun arzon bulut LLM API)*
- **Turi:** `External Cloud API` *(`1M` kontekst, `matn + rasm + video`, OpenAI/Anthropic-mos REST API)*
- **Sifat bahosi:** **8.0 / 10** *(narx / tezlik / multimodal sifat nisbati bo'yicha)*
- **Ishda kerak bo'lishi:** **5.0 / 10** *(mahsulot backendidagi ommaviy AI funksiyalar uchun tejamkor API)*
- **Tavsiya etilgan ko'lam:** `Mahsulot backendida Pullik API (Zero-Data-Retention) sifatida`
- **Tekshirilgan sana:** `2026-11-16`
- **Joriy holati:** `👍 Yaxshi variant` *(`$0.15 / $0.60` narx va `170+ tok/s` tezlik bilan ommaviy bot, OCR/rasm/video tahlili va SaaS avtomatizatsiyasi uchun qulay)*

---

## 1. Nimaga mo'ljallangan va nima ish qila oladi? (Asosiy yo'nalishi)

> [!IMPORTANT]
> **Oddiy tilda (Asosiy vazifasi va foydasi):** O'z mahsulotingiz backendida mijozlar uchun ommaviy chatbot, tarjima, rasm/hujjat o'qish (`OCR`) va video tahlil qilish kerak bo'lganda juda arzon (`$0.15 / $0.60`, keshda `$0.015`) va tez (`170+ tok/s`, `1M` kontekst) ishlaydigan tayyor API *(faqat pullik Zero-Retention kalit ishlating; tekin `:free` ga maxfiy kod bermang)*.

**`MiniMax M3.1 Flash API`** — mahsulotlar ichida (web-app, mobil ilova yoki admin panel backendida) katta oqimli so'rovlarni **juda arzon va yuqori tezlikda** qayta ishlashga mo'ljallangan multimodal (`matn + rasm + video`) bulut API.

**Qo'lidan keladigan asosiy ishlar:**
1. **Ommaviy mijoz botlari va tarjima:** `170–200+ token/s` tezlikda kuttirmasdan javob berish va matnlarni xulosalash.
2. **Rasm, hujjat (`OCR`) va video tahlili:** Chek, skrinshot, pasport/hujjat yoki qisqa videolarni o'qib, tayyor `JSON` (`structured output`) qaytarish (`BabyVision: 91`).
3. **Ofis va SaaS avtomatizatsiyasi:** Jadval, CRM va veb-formalarni avtomatik to'ldirish hamda ko'p qadamli `tool-calling` (`Automation-Bench: 62.8%`, `BankerToolBench: 76.2%`).
4. **Katta kontekst (`1,000,000` token):** Uzun loglar yoki katta hujjatlarni bo'laklamasdan bitta so'rovda tahlil qilish.

---

## 2. Kod yozishga ishlaydimi?

- **Oddiy skript va yordamchi avtomatizatsiyaga — Ha; murakkab loyiha arxitekturasiga — Yo'q:**
  - Bir faylli skriptlar, oddiy UI prototiplar, regex/SQL tuzish va ma'lumot konvertatsiya qilishda yaxshi ishlaydi.
  - **Asosiy dasturlash agentida (`Claude Code`, `Codex`) `Opus` yoki `Codex` o'rnini bosa olmaydi:** Real muhandislik testlarida **`Terminal-Bench 4.0` = `38.1%`** *(vs `Claude Opus 5`: `51.8%`)* va **`NL2Repo-Bench` = `61.2%`** *(vs `Opus`: `75.3%`)* — ko'p faylli murakkab kod bazasida ko'proq xato qiladi.

---

## 3. Narx, Tezlik va Xavfsizlik

| Ko'rsatkich | Qiymati |
|---|---|
| **Input narxi** | **`$0.15 / 1M token`** *(Cached Input: **`$0.015 / 1M`**)* |
| **Output narxi** | **`$0.60 / 1M token`** *(frontier `$4/$20` modellardan `~25–33x` arzon)* |
| **Tezlik (`Throughput`)** | **`170 – 200+ token / soniya`** |
| **Kontekst oynasi** | **`1,000,000 token`** (`matn + rasm + video`) |
| **Integratsiya** | Standart `OpenAI` yoki `Anthropic` SDK (`baseURL` orqali) |

> ⚠️ **Xavfsizlik eslatmasi:** Yopiq loyiha kodi yoki mijoz ma'lumotlarini `MiniMax Code` kunlik tekin kreditlariga yoki `:free` endpointlarga yubormang (ular o'qitish uchun loglanadi). Faqat **pullik `Zero-Data-Retention` API kalit** ishlating.

---

## 4. Bizga qanchalik kerak?

- **Mahsulot backendi uchun — foydali (`5.0/10`, `👍 Yaxshi variant`):** Ilovalarimiz ichida ommaviy AI chat, rasm/chek o'qish (`OCR`), moderatsiya yoki tarjima kerak bo'lganda qimmat API'lar o'rniga xarajatlarni `25–30 baravar` qisqartiradi.
- **Kod yozish uchun — kerak emas:** Dasturlashda o'zimizning asosiy frontier modellarimiz (`Claude Opus`, `Codex`, `Gemini`) ishlatiladi.

---

## 5. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-11-16 | Yo'nalishi, coding ko'rsatkichi (`Terminal-Bench 38.1%`), narxi (`$0.15/$0.60`) va statistika linklari tahlili | `👍 Yaxshi variant` | Mahsulot backendidagi ommaviy bot, OCR/vision va avtomatizatsiya vazifalari uchun tejamkor bulut API sifatida katalogga kiritildi. |
