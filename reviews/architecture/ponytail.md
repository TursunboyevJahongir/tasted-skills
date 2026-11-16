# `ponytail` (Dietrich Gebert)

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/architecture/ponytail.md) | [🇷🇺 Русский](../ru/architecture/ponytail.md)

- **Manba:** [DietrichGebert/ponytail](https://github.com/DietrichGebert/ponytail/blob/main/skills/ponytail/SKILL.md)
- **Turkum:** `Architecture` *(Kod soddaligi, YAGNI va qisqa javob intizomi)*
- **Turi:** `Skill`
- **Sifat bahosi:** **9.5 / 10**
- **Bizga kerakliligi:** **9.5 / 10**
- **Tavsiya etilgan ko'lam:** `Global (-g)`
- **Tekshirilgan sana:** `2026-11-15`
- **Joriy holati:** `✅ Ishlatyapman`

---

## 1. Nima va qanday ishlaydi?

> [!IMPORTANT]
> **Oddiy tilda (Asosiy vazifasi va foydasi):** AI'ning 10 qatorlik oddiy ishni 200 qatorlik murakkab "arxitektura"ga aylantirish va uzun insho yozish odatini kesadi. Muammoni to'liq yopadigan **eng qisqa toza kod** yozdiradi va bir o'qishda tushunarli javob qaytaradi (**chiqish tokeni va kod hajmini `~2–4x` gacha kamaytiradi**).

"Lazy senior dev mode" — vazifani to'liq hal qiladigan **eng kichik o'zgarish** (YAGNI) va band odam **bir o'qishda tushunadigan** qisqa javob yozishga o'rgatuvchi sof Markdown skill (`SKILL.md`, 3.5 KB).

Ichida 3 xil rejim (`lite`, `full` default, `ultra`) va aniq qoidalar bor:
- So'ralmagan kelajak uchun "universal" abstraksiya, factory, wrapper, konfiguratsiya yoki bir necha qatorlik ish uchun yangi kutubxona qo'shmaslik;
- Kod yozishdan oldin tegadigan barcha chaqiruvchilar (`callers`), testlar va eksportlarni tekshirib, muammoni eng qisqa to'liq o'zgarish bilan yopish;
- Murakkab yangi mantiqda 1 ta kichik test yoki `assert` qoldirish; xavfsizlik, accessibility va ma'lumot yo'qolishidan himoyani hech qachon kesmaslik;
- Javob oxirida 1–2 qatorda nima tekshirilmagani yoki tashlab ketilgani hamda mavjud xavfni ochiq yozish.

---

## 2. Qanchalik yaxshi va qanchalik yomon?

### Kuchli tomonlari
- Juda yengil (atigi 1 ta fayl, skript va hook yo'q), kontekstni deyarli band qilmaydi.
- AI agentlarning eng katta kasali — 10 qatorlik ishni 200 qatorlik "arxitektura" ga aylantirish va uzun insho yozish odatini kesadi.

### Zaif tomonlari va xarajati
- Katta tizimni noldan loyihalashda (`greenfield architecture`) haddan tashqari minimalizm qilmaslik uchun me'moriy vazifalarda aniq talab berish kerak.

---

## 3. Xavfsizlik va O'rnatishdan oldin tozalash (Sanitarizatsiya)

- **Xavf darajasi:** `Past`
- **Tekshirilgan nuqtalar:** `skillshare audit` toza (`0 findings`). Tashqi skript, hook yoki tarmoq chaqiruvi yo'q. Tozalash talab etilmaydi.

---

## 4. Bizga qanchalik kerak va mavjud vositalar bilan mosligi

- `karpathy-guidelines` bilan bir-birini to'ldiradi: `karpathy-guidelines` taxminlarni ochiqlash va jarrohlik aniqligidagi tahrirni talab qilsa, `ponytail` kod hajmini va javob uzunligini minimal darajada ushlab turadi.
- `superpowers` kabi og'ir jarayonlarning to'g'ridan-to'g'ri antipodi.

---

## 5. Qaysi yo'nalish va vazifalarda foydali?

- **Qachon ishlatish kerak:** Kundalik Web, Mobile va Backend kod yozish, bugfix va refaktoringda.
- **Qachon ishlatmaslik kerak:** Uzun tahliliy hisobot yoki keng qamrovli hujjat yozish so'ralganda.

---

## 6. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-11-15 | `skillshare install DietrichGebert/ponytail/skills/ponytail -g` orqali o'rnatish | `✅ Ishlatyapman` | Audit toza o'tdi va barcha 5 ta global agent targetiga sinxronlandi. |
