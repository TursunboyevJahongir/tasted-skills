# `sentry` (Self-Hosted Sentry + AI Skill / MCP)

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/backend/sentry.md) | [🇷🇺 Русский](../ru/backend/sentry.md)

- **Manba:** [getsentry/self-hosted](https://github.com/getsentry/self-hosted) · [docs.sentry.io](https://docs.sentry.io/)
- **Turkum:** `Backend` *(Full-Stack Observability: Backend, Web va Mobile xatolari, Trace va Session Replay)*
- **Turi:** `Self-Hosted Platform + SDK + AI Skill / MCP`
- **Sifat bahosi:** **9.5 / 10**
- **Bizga kerakliligi:** **9.5 / 10**
- **Tavsiya etilgan ko'lam:** `Global (-g)` *(AI navigatsiya skilli / MCP orqali barcha loyihalar uchun)*
- **Muqobil tizim bilan bog'liqlik:** [**`opentelemetry`**](opentelemetry.md) *(Sentry v8+ SDK kapot ostida OTel ustiga qurilgan)*
- **Ishlatilayotgan sana:** `2026-07-08` dan
- **Joriy holati:** `✅ Faol` *(Backend, Web va iOS/Android ilovalarda asosiy xato, trace va replay tahlil tizimi)*

---

## 1. Nima va qanday ishlaydi?

Web (`React`, `Next.js`), Mobile (`iOS`, `Android`, `React Native / Expo`) va Backend (`Nest.js`, `FastAPI`, background worker/queue) loyihalaridagi real vaqtdagi xatolarni, sekin so'rovlarni va foydalanuvchi harakatlarini bitta markazga yig'uvchi platforma:
- **Aqlli xato guruhlash (`Issue Grouping`):** Minglab bir xil crash yoki exception'ni bitta `Issue` guruhiga yig'adi, qaysi `Release` da boshlangani va nechta foydalanuvchiga ta'sir qilganini ko'rsatadi.
- **`Stack Trace` + `Breadcrumbs`:** Xatoning aniq kod qatorini (`Source Maps`, iOS `dSYM`, Android `ProGuard/R8`) hamda xatodan oldin foydalanuvchi bosgan tugmalar, konsol loglari va tarmoq so'rovlarini ketma-ket ko'rsatadi.
- **`Distributed Tracing` (OpenTelemetry asosida):** Zamonaviy Sentry SDK (`v8+`) ichida OpenTelemetry ishlaydi — frontenddan chiqqan so'rovning backend API, baza (`SQL`/`Redis`) va queue worker'largacha qancha vaqt olganini bitta `trace_id` zanjirida bog'laydi.
- **`Session Replay`:** Web ilovalarda xato yuz bergan lahzadagi foydalanuvchi ekranini (DOM yozuvi, `rage/dead click`, network timeline) videodek qayta ko'rsatib beradi.
- **AI Agent bilan integratsiya (`Skill` / `MCP`):** Maxsus navigatsiya skilli yoki `MCP & CLI` ulanishi orqali AI agent issue, stack-trace, release va trace'larni bevosita o'qib, sababini kod bilan solishtirib topadi.

---

## 2. Qanchalik yaxshi va qanchalik yomon? (`OpenTelemetry` bilan solishtiruv)

### Kuchli tomonlari (Sentry nimada ustun?)
- **Kod va foydalanuvchi markazli tashxis (`Application-centric`):** Crash va exception'larni deduplikatsiya qilish, `Release` regressiyasini ushlash, mobil `dSYM`/`ProGuard` o'qish va `Breadcrumbs` berishda toza [`opentelemetry`](opentelemetry.md) stekidan ancha ustun.
- **`Session Replay` bitta qutida:** Alohida uchinchi tomon replay servisi ko'tarmasdan, xato bilan foydalanuvchi ekran harakatini bitta sahifada bog'laydi (OpenTelemetry'da Session Replay umuman yo'q).
- **Qo'shimcha stek ko'tarish shart emas:** Xatolar, bazaviy trace'lar va web replay uchun bitta self-hosted platformaning o'zi yetarli.

### Zaif tomonlari va cheklovlari
- **Server va infratuzilma monitoringi emas:** Server CPU/RAM/Disk holati, konteyner resurslari, DB connection pool to'lishi va katta hajmdagi xom server loglarini (`stdout`) tahlil qilishda [`opentelemetry`](opentelemetry.md) (+ `Grafana` / `SigNoz`) kuchliroq.
- Agar `Session Replay` va `Tracing` (`1.0` / `100%`) barcha sessiyalar uchun cheklovsiz yoqib yuborilsa, self-hosted server diskini tez to'ldiradi.

---

## 3. Xavfsizlik, Maxfiylik va To'liq ishlashi uchun umumiy talablar

- **Xavf darajasi:** `Past` *(o'z serveringizda — self-hosted boshqariladi)*
- **Xavfsizlik va AI orqali tekshirish qoidalari:**
  1. **Maxfiy ma'lumotlarni tozalash (`sendDefaultPii: false` / Data Scrubbing):** Parollar, `Authorization` headerlar, JWT/refresh tokenlar, to'lov raqamlari va DSN kalitlarini log yoki doimiy hujjatlarga ko'chirmaslik; Replay'da kiritish maydonlarini (`maskAllInputs: true`) yopiq qoldirish.
  2. **AI agent uchun `Read-Only` chegara:** AI xatoni tekshirayotganda ruxsatsiz issue'larni `Resolve/Archive` qilmasligi, alert qoidalarini yoki loyiha sozlamalarini o'zgartirmasligi kerak.
- **Sentry to'liq kuchda ishlashi uchun kerakli umumiy sozlamalar:**
  1. **`Source Maps` va `Debug Symbols`:** CI/build jarayonida Web uchun `Source Maps`, Android uchun `ProGuard/R8 mapping`, iOS uchun `dSYM` yuklash (aks holda AI `/app/main.js` kabi yig'ilgan faylni ko'radi).
  2. **Aqlli `Tracing` ulushi:** Backend va Web SDK'larda `tracesSampleRate: 0.1` (`10%`–`20%`) yoqish — serverni qiynamasdan sekin SQL va API zanjirlarini ko'rsatadi.
  3. **Faqat xatoda `Session Replay`:** `replaysSessionSampleRate: 0` (yoki `0.05`) va **`replaysOnErrorSampleRate: 1.0`** qo'yish — disk joyini tejab, xato bo'lgan sessiyalarni `100%` yozib oladi.
  4. **Aniq `release` va `environment` teglari:** Har bir deploy'da git versiyasi va muhit (`production` / `staging`) uzatilishi shart.

---

## 4. Bizga qanchalik kerak va [`opentelemetry`](opentelemetry.md) bilan nisbati

- Bizda Web, Mobile (`iOS` / `Android`) va Backend servislar yonma-yon ishlagani uchun **ikkisidan bittasi sifatida `Sentry` asosiy platforma qilib tanlangan**: u xato guruhlash, mobil crash tahlili, `Breadcrumbs`, `Session Replay` va `v8+` OTel-trace'larni bitta joyda yopadi.
- Shu sababli alohida [`opentelemetry`](opentelemetry.md) (`Collector + Grafana/SigNoz`) stekini parallel ko'tarishga hozir ehtiyoj yo'q (u faqat chuqur server/DB infratuzilma metrikalari va markazlashgan log bazasi kerak bo'lgandagina qo'shiladi).

---

## 5. Qaysi yo'nalish va vazifalarda foydali?

- **Qachon ishlatish kerak:** Production/staging crash va `500` xatolarni tekshirishda, yangi `Release` dan keyin regressiyani tutishda, Web foydalanuvchida xato qanday yuz berganini (`Replay` + `Breadcrumbs`) ko'rishda va sekin API/DB so'rovlarini tahlil qilishda.
- **Qachon ishlatmaslik kerak:** Server disk/CPU/RAM monitoringi yoki millionlab qatorli infratuzilma loglarini saqlash vazifalarida.

---

## 6. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-07-08 | Self-hosted Sentry platformasini loyihalarga ulash + AI navigatsiya skilli (`2026-10-31`) | `✅ Faol` | Backend, Web va iOS/Android loyihalar ulangan; xato, stack-trace, breadcrumbs va trace tahlilida asosiy observability tizimi sifatida faol ishlatilmoqda. |
