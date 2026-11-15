# `cross-platform-qa` (Lokal Emulator → Yakuniy Real Qurilma QA Oqimi)

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/mobile/cross-platform-qa.md) | [🇷🇺 Русский](../ru/mobile/cross-platform-qa.md)

- **Manba:** Ichki global skill (`skills/cross-platform-qa/SKILL.md`)
- **Turkum:** `Mobile` *(Web + iOS + Android 2-bosqichli tekshiruv qoidasi)*
- **Turi:** `Skill`
- **Sifat bahosi:** **9.5 / 10**
- **Bizga kerakliligi:** **9.5 / 10**
- **Tavsiya etilgan ko'lam:** `Global (-g)`
- **Tekshirilgan sana:** `2026-11-15`
- **Joriy holati:** `✅ Ishlatilyapti`

---

## 1. Nima va qanday ishlaydi?

Web, iOS va Android ilovalarda kod yozish hamda tekshirishni **oldindan unit-test (TDD) yozmasdan**, haqiqiy UI'da tez va tartibli o'tkazish uchun yaratilgan 2-bosqichli global skill:

1. **1-Bosqich (Ish jarayoni — 100% lokal kompyuterda):**
   - Ish davomida fizikiy telefon/planshetga qayta-qayta build o'rnatilmaydi.
   - **Web (`Google Chrome`):** `agent-desktop` orqali ochiq va login qilingan brauzerda fonda (`AXPress`, `~0.2–0.3s`) tekshiriladi.
   - **iOS (`Device Hub` / iOS Simulator):** `xcrun simctl` bilan simulyator yoqilib, Xcode `Device Hub` oynasi orqali `agent-desktop` yordamida ichki iOS React Native/UIKit elementlari `@ref` bilan (`~0.3–0.8s`) boshqariladi.
   - **Android (Lokal Android Emulator):** `emulator -avd ... -no-window` fonda yoqilib, ichki Android UI `adb -s emulator-5554` (`uiautomator dump`, `input tap`, `screencap`) orqali tekshiriladi.
2. **2-Bosqich (Yakuniy "Done" qoidasi — Real qurilmada 1 marta tekshirish):**
   - Barcha lokal tekshiruvlar bitib, vazifa **Done** bo'lishidan oldin kompyuterga ulangan real telefon/planshetda (`adb devices` / `devicectl`) **1 marta yakuniy sinov** o'tkazilib tasdiqlanadi.

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

- `agent-desktop`, `adb` va `xcrun simctl + Device Hub` vositalarini yagona intizomga birlashtiradi.

---

## 5. Qaysi yo'nalish va vazifalarda foydali?

- **Qachon ishlatish kerak:** Web, iOS, Android va React Native / Expo loyihalaridagi har qanday UI yoki funksional o'zgarishda.

---

## 6. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-11-15 | `skillshare new cross-platform-qa -g` orqali yaratish va sinxronlash | `✅ Ishlatilyapti` | Barcha 5 ta global targetga ulandi. |
