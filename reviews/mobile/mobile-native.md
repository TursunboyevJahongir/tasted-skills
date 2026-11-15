# `mobile-native` (Emil Kowalski)

- **Manba:** [emilkowalski/skills — `skills/mobile-native`](https://github.com/emilkowalski/skills/tree/main/skills/mobile-native)
- **Turkum:** `Mobile` *(Mobile Web & PWA)*
- **Turi:** `Skill` *(sof Markdown qoidalar, ~319 qator)*
- **Sifat bahosi:** **8.5 / 10**
- **Bizga kerakliligi:** **7.5 / 10**
- **Tavsiya etilgan ko'lam:** `Global (-g)` *(tozalangan holda)*
- **Tekshirilgan sana:** `2026-11-15`
- **Joriy holati:** `👀 Ko'rib chiqdik (sinab ko'rmadik)` *(yaxshi nomzod)*

---

## 1. Nima va qanday ishlaydi?

Muallifi — **Emil Kowalski** (`Sonner` va `Vaul` kutubxonalari muallifi, avval Linear va Vercel'da ishlagan design engineer).

Skill hech qanday tashqi skript yoki kutubxona o'rnatmaydi. U bitta aniq vazifani bajaradi: **mobil brauzerda yoki PWA ko'rinishida ochilgan veb-ilovani "oddiy veb-sayt" ekanini sezdirib qo'yadigan 11 ta platforma/CSS kamchiligini** toza CSS va `<meta>` teglar orqali tuzatadi:

1. **Yopishib qoladigan `:hover`** — barcha hover effektlarni `@media (hover: hover) and (pointer: fine)` ichiga olish.
2. **Bosganda ko'k/kulrang chaqnash** — `-webkit-tap-highlight-color: transparent` va majburiy `:active` holati.
3. **`100vh` xatosi** — URL bar sababli sakrashlarni `100dvh` (app shell/drawer) va `100svh` (hero) bilan yechish.
4. **iOS Safari input zoom muammosi** — `maximum-scale=1` (accessibility xatosi) qo'ymasdan, inputlarda `font-size: 16px` (`@media (pointer: coarse)`), `inputmode` va `enterkeyhint` berish.
5. **300ms bosish kechikishi** — `touch-action: manipulation` va javobni `click` da emas, `:active` / `pointerdown` da qaytarish (`scale(0.97)`).
6. **Pull-to-refresh va scroll zanjiri** — JS `touchmove` bloklash o'rniga `overscroll-behavior: none` (root) va `overscroll-behavior: contain` (sheet/modal ichida).
7. **Notch / Dynamic Island va ekran klaviaturasi** — `viewport-fit=cover` + `env(safe-area-inset-*)` + `interactive-widget=resizes-content`.
8. **Tugmani bosib turganda matn belgilanib qolishi** — faqat control elementlarda `user-select: none` va `-webkit-touch-callout: none`.
9. **Karusel va vertikal scroll urishib qolishi** — `touch-action: pan-y` yoki native `scroll-snap-type: x mandatory`.
10. **Status bar rangi** — light va dark rejim uchun ikkita alohida `<meta name="theme-color" media="...">`.
11. **Haqiqiy qurilmada tekshirish talabi** — Chrome DevTools emulyatori bu xatolarni ko'rsatmasligini hisobga olib, nimani koddan tekshirgani va nimani telefonda sinash shartligini ochiq aytadi.

*(Eslatma: ijtimoiy tarmoqlardagi ayrim qisqa videolarda bu skill "buzilgan desktop dizaynni avtomatik mobilga qayta chizib beradi" deb soxta B-roll bilan reklama qilinadi — aslida u layout generator emas, aynan mobil brauzer polish qatlamidir.)*

---

## 2. Qanchalik yaxshi va qanchalik yomon?

### Kuchli tomonlari
- **Ortiqcha JS yozdirmaydi:** `useIsTouchDevice()` yoki `navigator.userAgent` kabi noto'g'ri yechimlarni qat'iy taqiqlab, CSS media query va platforma imkoniyatlaridan foydalanadi.
- **Ixcham va aniq:** ~319 qator, kontekstni shishirmaydi, oxirida aniq `Never Ship` tekshiruv jadvali bor.
- **Accessibility'ni buzmaydi:** Zoom'ni o'chirib qo'yish o'rniga ildiz sababni (`16px` input shrifti) to'g'rilaydi.

### Zaif tomonlari va xarajati
- Buzilgan ko'p ustunli desktop sahifani o'zi mobil UX'ga qayta loyihalab bermaydi (buning uchun umumiy UI adaptatsiya skilli kerak).
- `html { overscroll-behavior: none; }` qoidasi oddiy maqola/kontent saytlarda pull-to-refresh'ni o'chirib qo'yishi mumkin — faqat web-app / PWA interfeyslarida qo'llash kerak.

---

## 3. Xavfsizlik va O'rnatishdan oldin tozalash (Sanitarizatsiya)

- **Xavf darajasi:** `Past`
- **Tekshirilgan nuqtalar:** Ichida hech qanday bash/python/node skript, hook, tashqi URL chaqiruvi yoki maxfiy o'zgaruvchi o'qish yo'q — toza Markdown.
- **O'rnatishdan oldin olib tashlanishi shart bo'lgan qismlar:**
  1. `SKILL.md` boshidagi **`## Initial Response`** bo'limini (savolsiz chaqirilganda faqat *"I'm ready to make your web app feel native on mobile..."* deb javob qaytarish talabi) **olib tashlash kerak** — aks holda murakkab vazifalarda agentning odatiy javob oqimiga xalaqit berishi mumkin.
  2. Qolgan barcha texnik qoidalar (`## Operating Posture`, `## Hard Rules`, `## The Symptom Table`, `## The Fixes`, `## Baseline`, `## Never Ship`) o'z holicha qoldiriladi.

---

## 4. Bizga qanchalik kerak va mavjud vositalar bilan mosligi

Mavjud global skillar bilan **to'qnashmaydi**, aksincha ochiq qolgan qatlamni to'ldiradi:
- `animate-expo` — faqat React Native / Expo native ilovalar uchun.
- `web-to-native-mobile` — veb funksiyani native iOS/Android ilovaga ko'chirish uchun (mobil vebni qamrab olmaydi).
- `impeccable` va `make-interfaces-feel-better` — umumiy UI/UX, ierarxiya, tipografiya va micro-interaction beradi, lekin `dvh/svh`, `interactive-widget`, `overscroll-behavior`, `pointer: coarse` kabi mobil brauzer pastki qatlamini bu darajada qat'iy tekshirmaydi.
- `client-performance-gate` — tarmoq va CPU tezligini tekshiradi, touch/native sezgisini emas.

---

## 5. Qaysi yo'nalish va vazifalarda foydali?

- **Qachon ishlatish kerak:** Mobil brauzerda ishlatiladigan veb-ilovalar, PWA, Telegram Mini App, bottom-sheet / drawer / karusel qatnashgan sahifalar va mobil formalarni sayqallashda.
- **Qachon ishlatmaslik kerak:** Faqat kompyuterda ishlatiladigan ichki admin panellar va toza native (`Expo` / `Swift` / `Kotlin`) ilovalarda.

---

## 6. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-11-15 | Video + GitHub `SKILL.md` to'liq auditi | `📦 Nomzod` | Sifatli va xavfsiz deb topildi. O'rnatish paytida `Initial Response` bo'limini kesib, `skillshare` orqali global qo'shish tavsiya etildi. Hozircha o'rnatilmagan. |
