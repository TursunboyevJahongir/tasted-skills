# `grill-me` (`grilling` + `grill-with-docs`)

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/architecture/grill-me.md) | [🇷🇺 Русский](../ru/architecture/grill-me.md)

- **Manba:** [aihero.dev/skills-grill-me](https://www.aihero.dev/skills-grill-me)
- **Turkum:** `Architecture` *(Rejalashtirish, Qarorlar daraxti va Talablarni charxlash)*
- **Turi:** `Skilllar to'plami` (`grill-me`, `grilling`, `grill-with-docs`)
- **Sifat bahosi:** **9.5 / 10**
- **Bizga kerakliligi:** **9.5 / 10**
- **Tavsiya etilgan ko'lam:** `Global (-g)`
- **Tekshirilgan sana:** `2026-11-15`
- **Joriy holati:** `✅ Ishlatilyapti` *(kod yozishdan oldin g'oya va rejani pishitish uchun asosiy vosita)*

---

## 1. Nima va qanday ishlaydi?

Matt Pocock tomonidan yaratilgan, reja yoki arxitektura g'oyasini kod yozishdan oldin **savol-javob bosqichlari (rounds)** orqali oxirigacha aniqlashtirib oladigan yengil va kuchli skill:
- Vazifani **qarorlar daraxti (design tree)** sifatida ko'radi va har bir bosqichda faqat oldingi shartlari hal bo'lgan savollarni (**frontier**) raqamlab beradi (`❓ Q1 ... ➡️ Tavsiya etilgan javob`).
- **Muhim qoida:** Kod bazasidan yoki fayl tizimidan topib bo'ladigan *faktlarni* foydalanuvchidan so'ramaydi — subagent yuborib o'zi tekshiradi; foydalanuvchiga faqat *qaror* talab qiladigan savollarni qo'yadi.
- Qarorlar daraxtida borta ham ochiq taxmin qolmaguncha kod yozishga o'tmaydi.
- Yonidagi **`grill-with-docs`** varianti `domain-modeling` bilan birga ishlab, suhbat davomida loyiha lug'ati (`CONTEXT.md`) va arxitektura qarorlarini (`docs/adr/`) ham yozib ketadi.

---

## 2. Qanchalik yaxshi va qanchalik yomon?

### Kuchli tomonlari
- **O'ta ixcham (~28 qator):** Kontekstni umuman shishirmaydi, lekin agentning fikrlash sifatini keskin o'zgartiradi.
- Har bir savolga agentning o'z **tavsiya etilgan javobi (`➡️`)** qo'shib berilgani uchun javob berish juda tez kechadi.
- Yarim-chala tushunilgan talab bilan noto'g'ri kod yozib vaqt yo'qotishning oldini oladi.

### Zaif tomonlari va cheklovlari
- Bitta sessiya ichida 1-ga-1 suhbat sifatida ishlaydi (agar juda katta texnik hujjatni xotirasiz ko'p-agentli tanqidchilarga tekshirtirish kerak bo'lsa, buning yoniga `elephant-goldfish-model` mos tushadi).

---

## 3. Xavfsizlik va Sanitarizatsiya holati

- **Xavf darajasi:** `Past`
- **Tekshirilgan nuqtalar:** Sof Markdown, skript va hooklar yo'q. `grill-me` va `grill-with-docs` da `disable-model-invocation: true` o'rnatilgan — ya'ni oddiy savol-javobda o'zicha so'roq boshlab yubormaydi, faqat siz "grill me" yoki `/grill-me` deganingizda ishga tushadi. Qo'shimcha tozalash talab etilmaydi.

---

## 4. Bizga qanchalik kerak va mavjud vositalar bilan mosligi

- `karpathy-guidelines` (*Think Before Coding*) tamoyilining chuqurlashtirilgan interaktiv shakli.
- `domain-modeling` va `task-context` bilan uzviy ishlaydi: `grill-me` qarorlarni aniqlashtiradi, `task-context` esa ularni implementer va reviewer agentlar uchun yozib qo'yadi.

---

## 5. Qaysi yo'nalish va vazifalarda foydali?

- **Qachon ishlatish kerak:** Yangi ficha, murakkab refaktoring, ma'lumotlar bazasi sxemasi yoki biznes mantiqida noaniq joylar ko'p bo'lganda kod yozishdan oldin.
- **Qachon ishlatmaslik kerak:** Talabi 100% aniq bo'lgan mayda bugfix va bir qatorli o'zgarishlarda.

---

## 6. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-11-15 | Global o'rnatilgan rejalashtirish skilli sifatida qayd etish | `✅ Ishlatilyapti` | `grilling`, `grill-me` va `grill-with-docs` barcha agentlarga global ulangan va faol qo'llanilmoqda. |
