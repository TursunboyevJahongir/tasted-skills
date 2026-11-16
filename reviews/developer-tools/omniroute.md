# `OmniRoute` (AI Gateway + 44 Admin Skills)

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/developer-tools/omniroute.md) | [🇷🇺 Русский](../ru/developer-tools/omniroute.md)

- **Manba:** [cheaper-inference/OmniRoute](https://github.com/cheaper-inference/OmniRoute)
- **Turkum:** `Developer Tools` *(Lokal LLM Reverse-Proxy, API Kalitlar Rotatsiyasi va Prompt Kompressiyasi)*
- **Turi:** `Local Proxy Server + MCP + 44 Generated Skills`
- **Sifat bahosi:** **7.5 / 10**
- **Bizga kerakliligi:** **2.0 / 10**
- **Tavsiya etilgan ko'lam:** `O'rnatmaslik`
- **Tekshirilgan sana:** `2026-11-16`
- **Joriy holati:** `⛔ Rad etildi` *(rasmiy muhitlar, `Orca` va `ponytail` ishlatilgani hamda ToS/sessiya xavflari sabab o'rnatilmadi)*

---

## 1. Nima va qanday ishlaydi?

> [!IMPORTANT]
> **Oddiy tilda (Asosiy vazifasi va foydasi):** Pullik AI obunalarini bitta lokal proxy orqali aylantirishga urinadi, lekin amalda uzoq kod yozish sessiyalarini uzib qo'yadi (`#7287`), limit tugaganda yashirincha kuchsiz modelga tushirib kodni buzadi va akkaunt ban (`ToS`) xavfini tug'diradi. O'rniga xavfsiz `Orca` ishlatiladi.

Ko'pchilik `OmniRoute` ni kod yozish sifatini oshiradigan skill deb o'ylaydi, lekin kod bazasini (`v3.8.54`) tekshirganda u ikki qismdan iborat ekani aniqlandi:

1. **Lokal AI Reverse-Proxy (`http://localhost:20128/v1`):** Next.js standalone, SQLite (`better-sqlite3` / `sql.js`) va Electron ustiga qurilgan shlyuz. `Claude Code`, `Codex`, `Cursor` yoki `Cline` dagi `BASE_URL` ni o'ziga ulab oladi, 375+ provayder va bir nechta akkaunt/API kalit o'rtasida so'rovlarni aylantiradi (`auto-fallback`) hamda prompt va terminal javoblarini qisqartiradi (`RTK + Caveman compression`).
2. **Ichidagi 44 ta `SKILL.md` (`skills/omni-*` va `skills/cli-*`):** `src/lib/agentSkills/generator.ts` orqali avto-generatsiya qilingan REST API va CLI qo'llanmalar (`omni-auth`, `omni-providers`, `omni-combos-routing`, `cli-serve`, `config-codex-cli` va h.k.). Ular dasturlash, arxitektura yoki UI ko'nikmalari **emas** — faqat ishlab turgan `OmniRoute` serverining o'zini sozlash uchun xizmat qiladi *(repodagi yagona haqiqiy kodlash skilli — nusxa olingan `ponytail`)*.

---

## 2. Qanchalik yaxshi va qanchalik yomon?

### Kuchli tomonlari
- O'nlab arzon yoki bepul API kalitlar (`OpenRouter`, `Groq`, `DeepSeek`, `Kimi`) bilan `Cline` / `OpenCode` ishlatadigan dasturchilar uchun yagona OpenAI-mos endpoint, circuit-breaker va xarajat hisobini beradi.
- MCP (`SSE/stdio/HTTP`) va A2A protokollari orqali o'z holatini monitoring qilish imkoni bor.

### Zaif tomonlari va xarajati (kontekst / sifat / sessiya uzilishi)
- **Uzoq sessiyalar va prompt-cache buzilishi (`issue #7287`):** `skills/config-codex-cli/SKILL.md` hujjatining o'zida tan olinganidek, default holatda `sessionAffinityTtlMs = 0` — har bir turn boshqa akkaunt yoki provayderga tushib prompt-cache va kontekst davomiyligini uzadi; `STREAM_IDLE_TIMEOUT_MS = 600000` (10 daqiqa) esa chuqur o'ylaydigan (`high reasoning`) vazifalarni `StreamIdleTimeoutError` bilan majburan uzib qo'yadi.
- **Yashirin model pasayishi (`Silent Quality Downgrade`):** 4 bosqichli `auto-fallback` (`Subscription -> API -> Cheap -> Free`) murakkab arxitektura yoki backend ishi o'rtasida limit tugasa, so'rovni sezdirmasdan kuchsiz/bepul modelga o'tkazib yuboradi.
- **Xavfli prompt qirqish (`RTK + Caveman`):** Proxy qatlamida terminal chiqishlari va matnni 60–95% gacha qirqish stack-trace, fayl yo'llari va aniq qator raqamlarini yo'qotib, xato tuzatishda agentni chalg'itadi.
- **Kontekst shishishi:** Agar 44 ta `omni-*` / `cli-*` skill global o'rnatilsa, amaliy kodlashga hech qanday foyda bermasdan doimiy kontekst byudjetini yeb yotadi.

---

## 3. Xavfsizlik va O'rnatishdan oldin tozalash (Sanitarizatsiya)

- **Xavf darajasi:** `O'rta–Yuqori` *(akkaunt ToS bloklanishi va tizim darajasidagi postinstall o'zgarishlari sabab)*
- **Tekshirilgan nuqtalar:**
  - `scripts/build/postinstall.mjs` o'rnatish vaqtida avto-ishga tushadi: `wreq-js` (TLS fingerprint spoofing / stealth mijoz), `node-machine-id` native modullarini ko'chiradi va `~/.cache/node-gyp/<version>/include/node/common.gypi` faylini patch qiladi.
  - Web-cookie va OAuth obunalarni TLS-stealth reverse-proxy (`tsconfig.mitm.json`, `wreq-js`, `Quota-Share`) orqali ulash yirik AI provayderlarning foydalanish shartlariga (`Terms of Service`) zid — pullik shaxsiy akkaunt bloklanishiga (`ban/suspension`) olib kelishi mumkin (reponing o'zida ham ayrim provayderlarga `tos: avoid` belgisi qo'yilgan).
  - `README.md` ichida homiylik/affiliate havolalari (`?aff=omniroute`) va tashqi tunnel/cloud-sync (`omni-tunnels`, `omni-sync-cloud`) modullari mavjud.
- **Agar kimdir alohida sinab ko'rmoqchi bo'lsa majburiy cheklovlar:**
  1. 44 ta `skills/omni-*` va `skills/cli-*` fayllarini global `skillshare` ga **qo'shmaslik**.
  2. Asosiy pullik `Claude` / `ChatGPT` / `Google` obunalarini OAuth/cookie reverse-proxy orqali **ulamaslik** (faqat rasmiy API kalitlar bilan cheklash).
  3. `omni-sync-cloud`, `omni-tunnels` va `Caveman` kompressiyasini o'chirib qo'yish hamda `sessionAffinityTtlMs` ni yoqish.

---

## 4. Bizga qanchalik kerak va mavjud vositalar bilan mosligi

- **To'liq ortiqcha va ziddiyatli:**
  - Ko'p-model orkestratsiyasi uchun bizda allaqachon [**`Orca`**](orca.md) + rasmiy `Antigravity`, `Codex` va `Claude` muhitlari to'g'ridan-to'g'ri, TLS proxy'siz va prompt-cache'ni buzmasdan ishlayapti (`Antigravity` esa baribir tashqi `OPENAI_BASE_URL` proxy'ni ishlatmaydi).
  - Token va javob hajmini tejash uchun kiruvchi loglarni buzmaydigan [**`ponytail`**](../architecture/ponytail.md) hamda [**`graphify`**](../architecture/graphify.md) faol.

---

## 5. Qaysi yo'nalish va vazifalarda foydali?

- **Qachon ishlatish kerak:** Faqat rasmiy AI obunasi bo'lmagan, o'nlab turli API kalitlarni (`OpenRouter`, `Groq`, lokal `Ollama` va b.) bitta lokal shlyuz orqali `Cline` yoki `OpenCode` ga ulamoqchi bo'lgan holatda.
- **Qachon ishlatmaslik kerak:** Rasmiy `Antigravity`, `Claude Code` va `Codex` obunalari hamda `Orca` ishlatiladigan professional ish muhitida, uzoq davom etuvchi murakkab arxitektura va ko'p-repoli vazifalarda.

---

## 6. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-11-16 | Manba kodi (`v3.8.54`), `postinstall.mjs` va 44 ta `SKILL.md` auditi | `⛔ Rad etildi` | Ichidagi skillar kodlash skilli emasligi (faqat proxy sozlamalari), uzoq sessiyalarni uzishi (`#7287`), yashirin model pasayishi va `wreq-js` TLS-stealth orqali pullik obunalarda ToS bloklanish xavfi borligi sabab o'rnatmaslikka qaror qilindi. |
