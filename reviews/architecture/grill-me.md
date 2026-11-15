# `grill-me` (`grilling` + `grill-with-docs`)

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/architecture/grill-me.md) | [🇷🇺 Русский](../ru/architecture/grill-me.md)

- **Manba:** [aihero.dev/skills-grill-me](https://www.aihero.dev/skills-grill-me) · [mattpocock/skills](https://github.com/mattpocock/skills)
- **Turkum:** `Architecture` *(Rejalashtirish, Qarorlar daraxti va Talablarni charxlash)*
- **Turi:** `Skilllar to'plami` (`grill-me`, `grilling`, `grill-with-docs`, `domain-modeling`, `diagnosing-bugs`, `improve-codebase-architecture`)
- **Sifat bahosi:** **9.5 / 10**
- **Bizga kerakliligi:** **9.5 / 10**
- **Tavsiya etilgan ko'lam:** `Global (-g)`
- **Tekshirilgan sana:** `2026-11-15`
- **Joriy holati:** `✅ Faol` *(kod yozishdan oldin g'oya va rejani pishitish uchun asosiy vosita)*

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

### `mattpocock/skills` to'plamidagi qo'shimcha skillar (`2026-11-16`)

Rasmiy [mattpocock/skills](https://github.com/mattpocock/skills) reposidagi barcha skillar tekshirilib, eng foydali **2 tasi sanitarizatsiya bilan faqat kerak paytda ishlaydigan (`on-demand`) qilib global ulandi (`✅ Faol`)**:
- **`diagnosing-bugs` (`✅ Faol` — faqat murakkab/noaniq xatolar uchun):** Oddiy 1 qatorli xatolarda ishga tushmasligi uchun trigger chegarasi toraytirildi (`ponytail` ustuvor), osilib qoladigan interaktiv `scripts/hitl-loop.template.sh` olib tashlandi va Web/Mobil UI sikli bizning `agent-desktop` / `agent-device` / `sentry` stekimizga moslandi (`skillshare audit`: `0 issues`).
- **`improve-codebase-architecture` (`✅ Faol` — `disable-model-invocation: true`):** Faqat arxitektura tekshiruvi so'ralganda ishlaydi; global `codebase-design` auto-trigger shovqinisiz ishlashi uchun 8 atamali lug'at ichki `CODEBASE-DESIGN.md` fayliga joylandi, `CONTEXT.md` (`domain-modeling`) bilan uyg'unlashtirildi hamda `/tmp/architecture-review-<timestamp>.html` ga vizual `Before / After` Mermaid hisobot chiqarib `grilling` ga ulaydi (`skillshare audit`: `0 issues`).
- **Rad etilganlar (`⛔ Rad etildi`):** `tdd`, `implement`, `implement-spec`, `to-tickets`, `triage`, `setup-matt-pocock-skills` — majburiy TDD va issue-tracker konveyeri kundalik ishimizda ortiqcha sikl yaratadi.

---

## 5. Qaysi yo'nalish va vazifalarda foydali?

- **Qachon ishlatish kerak:** Yangi ficha, murakkab refaktoring, ma'lumotlar bazasi sxemasi yoki biznes mantiqida noaniq joylar ko'p bo'lganda kod yozishdan oldin (`grill-me`), noaniq/flaky xatolarda (`diagnosing-bugs`) va modullarni chuqurlashtirishda (`improve-codebase-architecture`).
- **Qachon ishlatmaslik kerak:** Talabi va sababi 100% aniq bo'lgan mayda bugfix va bir qatorli o'zgarishlarda.

---

## 6. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-11-15 | Global o'rnatilgan rejalashtirish skilli sifatida qayd etish | `✅ Faol` | `grilling`, `grill-me`, `grill-with-docs` va `domain-modeling` barcha agentlarga global ulangan. |
| 2026-11-16 | `diagnosing-bugs` va `improve-codebase-architecture` sanitarizatsiyasi va global ulanishi | `✅ Faol` | Faqat kerak paytda ishlaydigan (`on-demand`) qilib tozalandi (`hitl-loop.template.sh` o'chirildi, `CODEBASE-DESIGN.md` biriktirildi, `0/100` audit xavfi) va barcha 5 ta agent muhitiga sinxronlandi; og'ir `tdd`/`to-tickets` skillari rad etildi (`⛔ Rad etildi`). |
