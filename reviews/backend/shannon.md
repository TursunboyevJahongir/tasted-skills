# `Shannon` (`KeygraphHQ/shannon` — AI Pentester)

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/backend/shannon.md) | [🇷🇺 Русский](../ru/backend/shannon.md)

- **Manba:** [KeygraphHQ/shannon](https://github.com/KeygraphHQ/shannon)
- **Turkum:** `Backend` *(Web va HTTP API White-Box Xavfsizlik Auditi va Avtonom Pentest)*
- **Turi:** `Standalone CLI (Docker + Temporal)` + yengil lokal `hacker-test` trigger skilli
- **Sifat bahosi:** **8.5 / 10**
- **Bizga kerakliligi:** **6.5 / 10**
- **Tavsiya etilgan ko'lam:** `Standalone CLI (npx @keygraph/shannon@latest)` — *faqat lokal/staging reliz oldidan; o'zining og'ir pluginini global o'rnatmaslik*
- **Tekshirilgan sana:** `2026-11-16`
- **Joriy holati:** `👀 Ko'rib chiqdik (sinab ko'rmadik)` *(kodi tekshirildi; esdan chiqmasligi uchun yengil `hacker-test` skilli ulandi, katta reliz oldidan lokal bazada sinab ko'riladi)*

---

## 1. Nima va qanday ishlaydi?

`Shannon` (`AGPL-3.0`) — oddiy statik linter yoki kod o'qiydigan prompt emas, balki ishlab turgan Web ilova va HTTP API'ga real hujum uyushtirib zaiflikni isbotlaydigan **White-Box AI Pentester**:

1. `npx @keygraph/shannon@latest start -u <url> -r <repo>` ishga tushganda u **Docker + Temporal (`temporalio/temporal:1.7.0`) + Playwright CLI + Pi agent harness** konteynerlarini ko'taradi.
2. Loyiha manba kodini `read-only` rejimda o'qib, marshrutlar, auth guardlar va ma'lumot oqimlarini xaritaga tushiradi (`pre-recon` va `recon`).
3. Keyin ishlab turgan nishon URL'ga **5 ta OWASP yo'nalishi** bo'yicha real ekspluatatsiya agentlarini yuboradi:
   - **Broken Authentication** (`exploit-auth`)
   - **Broken Authorization / IDOR** (`exploit-authz` — bir user tokeni bilan boshqa user/tashkilot resursiga kirish)
   - **Injection** (`exploit-injection` — SQL/NoSQL/Command injection)
   - **XSS** (`exploit-xss`)
   - **SSRF** (`exploit-ssrf`)
4. **"No exploit, no report" tamoyili:** Faqat amalda buzib kirib isbotlangan (`status: exploited`) zaifliklarnigina PoC bilan PDF, Markdown, JSON va SARIF 2.1.0 ko'rinishida chiqaradi.

---

## 2. Qanchalik yaxshi va qanchalik yomon?

### Kuchli tomonlari
- **Mavjud stekimizdagi bo'shliqni yopadi:** `elephant-goldfish-model` arxitektura va hujjat-kod farqini topsa, `sentry` runtime xatolarni ushlaydi; `Shannon` esa real HTTP so'rovlar va brauzer orqali IDOR, ruxsatlarni aylanib o'tish va injection zaifliklarini amalda tekshiradi.
- **Mavjud `Codex` (`ChatGPT Plus/Pro`) obunasi bilan ishlaydi:** Alohida qimmat API kalit shart emas — `pi` orqali `SHANNON_USE_PI_AUTH=1` va `SHANNON_AI_MODEL=openai-codex:gpt-5.5` (yoki `gpt-6-sol`) bilan ulanadi *(eslatma: v2 talqinida Claude Code OAuth obunasi olib tashlangan, u faqat eski `@1.9.0` da qolgan)*.

### Zaif tomonlari va xarajati
- **Uzoq va og'ir jarayon:** Docker + Temporal talab qiladi, bitta to'liq tekshiruv **1 – 1.5 soat** vaqt va katta model kvotasini oladi.
- **OpenAI / Anthropic "Cyber Safeguards" to'sig'i:** Provayderlar real xakerlik payloadlarini skan o'rtasida bloklab qo'yishi mumkin — boshlashdan oldin albatta `--validate-model` bilan tekshirish (va kerak bo'lsa `chatgpt.com/cyber` tasdig'idan o'tish) shart.
- **Tor qamrov:** Faqat Web va HTTP API'larni tekshiradi; native iOS/Android ilova ichini, xom TCP binar protokollarni va paketlarning CVE versiyalarini tekshirmaydi.

---

## 3. Xavfsizlik va O'rnatishdan oldin tozalash (Sanitarizatsiya)

- **Xavf darajasi:** `O'rta` *(noto'g'ri muhitga — production'ga ulansa bazani buzib yuboradi)*
- **Tekshirilgan nuqtalar:** `plugins/shannon/skills/shannon/SKILL.md`, `compose.yml`, `docs/safety.md`, `AGPL-3.0` litsenziyasi.
- **Ishlatishda qat'iy qoidalar:**
  1. **Production'ga mutlaqo ulamaslik:** Ekspluatatsiya agentlari yangi akkauntlar ochadi, formalar yuboradi va ma'lumotlarni o'zgartiradi/o'chiradi. Faqat o'chib ketsa achimaydigan **lokal (`http://host.docker.internal:<port>`) yoki alohida staging baza**ga qaratish shart.
  2. **Rasmiy `plugins/shannon` paketini global o'rnatmaslik:** Ichidagi katta `llms-full.txt` kundalik ishga kerak emas; uning o'rniga faqat `"hacker test"` deyilganda uyg'onadigan ixcham (~40 tokenli) mahalliy `hacker-test` eslatma-skilli yaratildi.
  3. **Ishonchsiz begona repolarni skanerlamaslik:** Kod o'qiydigan LLM agentlarda prompt-injection xavfi bor.

---

## 4. Bizga qanchalik kerak va mavjud vositalar bilan mosligi

- Har kungi kodlashda kerak emas, lekin ko'p-foydalanuvchili (`multi-tenant`) admin panellar, to'lov/obuna API'lari va rollar (`permissions`) o'zgargan katta relizlar oldidan **`"hacker test"`** buyrug'i bilan lokal serverni tekshirib olish uchun juda foydali to'ldiruvchi vosita.

---

## 5. Qaysi yo'nalish va vazifalarda foydali?

- **Qachon ishlatish kerak:** Katta reliz oldidan lokal Docker/staging muhitda Web ilova va Backend API'ni IDOR, Auth bypass, SQLi, XSS va SSRF ga sinashda (`"hacker test"` deb murojaat qilinganda).
- **Qachon ishlatmaslik kerak:** Production serverlarda, oddiy UI o'zgarishlarda yoki native mobil / binar TCP xizmatlarda.

---

## 6. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-11-16 | Manba kodi, Docker/Temporal arxitekturasi va `ai-providers.md` auditi + yengil `hacker-test` trigger skilli yaratish | `👀 Ko'rib chiqdik (sinab ko'rmadik)` | Kuchli `npx` pentest vositasi sifatida tasdiqlandi; esdan chiqmasligi uchun barcha agentlarga xavfsiz lokal `hacker-test` eslatma-skilli ulandi. |
