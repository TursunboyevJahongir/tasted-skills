# `opentelemetry` (OpenTelemetry + SigNoz / Grafana Stack)

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/backend/opentelemetry.md) | [🇷🇺 Русский](../ru/backend/opentelemetry.md)

- **Manba:** [open-telemetry.io](https://opentelemetry.io/) · [open-telemetry/opentelemetry-collector](https://github.com/open-telemetry/opentelemetry-collector)
- **Turkum:** `Backend` *(Distributed Tracing, Server/DB Metrics va Markazlashgan Logs standarti)*
- **Turi:** `Observability Standard + SDK + Collector` *(Vizual panel sifatida `SigNoz` yoki `Grafana Tempo/Loki/Prometheus` bilan)*
- **Sifat bahosi:** **9.0 / 10**
- **Ishda kerak bo'lishi:** **4.0 / 10** *(alohida stek sifatida — chunki asosiy ehtiyojni `Sentry` yopadi)*
- **Tavsiya etilgan ko'lam:** `Hozircha alohida ko'tarmaslik` *(kerak bo'lganda faqat ko'p-servisli Backend + Infra monitoringi uchun)*
- **O'rniga ishlatiladigan tizim:** [**sentry**](sentry.md) *(Self-Hosted Sentry + v8+ OTel SDK + AI Skill)*
- **Tekshirilgan sana:** `2026-11-15`
- **Joriy holati:** `👍 Yaxshi variant` *(asosiy tizim sifatida [sentry](sentry.md) ishlatilayotgani uchun alohida OTel backend ko'tarilmagan)*

---

## 1. Nima va qanday ishlaydi?

> [!IMPORTANT]
> **Oddiy tilda (Asosiy vazifasi va foydasi):** O'nlab mikroservis va og'ir server infratuzilmasi (`CPU`, `RAM`, `DB pool`) metrikalarini kuzatish uchun eng kuchli standart, lekin alohida `Collector + Grafana/SigNoz` serverlarini saqlashni talab qiladi — hozirgi barcha xato, replay va trace ishlarimizni bitta `Sentry` yopadi.

CNCF (Cloud Native Computing Foundation) tomonidan ishlab chiqilgan, har qanday dasturlash tili va servisdan **3 turdagi telemetriyani (`Traces`, `Metrics`, `Logs`) yagona formatda (`OTLP`) yig'uvchi va uzatuvchi universal standart**:

1. **Yagona so'rov pasporti (`trace_id` / W3C `traceparent`):** Mijozdan kelgan bitta so'rov API, autentifikatsiya servisi, ma'lumotlar bazasi (`PostgreSQL`/`Redis`), navbat (`Queue`/`Worker`) va tashqi to'lov/xabar servislaridan o'tayotganda uzilmay kuzatib boradi.
2. **`Traces` (Waterfall shkalasi):** So'rov jami `3 sekund` ketgan bo'lsa, millisekundigacha qaysi servis yoki qaysi SQL so'rov ushlab qolganini ko'rsatadi.
3. **`Metrics` (Tizim va ilova ko'rsatkichlari):** `RPS` (sekundiga so'rovlar), `p95`/`p99` javob vaqti, server CPU/RAM, DB connection pool va queue uzunligini real vaqtda o'lchaydi.
4. **`Logs` (Trace bilan bog'langan loglar):** Har bir log qatoriga avtomatik `trace_id` va `span_id` qo'shadi — turli servislardagi barcha loglarni bitta so'rov bo'yicha bir joyda chiqaradi.

*(Muhim: OpenTelemetry o'zi ma'lumot saqlovchi baza yoki UI emas — u yig'uvchi quvurdir. Ko'rish uchun orqasiga **SigNoz** yoki **Grafana (`Tempo` + `Loki` + `Prometheus`)** ulanadi.)*

---

## 2. Qanday muammolarni hal qiladi va [sentry](sentry.md) dan farqi nimada?

### Hal qiladigan asosiy muammolari (Kuchli tomonlari)
- **"Xato (`500`) yo'q, lekin tizim sekin ishlayapti" muammosi:** Crash bermasdan `200 OK` qaytaradigan, ammo `N+1` SQL so'rov, indeks yetishmasligi yoki tashqi API kutishi sababli sekin ishlaydigan joylarni darhol topadi.
- **Ko'p servisli zanjirda aybdorni topish:** Muammo asosiy API'dami, ichki servisdami yoki fon worker'dami — taxmin qilmasdan bitta chizmada ko'rsatadi.
- **Kod sekinlashishini Server/Baza holati bilan bog'lash:** *"API javob vaqti oshib ketdi, chunki aynan shu daqiqada DB connection pool 100% to'lgan yoki xotira tugagan"* degan savolga bitta grafikda javob beradi.
- **Vendor-neutral (Mustaqil):** Kod bir marta OTel SDK bilan yozilsa, keyinchalik ma'lumotni kodga tegmasdan istalgan tizimga (`SigNoz`, `Grafana`, `Datadog` yoki `Sentry`) yo'naltirish mumkin.

### Zaif tomonlari va [sentry](sentry.md) ustun bo'lgan joylar
- **Xatolarni guruhlash (`Issue Grouping`) va Mobil Crash tahlili kuchsiz:** Bir xil exception ming marta tushsa, OTel log/trace'larida u mingta alohida yozuv bo'lib ko'rinadi; Sentry esa uni bitta `Issue` qilib yig'adi, `Release` bilan bog'laydi hamda iOS `dSYM` / Android `ProGuard` crash'larini tayyor o'qiydi.
- **`Session Replay` yo'q:** Foydalanuvchi ekranida nima bosganini videodek qayta ko'rsatish OTel standartida mavjud emas.
- **Alohida infratuzilma xarajati:** Ishlatish uchun alohida Collector, baza (`ClickHouse` yoki `Tempo`/`Loki`/`Prometheus`) va UI ko'tarib, disk retention'ni nazorat qilish kerak.

---

## 3. Agar OpenTelemetry yo'lga qo'yilsa, umumiy nimalar kerak bo'ladi? (Arxitektura va Xavfsizlik)

To'liq va xavfsiz OpenTelemetry steki uchun 4 ta qism kerak bo'ladi:
1. **Ilova ichida Auto-Instrumentation SDK:**
   - Node.js / Nest.js uchun `@opentelemetry/sdk-node` + `@opentelemetry/auto-instrumentations-node`; Python / FastAPI uchun `opentelemetry-distro` (`HTTP`, `PostgreSQL`, `Redis`, `Queue` chaqiruvlarini avtomatik tutadi).
2. **`OpenTelemetry Collector` (`otel-collector`):**
   - Ilovalardan kelgan telemetriyani qabul qilib, paketlab (`batch`) saqlash bazasiga uzatuvchi oraliq qatlam.
   - **Majburiy sanitarizatsiya (`transform`/`attributes` processor):** `Authorization` headerlar, cookie'lar, tokenlar, parollar va shaxsiy ma'lumotlarni (`PII`) bazaga yozishdan oldin Collector darajasida kesib tashlash.
   - **Tail-based Sampling:** Disk to'lib ketmasligi uchun xatolik bo'lgan (`error`) va sekin (`>1s`) so'rovlarni `100%`, oddiy tez o'tgan so'rovlarni esa `5–10%` saqlash.
3. **Saqlash va Vizual panel (ikkisidan biri tanlanadi):**
   - **Soddaroq "hammasi birda" variant:** [**SigNoz**](https://github.com/SigNoz/signoz) (`ClickHouse` ustida `Traces + Metrics + Logs` bitta interfeysda).
   - **Klassik modulli variant:** **Grafana LGTM** (`Tempo` — trace uchun, `Loki` — loglar uchun, `Prometheus` / `VictoriaMetrics` — metrikalar uchun).
4. **Disk tozalash (`TTL / Retention`):** Log va trace'lar uchun aniq saqlash muddati (masalan, `7–14 kun`) belgilash.

---

## 4. Nega hozir alohida ishlatmayapmiz? (`Sentry` vs `OpenTelemetry` qarori)

- Bizning kundalik ishimizda ham Web, ham Mobile (`iOS` / `Android`), ham Backend borligi sababli **ikkisidan bittasi sifatida [sentry](sentry.md) tanlangan**: u crash/exception guruhlash, `Breadcrumbs`, `Session Replay` va zamonaviy `v8+` SDK orqali bazaviy OpenTelemetry trace'larini bitta tayyor platformada beradi.
- Alohida OpenTelemetry stekini (`SigNoz` yoki `Grafana`) ko'tarishga faqat kelajakda **chuqur server/DB infratuzilma metrikalari va markazlashgan backend log qidiruvi** Sentry doirasidan tashqariga chiqqandagina ehtiyoj tug'iladi (shunda ham kodni ikki marta yozmasdan, OTel Collector orqali xatolarni Sentry'ga, metrika/loglarni esa OTel paneliga uzatish mumkin).

---

## 5. Qaysi yo'nalish va vazifalarda foydali?

- **Qachon ishlatish kerak:** Ko'p mikroservisli backend tizimlarda servislararo kechikishlarni (`p95`/`p99`), server/DB resurs yuklamasini va markazlashgan loglarni bitta oynada kuzatish zarur bo'lganda.
- **Qachon ishlatmaslik kerak:** Asosiy maqsad Web/Mobile ilovalardagi crash'lar, `Session Replay` va kod xatolarini tutish bo'lib, allaqachon [sentry](sentry.md) ishlab turgan bo'lsa.

---

## 6. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-11-15 | Arxitektura, kerakli komponentlar va [sentry](sentry.md) bilan solishtirma tahlil | `👍 Yaxshi variant` | Kuchli sanoat standarti (`9.0/10`), biroq bizda xatolar, replay va bazaviy trace'lar uchun [sentry](sentry.md) ishlatilayotgani sababli ikkinchi parallel stek sifatida ko'tarilmadi. |
