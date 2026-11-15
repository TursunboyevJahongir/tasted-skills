# `elephant-goldfish-model` (Google EGM)

- **Manba:** [google/elephant-goldfish-model](https://github.com/google/elephant-goldfish-model)
- **Turkum:** `Architecture` *(Spec-Driven Development, Arxitektura va Kod/Hujjat Auditi)*
- **Turi:** `Plugin` *(7 ta skill + 10 ta maxsus subagent + hujjat standartlari)*
- **Sifat bahosi:** **9.0 / 10**
- **Bizga kerakliligi:** **8.0 / 10**
- **Tavsiya etilgan ko'lam:** `Plugin` *(barcha skillarida manual chaqiruv saqlangan holda)*
- **Joriy holati:** `📦 Nomzod` *(tekshirildi, katta arxitektura vazifalari uchun tavsiya etilgan, hali o'rnatilmadi)*

---

## 1. Nima va qanday ishlaydi?

Google muhandislari tomonidan chiqarilgan open-source (`Apache-2.0`) ko'p-agentli loyihalash va tekshirish plugini.

**Hal qiladigan asosiy muammosi:** Bitta chat ichida agent bilan g'oyani muhokama qilib, shu agentning o'ziga reja yozdirib va o'ziga tekshirtirilsa — suhbat tarixi taxminlar bilan to'ladi (*confirmation bias*), model o'z xatosini o'zi ma'qullaydi. EGM rollarni ikkiga ajratadi:
- **Elephant (Fil — xotirali me'mor):** Loyiha tarixi, talablar va suhbat kontekstini ushlab turadi hamda texnik dizayn hujjatini (`docs/designs/<feature>.md`) yozadi.
- **Goldfish (Oltin baliq — xotirasiz tanqidchilar):** Oldingi suhbatni **umuman ko'rmaydigan**, faqat yozilgan hujjat va kod bazasini o'qiydigan `read-only` toza (`fresh-context`) subagentlar guruhi. Ular yashirin taxminlar, ortiqcha murakkablik (YAGNI) va masshtab xavflarini topadi.

Ichida **7 ta skill** mavjud:
1. `egm-brainstorm` — G'oyani 7 xil burchakdan (jumladan **TRIZ** ixtirochilik tamoyillari asosida yolg'on kompromisslarni yechuvchi `inventive_catalyst` orqali) sinovdan o'tkazib `concepts_brief.md` yozadi.
2. `egm-draft` — Chatni uzun matn bilan to'ldirmasdan, bo'limma-bo'lim texnik spec (`design_draft.md`) yozadi.
3. `egm-review` — 5 bosqichli tekshiruv konveyeri: *Zoom Out (YAGNI/soddalik) → Comprehension (yangi o'quvchi testi) → Design Critic (arxitektura/yuklama) → Qayta Zoom Out → Implementation Readiness (fayllar, signaturalar, testlar)*.
4. `egm-resolve` — Topilgan xatolarni birma-bir qabul qilish yoki rad etish.
5. `egm-review-loop` — Tanlangan tanqidchilar guruhi bilan maxsus hujjat tekshiruvi.
6. `egm-drift-report` — Repodagi `docs/designs/` yoki `README.md` hujjatlarini **joriy real kod** bilan solishtirib, qayerda kod hujjatdan og'ib ketganini yoki chala qolganini topadi.
7. `egm-bootstrap` — Mavjud kod bazasining papkalari bo'ylab modul shartnomalari va arxitektura xaritasini (`README.md` / `EGM.md`) yaratadi.

---

## 2. Qanchalik yaxshi va qanchalik yomon?

### Kuchli tomonlari
- **Nol xushomad (`No Glazing`, `Critique First`):** Agentga *"Great/Brilliant idea"* kabi puch maqtovlar va uzr so'rashlar taqiqlangan — avval zaif nuqtani ko'rsatishi shart.
- **Haqiqiy izolyatsiya:** Antigravity (`invoke_subagent`), Claude Code (`Agent`) va Codex (`spawn_agent`) da chinakam yangi subagent ochadi; subagent yo'q muhitda foydalanuvchini aldamasdan to'xtaydi.
- **Kundalik ishlarga aralashib ketmaydi:** Barcha 7 ta skillda `disable-model-invocation: true` yoqilgan — faqat foydalanuvchi `/egm-...` deb aniq chaqirganda ishga tushadi.
- **`egm-drift-report` va TRIZ tahlili:** Odatiy review skillarda uchramaydigan yuqori muhandislik qiymatiga ega.

### Zaif tomonlari va xarajati
- **Yuqori token va kvota sarfi:** Bitta brainstorm yoki to'liq review 5–7+ ta parallel subagentni ishga tushiradi. Kichik va o'rta vazifalar uchun juda og'ir.
- **Yakka `SKILL.md` sifatida ko'chirib bo'lmaydi:** Skillar ish vaqtida `agents/` va `resources/document_standards/` fayllarini o'qiydi, shuning uchun butun plugin tuzilmasi saqlanishi shart.

---

## 3. Xavfsizlik va O'rnatishdan oldin tozalash (Sanitarizatsiya)

- **Xavf darajasi:** `Past`
- **Tekshirilgan nuqtalar:** Rasmiy Google open-source paketi, zararli skript yoki yashirin `Stop` hook yo'q; Goldfish subagentlar qat'iy `read-only` rejimda va git commit qilmaslik cheklovi bilan ishlaydi.
- **O'rnatishda rioya qilinadigan tozalash va sozlash qoidalari:**
  1. **Faqat runtime kerakli qismlarni o'rnatish:** Repo klon qilinsa, veb-sayt va CI qismlarini (`site/`, `tests/`, `.github/`, `adapters/`) tashlab, faqat `plugin.json`, `skills/`, `agents/`, `resources/`, `docs/`, `assets/` qismlarini plugin sifatida o'rnatish (`agy plugin install`, `claude plugin`, `codex plugin` buni avtomatik qiladi).
  2. **`disable-model-invocation: true` ni o'zgartirmaslik:** Avto-trigger yoqib yuborilsa, oddiy vazifalarda ham subagentlar to'dasi ochilib kvotani yeb qo'yadi.
  3. **Qoralama fayllar tartibi:** Loyiha ildizi ifloslanmasligi uchun kerak bo'lganda `EGM artifact directory: .dev/docs` ko'rsatib, `.dev/docs` ni `.gitignore` ga qo'shish.

---

## 4. Bizga qanchalik kerak va mavjud vositalar bilan mosligi

- `grill-me` / `grill-with-docs` + `domain-modeling` — bitta chatda tez 1-ga-1 savol-javob uchun yengil va qulay; EGM esa murakkab tizimlarda ko'p-agentli chuqur tekshiruv beradi.
- `task-context` — **kod yozish jarayonida** implementer va reviewer'ga kontekstni ulashish uchun ishlasa, EGM **kod yozishdan oldin** kontekstni yashirib (Goldfish) arxitekturani sinash uchun ishlaydi. Ikki bosqich bir-birini to'ldiradi.
- `egm-drift-report` funksiyasining muqobili mavjud skillarimiz orasida yo'q.

---

## 5. Qaysi yo'nalish va vazifalarda foydali?

- **Qachon ishlatish kerak:** Yangi mikroservis, real-time oqim/socket arxitekturasi, to'lov/billing mantiqi, murakkab DB migratsiyasi yoki katta repoda hujjat bilan kod o'rtasidagi farqni (`egm-drift-report`) tekshirishda.
- **Qachon ishlatmaslik kerak:** Oddiy UI tuzatishlar, kichik bugfix va odatiy CRUD vazifalarda.

---

## 6. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-11-15 | Arxitektura, subagent promptlari va harness mosligi auditi | `📦 Nomzod` | Yuqori sifatli plugin sifatida tasdiqlandi. Katta arxitektura ishi boshlanganda to'liq plugin ko'rinishida o'rnatish tavsiya etildi. Hozircha o'rnatilmagan. |
