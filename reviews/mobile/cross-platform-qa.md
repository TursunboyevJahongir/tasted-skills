# `cross-platform-qa` (Lokal Emulator → Yakuniy Real Qurilma QA Oqimi)

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/mobile/cross-platform-qa.md) | [🇷🇺 Русский](../ru/mobile/cross-platform-qa.md)

- **Manba:** Ichki global skill (`skills/cross-platform-qa/SKILL.md`)
- **Turkum:** `Mobile` *(Web + iOS/tvOS + Android/Android TV 2-bosqichli tekshiruv qoidasi)*
- **Turi:** `Skill`
- **Sifat bahosi:** **9.5 / 10**
- **Bizga kerakliligi:** **9.5 / 10**
- **Tavsiya etilgan ko'lam:** `Global (-g)`
- **Tekshirilgan sana:** `2026-11-16`
- **Joriy holati:** `✅ Faol`

---

## 1. Nima va qanday ishlaydi?

Web, iOS/tvOS va Android/Android TV ilovalarda kod yozish hamda tekshirishni **oldindan unit-test (TDD) yozmasdan**, haqiqiy UI'da tez va tartibli o'tkazish uchun yaratilgan 2-bosqichli global skill:

1. **1-Bosqich (Ish jarayoni — 100% lokal kompyuterda):**
   - Ish davomida fizikiy telefon/planshetga qayta-qayta build o'rnatilmaydi.
   - **Web (`Google Chrome`):** [`agent-desktop`](../developer-tools/agent-desktop.md) orqali ochiq va login qilingan brauzerda fonda (`AXPress`, `~0.2–0.3s`) tekshiriladi.
   - **iOS / tvOS (Headless Simulator):** [`simslim`](simslim.md) bilan yengillashtirilgan (`~1.16 GB` RAM) simulyator `xcrun simctl boot <UDID>` orqali oynasiz fonda yoqilib, [`agent-device`](agent-device.md) (`--platform ios --udid <UDID>`, `@ref`, `diff snapshot -i --settle`, `~0.2s`) orqali tekshiriladi (`Device Hub` fallback sifatida qoladi).
   - **Android / Android TV (Headless Emulator):** [`avdslim`](avdslim.md) (`avdslim start ... --headless --no-slim`, `1536 MB` + Apple Metal `host` GPU Golden Snapshot, `~2.64 GB` RAM) bilan fonda yoqilib, UI oqimi [`agent-device`](agent-device.md) (`--platform android --serial emulator-5554`, `~0.9s`, o'zbekcha UTF-8 input bilan) hamda past darajadagi port/log ishlari [`adb`](adb.md) (`reverse`, `logcat`) orqali tekshiriladi.
2. **2-Bosqich (Yakuniy "Done" qoidasi — Real qurilmada 1 marta tekshirish):**
   - Barcha lokal tekshiruvlar bitib, vazifa **Done** bo'lishidan oldin kompyuterga ulangan real telefon/planshetda (`agent-device` + `adb` / `devicectl`) **1 marta yakuniy sinov** o'tkazilib tasdiqlanadi.

---

## 2. Qanchalik yaxshi va qanchalik yomon?

### Kuchli tomonlari
- Ish vaqtida USB qurilmaga bog'lanib qolishni va sekin build kutishni yo'qotadi.
- UI'da befoyda unit-testlar yozish o'rniga haqiqiy xarita, tugma va ekranlarni jonli tekshiradi, oxirida esa real telefon/planshetda yakuniy ishonch hosil qiladi.

### Zaif tomonlari va xarajati
- Hech qanday ortiqcha kontekst xarajati yo'q (`~3.4 KB` Markdown).

---

## 3. Xavfsizlik va O'rnatishdan oldin tozalash (Sanitarizatsiya)

- **Xavf darajasi:** `Past`
- **Tekshirilgan nuqtalar:** O'zimiz yozgan global qoida; `adb` da doim aniq `-s <serial>` ko'rsatish va ish yakunida fonda ochilgan emulyatorni yopish talabi kiritilgan.

---

## 4. Bizga qanchalik kerak va mavjud vositalar bilan mosligi

- [`agent-desktop`](../developer-tools/agent-desktop.md) (Web), [`agent-device`](agent-device.md) (iOS/Android/TV UI + `--maestro` E2E), [`simslim`](simslim.md) (iOS Simulator `1.16 GB` RAM), [`avdslim`](avdslim.md) (Android AVD `2.64 GB` RAM + Apple Metal GPU), [`adb`](adb.md) va [`xcrun simctl` + `Device Hub`](ios-simulator-device-hub.md) vositalarini yagona 2-bosqichli intizomga birlashtiradi.

---

## 5. Qaysi yo'nalish va vazifalarda foydali?

- **Qachon ishlatish kerak:** Web, iOS, tvOS, Android, Android TV va React Native / Expo loyihalaridagi har qanday UI yoki funksional o'zgarishda.

---

## 6. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-11-15 | `skillshare new cross-platform-qa -g` orqali yaratish va sinxronlash | `✅ Faol` | Barcha 5 ta global targetga ulandi. |
| 2026-11-16 | Mobil va TV bosqichlarini `agent-device`, `simslim` va `avdslim` bilan yangilash | `✅ Faol` | Headless iOS/tvOS Simulator (`simslim`, `1.16 GB`) va `-no-window` Android/TV Emulator (`avdslim`, `2.64 GB` Metal GPU) uchun `agent-device` (`+ --maestro`) asosiy vosita qilindi; Web uchun `agent-desktop` saqlab qolindi. |
