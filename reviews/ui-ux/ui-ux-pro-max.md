# `ui-ux-pro-max` (NextLevelBuilder)

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/ui-ux/ui-ux-pro-max.md) | [🇷🇺 Русский](../ru/ui-ux/ui-ux-pro-max.md)

- **Manba:** [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill)
- **Turkum:** `UI/UX` *(Dizayn shablonlari, palitra va shrift qidiruvi)*
- **Turi:** `Skill + Python CLI / CSV baza`
- **Sifat bahosi:** **7.0 / 10**
- **Ishda kerak bo'lishi:** **3.5 / 10**
- **Tavsiya etilgan ko'lam:** `O'rnatmaslik` *(asosiy UI skilli sifatida kerak emas)*
- **Tekshirilgan sana:** `2026-11-15`
- 🔄 **Alternativi yaxshiroq:** [impeccable](impeccable.md) (`APCA` kontrast bilan)

---

## 1. Nima va qanday ishlaydi?

> [!IMPORTANT]
> **Oddiy tilda (Asosiy vazifasi va foydasi):** Statik CSV fayllardan bir xil rang va shrift shablonlarini tanlab beradi — `impeccable` dan ancha kuchsiz va uning ishiga xalaqit beradi.

Lokal CSV/JSON jadvallar bazasi va Python BM25 qidiruv skripti (`scripts/search.py`) ustiga qurilgan UI/UX ma'lumotnomasi:
- Ichida 80 ta UI uslub (`styles.csv`), 192 ta mahsulot/soha palitrasi (`products.csv`, `colors.csv`), 74 ta shrift juftligi (`typography.csv`, `google-fonts.csv`), 120 ta UX qoida, 25 ta diagramma turi, 17 ta GSAP animatsiya shabloni va 22 ta freymvork bo'yicha yo'riqnoma bor.
- Agent yangi sahifa yoki komponent qilayotganda terminal orqali `python search.py "<soha va kalit so'zlar>" --design-system` buyrug'ini chaqiradi, tayyor rang/shrift/sektsiya shablonini oladi va loyiha ichida `design-system/<slug>/MASTER.md` faylini yaratadi.
- Repo ichida qo'shimcha `slides`, `banner-design`, `brand`, `design-system` skillari ham mavjud (freemium model — kengaytirilgan qismi pullik platformaga yo'naltirilgan).

---

## 2. Qanchalik yaxshi va qanchalik yomon?

### Kuchli tomonlari
- Boshlovchilar yoki noldan tez prototip/MVP quruvchilar uchun qulay: tayyor rang kodlari, Google Fonts juftliklari, GSAP scroll-animatsiya presetlari va chart tavsiyalarini tez chiqarib beradi.
- Yakuniy `Pre-Delivery Checklist` (4.5:1 kontrast, `44x44px` touch target, emoji o'rniga SVG icon, `reduced-motion`) to'g'ri yozilgan.

### Zaif tomonlari va xarajati
- **Jadval bo'yicha qolipli dizayn (Paint-by-numbers):** BM25 qidiruvi CSV'dan soha bo'yicha eng ommabop klisheni tanlaydi — mavjud mahsulotning o'z xarakteridan ko'ra tayyor kategoriya shabloniga tortadi.
- **Har bir UI vazifada qo'shimcha CLI qadami:** Python skriptlarini qayta-qayta chaqirish vaqt va kontekst sarflaydi.
- **Katta hajm va freemium qatlam:** Bir necha megabaytlik CSV/JSON kataloglar hamda pullik versiya reklamalari mavjud.

---

## 3. Xavfsizlik va O'rnatishdan oldin tozalash (Sanitarizatsiya)

- **Xavf darajasi:** `O'rta` *(xavfsizlikdan ko'ra kuchli auto-trigger va arxitektura ziddiyati sababli)*
- **Tekshirilgan nuqtalar:** Python `search.py` skripti lokal CSV'larni o'qiydi (tashqi paket o'rnatmaydi), biroq `SKILL.md` ichida `${CLAUDE_PLUGIN_ROOT}` muhit o'zgaruvchisiga bog'langan yo'llar va juda keng auto-trigger tavsifi bor.
- **Agar qachondir alohida qismi (masalan `slides` yoki CSV qidiruv) kerak bo'lib o'rnatilsa, olib tashlash shart:**
  1. Asosiy `ui-ux-pro-max` skillini global (`-g`) o'rnatmaslik; kerak bo'lsa `disable-model-invocation: true` qo'shib faqat qo'lda chaqiriladigan qilish.
  2. `${CLAUDE_PLUGIN_ROOT}` yo'llarini real skill papkasi yo'liga to'g'rilash (aks holda Codex va Antigravity'da skript topilmaydi).
  3. Keraksiz qo'shimcha skillarni (`brand`, `banner-design`) va reklama havolalarini olib tashlash.

---

## 4. Bizga qanchalik kerak va mavjud vositalar bilan mosligi

Global muhitimizda allaqachon undan **ancha kuchli UI tizim (`impeccable` + `make-interfaces-feel-better`)** o'rnatilgan va ikkalasi birga yoqilsa **to'g'ridan-to'g'ri urishib qoladi**:
- `impeccable` mahsulot kontekstini `PRODUCT.md` va `DESIGN.md` da saqlaydi hamda *"soha kategoriyasiga qarab shablon rang/tema tanlashni"* qat'iy taqiqlaydi.
- `ui-ux-pro-max` esa aynan soha kategoriyasiga qarab CSV'dan shablon tanlaydi va parallel ravishda `design-system/<slug>/MASTER.md` ochadi.
- Ikkalasining ham trigger sharti deyarli bir xil bo'lgani uchun har bir frontend so'rovda agent ikki qarama-qarshi yo'riqnoma orasida qoladi.

---

## 5. Qaysi yo'nalish va vazifalarda foydali?

- **Qachon ishlatish mumkin:** Faqat `impeccable` ishlatilmaydigan muhitda tez prototip rang/shrift tanlashda yoki repo ichidagi `slides` qismini alohida HTML slaydlar uchun o'rganishda.
- **Qachon ishlatmaslik kerak:** Mavjud mahsulotlar ustida ishlaganda va `impeccable` o'rnatilgan global muhitda.

---

## 6. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-11-15 | `SKILL.md`, `pro-rules.md` va CSV/BM25 arxitekturasi auditi | 🔄 **Alternativi yaxshiroq:** [impeccable](impeccable.md) | Mavjud `impeccable` + `make-interfaces-feel-better` juftligidan kuchsizroq va ular bilan ziddiyatga kirishgani sababli o'rnatmaslikka qaror qilindi. |
