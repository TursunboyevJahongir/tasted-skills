# Sinab ko'rilgan va ishlatilayotgan AI Skill hamda Tool'lar

**🇺🇿 O'zbekcha** | [🇬🇧 English](README.en.md) | [🇷🇺 Русский](README.ru.md)

**Holatlar (qaysi belgi nimani bildiradi):**
- `✅ Ishlatyapman` — har kuni doimiy ishlataman.
- `👍 Yaxshi variant` — sifatli vosita, mos vaziyat chiqqanda ishlatishga arziydi.
- 🔄 **Alternativi yaxshiroq:** `[havola]` — o'zi yaxshi, shunchaki bizda undan qulayroq muqobili bor (alohida qatorda havolasi bilan beriladi).
- `⚠️ Tavsiya etilmaydi` — xavfi yoki zarari bor (har birida sababi yozilgan).

**Baholar (ikkisi ikki xil narsa):**
- **`Sifat` (`1–10`)** — vositaning o'zi qanchalik sifatli ishlangani.
- **`Ishda kerak bo'lishi` (`1–10`)** — kundalik ishda qanchalik tez-tez kerak bo'lishi *(`3/10` — yomon degani emas, shunchaki kam kerak bo'ladi)*.

> [!TIP]
> **🛡️ Xavfsizlik qoidamiz (sizga ham tavsiya):** Hech qachon begona skill, plugin yoki MCP serverni faqat chiroyli `README` yoki yulduzlariga qarab o'rnatmang. Biz har bitta nomzodni o'rnatishdan oldin **o'zimizning AI coding agentga uning ichki kodini (`SKILL.md`, skriptlar, hooklar, tarmoq/env murojaatlari) o'qitib tekshirtiramiz** hamda [**skillshare**](reviews/developer-tools/skillshare.md) ichidagi tayyor `skillshare audit` tekshiruvidan o'tkazamiz.

📖 [Qaysi skill va tool'larni bir-biri bilan birga ishlatish bo'yicha amaliy qo'llanmalar →](practices/README.md) · [⚖️ Pastdagi batafsil solishtirishlar jadvaliga tushish ↓](#batafsil-solishtirishlar)

---

## ⭐ Eng keraklilari (Kundalik ishlatilish tartibi bo'yicha)

### 1. [grill-me](reviews/architecture/grill-me.md) — Ishni boshlashdan oldin oxirigacha o'ylab olish va chuqur debug
`✅ Ishlatyapman` · **Sifat:** `9.5/10` · **Ishda kerak bo'lishi:** `9.5/10` · **Turi:** Skilllar to'plami · **Sana:** `2026-05-23` dan

Vazifani AI'ga *"shu taskni qil"* deb ko'r-ko'rona topshirib yuborishdan saqlaydi: kod yozishdan oldin qisqa savol-javoblar bilan sizni ham, AI'ni ham bitta aniq rejaga olib keladi. Natijada xato yo'ldan ketib, bitta ishni ikki-uch marta qayta yozib tekshirishga vaqt ham, token ham ketmaydi (`~2–3x` tejamkorlik), o'zingiz ko'rmay qolgan nozik holatlarni esa boshidayoq o'ylab olasiz. *(To'plam ichida qiyin xatolarni sababigacha topadigan **`diagnosing-bugs`** va arxitektura tahlili **`improve-codebase-architecture`** ham bor).*

### 2. [graphify](reviews/architecture/graphify.md) — Loyiha qolipini chizish va tokenni `~10x–20x` gacha tejash
`✅ Ishlatyapman` · **Sifat:** `9.5/10` · **Ishda kerak bo'lishi:** `9.5/10` · **Turi:** Skill + Python CLI · **Sana:** `2026-07-28` dan

Butun loyihaning qolipini — qaysi fayl, modul va funksiya qayerga bog'langanini kompyuterning o'zida **`0` token sarflab** xaritaga (`graph.json` + HTML) tushirib qo'yadi. Keyingi vazifalarda AI yuzlab fayllarni bittalab o'qib token yoqmasdan, tayyor xaritadan kerakli joyni soniyada topadi.

<details>
<summary>📊 Solishtiruv va statistika (`graphify` USIZ vs `graphify` BILAN)</summary>

- **`graphify` USIZ (odatiy fayl qidirish):** AI katta repoda bog'liqliklarni topish uchun o'nlab fayllarni qayta-qayta o'qiydi (`~15,000–40,000` token sarfi), murakkab arxitektura savollarida aniqlik `~70.8%`.
- **`graphify` BILAN:** AST xarita lokalda `0` tokenga quriladi, so'rovlarda **token sarfi `~10x–20x` (`~85–95%`) kamayadi** va javob aniqligi **`82%` ga ko'tariladi**.
- 📖 [Batafsil sharh →](reviews/architecture/graphify.md) · [Pastdagi solishtiruv ↓](#batafsil-solishtirishlar)

</details>

### 3. [ponytail](reviews/architecture/ponytail.md) — Ortiqcha murakkabliksiz eng qisqa toza kod va lo'nda javob
`✅ Ishlatyapman` · **Sifat:** `9.5/10` · **Ishda kerak bo'lishi:** `9.5/10` · **Turi:** Skill · **Sana:** `2026-11-15` dan

AI'ning eng yomon odati — 10 qatorlik ishni 200 qatorlik keraksiz "universal arxitektura"ga aylantirish va uzun insho yozishni to'xtatadi. Vazifani to'liq hal qiladigan **eng kichik va toza kod** yozdiradi hamda bir o'qishda tushunarli qisqa javob qaytaradi (**chiqish tokeni va kod hajmini `~2–4x` gacha kamaytiradi**).

### 4. [karpathy-guidelines](reviews/architecture/karpathy-guidelines.md) — Qo'shni kodni buzmasdan faqat kerakli joyni aniq o'zgartirish
`✅ Ishlatyapman` · **Sifat:** `9.5/10` · **Ishda kerak bo'lishi:** `9.5/10` · **Turi:** Skill · **Sana:** `2026-11-15` dan

Ishlab turgan loyihada AI "yo'l-yo'lakay boshqa joylarni ham chiroyli qilaman" deb sog'lom kodni buzib qo'yishining oldini oladi. Noaniq joylarni jimjit taxmin qilmasdan oldindan aytishga va jarrohlik aniqligida **faqat so'ralgan qatorlarni** tahrirlashga majburlaydi.

### 5. [impeccable](reviews/ui-ux/impeccable.md) — Web va Mobil ilovalar uchun tayyor dizayner va UX tekshiruvchi
`✅ Ishlatyapman` · **Sifat:** `9.5/10` · **Ishda kerak bo'lishi:** `9.5/10` · **Turi:** Skill · **Sana:** `2026-11-09` dan

AI chizgan bir xil shablon ("AI-slop") dizaynlarni taqiqlab, Web, mobil veb va iOS/Android ekranlarni professional darajada loyihalaydi va tozalaydi (`polish`, `clarify`, `harden`). **💡 Muhim qo'shimcha:** rangli tugmalarda (`ko'k`, `olovrang`, `yashil`) eski `WCAG 2` formulasi toza oq yozuvni xira qoraga o'zgartirib yubormasligi uchun ichiga **`APCA` (`|Lc| ≥ 60`) ko'zga mos kontrast** qoidasini qo'shganmiz ([nimalar o'zgartirilgani](reviews/ui-ux/impeccable.md#apca-contrast)).

### 6. [elephant-goldfish-model](reviews/architecture/elephant-goldfish-model.md) — O'z xatosini yashirmaydigan mustaqil Arxitektura va Kod tekshiruvi
`✅ Ishlatyapman` · **Sifat:** `9.5/10` · **Ishda kerak bo'lishi:** `9.5/10` · **Turi:** Plugin (7 skill + 10 agent) · **Sana:** `2026-11-15` dan

Kod yozgan AI o'z ishini o'zi tekshirsa, xatosini maqtab o'tkazib yuboradi. Bu plugin oldingi suhbatni umuman ko'rmagan "xotirasiz" tanqidchi subagentlarni (*Goldfish*) chaqirib, yozilgan reja yoki kodni noldan ayovsiz tekshirtiradi va hujjat bilan real kod bir-biridan farq qilib ketgan joylarni (`egm-drift-report`) topib beradi.

### 7. [agent-desktop](reviews/developer-tools/agent-desktop.md) — Sichqonchani tortib olmasdan Chrome va Desktop dasturlarni fonda test qilish
`✅ Ishlatyapman` · **Sifat:** `9.5/10` · **Ishda kerak bo'lishi:** `10.0/10` · **Turi:** CLI + Skill · **Sana:** `2026-11-15` dan

Siz kompyuterda o'z ishingizni qilaverasiz — AI esa kursoringizga tegmasdan va oynani oldinga chiqarmasdan, orqa fonda ochiq turgan (login qilingan) `Google Chrome` yoki macOS dasturlaridagi tugmalarni bosib, formalarni to'ldirib UI'ni o'zi tekshiradi (og'ir skrinshotlar o'rniga yengil matnli daraxt o'qigani uchun **tokenni `~5–10x` tejaydi**).

### 8. [agent-device](reviews/mobile/agent-device.md) — Mobil va TV (`iOS` / `Android` / `tvOS`) ilovalarni oynasiz fonda test qilish
`✅ Ishlatyapman` · **Sifat:** `9.5/10` · **Ishda kerak bo'lishi:** `9.5/10` · **Turi:** CLI + Skill · **Sana:** `2026-11-16` dan

Ekranda birorta ham simulyator oynasini ochmasdan, orqa fonda iOS/tvOS (`~0.2s`) va Android/TV (`~0.9s`, o'zbekcha UTF-8 yozuv bilan) ilovalarni o'zi bosib tekshiradi; ustiga Java o'rnatmasdan tayyor Maestro `.yaml` E2E testlarni ham yurgizadi.

<details>
<summary>📊 Solishtiruv va statistika (`agent-device` vs `mobile-mcp` vs `ARTEMIS` vs `adb`)</summary>

- **`agent-device` bilan:** Doimiy kontekst yuki **`0` token**; iOS oynasiz fonda **`197 ms` (`~141` token)**; Android jonli xarita ekranida **`888 ms` (`~100` token)**; qo'shimcha API to'lovi **`$0`**.
- **`mobile-mcp` bilan:** Har bitta xabarda **`~7,580` token** bekorga yonadi; iOS `7,277 ms` (`37x` sekin), Android `5,788 ms` (`6.5x` sekin).
- **`ARTEMIS` bilan:** Faqat Android (`iOS`/`TV` yo'q), har qadami `3–40 soniya` va `.env` da alohida pullik LLM API kalit talab qiladi.
- 📖 [Batafsil sharh →](reviews/mobile/agent-device.md) · [Pastdagi solishtiruv ↓](#batafsil-solishtirishlar)

</details>

### 9. [sentry](reviews/backend/sentry.md) — Production'dagi xatolar, sekin so'rovlar va foydalanuvchi ekran yozuvi
`✅ Ishlatyapman` · **Sifat:** `9.5/10` · **Ishda kerak bo'lishi:** `9.5/10` · **Turi:** Self-Hosted + Skill / MCP · **Sana:** `2026-07-08` dan

Mijozda xato chiqqanda "qanday qilib buzildi ekan?" deb taxmin qilib o'tirmaysiz: Backend, Web va Mobil crash'larning aniq kod qatorini, xatodan oldin bosilgan tugmalarni (`Breadcrumbs`), videodek ekran yozuvini (`Session Replay`) va sekin API/SQL so'rovlarni yig'ib, to'g'ridan-to'g'ri AI'ga tahlil qilib beradi.

### 10. [skillshare](reviews/developer-tools/skillshare.md) — Barcha AI'lar uchun bitta skill markazi va xavfsizlik tekshiruvi (`audit`)
`✅ Ishlatyapman` · **Sifat:** `9.5/10` · **Ishda kerak bo'lishi:** `10.0/10` · **Turi:** CLI + Skill · **Sana:** `2026-05-30` dan

`Codex`, `Claude` va `Antigravity` uchun skilllarni har biriga qo'lda alohida ko'chirib yurish azobini yo'qotadi — bitta papkadan hammasiga birdan tarqatadi. Ichidagi **`skillshare audit`** skaneri esa yangi skill ichida yashirin virus, prompt-injection yoki token shishishi bor-yo'qligini `0.1` soniyada tekshirib beradi.

### 11. [animate-expo](reviews/mobile/animate-expo.md) — Expo / React Native ilovalarda qotmaydigan (`60/120fps`) silliq animatsiya
`✅ Ishlatyapman` · **Sifat:** `9.5/10` · **Ishda kerak bo'lishi:** `9.0/10` · **Turi:** Skill · **Sana:** `2026-11-09` dan

Simulyatorda silliq ko'rinib, haqiqiy Android yoki iPhone'da qotib qoladigan animatsiyalarning oldini oladi. Barcha harakat va jestlarni (`bottom-sheet`, `swipe`, `press`, `haptics`) asosiy JS oqimini band qilmasdan `Reanimated` UI oqimida toza yozdiradi.

### 12. [Orca](reviews/developer-tools/orca.md) — Bitta promptdan bir nechta AI'ni ishlatish va telefondan uzilmay boshqarish
`✅ Ishlatyapman` · **Sifat:** `9.5/10` · **Ishda kerak bo'lishi:** `9.5/10` · **Turi:** Desktop + Mobile App + CLI + Skill · **Sana:** `2026-11-16` dan

Bitta xabarda *"Codex kod yozsin, Claude rejasini tekshirsin, Gemini natijani test qilsin"* desangiz, asosiy agentning o'zi boshqa AI'larni ishga tushirib, xulosani bitta chatga yig'ib beradi (`orca orchestration`). Kompyuter blokda (`Lock Screen`) tursa ham uxlamaydi (`caffeinate`) va telefondagi **`Orca IDE`** ilovasidan aloqa uzilmay ishlaydi (`PostHog` telemetriyasi o'chirilgan).

<details>
<summary>📊 Solishtiruv va statistika (`Orca` vs `T3 Code`)</summary>

- **`Orca` bilan:** `12` ta repo + `3` agent bilan **`841 MB` RAM** (`0.2%` CPU), Chat UI ichida jonli subagent kartalari (`orca orchestration`), `Lock Screen` da `caffeinate` bilan uzilmasdan ishlaydi, rasmiy App Store / Play Store ilovasi bor.
- **`T3 Code` bilan:** `~1.1–1.4 GB` RAM + `~/.t3` da `~3.87 GB` kesh, kompyuter bloklanganda va telefon ekrani o'chganda ulanish tez-tez uzilib qoladi, UI ichida subagent kartalari yo'q.
- 📖 [Batafsil sharh →](reviews/developer-tools/orca.md) · [Pastdagi solishtiruv ↓](#batafsil-solishtirishlar)

</details>

### 13. [adb](reviews/mobile/adb.md) — Android port ulash (`reverse`), `logcat` xatolarini o'qish va APK o'rnatish
`✅ Ishlatyapman` · **Sifat:** `9.0/10` · **Ishda kerak bo'lishi:** `10.0/10` · **Turi:** CLI · **Sana:** `2026-09-07` dan

Android emulyator va haqiqiy telefonlarda lokal backend portlarini ulash (`adb reverse`), ilova yiqilganda aniq xato loglarini (`logcat`) olish va APK o'rnatish uchun eng ishonchli past darajadagi vosita (bir nechta qurilma ulanganda `-s <serial>` ko'rsatish majburiy).

### 14. [xcrun simctl + Device Hub](reviews/mobile/ios-simulator-device-hub.md) — iOS simulyatorni oynasiz yoqish va haqiqiy iPhone'ga ilova o'rnatish
`✅ Ishlatyapman` · **Sifat:** `9.0/10` · **Ishda kerak bo'lishi:** `9.5/10` · **Turi:** Xcode CLI + App · **Sana:** `2026-10-20` dan

iOS Simulator'ni ekranni to'smasdan fonda yoqib-o'chiradi (`simctl boot/shutdown`) va kabel/Wi-Fi orqali haqiqiy iPhone'ga tayyor build'ni o'rnatadi (`devicectl`).

### 15. [simslim](reviews/mobile/simslim.md) — iOS / tvOS Simulator RAM sarfini `-57%` (`-77.5%` GUI da) kamaytirish
`✅ Ishlatyapman` · **Sifat:** `9.0/10` · **Ishda kerak bo'lishi:** `7.5/10` · **Turi:** Standalone Go CLI · **Sana:** `2026-11-16` dan

iOS Simulator ichida bekorga yotadigan `~150+` ta keraksiz Apple fon xizmatini (`Siri`, `Apple Intelligence`, `Wallpaper`) o'chirib, simulyator RAM sarfini keskin kamaytiradi va ilovalarga tegmay ortiqcha keshni tozalaydi (`push` va `agent-device` buzilmaydi).

<details>
<summary>📊 Solishtiruv va statistika (`simslim` USIZ vs `simslim` BILAN)</summary>

- **`simslim` USIZ (odatiy iOS 26.5 Simulator):** Oynasiz fonda **`2.70 GB` RAM** (`182` ta jarayon), oynali GUI rejimda **`~4.0 GB` RAM**; `simctl erase` qilinsa o'rnatilgan ilova va loginlar o'chib ketadi.
- **`simslim` BILAN:** Oynasiz fonda **`1.16 GB` RAM (`-57%`, `-1.54 GB` tejaldi, `78` ta jarayon)**, GUI rejimda **`~0.9 GB` RAM (`-77.5%`)**, ilovalarga tegmay **`+1.51 GB` disk tozalanadi**, Push/Universal Links/GPS `4/4 OK`.
- 📖 [Batafsil sharh →](reviews/mobile/simslim.md) · [Pastdagi solishtiruv ↓](#batafsil-solishtirishlar)

</details>

### 16. [avdslim](reviews/mobile/avdslim.md) — Android Emulator RAM sarfini `-40%` qisqartirish va Mac GPU tezlatgichi
`✅ Ishlatyapman` · **Sifat:** `9.0/10` · **Ishda kerak bo'lishi:** `7.5/10` · **Turi:** Standalone Go CLI · **Sana:** `2026-11-16` dan

Android Emulator kompyuterni qotirib qo'ymasligi uchun grafikani sekin CPU'dan to'g'ridan-to'g'ri **Apple Metal GPU**'ga o'tkazadi va Golden Snapshot bilan xotira hamda yonish vaqtini keskin qisqartiradi (`defaults` himoyasi bilan GPS va Google Maps 100% ishlaydi).

<details>
<summary>📊 Solishtiruv va statistika (`avdslim` USIZ vs `avdslim` BILAN)</summary>

- **`avdslim` USIZ (odatiy API 35 AVD):** **`4.41 GB` RAM** (Android Studio standart AVD'da **`~8.5 GB`**), sekin `SwiftShader` CPU grafikasi, sovuq yonish vaqti `22.81s`.
- **`avdslim` BILAN:** **`2.64 GB` RAM (`-40.2%`, Studio AVD'dan `-69%`)**, native **Apple Metal GPU (`host`)**, tayyor Golden Snapshot bilan **`13.79s` da yonadi** (`1.65x` tez).
- 📖 [Batafsil sharh →](reviews/mobile/avdslim.md) · [Pastdagi solishtiruv ↓](#batafsil-solishtirishlar)

</details>

### 17. [security-audit](reviews/backend/security-audit-skill.md) — Server ko'tarmasdan kod ichidagi xavfsizlik teshiklarini topish
`✅ Ishlatyapman` · **Sifat:** `9.0/10` · **Ishda kerak bo'lishi:** `7.5/10` · **Turi:** Skill · **Sana:** `2026-11-16` dan

PR yoki reliz oldidan Docker yoqmasdan Backend, Web va **Mobil (`deep-link`, `WebView`)** kodlarini xaker ko'zi bilan o'qib chiqadi. Yolg'on trevogalarni kamaytirish uchun bitta subagent topgan zaiflikni ikkinchi mustaqil subagent qayta tekshirib tasdiqlaydi (kvota yemasligi uchun tejamkor `quick/scoped` rejim o'rnatilgan).

### 18. [mobile-native](reviews/mobile/mobile-native.md) — Mobil sayt, PWA va Mini App'larni telefonda native ilovadek silliq qilish
`✅ Ishlatyapman` · **Sifat:** `8.5/10` · **Ishda kerak bo'lishi:** `7.5/10` · **Turi:** Skill · **Sana:** `2026-11-15` dan

Telefonda ochilgan veb-sayt yoki Mini App'dagi noqulayliklarni (input bosganda ekran kattalashib ketishi, `100vh` sakrashi, iPhone `notch` ustiga chiqib ketish, yopishqoq `hover`, `overscroll` tortilishi) 11 ta tayyor CSS va meta qoida bilan bir zarbada tuzatadi.

### 19. [AssetDiet](reviews/developer-tools/assetdiet.md) — Loyihadagi og'ir rasm, SVG, video va 3D fayllarni sifatni buzmay siqish
`✅ Ishlatyapman` · **Sifat:** `7.5/10` · **Ishda kerak bo'lishi:** `6.5/10` · **Turi:** CLI + [asset-diet](skills/asset-diet/SKILL.md) · **Sana:** `2026-11-16` dan

Sayt yoki mobil ilova hajmini shishirib yuborgan rasm, SVG va videolarni kompyuterning o'zida (bulutga yuklamasdan) topib siqib beradi va yoqmasa 1 buyruq bilan asl holiga qaytaradi (`rollback`). Kontekstni band qilmasligi uchun doimiy MCP o'rniga faqat chaqirilganda (`0` token yuk) ishlaydi.

### 20. [video-analyzer](practices/06-video-and-desktop-workflows.md) — YouTube/Reels darsliklar va mijoz yuborgan bug-videolarni kadr-ba-kadr o'qish
`✅ Ishlatyapman` · **Sifat:** `9.0/10` · **Ishda kerak bo'lishi:** `7.5/10` · **Turi:** Skill + CLI (`ffmpeg` + `Whisper`) · **Sana:** `2026-10-25` dan

AI videoni shunchaki taxmin qilmaydi: ovozni matnga o'giradi (`Whisper`) va aynan ekran almashgan kadrlarni kesib olib ko'radi ([bsisduck/video-analyzer-skill](https://github.com/bsisduck/video-analyzer-skill)). Ham videodagi yangi tool'larning haqiqiy nomini topishda, ham tester yuborgan ekran yozuvidan xato sababini sekundigacha tutishda vaqtni tejaydi.

### 21. [Jev (TypeSafe AI)](reviews/external-apis/jev.md) — Rasm va matndan `~0.3s` da qaror (`true/false` va `select`) chiqaruvchi juda arzon server API
`✅ Ishlatyapman` · **Sifat:** `9.0/10` · **Ishda kerak bo'lishi:** `8.0/10` · **Turi:** Cloud Decision Engine API (`System-1`) · **Sana:** `2026-10` dan

**Muhim farq — bu matn yozadigan yoki rasm tahrirlaydigan AI model emas:** u faqat berilgan rasm yoki matnni tekshirib **`true / false`** (`yaroqli / yaroqsiz`) yoki **bir nechta variantdan eng mosini tanlab (`select`)** ishonch foizi (`0–100%`) bilan qaytaradigan qaror dvigateli. Media/video platformamiz va boshqa server loyihalarimizda kelgan rasmlar yaroqliligini tekshirish hamda video kadrlardan eng yaxshisini tanlashda 3 ta yo'ldan aynan shuni tanlaganmiz: **1) Pullik GPT API** — ulash oson, lekin rasm yuborilganda qimmat va sekin; **2) Serverda o'z AI obunamizdan (`GPT-6 Luna` `Medium`) ishlatish** — arzonroq, lekin eng tez rejimda ham rasmni bir necha tekshiruvdan o'tkazishga **kamida `~10 soniya` (`9–12s`)** ketib mijoz kutib qoladi; **3) `Jev`** — pullik bo'lsa ham **nihoyatda arzon (`$0.042 / 1M` kirish, chiqish `$0.00` tekin)** va **juda tez (`~0.3s`)** ishlagani barcha kamchiliklarini yopib ketadi. 📊 [typesafe.ai](https://typesafe.ai/) · [docs.typesafe.ai](https://docs.typesafe.ai/)

> [!WARNING]
> **Faqat o'z joyida va himoya (`Fallback`) bilan ishlating:** 1) Sozlash "o'rnatding — ishladi" emas, savollarni real holatlarda sinab kalibrlash shart; 2) Yoniga albatta kuchliroq AI (`GPT-6 Luna` / `Codex` / GPT) qo'ying — `Jev` ikkilansa (**ishonchi `< 80%`** bo'lsa) so'rovni o'sha AI'ga o'tkazing; 3) Ba'zan connect bermay yoki javob qaytarmay qolishi mumkin — qat'iy `timeout` (`3–6s`) va zaxira AI'ga avto-o'tish (`failover`) qo'yish majburiy!

<details>
<summary>📊 Solishtiruv va statistika (`Jev` vs `GPT Vision API` vs `GPT-6 Luna Medium`)</summary>

- **1-yo'l — Pullik `GPT Vision API` (`GPT-5`):** `$1.25` kirish / `$10.00` chiqish (`1M` tokenga), javob vaqti `~4–10+ soniya` — katta rasm oqimida juda qimmat.
- **2-yo'l — Server AI obuna (`GPT-6 Luna Medium`):** Obuna ichida arzon (yoki API'da `$0.10 / $0.50`), lekin 6 bandli rasm tekshiruvida **`p50: ~9.02–12.4 soniya`** — foydalanuvchi kutib qoladi.
- **3-yo'l — `Jev` (`TypeSafe AI`) + `<80%` Fallback:** Kirish **`$0.042 / 1M`** va chiqish **`$0.00` (`Luna` API'dan `~2.4x–10x`, `GPT-5` dan `~30x–100x+` arzon)**, 6 savolli rasm tekshiruvi **`p50: ~0.30–0.35 soniya` (`~25–30x` tezroq)**, 6 ta video kadrdan `main` tanlash `~3.3s`.
- 📖 [Batafsil sharh va server arxitekturasi →](reviews/external-apis/jev.md) · [Pastdagi solishtiruv ↓](#batafsil-solishtirishlar)

</details>

---

## Yo'nalishlar bo'yicha

### 🧠 Lokal modellar

#### [kimi-k3-in-c](reviews/local-models/kimi-k3-in-c.md) — `2.78T` gigant modelni GPU'siz SSD diskdan o'qish eksperimenti
`⚠️ Tavsiya etilmaydi` · **Sifat:** `8.5/10` *(C99 eksperiment sifatida)* · **Ishda kerak bo'lishi:** `1.0/10` · **Turi:** C99 CLI Engine (`2.78T` MoE) · **Sana:** `2026-11-16`<br>
🔄 **Alternativi yaxshiroq:** [Ollama](https://ollama.com/library/qwen3-coder) / `MLX` (`Qwen3-Coder`)

Katta `Kimi K3` modelini videokartasiz to'g'ridan-to'g'ri NVMe SSD diskdan o'qib ishlatish tajribasi. Modelning o'zi kuchli bo'lsa ham, diskdan stream qilish usulida **amaliy kod yozib bo'lmaydi** (`32–64 GB` Mac RAM'iga to'liq sig'adigan `Ollama / MLX Qwen3-Coder` ishlating). 📊 [GitHub](https://github.com/FareedKhan-dev/kimi-k3-in-c) · [Artificial Analysis](https://artificialanalysis.ai/leaderboards/models)

> [!WARNING]
> **Xavf (SSD umri va kod sizib chiqishi):** Bitta `500` tokenlik javob uchun NVMe diskdan **`~50 TB` o'qish** bo'lib, lehimlangan noutbuk SSD umrini (`TBW`) tez yeb bitiradi; tekin `:free` proxy'larga esa yopiq loyiha kodini ulamang.

<details>
<summary>📊 Solishtiruv va statistika (`kimi-k3-in-c` vs `Ollama / MLX Qwen3-Coder`)</summary>

- **`kimi-k3-in-c` bilan:** `≥1.8 TB` bo'sh NVMe disk kerak; `1 token = ~24–33 soniya` (`500` token kod = **`~3.5 soat`** + **`~50 TB` SSD o'qish**); silliq ishlashi uchun `16× H200 (~2.25 TB VRAM)` klaster shart.
- **Lokal `Ollama` / `MLX` (`Qwen3-Coder`) bilan:** `~9–20 GB` RAM ichida **`30–65 token/soniya`** (`~1000x` tezroq, `500` token = `~10 soniya`) va SSD diskka `0` zarar.
- 📖 [Batafsil sharh →](reviews/local-models/kimi-k3-in-c.md) · [Pastdagi solishtiruv ↓](#batafsil-solishtirishlar)

</details>

#### [MiniMax-M3.1-Flash *(Lokal)*](reviews/local-models/minimax-m3-1-flash.md) — `428B` multimodal modelni lokal kompyuterda ko'tarish
`⚠️ Tavsiya etilmaydi` · **Sifat:** `8.0/10` · **Ishda kerak bo'lishi:** `1.0/10` · **Turi:** Open-Weight `428B` MoE (`~23B` aktiv) · **Sana:** `2026-11-16`<br>
🔄 **Alternativi yaxshiroq:** [Ollama (Qwen3-Coder)](https://ollama.com/library/qwen3-coder) *(lokal kod uchun)* · [MiniMax M3.1 Flash API](reviews/external-apis/minimax-m3-1-flash-api.md) *(bulut API)*

Matn, rasm va videoni tushunadigan (`1M` kontekst) tezkor model, lekin lokal o'rnatish uchun og'irligi **`~250–285 GB`** — oddiy dasturchi kompyuterlariga sig'maydi va murakkab repozitoriy arxitekturasida asosiy coder emas (`Terminal-Bench 4.0: 38.1%`). 📊 [HuggingFace](https://huggingface.co/MiniMaxAI/MiniMax-M3.1-Flash) · [OpenRouter](https://openrouter.ai/minimax/minimax-m3.1-flash)

> [!WARNING]
> **Xavf:** `32–64 GB` kompyuterda disk-offload/swap orqali majburlab yoqish SSD'ni yemiradi, begona kvantlarda `trust_remote_code=True` (`RCE`) xavfi bor, tekin veb-kreditlar va `:free` endpointlarda esa yopiq kod model o'qitishga ketib qoladi.

<details>
<summary>📊 Solishtiruv va statistika (Lokal `M3.1-Flash` vs Bulut API vs `Qwen3-Coder`)</summary>

- **Lokal `MiniMax-M3.1-Flash` bilan:** Disk offload'da `~0.5–3 tok/s` (ishlab bo'lmaydi); normal `100–170+ tok/s` uchun `8× H100 (640 GB VRAM)` server kerak.
- **Bulut `MiniMax M3.1 Flash API` bilan:** `0 GB` lokal yuk, **`170+ tok/s`**, `$0.15 / $0.60` (`Cached: $0.015`).
- **Lokal `Ollama / MLX (Qwen3-Coder)` bilan:** `32–64 GB` Mac RAM ichida **`30–65 tok/s`**, `Apache-2.0`, 100% oflayn.
- 📖 [Batafsil sharh →](reviews/local-models/minimax-m3-1-flash.md) · [Pastdagi solishtiruv ↓](#batafsil-solishtirishlar)

</details>

### 🔌 Tashqi API'lar

> 💡 **Eslatma:** Serverlarimizda rasm va matn yaroqliligini tekshirish (`true/false`) hamda variantlardan tanlash (`select`) uchun har kuni ishlatayotgan eng tez (`~0.3s`) va arzon (`$0.042 / $0`) vositamiz — yuqoridagi [**#21. Jev (TypeSafe AI)**](reviews/external-apis/jev.md) (`✅ Ishlatyapman`).

#### [MiniMax M3.1 Flash API](reviews/external-apis/minimax-m3-1-flash-api.md) — Mahsulot backendi (chatbot, tarjima, rasm/video OCR) uchun juda arzon va tez API
`👍 Yaxshi variant` · **Sifat:** `8.0/10` · **Ishda kerak bo'lishi:** `5.0/10` · **Turi:** Cloud Multimodal API · **Sana:** `2026-11-16`

O'z loyihangiz ichida mijozlar uchun ommaviy AI-chat, hujjat/rasm o'qish (`OCR`), tarjima yoki video tahlil qilish kerak bo'lganda juda arzon (`$0.15 / $0.60`, keshda `$0.015`) va tez (`170+ tok/s`, `1M` kontekst) ishlaydi. Murakkab loyiha kodi yozishda asosiy IDE modeli emas (`Terminal-Bench: 38.1%`), lekin servis backendi uchun foydali. 📊 [OpenRouter](https://openrouter.ai/minimax/minimax-m3.1-flash) · [HuggingFace](https://huggingface.co/MiniMaxAI/MiniMax-M3.1-Flash) · [Artificial Analysis](https://artificialanalysis.ai/leaderboards/models)

> [!WARNING]
> **Maxfiylik eslatmasi:** Yopiq loyiha kodi va `.env` sirlarni `MiniMax Code` kunlik tekin kreditlariga yoki `:free` endpointlarga yubormang — faqat pullik `Zero-Data-Retention` API kalit ishlating.

<details>
<summary>📊 Solishtiruv va statistika (`MiniMax M3.1 Flash API` vs Frontier API)</summary>

- **Ommaviy backend/OCR/botlarda (`MiniMax M3.1 Flash API`):** `$0.15 / $0.60` (`Cached: $0.015`), **`170–200+ tok/s`**, `Automation-Bench: 62.8%` — frontier `$4/$20` API'lardan **`~25–33x` arzon**.
- **Murakkab kod bazasi arxitekturasida (`Claude Opus` / `Codex`):** `Terminal-Bench 4.0: 51.8%` vs `M3.1-Flash: 38.1%`, `NL2Repo: 75.3%` vs `61.2%`.
- 📖 [Batafsil sharh →](reviews/external-apis/minimax-m3-1-flash-api.md) · [Pastdagi solishtiruv ↓](#batafsil-solishtirishlar)

</details>

### 🌐 Web

#### [Hallmark v2](reviews/web/hallmark.md) — Noldan yangi Landing Page qurish va veb-sahifalarni yo'qotishsiz Redesign qilish tizimi
`👍 Yaxshi variant` · **Sifat:** `9.0/10` · **Ishda kerak bo'lishi:** `4.5/10` · **Turi:** Skill + `sloplint` CLI (50 ta mavzu) · **Sana:** `2026-11-17`

Noldan **yangi landing page, mahsulot taqdimot sayti (promo-sayt) qurish** yoki eski saytni bitta ham link/inputni tushirib qoldirmay to'liq yangilash (`redesign`) uchun eng kuchli tanlov. Doimiy avto-yoqib qo'ymasdan (kundalik Web/Mobil dastur ekranlariga xalaqit bermasligi uchun), **aynan landing sayt kerak bo'lganda** loyihaning o'ziga (`-p`) ulab yoki faqat `/hallmark` buyrug'i bilan chaqirib ishlatish tavsiya etiladi.

<details>
<summary>📊 Solishtiruv va statistika (`Hallmark v2` vs `impeccable` vs `taste-skill v2.5`)</summary>

- **Nima uchun `impeccable` landingda `Hallmark` o'rnini bosa olmaydi:** `Hallmark` ichida [usehallmark.com](https://www.usehallmark.com) dagi **50 ta tayyor ko'rib-tanlanadigan mavzu**, **755 ta qonuniy real fotosurat**, dasturingizdan avto-skrinshot oluvchi `capture.mjs`, redesign'da link/formalar yo'qolmasligini tekshiruvchi `sloplint --before/--kept` hamda soxta formalar va uydirma raqamlarni `8` ekran o'lchamida tutuvchi `sloplint` (`5,700+` qator kod) bor.
- **Nima uchun kundalik ishda baribir `impeccable` asosiy qoladi:** `Hallmark` faqat Web uchun (`Expo` / `iOS` / `Android` da ishlamaydi), 7 bosqichli sikli kundalik app/admin ishlari uchun og'ir va eski `WCAG 2` kontrast formulasi sabab rangli tugmadagi toza oq yozuvni yiqitadi (`impeccable` da esa `APCA` bor).
- **`taste-skill v2.5` bilan farqi:** Landing qurishda `Hallmark v2` (`9.0/10`) `taste-skill` (`8.0/10`) dan ancha toza — bloklovchi 600s `Stop` hooki yo'q va mexanik brauzer tekshirgichi bor.
- 📖 [Batafsil sharh →](reviews/web/hallmark.md) · [Pastdagi solishtiruv ↓](#batafsil-solishtirishlar)

</details>

#### [taste-skill v2.5](reviews/web/taste-skill.md) — Noldan chiroyli reklama va promo-landing sahifalar qurish to'plami
`👍 Yaxshi variant` · **Sifat:** `8.0/10` · **Ishda kerak bo'lishi:** `3.5/10` · **Turi:** Landing Kit + Hook · **Sana:** `2026-11-15`<br>
🔄 **Alternativi yaxshiroq:** [Hallmark v2](reviews/web/hallmark.md) *(landing page uchun)* · [impeccable](reviews/ui-ux/impeccable.md) *(kundalik UI uchun)*

WebGL shaderli promo-landing yig'ish uchun yaxshi variant, lekin odatiy landing sahifalar uchun `Hallmark v2` kuchliroq va xavfsizroq. *Agar `taste-skill` olinsa, ichidagi 600s `Stop` hookni olib tashlab faqat `-p` da ishlatish shart.*

#### [vercel-labs/ui](reviews/web/vercel-ui-sdk.md) — Faqat o'zining `@ui-sdk/*` teglarida yozilgan saytlarnigina ko'radigan Beta kutubxona
🔄 **Alternativi yaxshiroq:** [agent-desktop](reviews/developer-tools/agent-desktop.md) + [impeccable](reviews/ui-ux/impeccable.md)<br>
**Sifat:** `8.0/10` · **Ishda kerak bo'lishi:** `2.0/10` · **Turi:** `@ui-sdk/*` Library + Skill (`Beta`) · **Sana:** `2026-11-16`

Vercel Labs'ning g'oyasi qiziq (`8.0/10`), lekin *"skrinshotsiz 2x tez agent boshqaruvi"* faqat noldan `@ui-sdk/*` komponentlarida qayta yozilgan saytlardagina ishlaydi (oddiy `<button>`, `<input>`, `Shadcn`/`Radix` va `Expo` da ishlamaydi).

<details>
<summary>📊 Solishtiruv va statistika (`vercel-labs/ui` vs `agent-desktop`)</summary>

- **`vercel-labs/ui` bilan:** Mavjud `React` / `Next.js` / `Shadcn` komponentlarni ko'rmaydi (`0%` qamrov — butun UI'ni qayta yozish shart), `0.1.0-beta`.
- **`agent-desktop` bilan:** Har qanday tayyor veb-sayt va macOS dasturida `0` qator kod o'zgartirmasdan `~200–300 ms` da ishlaydi.
- 📖 [Batafsil sharh →](reviews/web/vercel-ui-sdk.md) · [Pastdagi solishtiruv ↓](#batafsil-solishtirishlar)

</details>

### 📱 Mobile

#### [swiftui-agent-skill](reviews/mobile/swiftui-agent-skill.md) — Sof Apple SwiftUI (`Widget`, `Live Activity`) qoidalari to'plami
`👍 Yaxshi variant` · **Sifat:** `8.5/10` · **Ishda kerak bo'lishi:** `3.0/10` · **Turi:** Skill · **Sana:** `2026-11-16`<br>
🔄 **Alternativi yaxshiroq *(Expo uchun)*:** [impeccable](reviews/ui-ux/impeccable.md) + [animate-expo](reviews/mobile/animate-expo.md)

Sof SwiftUI va Apple dizayn qoidalari juda yuqori sifatda (`8.5/10`) yozilgan. `Ishda kerak bo'lishi: 3.0/10` bo'lishining yagona sababi — asosiy mobil stekimiz `Expo / React Native` ekanligi; iPhone uchun alohida native Widget yoki Live Activity yozilganda `-p` qilib ulashga eng zo'r variant.

#### [ARTEMIS](reviews/mobile/artemis.md) — Google'ning rasm va OCR orqali o'zi yuradigan avtonom Android QA agenti
`👍 Yaxshi variant` · **Sifat:** `8.5/10` · **Ishda kerak bo'lishi:** `2.5/10` · **Turi:** Python CLI / SDK + MCP · **Sana:** `2026-11-16`<br>
🔄 **Alternativi yaxshiroq *(kundalik QA uchun)*:** [agent-device](reviews/mobile/agent-device.md)

Oddiy UI daraxti ko'rinmaydigan o'yin yoki murakkab `Canvas` ekranlarini rasm (`OCR`) orqali tekshirishda juda kuchli (`AndroidWorld: 99%+`), faqat kundalik ishda kam kerak bo'ladi (`2.5/10`).

> [!WARNING]
> **Xarajat eslatmasi:** "Open-source" bo'lsa ham, ishlatish **pullik** — `.env` ga alohida per-token pullik LLM API kalit ulashni talab qiladi va global `artemis mcp --install all` qilib o'rnatmaslik kerak.

<details>
<summary>📊 Solishtiruv va statistika (`ARTEMIS` vs `agent-device`)</summary>

- **`ARTEMIS` bilan:** Faqat Android (`iOS`/`tvOS` yo'q), har qadami **`3–40 soniya`**, alohida pullik `.env` API kalit yeydi, `.venv` `~1 GB+`.
- **`agent-device` bilan:** `iOS + Android + tvOS + Android TV`, har amali **`0.2–0.9 soniya` (`4x–45x` tez)**, **`$0` qo'shimcha API xarajati**, ichida tayyor `--maestro` bor.
- 📖 [Batafsil sharh →](reviews/mobile/artemis.md) · [Pastdagi solishtiruv ↓](#batafsil-solishtirishlar)

</details>

#### [mobile-mcp](reviews/mobile/mobile-mcp.md) — Kontekstni shishiradigan va `agent-device` dan `6.5x–37x` sekin mobil MCP server
`⚠️ Tavsiya etilmaydi` · **Sifat:** `7.0/10` · **Ishda kerak bo'lishi:** `2.0/10` · **Turi:** MCP Server (34 tool) · **Sana:** `2026-11-16`<br>
🔄 **Alternativi yaxshiroq:** [agent-device](reviews/mobile/agent-device.md) + [adb](reviews/mobile/adb.md)

Mobil ekranlarni MCP orqali boshqarish serveri, lekin jonli sinovda ham tezlik, ham token tejamkorligi bo'yicha yutqazdi.

> [!WARNING]
> **Nega tavsiya etilmaydi:** Ishlatmasangiz ham har bitta xabarda **`~7,580` token kontekstni bekorga band qiladi** va ichida `Scarf` + `PostHog` telemetriyasi hamda `mobilenext.ai` cloud reklamalari bor.

<details>
<summary>📊 Solishtiruv va statistika (`mobile-mcp` vs `agent-device`)</summary>

- **`mobile-mcp` bilan:** Har xabarda `~7,580` token sxema yuki; iOS `7,277 ms`, Android `5,788 ms`.
- **`agent-device` bilan:** Doimiy yuk `0` token; iOS **`197 ms` (`37x` tez)**, Android **`888 ms` (`6.5x` tez)**, `0` telemetriya.
- 📖 [Batafsil sharh →](reviews/mobile/mobile-mcp.md) · [Pastdagi solishtiruv ↓](#batafsil-solishtirishlar)

</details>

### 🎨 UI/UX

#### [animate](reviews/ui-ux/animate.md) — Emil Kowalski'ning Web animatsiya skilli
🔄 **Alternativi yaxshiroq:** [impeccable](reviews/ui-ux/impeccable.md) (`animate`) + [animate-expo](reviews/mobile/animate-expo.md)<br>
**Sifat:** `8.5/10` · **Ishda kerak bo'lishi:** `3.0/10` · **Turi:** Skill (2 fayl) · **Sana:** `2026-11-15`

Veb-animatsiya qoidalari sifatli (`8.5/10`), lekin faqat Web uchun yozilgan va o'rnatilsa mobil `animate-expo` bilan auto-trigger to'qnashuvi beradi.

#### [unslop](reviews/ui-ux/unslop.md) — AI chizgan veb-sahifalarni 9 bosqichda tozalovchi skill
🔄 **Alternativi yaxshiroq:** [impeccable](reviews/ui-ux/impeccable.md) (`polish` / `quieter` / `clarify`)<br>
**Sifat:** `8.5/10` · **Ishda kerak bo'lishi:** `2.5/10` · **Turi:** Skill + Playwright skriptlar · **Sana:** `2026-11-16`

Veb-sahifalardagi "AI-slop" shablonlarni yaxshi tozalaydi (`8.5/10`), lekin mobil ilovalarda ishlamaydi va `impeccable` bilan bir xil joyda uyg'onadi.

#### [break-ui](reviews/ui-ux/break-ui.md) — UI'ni uzun/bo'sh matnlar bilan stress-test qiluvchi skill
🔄 **Alternativi yaxshiroq:** [impeccable](reviews/ui-ux/impeccable.md) (`harden`)<br>
**Sifat:** `8.0/10` · **Ishda kerak bo'lishi:** `3.0/10` · **Turi:** Skill (2 fayl) · **Sana:** `2026-11-15`

Sahifaga ekstremal uzun ism yoki bo'sh ro'yxat kiritib qayeri sinishini ko'rsatadi (`8.0/10`), biroq repoga vaqtinchalik test tugmalar qo'shib ketadi va xatoni o'zi tuzatmaydi.

<details>
<summary>📊 Solishtiruv (`break-ui` vs `impeccable harden`)</summary>

- **`break-ui` bilan:** Loyihaga vaqtinchalik mock/toggle kodlar yozadi, buzilgan joyni ko'rsatib tuzatmasdan to'xtaydi (qo'lda tozalash kerak).
- **`impeccable` (`harden`) bilan:** Loyihani ifloslamasdan `overflow`, uzun matn, `i18n` va bo'sh holatlarni tekshiradi hamda CSS/kodni o'zi tuzatadi.
- 📖 [Batafsil sharh →](reviews/ui-ux/break-ui.md) · [Pastdagi solishtiruv ↓](#batafsil-solishtirishlar)

</details>

#### [make-interfaces-feel-better](reviews/ui-ux/make-interfaces-feel-better.md) — Mayda UI detallarni tekshiruvchi veb-skill
🔄 **Alternativi yaxshiroq:** [impeccable](reviews/ui-ux/impeccable.md) + [animate-expo](reviews/mobile/animate-expo.md)<br>
**Sifat:** `7.5/10` · **Ishda kerak bo'lishi:** `2.5/10` · **Turi:** Skill (6 fayl) · **Sana:** `2026-10-31 → 2026-11-15`

Chegara, burchak radiusi va soyalar bo'yicha yaxshi maslahatlari bor, lekin 16 kun ishlatganimizda oddiy UI o'zgarishida ham 4 tadan uzun Markdown jadval chiqarib tokenni ko'p yegani uchun olib tashlandi.

#### [ui-ux-pro-max](reviews/ui-ux/ui-ux-pro-max.md) — CSV jadvallardan rang va shrift tanlovchi skill
🔄 **Alternativi yaxshiroq:** [impeccable](reviews/ui-ux/impeccable.md) (`APCA` kontrast bilan)<br>
**Sifat:** `7.0/10` · **Ishda kerak bo'lishi:** `3.5/10` · **Turi:** Skill + CSV/Python · **Sana:** `2026-11-15`

Tayyor CSV ro'yxatdan rang va shrift taklif qiladi, lekin bir xil shablon dizayn beradi va `impeccable` bilan to'qnashadi.

### 🏗️ Arxitektura va Review

#### [addy-agent-skills](reviews/architecture/addy-agent-skills.md) — Addy Osmani'ning 25 ta skilldan iborat `/spec -> /ship` to'plami
🔄 **Alternativi yaxshiroq:** [grill-me](reviews/architecture/grill-me.md) + [ponytail](reviews/architecture/ponytail.md) + [elephant-goldfish-model](reviews/architecture/elephant-goldfish-model.md)<br>
**Sifat:** `8.0/10` · **Ishda kerak bo'lishi:** `2.5/10` · **Turi:** Plugin (25 skill + 9 command) · **Sana:** `2026-11-16`

Muhandislik intizomi sifatli (`8.0/10`), lekin har bir oddiy vazifani majburiy TDD va ko'p bosqichli to'xtashlarga solgani uchun kundalik ishni sekinlashtiradi.

#### [agency-agents](reviews/architecture/agency-agents.md) — 283 ta rol-promptlar ("Sen marketologsan / dizaynersan") to'plami
`⚠️ Tavsiya etilmaydi` · **Sifat:** `6.5/10` · **Ishda kerak bo'lishi:** `2.5/10` · **Turi:** 283 persona prompt + installer · **Sana:** `2026-11-16`<br>
🔄 **Alternativi yaxshiroq:** [impeccable](reviews/ui-ux/impeccable.md) + [ponytail](reviews/architecture/ponytail.md) + [elephant-goldfish-model](reviews/architecture/elephant-goldfish-model.md)

18 bo'lim bo'yicha 283 ta tayyor rol shablonlari jamlanmasi.

> [!WARNING]
> **Kontekst shishishi xavfi:** Hammasini global o'rnatganda yuzaki shablon gaplar uchun **`~18,500` token kontekstni doimiy band qilib**, agentning asosiy qoidalarga e'tiborini susaytiradi.

#### [superpowers](reviews/architecture/superpowers.md) — Har qadamda majburiy TDD va savollar qo'shadigan 14-skill plagin
`⚠️ Tavsiya etilmaydi` · **Sifat:** `6.5/10` · **Ishda kerak bo'lishi:** `2.0/10` · **Turi:** Plugin (14 skill + hook) · **Sana:** `2026-04-04 → 2026-09-01`<br>
🔄 **Alternativi yaxshiroq:** [grill-me](reviews/architecture/grill-me.md) + [ponytail](reviews/architecture/ponytail.md) + [agent-device](reviews/mobile/agent-device.md)

5 oy ishlatib ko'rib o'chirib tashlaganmiz.

> [!WARNING]
> **Vaqt va kvota zarari:** Har chat boshidagi `SessionStart` hook, keraksiz `brainstorming` savollari va Web/Mobil UI'da ham majburiy TDD talab qilishi sabab **ish vaqti hamda token sarfini `2x` oshirib yuboradi**.

<details>
<summary>📊 Solishtiruv va statistika (`superpowers` vs `grill-me + ponytail`)</summary>

- **`superpowers` bilan:** Har sessiyada avto-hook yuki + UI vazifalarda ham oldin unit-test yozish majburiyati -> **vaqt va kvota sarfi `~2x` ko'p**.
- **`grill-me + ponytail + agent-device` bilan:** Faqat kerak paytda aniq reja (`grill-me`), minimal kod (`ponytail`) va jonli emulyator/brauzerda tekshiruv (`~2–3x` tezroq).
- 📖 [Batafsil sharh →](reviews/architecture/superpowers.md) · [Pastdagi solishtiruv ↓](#batafsil-solishtirishlar)

</details>

### ⚙️ Backend

#### [opentelemetry](reviews/backend/opentelemetry.md) — O'nlab mikroservis va server yuklamasini kuzatish standarti
`👍 Yaxshi variant` · **Sifat:** `9.0/10` · **Ishda kerak bo'lishi:** `4.0/10` · **Turi:** Standard + Collector (`SigNoz` / `Grafana`) · **Sana:** `2026-11-15`<br>
🔄 **Alternativi yaxshiroq *(hozirgi miqyosimiz uchun)*:** [sentry](reviews/backend/sentry.md)

Katta infratuzilmada server CPU/RAM, DB ulanishlari va servislararo trace'larni kuzatish uchun eng kuchli sanoat standarti (`9.0/10`), faqat alohida `Collector + SigNoz/Grafana` klasterini talab qiladi. Hozirgi barcha xato, replay va bazaviy trace ehtiyojimizni bitta `sentry` oson yopadi.

#### [Shannon](reviews/backend/shannon.md) — Lokal/staging sayt va API'ga haqiqiy xakerdek hujum qilib tekshiruvchi AI pentester
`👍 Yaxshi variant` · **Sifat:** `8.5/10` · **Ishda kerak bo'lishi:** `6.5/10` · **Turi:** Standalone CLI + [hacker-test](skills/hacker-test/SKILL.md) · **Sana:** `2026-11-16`

Katta reliz oldidan ko'tarilgan lokal yoki staging serverga real exploit so'rovlar (`Auth bypass`, `IDOR`, `SQLi`, `XSS`, `SSRF`) otib, teshiklarni amalda isbotlab beradi (`0` token kontekst yuki bilan [hacker-test](skills/hacker-test/SKILL.md) orqali chaqiriladi). Kundalik PR tekshiruvida esa Docker'siz 👉 [security-audit](reviews/backend/security-audit-skill.md) ishlatiladi.

> [!WARNING]
> **Qat'iy chegara:** Jonli bazani o'zgartiruvchi exploitlar otgani sababli **hech qachon production serverga qarshi ishga tushirmang** — faqat lokal yoki test/staging muhitda ishlating!

### 🛠️ Developer Tools va Memory

#### [REA](reviews/developer-tools/rea.md) — Manba kodi yo'q begona dastur, `.asar`, `.apk` va binarlarni ichidan ochib o'rganish
`👍 Yaxshi variant` · **Sifat:** `9.0/10` · **Ishda kerak bo'lishi:** `3.5/10` · **Turi:** Standalone CLI + [rea](skills/rea/SKILL.md) · **Sana:** `2026-11-17`

Begona desktop/mobil/veb ilovadagi yoqqan funksiyani manba kodisiz (`Electron .asar`, JS bundle, Android `.apk`, `.NET`, `Mach-O`/`ELF`/`PE`) dalillari bilan tiklab beradi (`9.0/10`), shuningdek o'zimizning reliz paketimizda `.map`/`.dSYM` qolib ketmaganini tekshiradi (`audit-release-exposure`). Bizdagi [rea](skills/rea/SKILL.md) skilli orqali `"rea"` deb signal berilganda **avval Node.js versiyasini (eski bo'lsa kerakli versiyaga yangilab) hamda nishon turiga mos yordamchi dasturlarni (`openjdk`, `jadx`, `apktool`, `ghidra`, `rizin`) tekshirib o'rnatadi** va **`0` doimiy token yuki bilan** vaqtinchalik ishlab beradi. *(O'zimizning manba kodi bor loyihalarimiz uchun 👉 [graphify](reviews/architecture/graphify.md) ishlatiladi).*

> [!WARNING]
> **Kontekst tuzog'i:** Hech qachon `npx rea-agents setup` orqali global MCP qilib ulamang — uning `200+` ta MCP tool'i har suhbatda **`~300 KB` (`~75,000+` token)** kontekstni bekorga yeb qo'yadi! Faqat bizdagi vaqtinchalik [rea](skills/rea/SKILL.md) skilli orqali ishlating.

<details>
<summary>📊 Solishtiruv va statistika (Global `REA` MCP vs bizning `rea` skilli)</summary>

- **Standart `npx rea-agents setup` bilan:** `200+` tool (`~75,000+` token har sessiyada) + `~198 KB` (`~50K` token) skill referenslar + `189.6 MB` npm hajm; `Node 24.20.0` da versiya xatosi bilan yiqiladi.
- **Bizning [rea](skills/rea/SKILL.md) wrapper skilli bilan:** Kundalik suhbatlarda **`0` token yuk**; `"rea"` deb chaqirilganda mos `Node 26+`/`24.22+` ni o'zi tanlaydi (eski bo'lsa avto-yangilaydi), nishonga qarab yetishmayotgan dekompilyatorlarni aniqlab o'rnatadi va `/tmp` da ishlab, yakunda tozalab ketadi.
- 📖 [Batafsil sharh →](reviews/developer-tools/rea.md) · [Pastdagi solishtiruv ↓](#batafsil-solishtirishlar)

</details>

#### [SkillSpector](reviews/developer-tools/skillspector.md) — NVIDIA'ning Docker va Python asosidagi skill-xavfsizlik skaneri
🔄 **Alternativi yaxshiroq:** [skillshare](reviews/developer-tools/skillshare.md) (`skillshare audit`) + AI manba tekshiruvi<br>
**Sifat:** `9.0/10` · **Ishda kerak bo'lishi:** `3.5/10` · **Turi:** Python CLI + MCP + Skill · **Sana:** `2026-11-16`

NVIDIA jamoasi yozgan juda sifatli skaner (`9.0/10`), lekin har bitta skill uchun alohida Python/Docker/YARA konveyerini ko'tarish kundalik ishda ortiqcha vaqt oladi.

<details>
<summary>📊 Solishtiruv va statistika (`SkillSpector` vs `skillshare audit + AI tekshiruv`)</summary>

- **`SkillSpector` bilan:** Python + Docker + YARA + LLM API talab qiladi, tekshiruv vaqti bir necha o'n soniya.
- **`skillshare audit` + AI manba tekshiruvi bilan:** **`0.1 soniya`** statik tekshiruv + AI agentimiz mantiqiy to'qnashuvlar, yashirin telemetriya va kontekst shishishini ham o'qib tozalaydi (`$0` qo'shimcha xarajat).
- 📖 [Batafsil sharh →](reviews/developer-tools/skillspector.md) · [Pastdagi solishtiruv ↓](#batafsil-solishtirishlar)

</details>

#### [T3 Code](reviews/developer-tools/t3-code.md) — Oldin ishlatgan ko'p-agentli desktop dasturimiz (`Orca` ga almashtirildi)
🔄 **Alternativi yaxshiroq:** [Orca](reviews/developer-tools/orca.md)<br>
**Sifat:** `8.5/10` · **Ishda kerak bo'lishi:** `2.5/10` · **Turi:** Desktop App + CLI · **Sana:** `2026-10-23 → 2026-11-16`

Yaxshi ishlangan desktop muhit (`8.5/10`), bir necha hafta kundalik ishlatdik. Keyinchalik telefon ilovasi (Beta) ekran o'chganda uzilib qolishi, kompyuter bloklanganda (`Lock Screen`) to'xtashi va Chat UI ichida subagent kartalari yo'qligi sabab o'chirildi (`~3.87 GB` joy bo'shadi).

<details>
<summary>📊 Solishtiruv va statistika (`T3 Code` vs `Orca`)</summary>

- **`T3 Code` bilan:** `~1.1–1.4 GB` RAM + `~/.t3` ichida `~3.87 GB` kesh; `Lock Screen` da sessiya to'xtaydi; mobil ilova Beta (tez uziladi).
- **`Orca` bilan:** **`841 MB` RAM** (`12` repo bilan), ichki `caffeinate` (`Lock Screen` da uzilmaydi), rasmiy iOS/Android ilova va bitta promptdan `orca orchestration` subagent kartalari.
- 📖 [Batafsil sharh →](reviews/developer-tools/t3-code.md) · [Pastdagi solishtiruv ↓](#batafsil-solishtirishlar)

</details>

#### [caveman](reviews/developer-tools/caveman.md) — AI suhbat javoblarini `~65%` gacha qisqartiruvchi skill
`👍 Yaxshi variant` · **Sifat:** `8.0/10` · **Ishda kerak bo'lishi:** `3.5/10` · **Turi:** Skill *(+ ixtiyoriy CLI)* · **Sana:** `2026-11-16`<br>
🔄 **Alternativi yaxshiroq:** [ponytail](reviews/architecture/ponytail.md)

Chatdagi ortiqcha gap-so'zlarni qisqartirib chiqish matn tokenini tejaydi (`~65%`), lekin AI yozadigan kodning shishib ketishiga ta'sir qilmaydi. *(Agar `caveman` olinsa, telemetriyali CLI paketini emas, faqat toza yolg'iz `SKILL.md` faylini oling).*

<details>
<summary>📊 Solishtiruv va statistika (`caveman` vs `ponytail`)</summary>

- **`caveman` bilan:** Suhbat matnini `~65%` qisqartiradi, lekin kod hajmi o'zgarmaydi (`@caveman-ai/cli` ichida telemetriya va `SessionStart` hook bor).
- **`ponytail` bilan:** Ham javobni lo'nda qiladi, ham ortiqcha abstraksiyani kesib **kod/diff hajmini `~2–4x` qisqartiradi**, `0` telemetriya.
- 📖 [Batafsil sharh →](reviews/developer-tools/caveman.md) · [Pastdagi solishtiruv ↓](#batafsil-solishtirishlar)

</details>

#### [humanizer + stop-slop](reviews/developer-tools/humanizer-stop-slop.md) — Maqola va postlardagi "sun'iy intellekt ohangi"ni tozalovchi matn muharriri
🔄 **Alternativi yaxshiroq:** [ponytail](reviews/architecture/ponytail.md) + [impeccable](reviews/ui-ux/impeccable.md) (`clarify`)<br>
**Sifat:** `7.5/10` · **Ishda kerak bo'lishi:** `2.0/10` · **Turi:** Skill (`Markdown`) · **Sana:** `2026-11-16`

Blog maqola va esselar yozuvchilar uchun foydali (`humanizer` `~32 KB` kontekst oladi), shunchaki dasturlash va mahsulot interfeysi uchun mo'ljallanmagan.

#### [claude-code-setup](reviews/developer-tools/claude-code-setup.md) — Yangi boshlovchilar uchun Claude Code sozlamalarini tavsiya qiluvchi plagin
🔄 **Alternativi yaxshiroq:** [skillshare](reviews/developer-tools/skillshare.md)<br>
**Sifat:** `7.5/10` · **Ishda kerak bo'lishi:** `2.0/10` · **Turi:** Plugin · **Sana:** `2026-11-16`

Yangi o'rganuvchilarga boshlang'ich `CLAUDE.md` va hooklar tavsiya qiladi; tayyor global tizim borligi uchun bizga shart emas.

#### [OmniRoute](reviews/developer-tools/omniroute.md) — Obunalarni aylantiruvchi lokal LLM reverse-proxy (`localhost:20128`)
`⚠️ Tavsiya etilmaydi` · **Sifat:** `7.5/10` · **Ishda kerak bo'lishi:** `2.0/10` · **Turi:** Local Proxy + 44 Admin Skill · **Sana:** `2026-11-16`<br>
🔄 **Alternativi yaxshiroq:** [Orca](reviews/developer-tools/orca.md) + [ponytail](reviews/architecture/ponytail.md)

O'nlab arzon API kalitlarni bitta shlyuzga yig'ish uchun yozilgan lokal proxy server (ichidagi 44 ta skill kodlash uchun emas, faqat proxy sozlamalari).

> [!WARNING]
> **Akkaunt ban (`ToS`) va sessiya uzilishi xavfi:** Pullik `Claude` / `ChatGPT` / `Google` obunalarini `wreq-js` TLS-stealth orqali ulash **akkaunt bloklanishiga (`ban`)** olib kelishi mumkin; bundan tashqari uzoq kodlash sessiyalarini uzib qo'yadi (`#7287`) va limit tugaganda yashirincha kuchsiz modelga tushirib kod sifatini buzadi.

<details>
<summary>📊 Solishtiruv va statistika (`OmniRoute` vs `Orca + ponytail`)</summary>

- **`OmniRoute` bilan:** `sessionAffinityTtlMs = 0` sabab prompt-cache buziladi, 10 daqiqalik `StreamIdleTimeoutError` (`#7287`), yashirin model pasayishi va `wreq-js` TLS-stealth ban xavfi.
- **`Orca + ponytail` bilan:** `0%` ban xavfi (rasmiy CLI/obunalar), `100%` prompt-cache saqlanadi, limitlarni status barda ochiq ko'rsatadi va kerak bo'lsa vazifani sizning nazoratingizda boshqa modelga uzatadi.
- 📖 [Batafsil sharh →](reviews/developer-tools/omniroute.md) · [Pastdagi solishtiruv ↓](#batafsil-solishtirishlar)

</details>

---

<a id="batafsil-solishtirishlar"></a>
## ⚖️ Batafsil Solishtirishlar va Natijalar (Nima Uchun Qaysi Vosita Tanlangan?)

Yuqoridagi barcha sinovlar va raqamlarning 7 yo'nalish bo'yicha to'liq qiyosiy jadvali alohida qo'llanmada ham berilgan: 👉 [**To'liq 7 yo'nalishli solishtiruv matritsasini ochish (practices/07-tool-and-skill-comparisons.md) →**](practices/07-tool-and-skill-comparisons.md)

- **📱 Mobil va TV UI Avtomatizatsiyasi:**
  - ✅ [**agent-device**](reviews/mobile/agent-device.md): `iOS + Android + tvOS + Android TV`, **`197–888 ms`**, `0` MCP yuki, **`$0` API xarajati**, Java kerakmas, ichida tayyor `--maestro` bor.
  - ⚖️ Muqobillar: `Maestro CLI` (`1.5–4s`, Java `JDK 17+` shart) · [**ARTEMIS**](reviews/mobile/artemis.md) (faqat Android, `3–40s`, `.env` da pullik LLM API kalit yeydi) · ⚠️ [**mobile-mcp**](reviews/mobile/mobile-mcp.md) (har xabarda `~7,580` token yeydi, `6–7s` sekin, telemetriya/reklama bor).
- **📱 Mobil Emulyator RAM va GPU Optimizatsiyasi (`USIZ vs U BILAN`):**
  - ✅ [**simslim**](reviews/mobile/simslim.md) (iOS 26.5): oynasiz RAM **`2.70 GB -> 1.16 GB` (`-57%`)**, GUI **`4.0 GB -> 0.9 GB` (`-77.5%`)**, jarayonlar `182 -> 78`, ilovalarni o'chirmasdan **`+1.51 GB`** disk tozalash.
  - ✅ [**avdslim**](reviews/mobile/avdslim.md) (Android API 35): RAM **`4.41 GB -> 2.64 GB` (`-40.2%`, Studio 8.5 GB'dan `-69%`)**, CPU `SwiftShader` o'rniga **Apple Metal GPU (`host`)**, Golden Snapshot bilan yonish `22.8s -> 13.8s`.
- **🌐 Web va Desktop UI Boshqaruvi:**
  - ✅ [**agent-desktop**](reviews/developer-tools/agent-desktop.md): har qanday veb-sayt va macOS dasturida kodni o'zgartirmasdan fonda ishlaydi (`~5–10x` kam token).
  - 🔄 [**vercel-labs/ui**](reviews/web/vercel-ui-sdk.md): faqat `@ui-sdk/*` da qayta yozilgan saytlarnigina ko'radi (`Expo` va oddiy HTML'da ishlamaydi).
- **🎨 UI/UX Dizayn, Landing Page va Animatsiya:**
  - ✅ Kundalik App / Web / Mobil UI: [**impeccable**](reviews/ui-ux/impeccable.md) + [**mobile-native**](reviews/mobile/mobile-native.md) + [**animate-expo**](reviews/mobile/animate-expo.md) (`APCA` kontrast + `60/120fps` UI-thread animatsiya).
  - 👍 Noldan Landing Page / Promo-sayt kerak bo'lganda (`-p` / `/hallmark`): [**Hallmark v2**](reviews/web/hallmark.md) (`50` ta tayyor mavzu, `755` ta real foto, `capture.mjs` va `sloplint --before/--kept` — bu qismlar `impeccable` da yo'q; [**taste-skill v2.5**](reviews/web/taste-skill.md) dan ham ustun).
  - 🔄 Muqobillar: [**unslop**](reviews/ui-ux/unslop.md) va [**animate**](reviews/ui-ux/animate.md) (faqat Web, auto-trigger urishadi) · [**break-ui**](reviews/ui-ux/break-ui.md) (buzib ko'rsatib, tuzatmay to'xtaydi) · [**make-interfaces-feel-better**](reviews/ui-ux/make-interfaces-feel-better.md) (4 jadval token yeydi).
- **🏗️ Reja, YAGNI, Qisqa Javob va Multi-Agent Ishlash:**
  - ✅ [**grill-me**](reviews/architecture/grill-me.md) + [**graphify**](reviews/architecture/graphify.md) (`10x–20x` token tejamkor) + [**ponytail**](reviews/architecture/ponytail.md) (ham matn, ham kodni `2–4x` qisqartiradi) + [**Orca**](reviews/developer-tools/orca.md) (`841 MB` RAM, `Lock Screen` + mobil ilova + jonli subagentlar).
  - ⚖️ Muqobillar: [**T3 Code**](reviews/developer-tools/t3-code.md) (`Lock Screen` va mobil uzilishlar sabab `Orca` ga o'tildi) · [**caveman**](reviews/developer-tools/caveman.md) (faqat chat so'zlarini qisqartiradi) · ⚠️ [**superpowers**](reviews/architecture/superpowers.md) (`2x` sekinlashtiradi) · ⚠️ [**OmniRoute**](reviews/developer-tools/omniroute.md) (sessiya uzilishi va ToS ban xavfi).
- **🛡️ Xavfsizlik Auditi, Pentest va Monitoring:**
  - ✅ [**skillshare audit**](reviews/developer-tools/skillshare.md) (`0.1s` skill tekshiruv) + [**security-audit**](reviews/backend/security-audit-skill.md) (Docker'siz manba kodi auditi) + [**Shannon**](reviews/backend/shannon.md) (staging'da jonli exploit pentest) + [**sentry**](reviews/backend/sentry.md) (xato + Replay + trace).
  - ⚖️ Muqobillar: [**SkillSpector**](reviews/developer-tools/skillspector.md) (og'ir Docker/YARA sikli) · [**opentelemetry**](reviews/backend/opentelemetry.md) (`Collector + SigNoz/Grafana` katta klasterlar uchun) · 👍 [**REA**](reviews/developer-tools/rea.md) (faqat manba kodi yo'q begona `.asar`/`.apk`/binarlarni [rea](skills/rea/SKILL.md) orqali vaqtinchalik ochish va `audit-release-exposure` uchun).
- **🧠 Lokal Modellar va 🔌 Tashqi API'lar:**
  - ✅ Serverda tezkor qaror (`true/false` va `select`): [**Jev (TypeSafe AI)**](reviews/external-apis/jev.md) (`~0.3s`, `$0.042/$0`, `<80%` va `timeout` fallback bilan — `GPT-6 Luna Medium` `~9–12s` kutishini yo'qotadi) · Mahsulot backendida matn/chat/OCR generatsiya kerak bo'lsa: [**MiniMax M3.1 Flash API**](reviews/external-apis/minimax-m3-1-flash-api.md) (`$0.15/$0.60`, `170+ tok/s`) · Oflayn lokal coder: **`Ollama` / `MLX` (`Qwen3-Coder`)** (`32–64 GB` Mac RAM ichida `30–65 tok/s`).
  - ⚠️ Lokal ishchi kompyuterda tavsiya etilmaydi: [**kimi-k3-in-c**](reviews/local-models/kimi-k3-in-c.md) (`1 token = ~30s`, `~50 TB` SSD o'qish) · [**MiniMax-M3.1-Flash *(Lokal)* **](reviews/local-models/minimax-m3-1-flash.md) (`285 GB` vazn, `640 GB VRAM` server kerak).

---

<details>
<summary>Global <code>tasted-skills</code>, <code>hacker-test</code>, <code>asset-diet</code> va <code>rea</code> skillarini ulash</summary>

```bash
skillshare install TursunboyevJahongir/tasted-skills -s tasted-skills -s hacker-test -s asset-diet -s rea -g && skillshare sync -g
```

</details>
