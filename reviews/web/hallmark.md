# `Hallmark v2` (`Nutlope/hallmark` — Anti-Slop Web & Landing Design Engine)

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/web/hallmark.md) | [🇷🇺 Русский](../ru/web/hallmark.md)

- **Manba:** [Nutlope/hallmark](https://github.com/Nutlope/hallmark) · [usehallmark.com](https://www.usehallmark.com)
- **Turkum:** `Web` *(Noldan Landing Page, Promo-Sayt qurish va To'liq Veb Redesign tizimi)*
- **Turi:** `Skill + Node.js Linter/CLI Skriptlar (50 tema + sloplint + capture)`
- **Sifat bahosi:** **9.0 / 10**
- **Ishda kerak bo'lishi:** **4.5 / 10** *(landing va promo-saytlar har kuni qurilmagani uchun — kerak bo'lganda loyihaga `-p` ulab yoki faqat `/hallmark` bilan chaqirib ishlatiladi)*
- **Tavsiya etilgan ko'lam:** `Faqat kerak bo'lganda loyiha darajasida (-p) yoki auto-trigger o'chirilgan holda (/hallmark)`
- **Tekshirilgan sana:** `2026-11-17`
- **Joriy holati:** `👍 Yaxshi variant` *(landing page va marketing saytlar qurishda `taste-skill` dan ustun va `impeccable` da yo'q tayyor vositalarga ega kuchli tanlov)*

---

## 1. Nima va qanday ishlaydi?

> [!IMPORTANT]
> **Oddiy tilda (Asosiy vazifasi va foydasi):** Noldan **yangi landing page, mahsulot tanishtiruv sayti (promo-sayt) qurish** yoki eski veb-sahifani bitta ham link/formani yo'qotmasdan to'liq yangilash (`redesign`) uchun juda kuchli tanlov. Doimiy avto-yoqib qo'ymasdan, **aynan landing sayt kerak bo'lganda** ulab ishlatish eng to'g'ri yo'l.

Together AI (Hassan El Mghari / `Nutlope`) tomonidan yaratilgan open-source (`MIT`) veb-dizayn tizimi (`7.1 MB`, tashqi npm paketlarsiz `7,571` qator toza Node.js `.mjs` kod):

1. **50 ta tayyor ko'rib-tanlanadigan dizayn-mavzu (`references/themes/` + [usehallmark.com](https://www.usehallmark.com)):** Har bir mavzu (`Cobalt`, `Dusk`, `Atelier`, `Studio`, `Terminal`, `Ribbon` va b.) tayyor shrift, OKLCH rang tokenlari, sirt va komponent uslubiga ega; `theme.mjs deal/scaffold` ketma-ket ikki sayt bir xil shablon bo'lib qolmasligini ta'minlaydi (`custom` rejimida esa mavzusiz noldan chizadi).
2. **`sloplint.mjs` (`4,426` qator) + `sloplint-render.mjs` (`1,283` qator):** Yozilgan `.html`, `.css`, `.jsx/.tsx/.vue` kodni ham statik, ham `Chrome` orqali **8 xil ekran o'lchamida (`320px` dan `1920px` gacha)** tekshiradi:
   - binafsha-ko'k gradient, emoji-ikonka, karta ichida karta va `transition: all` ni taqiqlaydi;
   - har sarlavha ustidagi `UPPERCASE EYEBROW` va sarlavhadagi yolg'iz *italic* so'zni ushlaydi;
   - **uydirma statistika** (*"10,000+ mijoz", "99.9% uptime"*), yolg'on mijoz sharhlari va hech qayerga so'rov yubormaydigan **soxta formalarni** (`sloplint.mjs:3166`) `FAIL` qiladi;
   - birinchi ekran (`Hero`) `1280x800` ga skrollsiz sig'ganini pikselida tekshiradi.
3. **755 ta qonuniy real fotosurat (`photos.json`) va Avto-Skrinshot (`capture.mjs`):** Ishlab turgan real dasturingizdan (`localhost` yoki Electron `--cdp`) avtomatik skrinshot oladi yoki `Wikimedia Commons` (`CC0 / CC-BY`) bazasidan real surat qo'yib, mualliflik kreditini yozadi.
4. **Yo'qotishsiz Redesign (`sloplint --before` va `--kept`):** Eski sahifadagi barcha link, input, tugma va sarlavhalarni ro'yxatga olib, redesign tugaganda birortasi tushib qolgan bo'lsa `FAIL` beradi va yonma-yon `Before / After` (`compare.html`) chiqaradi.

---

## 2. Solishtiruv: Nega `impeccable` uning o'rnini bosa olmaydi (va nega `Hallmark` faqat kerak paytda ishlatiladi)?

`impeccable` va `Hallmark v2` bir-birini almashtirmaydi — ular **ikki xil vazifada** kuchli:

| Mezon | 🏆 **`Hallmark v2`** *(Landing va Promo-saytda ustun)* | 🏆 [**`impeccable`**](../ui-ux/impeccable.md) *(Kundalik App va Mobilda ustun)* | [**`taste-skill v2.5`**](taste-skill.md) |
|---|---|---|---|
| **Ko'rib tanlanadigan tayyor mavzular** | ✅ **50 ta tayyor mavzu** (`usehallmark.com` + `tokens.css` scaffold) | ❌ Tayyor mavzu katalogi yo'q (har safar noldan g'oya o'ylaydi) | ⚠️ Faqat dial parametrlar (`1–10`) |
| **Tayyor real fotosuratlar bazasi** | ✅ **755 ta litsenziyali real foto** (`Wikimedia Commons`) | ❌ Yo'q (placeholder yoki AI rasm generatsiya) | ❌ Yo'q |
| **Mahsulotdan avto-skrinshot olish** | ✅ **`capture.mjs`** (`localhost` va Electron `--cdp`) | ❌ Yo'q | ❌ Yo'q |
| **Redesign'da link/input yo'qolmaslik kafolati** | ✅ **Mexanik `sloplint --before` / `--kept` diff** | ⚠️ Faqat matnli eslatma (mexanik tekshirgich yo'q) | ❌ Yo'q |
| **Soxta forma va uydirma raqam tekshiruvi** | ✅ **Mexanik `sloplint` (`8` ekran kengligida)** | ⚠️ Vizual anti-pattern skaneri (`impeccable detect`) | ❌ Yo'q |
| **Native `iOS` / `Android` / `Expo` qamrovi** | ❌ **Yo'q (faqat Web HTML/CSS/JSX)** | ✅ **To'liq (`ios.md`, `android.md`, `adapt.native.md`)** | ❌ Yo'q (faqat Web) |
| **Rangli tugmalarda kontrast formulasi** | ⚠️ Eski **`WCAG 2`** (ko'k/olovrang tugmadagi oq yozuvni yiqitadi) | ✅ **`APCA` (`\|Lc\| ≥ 60`)** (toza oq yozuvni saqlaydi) | ⚠️ `WCAG 2` |
| **Tezlik va kundalik ishga mosligi** | ⚠️ 7 bosqichli og'ir landing sikli (2 marta subagent + Chrome) | ✅ Kundalik dashboard/app/mobil ekranlarda tez va yengil | ⚠️ 600s bloklovchi `Stop` hooki bor |

**Nega doimiy avto-yoqib qo'ymasdan, faqat kerak bo'lganda ishlatamiz?**
1. **Faqat Web uchun:** Mobil (`Expo / React Native / Swift / Kotlin`) loyihalarda ishlamaydi.
2. **Global auto-trigger urishishi:** `SKILL.md` dagi *"Use when the user asks to build or design something new"* qoidasi global turganda oddiy ichki admin/app komponentlarida ham `impeccable` bilan ustma-ust uyg'onib, CSS tepasiga `/* Hallmark */` shtamp va `.hallmark/` papka ochishga urinadi.
3. **Eski `WCAG 2` kontrast cheklovi (`sloplint-render.mjs:15-20`):** To'q olovrang, ko'k yoki yashil brend tugmalaridagi toza oq yozuvni `sloplint` xato deb topadi.

---

## 3. Xavfsizlik va Kerak bo'lganda to'g'ri ulash (Sanitarizatsiya)

- **Xavf darajasi:** `Past` *(toza `MIT` manba kodi, yashirin telemetriya yoki reklama yo'q)*
- **`skillshare audit` tahlili:** Skaner chiqargan ogohlantirishlar tekshirilganda yolg'on trevoga (`Host Grotesk` shrift nomidagi `Host` so'zi va `<prompt>` matni) ekani tasdiqlandi. Skriptlar faqat `upload.wikimedia.org` (rasm saqlashda) va ixtiyoriy `TOGETHER_API_KEY` berilganda `api.together.xyz` ga murojaat qiladi.
- **Kerak bo'lganda qanday ishlatish tavsiya etiladi:**
  1. **Landing page loyihaning o'ziga (`-p`) ulash:** `npx skills add nutlope/hallmark` (global `-g` siz, faqat o'sha landing repoga).
  2. **Agar global saqlansa:** `SKILL.md` frontmatteriga `disable-model-invocation: true` (va `agents/openai.yaml` da `allow_implicit_invocation: false`) qo'ying — shunda u kundalik ishga aralashmaydi va faqat siz aniq `/hallmark` yoki `$hallmark` deb chaqirganingizda ishga tushadi.
  3. To'liq 8-o'lchamli brauzer tekshiruvi (`sloplint --render`) ishlashi uchun `puppeteer-core` bo'lishi yetarli (bo'lmasa statik `sloplint` o'zi ishlayveradi).

---

## 4. Qaysi yo'nalish va vazifalarda foydali?

- **Qachon ishlatish kerak:** Noldan yangi **Landing Page, SaaS promo-sayt, portfolio, mahsulot taqdimot sahifasi** qurishda yoki mavjud marketing saytni barcha link/formalarni saqlagan holda to'liq **Redesign** qilishda.
- **Qachon ishlatmaslik kerak:** Kundalik ichki web-app, admin panel, murakkab dashboard va native `iOS`/`Android`/`Expo` mobil ilova ekranlarida (ularda [**`impeccable`**](../ui-ux/impeccable.md) + [**`mobile-native`**](../mobile/mobile-native.md) + [**`animate-expo`**](../mobile/animate-expo.md) ishlatiladi).

---

## 5. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-11-17 | `Nutlope/hallmark` (`v2.0.0`) manba kodi (`SKILL.md`, `7,571` qator skriptlar, 50 ta mavzu), `skillshare audit` va `impeccable` bilan qiyosiy tahlil | `👍 Yaxshi variant` | Landing page va promo-saytlar qurish uchun eng kuchli tanlov sifatida katalogga kiritildi (kundalik ishga xalaqit bermasligi uchun faqat landing loyihada `-p` yoki aniq `/hallmark` chaqiruvi bilan ishlatiladi). |
