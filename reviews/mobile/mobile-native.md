# `mobile-native` (Emil Kowalski — Mobile Web & PWA Platform Layer)

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/mobile/mobile-native.md) | [🇷🇺 Русский](../ru/mobile/mobile-native.md)

- **Manba:** [emilkowalski/skills — `skills/mobile-native`](https://github.com/emilkowalski/skills/tree/main/skills/mobile-native)
- **Turkum:** `Mobile` *(Mobile Web, PWA & Mini App)*
- **Turi:** `Skill` *(`SKILL.md` + lokal `LOCAL-COMPATIBILITY.md` moslik himoyasi)*
- **Sifat bahosi:** **8.5 / 10**
- **Bizga kerakliligi:** **7.5 / 10**
- **Tavsiya etilgan ko'lam:** `Global (-g)` *(tozalangan va moslashtirilgan holda)*
- **Tekshirilgan sana:** `2026-11-15`
- **Joriy holati:** `✅ Ishlatilyapti`

---

## 1. Nima va qanday ishlaydi?

Muallifi — **Emil Kowalski** (`Sonner` va `Vaul` kutubxonalari muallifi, avval Linear va Vercel'da ishlagan design engineer).

Skill hech qanday tashqi skript yoki kutubxona o'rnatmaydi. U bitta aniq vazifani bajaradi: **mobil brauzerda, PWA'da yoki mobil WebView/Mini App'da ochilgan veb-ilovani "oddiy veb-sayt" ekanini sezdirib qo'yadigan 11 ta platforma/CSS kamchiligini** toza CSS va `<meta>` teglar orqali tuzatadi:

1. **Yopishib qoladigan `:hover`** — barcha hover effektlarni `@media (hover: hover) and (pointer: fine)` ichiga olish.
2. **Bosganda ko'k/kulrang chaqnash** — `-webkit-tap-highlight-color: transparent` va majburiy `:active` holati.
3. **`100vh` xatosi** — URL bar sababli sakrashlarni `100dvh` (app shell/drawer) va `100svh` (hero) bilan yechish.
4. **iOS Safari input zoom muammosi** — `maximum-scale=1` (accessibility xatosi) qo'ymasdan, inputlarda `font-size: 16px` (`@media (pointer: coarse)`), `inputmode` va `enterkeyhint` berish.
5. **300ms bosish kechikishi** — `touch-action: manipulation` va javobni `click` da emas, `:active` / `pointerdown` da qaytarish (`scale(0.97)`).
6. **Pull-to-refresh va scroll zanjiri** — JS `touchmove` bloklash o'rniga `overscroll-behavior: none` (app-shell root) va `overscroll-behavior: contain` (sheet/modal ichida).
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
- **Ixcham va aniq:** ~315 qator, kontekstni shishirmaydi (`0` ta skript), oxirida aniq `Never Ship` tekshiruv jadvali bor va [`ponytail`](../architecture/ponytail.md) kabi qisqa javob qaytaradi.
- **Accessibility'ni buzmaydi:** Zoom'ni o'chirib qo'yish o'rniga ildiz sababni (`16px` input shrifti) to'g'rilaydi.

### Zaif tomonlari va xarajati
- Buzilgan ko'p ustunli desktop sahifani o'zi mobil UX'ga qayta loyihalab bermaydi (buning uchun [`impeccable`](../ui-ux/impeccable.md) ning `adapt` bo'limi ishlatiladi).
- `html { overscroll-behavior: none; }` qoidasi oddiy maqola/katalog saytlarda pull-to-refresh'ni o'chirib qo'yishi mumkin — shu sababli `LOCAL-COMPATIBILITY.md` orqali faqat app-shell / xarita / PWA sahifalarida qo'llash chegaralandi.

---

## 3. Xavfsizlik va O'rnatishdan oldin tozalash (Sanitarizatsiya)

- **Xavf darajasi:** `Past` *(`skillshare audit` bo'yicha skript/tarmoq xavfi `0`)*
- **Qo'llanilgan sanitarizatsiya va konflikt himoyasi:**
  1. **`## Initial Response` bloki olib tashlandi:** Savolsiz chaqirilganda faqat *"I'm ready to make your web app feel native on mobile..."* qaytarish talabi kesib tashlandi.
  2. **`description` aniq chegaralandi (Auto-trigger himoyasi):** Faqat foydalanuvchi mobil veb-ilovalari, PWA va mobil WebView/Mini App'larda ishga tushadigan qilindi; faqat kompyuterda ishlatiladigan ichki **admin panellar**, TV interfeyslar va toza **native React Native / Expo** ilovalar istisno qilindi.
  3. **O'rnatilmagan skill havolalari almashtirildi:** Asl matndagi `animate` va `review-animations` havolalari bizda ishlatilayotgan [`impeccable`](../ui-ux/impeccable.md) ga yo'naltirildi, `:active` bosish misoliga `@media (prefers-reduced-motion: reduce)` himoyasi qo'shildi.
  4. **`LOCAL-COMPATIBILITY.md` qo'shildi:** [`animate-expo`](animate-expo.md) dagi kabi lokal moslik fayli yaratilib, `impeccable`, `animate-expo`, `cross-platform-qa` va `ponytail` bilan aniq vazifa taqsimoti belgilandi.

---

## 4. Bizga qanchalik kerak va mavjud vositalar bilan mosligi

Tozalangandan keyin mavjud global skillar bilan **umuman to'qnashmaydi**, aksincha ochiq qolgan mobil brauzer qatlamini yopadi:
- **[`impeccable`](../ui-ux/impeccable.md)** — umumiy UI/UX, ierarxiya, tipografiya, responsive qayta joylashtirish (`adapt`) va veb animatsiyani (`animate`) boshqaradi; `mobile-native` esa faqat mobil brauzerning pastki platforma qoidalarini (`dvh/svh`, `interactive-widget`, `overscroll-behavior`, `pointer: coarse`, `safe-area-inset-*`) to'g'rilaydi.
- **[`animate-expo`](animate-expo.md)** — faqat React Native / Expo native ilovalardagi UI-thread harakatlar uchun.
- **`web-to-native-mobile`** — veb funksiyani native iOS/Android ilovaga ko'chirish uchun (mobil vebni qamrab olmaydi).
- **[`cross-platform-qa`](cross-platform-qa.md)** — `mobile-native` ning "oxirida haqiqiy telefonda tekshir" qoidasi 2-bosqichli QA jarayonimiz (1-bosqich lokal, 2-bosqich real telefon) bilan 100% mos tushadi.

---

## 5. Qaysi yo'nalish va vazifalarda foydali?

- **Qachon ishlatish kerak:** Mobil brauzerda ochiladigan veb-ilovalar, real-time xarita sahifalari, PWA, Telegram Mini App, bottom-sheet / drawer / karusel qatnashgan mobil veb sahifalar va formalarni sayqallashda.
- **Qachon ishlatmaslik kerak:** Faqat kompyuterda ishlatiladigan ichki admin panellar, Smart TV (WebOS) interfeyslari va toza native (`Expo` / `Swift` / `Kotlin`) ilovalarda.

---

## 6. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-11-15 | Video + GitHub `SKILL.md` dastlabki auditi | `👀 Ko'rib chiqdik` | Sifatli va xavfsiz deb topildi (`8.5/10`). |
| 2026-11-15 | Sanitarizatsiya + `LOCAL-COMPATIBILITY.md` + `skillshare` orqali global o'rnatish | `✅ Ishlatilyapti` | `Initial Response` olib tashlandi, admin/native istisnolari va `impeccable` mosligi qo'shilib, barcha 5 ta global agentga sinxronlandi. |
