# Sinab ko'rilgan va ishlatilayotgan AI Skill hamda Tool'lar

**🇺🇿 O'zbekcha** | [🇬🇧 English](README.en.md) | [🇷🇺 Русский](README.ru.md)

- `✅ Ishlatyapman` — kundalik ishda doimiy ishlatilyapti
- `👍 Yaxshi variant` — tekshirilgan, aynan mos vaziyat chiqqanda ishlatishga arziydi
- `⛔ Rad etildi` — bizga kerak emas, mavjud vositamizdan kuchsiz, ziddiyatli yoki xavfli

> [!TIP]
> **🛡️ Xavfsizlik qoidamiz (sizga ham tavsiya):** Hech qachon begona skill, plugin yoki MCP serverni faqat chiroyli `README` yoki yulduzlariga qarab o'rnatmang. Biz har bitta nomzodni o'rnatishdan oldin **o'zimizning AI coding agentga uning ichki kodini (`SKILL.md`, skriptlar, hooklar, tarmoq/env murojaatlari) o'qitib tekshirtiramiz** hamda [**`skillshare`**](reviews/developer-tools/skillshare.md) ichidagi tayyor `skillshare audit` tekshiruvidan o'tkazamiz.

📖 [Qaysi skill va tool'larni bir-biri bilan qanday ulab ishlatish, qo'shimcha imkoniyatlari va **⚖️ Barcha Skill/Tool'lar Solishtiruvi** →](practices/README.md)

---

## ⭐ Eng keraklilari (Kundalik ishlatilish tartibi bo'yicha)

### 1. [grill-me](reviews/architecture/grill-me.md) — Ishni boshlashdan oldin oxirigacha o'ylab olish va chuqur debug
`✅ Ishlatyapman` · **Baho:** `9.5/10` · **Turi:** Skilllar to'plami · **Sana:** `2026-05-23` dan

Vazifani AI'ga *"shu taskni qil"* deb ko'r-ko'rona topshirib yuborishdan saqlaydi: kod yozishdan oldin qisqa savol-javoblar bilan sizni ham, AI'ni ham bitta aniq rejaga olib keladi. Natijada xato yo'ldan ketib, bitta ishni ikki-uch marta qayta yozib tekshirishga vaqt ham, token ham ketmaydi (`~2–3x` tejamkorlik), o'zingiz ko'rmay qolgan nozik holatlarni esa boshidayoq o'ylab olasiz. *(To'plam ichida qiyin xatolarni sababigacha topadigan **`diagnosing-bugs`** va arxitektura tahlili **`improve-codebase-architecture`** ham bor).*

### 2. [graphify](reviews/architecture/graphify.md) — Loyiha qolipini chizish va tokenni `~10x–20x` gacha tejash
`✅ Ishlatyapman` · **Baho:** `9.5/10` · **Turi:** Skill + Python CLI · **Sana:** `2026-07-28` dan

Butun loyihaning qolipini — qaysi fayl, modul va funksiya qayerga bog'langanini kompyuterning o'zida **`0` token sarflab** xaritaga (`graph.json` + HTML) tushirib qo'yadi. Keyingi vazifalarda AI yuzlab fayllarni bittalab o'qib token yoqmasdan, tayyor xaritadan kerakli joyni soniyada topadi — bu katta loyihalarda **token sarfini taxminan `10x–20x` gacha (`~85–95%`) tejaydi** va javob aniqligini oshiradi (`70.8% -> 82%`).

### 3. [ponytail](reviews/architecture/ponytail.md) — Ortiqcha murakkabliksiz eng qisqa toza kod va lo'nda javob
`✅ Ishlatyapman` · **Baho:** `9.5/10` · **Turi:** Skill · **Sana:** `2026-11-15` dan

AI'ning eng yomon odati — 10 qatorlik ishni 200 qatorlik keraksiz "universal arxitektura"ga aylantirish va uzun insho yozishni to'xtatadi. Vazifani to'liq hal qiladigan **eng kichik va toza kod** yozdiradi hamda bir o'qishda tushunarli qisqa javob qaytaradi (**chiqish tokeni va kod hajmini `~2–4x` gacha kamaytiradi**).

### 4. [karpathy-guidelines](reviews/architecture/karpathy-guidelines.md) — Qo'shni kodni buzmasdan faqat kerakli joyni aniq o'zgartirish
`✅ Ishlatyapman` · **Baho:** `9.5/10` · **Turi:** Skill · **Sana:** `2026-11-15` dan

Ishlab turgan loyihada AI "yo'l-yo'lakay boshqa joylarni ham chiroyli qilaman" deb sog'lom kodni buzib qo'yishining oldini oladi. Noaniq joylarni jimjit taxmin qilmasdan oldindan aytishga va jarrohlik aniqligida **faqat so'ralgan qatorlarni** tahrirlashga majburlaydi.

### 5. [impeccable](reviews/ui-ux/impeccable.md) — Web va Mobil ilovalar uchun tayyor dizayner va UX tekshiruvchi
`✅ Ishlatyapman` · **Baho:** `9.5/10` · **Turi:** Skill · **Sana:** `2026-11-09` dan

AI chizgan bir xil shablon ("AI-slop") dizaynlarni taqiqlab, Web, mobil veb va iOS/Android ekranlarni professional darajada loyihalaydi va tozalaydi (`polish`, `clarify`, `harden`). **💡 Muhim qo'shimcha:** rangli tugmalarda (`ko'k`, `olovrang`, `yashil`) eski `WCAG 2` formulasi toza oq yozuvni xira qoraga o'zgartirib yubormasligi uchun ichiga **`APCA` (`|Lc| ≥ 60`) ko'zga mos kontrast** qoidasini qo'shganmiz ([nimalar o'zgartirilgani](reviews/ui-ux/impeccable.md#apca-contrast)).

### 6. [elephant-goldfish-model](reviews/architecture/elephant-goldfish-model.md) — O'z xatosini yashirmaydigan mustaqil Arxitektura va Kod tekshiruvi
`✅ Ishlatyapman` · **Baho:** `9.5/10` · **Turi:** Plugin (7 skill + 10 agent) · **Sana:** `2026-11-15` dan

Kod yozgan AI o'z ishini o'zi tekshirsa, xatosini maqtab o'tkazib yuboradi. Bu plugin oldingi suhbatni umuman ko'rmagan "xotirasiz" tanqidchi subagentlarni (*Goldfish*) chaqirib, yozilgan reja yoki kodni noldan ayovsiz tekshirtiradi va hujjat bilan real kod bir-biridan farq qilib ketgan joylarni (`egm-drift-report`) topib beradi.

### 7. [agent-desktop](reviews/developer-tools/agent-desktop.md) — Sichqonchani tortib olmasdan Chrome va Desktop dasturlarni fonda test qilish
`✅ Ishlatyapman` · **Baho:** `9.5/10` · **Turi:** CLI + Skill · **Sana:** `2026-11-15` dan

Siz kompyuterda o'z ishingizni qilaverasiz — AI esa kursoringizga tegmasdan va oynani oldinga chiqarmasdan, orqa fonda ochiq turgan (login qilingan) `Google Chrome` yoki macOS dasturlaridagi tugmalarni bosib, formalarni to'ldirib UI'ni o'zi tekshiradi (og'ir skrinshotlar o'rniga yengil matnli daraxt o'qigani uchun **tokenni `~5–10x` tejaydi**).

### 8. [agent-device](reviews/mobile/agent-device.md) — Mobil va TV (`iOS` / `Android` / `tvOS`) ilovalarni oynasiz fonda test qilish
`✅ Ishlatyapman` · **Baho:** `9.5/10` · **Turi:** CLI + Skill · **Sana:** `2026-11-16` dan

Ekranda birorta ham simulyator oynasini ochmasdan, orqa fonda iOS/tvOS (`~0.2s`) va Android/TV (`~0.9s`, o'zbekcha UTF-8 yozuv bilan) ilovalarni o'zi bosib tekshiradi. MCP serverlarga qaraganda har xabarda **`~7,500` token bo'sh qoladi** va ekran o'qishda **tokenni `~27x` gacha tejaydi**; ustiga Java o'rnatmasdan tayyor Maestro `.yaml` E2E testlarni ham yurgizadi.

### 9. [cross-platform-qa](reviews/mobile/cross-platform-qa.md) — Web, Mobil va TV uchun 2 bosqichli sifat nazorati tartibi
`✅ Ishlatyapman` · **Baho:** `9.5/10` · **Turi:** Skill · **Sana:** `2026-11-15` dan

Har mayda o'zgarishda telefonga kabel orqali qayta-qayta build yozib vaqt yo'qotmaslik qoidasi: **1-bosqichda** AI barcha tekshiruvlarni kompyuterning o'zida fonda (`agent-desktop` + `agent-device`) bitiradi, **2-bosqichda** esa ishni "Tayyor" deyishdan oldin ulangan haqiqiy telefonda 1 marta yakuniy sinovdan o'tkazadi.

### 10. [sentry](reviews/backend/sentry.md) — Production'dagi xatolar, sekin so'rovlar va foydalanuvchi ekran yozuvi
`✅ Ishlatyapman` · **Baho:** `9.5/10` · **Turi:** Self-Hosted + Skill / MCP · **Sana:** `2026-07-08` dan

Mijozda xato chiqqanda "qanday qilib buzildi ekan?" deb taxmin qilib o'tirmaysiz: Backend, Web va Mobil crash'larning aniq kod qatorini, xatodan oldin bosilgan tugmalarni (`Breadcrumbs`), videodek ekran yozuvini (`Session Replay`) va sekin API/SQL so'rovlarni yig'ib, to'g'ridan-to'g'ri AI'ga tahlil qilib beradi.

### 11. [skillshare](reviews/developer-tools/skillshare.md) — Barcha AI'lar uchun bitta skill markazi va xavfsizlik tekshiruvi (`audit`)
`✅ Ishlatyapman` · **Baho:** `9.5/10` · **Turi:** CLI + Skill · **Sana:** `2026-05-30` dan

`Codex`, `Claude` va `Antigravity` uchun skilllarni har biriga qo'lda alohida ko'chirib yurish azobini yo'qotadi — bitta papkadan hammasiga birdan tarqatadi. Ichidagi **`skillshare audit`** skaneri esa yangi skill ichida yashirin virus, prompt-injection yoki token shishishi bor-yo'qligini `0.1` soniyada tekshirib beradi.

### 12. [animate-expo](reviews/mobile/animate-expo.md) — Expo / React Native ilovalarda qotmaydigan (`60/120fps`) silliq animatsiya
`✅ Ishlatyapman` · **Baho:** `9.5/10` · **Turi:** Skill · **Sana:** `2026-11-09` dan

Simulyatorda silliq ko'rinib, haqiqiy Android yoki iPhone'da qotib qoladigan animatsiyalarning oldini oladi. Barcha harakat va jestlarni (`bottom-sheet`, `swipe`, `press`, `haptics`) asosiy JS oqimini band qilmasdan `Reanimated` UI oqimida toza yozdiradi.

### 13. [Orca + CLI Subagent](reviews/developer-tools/orca.md) — Bitta promptdan bir nechta AI'ni ishlatish va telefondan uzilmay boshqarish
`✅ Ishlatyapman` · **Baho:** `9.5/10` · **Turi:** Desktop + Mobile App + CLI + Skill · **Sana:** `2026-11-16` dan

Bitta xabarda *"Codex kod yozsin, Claude rejasini tekshirsin, Argon natijani test qilsin"* desangiz, asosiy agentning o'zi boshqa AI'larni ishga tushirib, xulosani bitta chatga yig'ib beradi (`orca orchestration`). Kompyuter blokda (`Lock Screen`) tursa ham uxlamaydi (`caffeinate`) va telefondagi **`Orca IDE`** ilovasidan aloqa uzilmay ishlaydi (`PostHog` telemetriyasi o'chirilgan).

### 14. [adb](reviews/mobile/adb.md) — Android port ulash (`reverse`), `logcat` xatolarini o'qish va APK o'rnatish
`✅ Ishlatyapman` · **Baho:** `9.0/10` · **Turi:** CLI · **Sana:** `2026-09-07` dan

Android emulyator va haqiqiy telefonlarda lokal backend portlarini ulash (`adb reverse`), ilova yiqilganda aniq xato loglarini (`logcat`) olish va APK o'rnatish uchun eng ishonchli past darajadagi vosita (bir nechta qurilma ulanganda `-s <serial>` ko'rsatish majburiy).

### 15. [xcrun simctl + Device Hub](reviews/mobile/ios-simulator-device-hub.md) — iOS simulyatorni oynasiz yoqish va haqiqiy iPhone'ga ilova o'rnatish
`✅ Ishlatyapman` · **Baho:** `9.0/10` · **Turi:** Xcode CLI + App · **Sana:** `2026-10-20` dan

iOS Simulator'ni ekranni to'smasdan fonda yoqib-o'chiradi (`simctl boot/shutdown`) va kabel/Wi-Fi orqali haqiqiy iPhone'ga tayyor build'ni o'rnatadi (`devicectl`).

### 16. [simslim](reviews/mobile/simslim.md) — iOS / tvOS Simulator RAM sarfini `-57%` (`-77.5%` GUI da) kamaytirish
`✅ Ishlatyapman` · **Baho:** `9.0/10` · **Turi:** Standalone Go CLI · **Sana:** `2026-11-16` dan

iOS Simulator ichida bekorga yotadigan `~150+` ta keraksiz Apple fon xizmatini (`Siri`, `Apple Intelligence`, `Wallpaper`) o'chirib, fonda simulyator RAM sarfini **`2.70 GB -> 1.16 GB` (`-57%`, oynali rejimda `4.0 GB -> 0.9 GB`)** ga tushiradi hamda har simulyatordan `1.5 GB+` ortiqcha keshni tozalaydi (`push` va `agent-device` buzilmaydi).

### 17. [avdslim](reviews/mobile/avdslim.md) — Android Emulator RAM sarfini `-40%` qisqartirish va Mac GPU tezlatgichi
`✅ Ishlatyapman` · **Baho:** `9.0/10` · **Turi:** Standalone Go CLI · **Sana:** `2026-11-16` dan

Android Emulator kompyuterni qotirib qo'ymasligi uchun grafikani CPU'dan to'g'ridan-to'g'ri **Apple Metal GPU**'ga o'tkazadi va xotirani **`4.41 GB -> 2.64 GB` (Android Studio standart `8.5 GB` idan `-69%`)** gacha tushiradi. Xarita va animatsiyalar silliq ishlaydi, yoqilish vaqti `14` soniyaga tushadi.

### 18. [security-audit](reviews/backend/security-audit-skill.md) — Server ko'tarmasdan kod ichidagi xavfsizlik teshiklarini topish
`✅ Ishlatyapman` · **Baho:** `9.0/10` · **Turi:** Skill · **Sana:** `2026-11-16` dan

PR yoki reliz oldidan Docker yoqmasdan Backend, Web va **Mobil (`deep-link`, `WebView`)** kodlarini xaker ko'zi bilan o'qib chiqadi. Yolg'on trevogalarni kamaytirish uchun bitta subagent topgan zaiflikni ikkinchi mustaqil subagent qayta tekshirib tasdiqlaydi (kvota yemasligi uchun tejamkor `quick/scoped` rejim o'rnatilgan).

### 19. [mobile-native + web-to-native-mobile](reviews/mobile/mobile-native.md) — Mobil sayt/PWA'ni native ilovadek qilish va Web -> App ko'chirish
`✅ Ishlatyapman` · **Baho:** `8.5/10` · **Turi:** Skilllar to'plami · **Sana:** `2026-11-15` dan

Telefonda ochilgan veb-sayt yoki Mini App'dagi noqulayliklarni (input bosganda ekran kattalashib ketishi, `100vh` sakrashi, iPhone `notch` ustiga chiqib ketish, yopishqoq `hover`) 11 ta tayyor CSS/meta qoida bilan tuzatadi + veb funksiyani mobil ilovaga ko'chirishda nimalarni soddalashtirish kerakligini hal qiladi.

### 20. [AssetDiet](reviews/developer-tools/assetdiet.md) — Loyihadagi og'ir rasm, SVG, video va 3D fayllarni sifatni buzmay siqish
`✅ Ishlatyapman` · **Baho:** `7.5/10` · **Turi:** CLI + [`asset-diet`](skills/asset-diet/SKILL.md) · **Sana:** `2026-11-16` dan

Sayt yoki mobil ilova hajmini shishirib yuborgan rasm, SVG va videolarni kompyuterning o'zida (bulutga yuklamasdan) topib siqib beradi va yoqmasa 1 buyruq bilan asl holiga qaytaradi (`rollback`). Kontekstni band qilmasligi uchun doimiy MCP o'rniga faqat chaqirilganda (`0` token yuk) ishlaydi.

### 21. [watch + video-analyzer](practices/06-video-figma-and-db-workflows.md) — YouTube/Reels darsliklar va mijoz yuborgan bug-videolarni kadr-ba-kadr o'qish
`✅ Ishlatyapman` · **Baho:** `9.0/10` · **Turi:** Skill + CLI (`yt-dlp` + `ffmpeg`) · **Sana:** `2026-10-25` dan

AI videoni shunchaki taxmin qilmaydi: ovozni matnga o'giradi (`Whisper`) va aynan ekran almashgan kadrlarni kesib olib ko'radi. Ham videodagi yangi tool'larning haqiqiy nomini topishda, ham tester yuborgan "mana bu yerda qotyapti" degan ekran yozuvidan xato sababini sekundigacha tutishda vaqtni tejaydi.

### 22. [figma skilllar to'plami](practices/06-video-figma-and-db-workflows.md) — Figma dizayndan kod yozish va tayyor koddan Figma'ga dizayn chizish
`✅ Ishlatyapman` · **Baho:** `9.0/10` · **Turi:** 6 ta Skill + MCP · **Sana:** `2026-10-20` dan

Ikki tomonlama ko'prik: dizayner chizgan Figma maketni aniq o'lcham va ranglari bilan kodga o'giradi (`figma-implement-design`), yoki aksincha — dizaynersiz yozilgan tayyor dastur ekranlarini qayta Figma'ga toza maket va komponent qilib chizib beradi (`figma-generate-design`).

### 23. [client-performance-gate](practices/03-web-and-mobile-ui-polish.md) — Mijoz ilovalarini past internet va kuchsiz qurilmada qotmaslikka tekshirish
`✅ Ishlatyapman` · **Baho:** `9.0/10` · **Turi:** Skill · **Sana:** `2026-11-10` dan

Dasturchining kuchli kompyuterida tez ishlagan sayt yoki TV ilova oddiy foydalanuvchining sekin telefoni va `3G` internetida qotib qolmasligini tekshiradi (`6x` sekin CPU + internet uzilib-ulanishida sahifani yangilamasdan o'zi tiklanishi shart; Admin panellarga qo'llanmaydi).

### 24. [drizzle-relations-v2](practices/06-video-figma-and-db-workflows.md) — Drizzle ORM bazasida eski kod yozib xato qilishdan himoya
`✅ Ishlatyapman` · **Baho:** `8.5/10` · **Turi:** Skill · **Sana:** `2026-11-05` dan

AI modellarining xotirasida eski Drizzle `v1` sintaksisi qolib ketgani sababli baza so'rovlarida xato yozib qo'yadi. Bu skill AI'ga yangi `v2 defineRelations` qoidalarini berib, birinchi urinishdayoq to'g'ri SQL sxema va so'rov yozdiradi.

---

## Yo'nalishlar bo'yicha

### 🧠 Lokal modellar

#### [kimi-k3-in-c](reviews/local-models/kimi-k3-in-c.md) — `2.78T` gigant modelni GPU'siz SSD diskdan o'qish eksperimenti
`⛔ Rad etildi` · **Sifat:** `8.5/10` · **Keraklilik:** `1.0/10` · **Turi:** C99 CLI Engine (`2.78T` MoE) · **Sana:** `2026-11-16`

Katta `Kimi K3` modelini videokartasiz to'g'ridan-to'g'ri NVMe SSD diskdan o'qib ishlatish tajribasi. **Nega rad etildi:** Modelning o'zi kuchli bo'lsa ham, diskdan o'qish usulida **kod yozib bo'lmaydi** — `1 ta so'z (token) = ~24–33 soniya`, `500` token javob uchun **`~3.5 soat`** va **`~50 TB` SSD o'qish** ketadi (disk umrini yeb bitiradi; normal ishlashi uchun `16× H200 / ~2.25 TB VRAM` server kerak). **Haqiqiy lokal coder kerak bo'lsa:** `32–64 GB` Mac'da RAM ichida tez ishlaydigan (`30–65 tok/s`) `Ollama` / `MLX` (`Qwen3-Coder`). 📊 [GitHub](https://github.com/FareedKhan-dev/kimi-k3-in-c) · [Artificial Analysis](https://artificialanalysis.ai/leaderboards/models)

#### [MiniMax-M3.1-Flash *(Lokal)*](reviews/local-models/minimax-m3-1-flash.md) — `428B` multimodal modelni lokal kompyuterda ko'tarish
`⛔ Rad etildi` · **Sifat:** `8.0/10` · **Keraklilik:** `1.0/10` · **Turi:** Open-Weight `428B` MoE (`~23B` aktiv) · **Sana:** `2026-11-16`

Matn, rasm va videoni tushunadigan (`1M` kontekst) tezkor model, lekin lokal o'rnatish uchun og'irligi **`~250–285 GB`** — oddiy ishchi kompyuterlarga umuman sig'maydi (`Min: 512 GB Mac Studio`, silliq ishlashi uchun `8× H100 / 640 GB VRAM`), murakkab kod yozishda ham asosiy model emas (`Terminal-Bench 4.0: 38.1%`). **O'rniga:** lokalda `Ollama` / `MLX` (`Qwen3-Coder`); aynan shu model kerak bo'lsa — [🔌 `MiniMax M3.1 Flash API`](reviews/external-apis/minimax-m3-1-flash-api.md). 📊 [HuggingFace](https://huggingface.co/MiniMaxAI/MiniMax-M3.1-Flash) · [OpenRouter](https://openrouter.ai/minimax/minimax-m3.1-flash)

### 🔌 Tashqi API'lar

#### [MiniMax M3.1 Flash API](reviews/external-apis/minimax-m3-1-flash-api.md) — Mahsulot backendi (chatbot, tarjima, rasm/video OCR) uchun juda arzon va tez API
`👍 Yaxshi variant` · **Sifat:** `8.0/10` · **Keraklilik:** `5.0/10` · **Turi:** Cloud Multimodal API · **Sana:** `2026-11-16`

O'z loyihangiz ichida mijozlar uchun ommaviy AI-chat, hujjat/rasm o'qish (`OCR`), tarjima yoki video tahlil qilish kerak bo'lganda juda arzon (`$0.15 / $0.60`, keshda `$0.015`) va tez (`170+ tok/s`, `1M` kontekst) ishlaydi. Murakkab dasturlash arxitekturasi uchun emas (`Terminal-Bench: 38.1%`), lekin servis backendi uchun foydali *(faqat pullik Zero-Retention API kalit ishlating; tekin `:free` proxy'larga yopiq kod yubormang)*. 📊 [OpenRouter](https://openrouter.ai/minimax/minimax-m3-1-flash) · [HuggingFace](https://huggingface.co/MiniMaxAI/MiniMax-M3.1-Flash)

### 🌐 Web

#### [taste-skill v2.5](reviews/web/taste-skill.md) — Noldan chiroyli reklama va promo-landing sahifalar qurish to'plami
`👍 Yaxshi variant` · **Sifat:** `8.0/10` · **Keraklilik:** `4.0/10` · **Turi:** Landing Kit + Hook · **Sana:** `2026-11-15`

Yangi mahsulot uchun noldan ko'zni tortadigan promo-sayt (landing) yig'ishda foydali; lekin ichida 600 soniyalik sekinlashtiruvchi `Stop` hook borligi uchun global o'rnatilmaydi — faqat landing loyihaning o'ziga (`-p`) hookni olib tashlab ulanadi. Kundalik UI uchun [**`impeccable`**](reviews/ui-ux/impeccable.md) yetarli.

#### [vercel-labs/ui](reviews/web/vercel-ui-sdk.md) — Faqat o'zining `@ui-sdk/*` teglarida yozilgan saytlarnigina ko'radigan Beta kutubxona
`⛔ Rad etildi` · **Sifat:** `8.0/10` · **Keraklilik:** `2.0/10` · **Turi:** `@ui-sdk/*` Library + Skill (`Beta`) · **Sana:** `2026-11-16`

*"Skrinshotsiz 2x tez agent boshqaruvi"* deb reklama qilingan imkoniyati amalda oddiy `<button>`, `<input>` yoki `Shadcn`/`Radix` saytlarini ko'rmaydi — buning uchun butun saytni noldan `@ui-sdk/*` da qayta yozib chiqish kerak (`Expo` da esa umuman ishlamaydi). **O'rniga:** har qanday tayyor saytda ishlaydigan [**`agent-desktop`**](reviews/developer-tools/agent-desktop.md) + [**`impeccable`**](reviews/ui-ux/impeccable.md).

### 📱 Mobile

#### [swiftui-agent-skill](reviews/mobile/swiftui-agent-skill.md) — Sof Apple SwiftUI (`Widget`, `Live Activity`) qoidalari to'plami
`👍 Yaxshi variant` · **Sifat:** `8.5/10` · **Keraklilik:** `3.0/10` · **Turi:** Skill · **Sana:** `2026-11-16`

Sof SwiftUI va Apple dizayn qoidalari juda yaxshi yozilgan; asosiy mobil stekimiz `Expo / React Native` bo'lgani uchun global kontekstni band qilmasdan, faqat iPhone uchun alohida native Widget yoki Live Activity yoziladigan loyihada (`-p`) olinadi. **Asosiy mobil ishlar uchun:** [**`impeccable`**](reviews/ui-ux/impeccable.md) + [**`animate-expo`**](reviews/mobile/animate-expo.md).

#### [ARTEMIS](reviews/mobile/artemis.md) — Google'ning rasm va OCR orqali o'zi yuradigan pullik Android QA agenti
`👍 Yaxshi variant` · **Sifat:** `8.5/10` · **Keraklilik:** `2.5/10` · **Turi:** Python CLI / SDK + MCP · **Sana:** `2026-11-16`

Oddiy UI daraxti ko'rinmaydigan o'yin yoki murakkab `Canvas` ekranlarini rasm orqali tekshira oladi, lekin **har bir qadami uchun alohida pullik API kalit (`.env`) so'raydi**, `3–40 soniya` sekin yuradi va `iOS`/`TV` da ishlamaydi. **O'rniga:** bepul (`$0`), `iOS + Android + TV` da `0.2–0.9s` da ishlaydigan [**`agent-device`**](reviews/mobile/agent-device.md).

#### [mobile-mcp](reviews/mobile/mobile-mcp.md) — Kontekstni shishiradigan va `agent-device` dan `6.5x–37x` sekin mobil MCP server
`⛔ Rad etildi` · **Sifat:** `7.0/10` · **Keraklilik:** `2.0/10` · **Turi:** MCP Server (34 tool) · **Sana:** `2026-11-16`

Jonli sinovda rad etildi: ishlatmasangiz ham har bitta yozishmada **`~7,580` tokenni bekorga yeb turadi**, bitta tugma yoki skrinshot uchun `6–7 soniya` kutadi hamda ichida `Scarf`/`PostHog` kuzatuvi va pullik cloud reklamalari bor. **O'rniga:** [**`agent-device`**](reviews/mobile/agent-device.md) + [**`adb`**](reviews/mobile/adb.md).

### 🎨 UI/UX

#### [animate](reviews/ui-ux/animate.md) — Faqat Web uchun animatsiya skilli (`impeccable` bilan takrorlanadi)
`⛔ Rad etildi` · **Sifat:** `8.5/10` · **Keraklilik:** `3.0/10` · **Turi:** Skill (2 fayl) · **Sana:** `2026-11-15`

Emil Kowalski'ning veb-animatsiya qoidalari sifatli bo'lsa-da, xuddi shu qoidalar bizdagi `impeccable` ichida bor va o'rnatilsa mobil `animate-expo` bilan trigger to'qnashuvi beradi. **O'rniga:** [**`impeccable`**](reviews/ui-ux/impeccable.md) (`animate`) + [**`animate-expo`**](reviews/mobile/animate-expo.md).

#### [unslop](reviews/ui-ux/unslop.md) — AI chizgan veb-sahifalarni 9 bosqichda tozalovchi tor skill
`⛔ Rad etildi` · **Sifat:** `8.5/10` · **Keraklilik:** `2.5/10` · **Turi:** Skill + Playwright skriptlar · **Sana:** `2026-11-16`

Faqat veb-brauzer sahifalaridagi "AI-slop" belgilarni tozalaydi, mobil ilovalarda ishlamaydi va `impeccable` bilan bir xil joyda avtomatik uyg'onib urishadi. **O'rniga:** [**`impeccable`**](reviews/ui-ux/impeccable.md) (`polish` / `quieter` / `clarify`).

#### [break-ui](reviews/ui-ux/break-ui.md) — UI'ni uzun/bo'sh matnlar bilan buzib ko'rsatib, tuzatmay to'xtaydigan skill
`⛔ Rad etildi` · **Sifat:** `8.0/10` · **Keraklilik:** `3.0/10` · **Turi:** Skill (2 fayl) · **Sana:** `2026-11-15`

Sahifaga juda uzun ism yoki bo'sh ro'yxat tiqib qayeri sinishini ko'rsatadi, lekin loyiha kodiga vaqtinchalik test tugmalar qo'shib ketadi va muammoni o'zi tuzatmaydi. **O'rniga:** xatoni topiboq darhol kodda tuzatadigan [**`impeccable`**](reviews/ui-ux/impeccable.md) (`harden`).

#### [make-interfaces-feel-better](reviews/ui-ux/make-interfaces-feel-better.md) — Uzun hisobotlar chiqarib token yeydigan veb-UI tekshirgich
`⛔ Rad etildi` · **Sifat:** `7.5/10` · **Keraklilik:** `2.5/10` · **Turi:** Skill (6 fayl) · **Sana:** `2026-10-31 → 2026-11-15`

16 kun davomida sinab ko'rilib olib tashlandi: oddiy UI ishida ham 4 tadan uzun Markdown jadval yozib tokenni ko'p yeydi va `impeccable` bilan urishadi. **O'rniga:** [**`impeccable`**](reviews/ui-ux/impeccable.md) + [**`animate-expo`**](reviews/mobile/animate-expo.md).

#### [ui-ux-pro-max](reviews/ui-ux/ui-ux-pro-max.md) — Shablon CSV jadvallardan rang va shrift tanlovchi eski UI skill
`⛔ Rad etildi` · **Sifat:** `7.0/10` · **Keraklilik:** `3.5/10` · **Turi:** Skill + CSV/Python · **Sana:** `2026-11-15`

Tayyor CSV ro'yxatdan bir xil shablon ranglar taklif qiladi, `impeccable` dan ancha kuchsiz va uning ishiga xalaqit beradi. **O'rniga:** [**`impeccable`**](reviews/ui-ux/impeccable.md).

### 🏗️ Arxitektura va Review

#### [addy-agent-skills](reviews/architecture/addy-agent-skills.md) — Har bir ishni majburiy TDD va uzun bosqichlarga soladigan og'ir konveyer
`⛔ Rad etildi` · **Sifat:** `8.0/10` · **Keraklilik:** `2.5/10` · **Turi:** Plugin (25 skill + 9 command) · **Sana:** `2026-11-16`

Addy Osmani'ning 25 ta skilldan iborat `/spec -> /ship` tizimi; kundalik vazifalarda ham majburiy TDD va to'xtashlar talab qilgani uchun ishni sekinlashtiradi. **O'rniga:** tez va aniq ishlaydigan [**`grill-me`**](reviews/architecture/grill-me.md) + [**`ponytail`**](reviews/architecture/ponytail.md) + [**`elephant-goldfish-model`**](reviews/architecture/elephant-goldfish-model.md).

#### [agency-agents](reviews/architecture/agency-agents.md) — `~18.5K` token yeydigan 283 ta yuzaki rol-promptlar to'plami
`⛔ Rad etildi` · **Sifat:** `6.5/10` · **Keraklilik:** `2.5/10` · **Turi:** 283 persona prompt + installer · **Sana:** `2026-11-16`

"Sen marketologsan", "Sen dizaynersan" kabi 283 ta shablon matndan iborat bo'lib, hammasini o'rnatganda foydali amaliyot bermasdan **`~18,500` token kontekstni shishirib yuboradi**. **O'rniga:** [**`impeccable`**](reviews/ui-ux/impeccable.md), [**`ponytail`**](reviews/architecture/ponytail.md), [**`elephant-goldfish-model`**](reviews/architecture/elephant-goldfish-model.md).

#### [superpowers](reviews/architecture/superpowers.md) — Ishni `2x` sekinlashtirib, ortiqcha savol va TDD majburlaydigan og'ir plugin
`⛔ Rad etildi` · **Sifat:** `6.5/10` · **Keraklilik:** `2.0/10` · **Turi:** Plugin (14 skill + hook) · **Sana:** `2026-04-04 → 2026-09-01`

5 oy ishlatib ko'rib o'chirib tashlaganmiz: har chat boshida hook orqali ortiqcha o'ylanish qo'shadi, oddiy ishlarda ham keraksiz `brainstorming` va majburiy TDD talab qilib, **vaqt va token sarfini `2x` oshirib yuboradi**. **O'rniga:** [**`grill-me`**](reviews/architecture/grill-me.md) + [**`ponytail`**](reviews/architecture/ponytail.md).

### ⚙️ Backend

#### [opentelemetry](reviews/backend/opentelemetry.md) — O'nlab mikroservis va server yuklamasini kuzatish uchun og'ir monitoring steki
`👍 Yaxshi variant` · **Sifat:** `9.0/10` · **Keraklilik:** `4.0/10` · **Turi:** Standard + Collector (`SigNoz` / `Grafana`) · **Sana:** `2026-11-15`

Katta infratuzilmada server CPU/RAM, DB ulanishlari va servislararo trace'larni chuqur kuzatish uchun eng kuchli standart, lekin alohida `Collector + SigNoz/Grafana` serverlarini ko'tarish va saqlashni talab qiladi. Hozirgi barcha xato, replay va bazaviy trace ehtiyojimizni bitta [**`sentry`**](reviews/backend/sentry.md) to'liq yopadi.

#### [Shannon](reviews/backend/shannon.md) — Lokal/staging sayt va API'ga haqiqiy xakerdek hujum qilib tekshiruvchi AI pentester
`👍 Yaxshi variant` · **Sifat:** `8.5/10` · **Keraklilik:** `6.5/10` · **Turi:** Standalone CLI + [`hacker-test`](skills/hacker-test/SKILL.md) · **Sana:** `2026-11-16`

Katta reliz oldidan ko'tarilgan lokal yoki staging serverga real exploit so'rovlar (`Auth bypass`, `IDOR`, `SQLi`, `XSS`, `SSRF`) otib, teshiklarni amalda isbotlab beradi. Kontekstni shishirmaslik uchun og'ir plugini o'rnatilmaydi — ushbu repodagi yengil [`hacker-test`](skills/hacker-test/SKILL.md) skilli orqali faqat kerak paytda `npx` bilan chaqiriladi *(production serverga otish qat'iyan man etilgan)*.

### 🛠️ Developer Tools va Memory

#### [SkillSpector](reviews/developer-tools/skillspector.md) — NVIDIA'ning Docker va Python talab qiladigan alohida skill-xavfsizlik skaneri
`⛔ Rad etildi` · **Sifat:** `9.0/10` · **Keraklilik:** `3.5/10` · **Turi:** Python CLI + MCP + Skill · **Sana:** `2026-11-16`

Texnik jihatdan kuchli skaner bo'lsa ham, har safar yangi skill olishda alohida Python/Docker/YARA muhitini yurgizish ortiqcha vaqt oladi. **O'rniga:** `0.1` soniyada ishlaydigan [**`skillshare`**](reviews/developer-tools/skillshare.md) (`skillshare audit`) + **AI agentimizga skill kodini bevosita o'qitib tekshirtirish** yetarli.

#### [T3 Code](reviews/developer-tools/t3-code.md) — Eski ko'p-agentli ish muhitimiz (`Orca` ga almashtirildi)
`⛔ Rad etildi` · **Sifat:** `8.5/10` · **Keraklilik:** `2.5/10` · **Turi:** Desktop App + CLI · **Sana:** `2026-10-23 → 2026-11-16`

Bir nechta AI'ni bitta joyda ishlatish uchun ishlatib keldik va to'liq o'chirdik (`~3.87 GB` disk bo'shadi): telefon ilovasi (Beta) ekran o'chganda tez-tez uzilib qoladi, kompyuter bloklanganda (`Lock Screen`) to'xtab qoladi va Chat UI ichida jonli subagent kartalari yo'q. **O'rniga:** har uchala muammoni hal qilgan [**`Orca`**](reviews/developer-tools/orca.md).

#### [caveman](reviews/developer-tools/caveman.md) — AI'ni faqat qisqa "g'or odami" jumlalari bilan javob berishga tushiruvchi skill
`👍 Yaxshi variant` · **Sifat:** `8.0/10` · **Keraklilik:** `3.5/10` · **Turi:** Skill *(+ ixtiyoriy CLI)* · **Sana:** `2026-11-16`

Suhbatdagi gap-so'zlarni qisqartirib **chiqish matn tokenini `~65%` gacha tejaydi**, lekin AI yozadigan kodning shishib ketishini to'xtatmaydi (va CLI paketida telemetriya bor — olinsa faqat toza `SKILL.md` olinishi shart). **O'rniga:** ham gapni, ham ortiqcha kodni qisqartiradigan [**`ponytail`**](reviews/architecture/ponytail.md).

#### [humanizer + stop-slop](reviews/developer-tools/humanizer-stop-slop.md) — Maqola va postlardagi "sun'iy intellekt ohangi"ni tozalovchi matn muharriri
`⛔ Rad etildi` · **Sifat:** `7.5/10` · **Keraklilik:** `2.0/10` · **Turi:** Skill (`Markdown`) · **Sana:** `2026-11-16`

Blog maqola va esselar yozishda foydali (`humanizer` `~32 KB` kontekst oladi), lekin dasturlash va mahsulot interfeysi matnlari uchun mo'ljallanmagan. **O'rniga:** [**`ponytail`**](reviews/architecture/ponytail.md) + [**`impeccable`**](reviews/ui-ux/impeccable.md) (`clarify`).

#### [claude-code-setup](reviews/developer-tools/claude-code-setup.md) — Yangi loyiha uchun boshlang'ich Claude sozlamalarini tavsiya qiluvchi oddiy plagin
`⛔ Rad etildi` · **Sifat:** `7.5/10` · **Keraklilik:** `2.0/10` · **Turi:** Plugin · **Sana:** `2026-11-16`

Faqat yangi o'rganuvchilarga "mana bu hook yoki MCP'ni qo'shsang bo'ladi" deb maslahat beradi; bizda tayyor global ekotizim borligi uchun hech qanday yangi qiymat bermaydi. **O'rniga:** [**`skillshare`**](reviews/developer-tools/skillshare.md).

#### [OmniRoute](reviews/developer-tools/omniroute.md) — Uzoq sessiyalarni uzib qo'yadigan va akkaunt ban xavfi bor lokal LLM proxy
`⛔ Rad etildi` · **Sifat:** `7.5/10` · **Keraklilik:** `2.0/10` · **Turi:** Local Proxy + 44 Admin Skill · **Sana:** `2026-11-16`

Turli AI obunalarini bitta lokal proxy (`localhost:20128`) orqali aylantirishga urinadi, lekin amalda uzoq kod yozish sessiyalarini uzib qo'yadi (`#7287`), limit tugaganda sezdirmay kuchsiz modelga tushirib kod sifatini buzadi va pullik akkauntlarda ToS ban xavfini tug'diradi. **O'rniga:** rasmiy obunalarni xavfsiz boshqaradigan [**`Orca`**](reviews/developer-tools/orca.md) + [**`ponytail`**](reviews/architecture/ponytail.md).

---

<details>
<summary>Global <code>tasted-skills</code>, <code>hacker-test</code> va <code>asset-diet</code> skillarini ulash</summary>

```bash
skillshare install TursunboyevJahongir/tasted-skills -s tasted-skills -s hacker-test -s asset-diet -g && skillshare sync -g
```

</details>
