# `taste-skill` v2.5 (`design-taste-frontend`)

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/web/taste-skill.md) | [🇷🇺 Русский](../ru/web/taste-skill.md)

- **Manba:** [Leonxlnx/taste-skill](https://github.com/Leonxlnx/taste-skill) *(eski yengil versiyalari: [Leonxlnx/taste-skill-classics](https://github.com/Leonxlnx/taste-skill-classics))*
- **Turkum:** `Web` *(Marketing veb-saytlar va kompaniya landing sahifalari)*
- **Turi:** `Skill + Landing Kit + Headless Chrome Gate + Stop Hook`
- **Sifat bahosi:** **8.0 / 10** *(promo/landing saytlar uchun kuchli)*
- **Bizga kerakliligi:** **4.0 / 10** *(global muhit uchun past; faqat noldan promo-landing qurishda foydali)*
- **Tavsiya etilgan ko'lam:** `Faqat alohida loyihaga (-p)` *(tozalangan holda; globalga o'rnatmaslik)*
- **Tekshirilgan sana:** `2026-11-15`
- **Joriy holati:** `👍 Yaxshi variant`

---

## 1. Nima va qanday ishlaydi?

> [!IMPORTANT]
> **Oddiy tilda (Asosiy vazifasi va foydasi):** Noldan chiroyli reklama/promo-landing sahifa yig'ishda foydali to'plam, lekin ichidagi 600 soniyalik `Stop` hook olib tashlanib, faqat o'sha landing loyihasining o'ziga (`-p`) ulanishi shart. Kundalik dastur ekranlari uchun `impeccable` ishlatiladi.

Eski v1 versiyasidan farqli o'laroq, `tasteskill 2.5.1` (`design-taste-frontend`) endi oddiy did qoidalari emas, balki **`figma.com` va `x.ai` darajasidagi kompaniya vizitka/landing saytlarini quruvchi og'ir dvigatel**:
- Ichida tayyor **`system.css`, `system.js`, `starter.html`**, WebGL/shader komponentlar (`fx-globe`, `fx-dither-object`, `fx-feature-card`), litsenziyalangan haqiqiy rasmlar kutubxonasi (`photos.mjs`) va Node 22+ skriptlar to'plami bor.
- Saytlarni 6 ta biznes turiga (`software`, `tech`, `gaming`, `product`, `service`, `place`) ajratadi: texnik/o'yin saytlariga WebGL shader qo'shadi, kafe/do'kon/servis saytlarida esa shaderlarni taqiqlab haqiqiy fotografiya va tipografiya ishlatadi.
- **`consistency.mjs` va `gate.mjs`:** Sahifani headless Chrome'da `1440`, `1024`, `820`, `768`, `390` px kengliklarda ochib tekshiradi, copy-linter bilan "AI-slop" iboralarni ushlaydi va xato topilsa build'ni to'xtatadi.

---

## 2. Qanchalik yaxshi va qanchalik yomon?

### Kuchli tomonlari
- Noldan kompaniya promo-sayti yoki startap landing sahifasini qurganda bir xil "AI shablon" emas, balki haqiqiy fotografiyali, toza matnli va 5 xil ekran o'lchamida tekshirilgan yuqori darajali natija chiqaradi.
- WebGL kontekstlar sonini (maksimum 4 ta) va mobil/reduced-motion fallback'larni nazorat qiladi.

### Zaif tomonlari va xarajati
- **Funksional web-app emas, faqat promo-sayt qolipi:** *"Har bir sektsiya aniq 1 ekran (`1440x900`) bo'lsin"*, *"rasm tagida izoh bo'lmasin"*, *"loyihaning `public/` papkasiga mening `system.css` va `system.js` fayllarimni joyla"*, *"Next.js bo'lsa `static export` qil"* kabi qat'iy talablari bor — mavjud murakkab veb-ilovalarni (dashboard, xarita, video katalog, admin panel) buzib qo'yishi mumkin.
- **Katta hajm (~130+ MB repo/assetlar)** va Node 22+ + Chrome bog'liqligi.

---

## 3. Xavfsizlik va O'rnatishdan oldin tozalash (Sanitarizatsiya)

- **Xavf darajasi:** `O'rta–Yuqori` *(global o'rnatilganda agent oqimini bloklashi va begona kod kiritishi sababli)*
- **Tekshirilgan nuqtalar:**
  1. **`Stop` hook mavjud:** `SKILL.md` frontmatter qismida `hooks: Stop:` yozilgan bo'lib (`timeout: 600` soniya!), agent har to'xtaganda `node scripts/gate.mjs --hook claude` ni ishga tushirishga urinadi.
  2. **Tarmoq va fayl tizimi:** `photos.mjs` va `icons.mjs` qo'shimcha rasm/shrift/ikonka kerak bo'lganda internetga murojaat qiladi va loyiha ichida `.taste-skill/` papkasini ochadi.
  3. **O'ta keng auto-trigger:** Tavsifida React, Next.js, Vue, Tailwind'dagi har qanday sahifa dizayni yoki *"AI qilganga o'xshaydi"* degan gapga avtomatik ulanib ketishi yozilgan (`impeccable` bilan to'qnashadi).
- **Agar alohida yangi landing loyihaga (`-p`) o'rnatilsa, oldin olib tashlash SHART bo'lgan qismlar:**
  1. `SKILL.md` frontmatter'idagi **`hooks: Stop:` blokini butunlay o'chirib tashlash** (`consistency.mjs` va `gate.mjs` ni avtomatik hook emas, kerak paytda oddiy buyruq bilan ishlatish).
  2. Hech qachon global (`-g`) o'rnatmaslik — faqat yangi landing repozitoriysining o'ziga (`-p`) ulash yoki `disable-model-invocation: true` qo'yish.

---

## 4. Bizga qanchalik kerak va mavjud vositalar bilan mosligi

- Kundalik veb-ilovalar va mahsulot interfeyslari uchun mavjud **`impeccable`** (`Operate` va `Persuade` rejimlari) + **`make-interfaces-feel-better`** ancha xavfsiz, chunki ular loyihaning o'z stekini buzmaydi va begona `system.css` kiritmaydi.
- Shu sababli global bazaga qo'shilmaydi; faqat noldan mustaqil marketing/vizitka sayti quriladigan vaziyat uchun katalogda "maxsus qurol" sifatida eslab qolinadi.

---

## 5. Qaysi yo'nalish va vazifalarda foydali?

- **Qachon ishlatish kerak:** Noldan yangi mahsulot, startap, o'yin yoki xizmat uchun alohida repoda boy vizual promo/landing sayt qurilganda (yuqoridagi sanitarizatsiya bilan `-p` rejimda).
- **Qachon ishlatmaslik kerak:** Mavjud React/Next.js web-app, SaaS ichki kabineti, xarita/pleyer tizimlari va admin panellarda.

---

## 6. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-11-15 | `tasteskill 2.5.1` kodi, skriptlari va `Stop` hook auditi | `👍 Yaxshi variant` | Global o'rnatish rad etildi (`Stop` hook va web-app arxitekturasiga zidligi sababli). Alohida landing loyihalar uchun sanitarizatsiya qo'llanmasi bilan zaxiraga olindi. |
