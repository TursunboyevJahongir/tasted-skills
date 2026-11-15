# `graphify`

- **Manba:** [Graphify-Labs/graphify](https://github.com/Graphify-Labs/graphify)
- **Turkum:** `Architecture` *(Kod bazasi va hujjatlardan bilim grafigi — Knowledge Graph)*
- **Turi:** `Skill + Python CLI (graphifyy)`
- **Sifat bahosi:** **9.0 / 10**
- **Bizga kerakliligi:** **9.0 / 10**
- **Tavsiya etilgan ko'lam:** `Global (-g)`
- **Tekshirilgan sana:** `2026-11-15`
- **Joriy holati:** `✅ Ishlatilyapti` *(katta kod bazalari arxitekturasini tez tushunish va qidirish uchun ishlatiladi)*

---

## 1. Nima va qanday ishlaydi?

Istalgan loyiha papkasini (kod, SQL sxemalar, Markdown hujjatlar, PDF, rasm va videolar) vektor bazasiz **doimiy bilim grafigiga (`graphify-out/graph.json`, interaktiv HTML va `GRAPH_REPORT.md`)** aylantiradigan vosita:
- **Kod fayllari uchun lokal deterministik AST tahlil** ishlatadi — token sarflamaydi va juda tez ishlaydi.
- **Hujjat / PDF fayllari uchun** parallel subagentlar orqali semantik bog'lanishlarni chiqaradi va har bir aloqani halol darajalaydi (`EXTRACTED`, `INFERRED`, `AMBIGUOUS`).
- Graf qurilgach (`graphify-out/graph.json` mavjud bo'lsa), keyingi savollarda qayta skaner qilmasdan to'g'ridan-to'g'ri `graphify query "<savol>"`, `graphify path "A" "B"` va `graphify explain` orqali soniyada javob topadi (`--update` faqat o'zgargan fayllarni yangilaydi).

---

## 2. Qanchalik yaxshi va qanchalik yomon?

### Kuchli tomonlari
- Notanish yoki juda katta repolarda "qaysi modul qayerga bog'langan, god-node qayerda?" degan savollarga fayllarni bittalab o'qib token yoqmasdan javob beradi.
- Monorepo va bir nechta GitHub repolarni bitta umumiy grafga birlashtira oladi; Obsidian, Wiki, SVG va Neo4j eksportlari bor.

### Zaif tomonlari va xarajati
- `SKILL.md` hajmi katta (~641 qator, chaqirilganda ~8.7K on-demand token oladi).
- Hujjat/PDF ko'p bo'lgan loyihalarda dastlabki semantik tahlil bir nechta subagent ochadi (faqat koddan iborat loyihalarda esa AST o'zi yetarli va bepul).

---

## 3. Xavfsizlik va Ishlatish qoidalari (Sanitarizatsiya / Cheklovlar)

- **Xavf darajasi:** `Past–O'rta` *(Python paketi va lokal skript ishlatgani uchun muhit nazorati kerak)*
- **E'tibor beriladigan nuqtalar:**
  1. **Paket nomi va o'rnatish:** PyPI'dagi paket nomi `graphifyy` (ikkita `y`). `SKILL.md` ichida paket topilmasa `pip install --break-system-packages` fallback qatori bor — tizim Python'ini buzmaslik uchun uni oldindan `uv tool install graphifyy` orqali alohida muhitda tutish ma'qul.
  2. **Tashqi API kalit tekshiruvi:** Muhitda `GEMINI_API_KEY` yoki `GOOGLE_API_KEY` yoqilgan bo'lsa, hujjatlarni tahlil qilishda Gemini API'ga yuboradi; o'chirilgan bo'lsa, faqat lokal agent subagentlarida qoladi. Maxfiy hujjatli loyihalarda buni hisobga olish kerak.
  3. **Git tozaligi:** Loyiha ichida hosil bo'ladigan `graphify-out/` papkasini (agar jamoa bilan ulashish maqsad qilinmasa) `.gitignore` ga qo'shish.

---

## 4. Bizga qanchalik kerak va mavjud vositalar bilan mosligi

- Katta va ko'p servisli kod bazalarida arxitektura xaritasi sifatida `grill-me` (rejalashtirish) va `domain-modeling` (`CONTEXT.md`) bilan juda yaxshi chiqishadi.

---

## 5. Qaysi yo'nalish va vazifalarda foydali?

- **Qachon ishlatish kerak:** Katta repozitoriyni o'rganish, modullar o'rtasidagi bog'liqlik va oqimni topish (`path`, `query`), bir nechta servisni bitta xaritada ko'rishda.
- **Qachon ishlatmaslik kerak:** 3–5 faylli kichik loyihalarda yoki allaqachon aniq bitta fayl ichidagi kichik o'zgarishlarda.

---

## 6. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-11-15 | Global o'rnatilgan arxitektura vositasi sifatida qayd etish | `✅ Ishlatilyapti` | `skillshare` orqali global ulangan va kod bazalarini tahlil qilishda faol ishlatilmoqda. |
