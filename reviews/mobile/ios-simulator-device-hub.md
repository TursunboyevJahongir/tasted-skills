# `xcrun simctl` + Xcode `Device Hub` (`devicectl`)

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/mobile/ios-simulator-device-hub.md) | [🇷🇺 Русский](../ru/mobile/ios-simulator-device-hub.md)

- **Manba:** [Apple Xcode Command Line & Simulator Tools (`simctl` / `devicectl`)](https://developer.apple.com/documentation/xcode/interacting-with-simulator-from-the-command-line)
- **Turkum:** `Mobile` *(iOS Simulator va haqiqiy iPhone/iPad ilovalarini boshqarish)*
- **Turi:** `CLI + macOS App Bridge` (`Xcode.app` tarkibida)
- **Sifat bahosi:** **9.0 / 10**
- **Bizga kerakliligi:** **9.5 / 10**
- **Tavsiya etilgan ko'lam:** `Standalone Tool` *(Xcode bilan o'rnatilgan + `agent-desktop` bilan birga ishlaydi)*
- **Ishlatilayotgan sana:** `2026-10-20` dan
- **Joriy holati:** `✅ Ishlatyapman` *(iOS ilovalarni simulyator va qurilmada tekshirish uchun asosiy vosita)*

---

## 1. Nima va qanday ishlaydi?

macOS'da iOS va Expo / React Native ilovalarini fonda ishga tushirish, boshqarish va tekshirish uchun ishlatiladigan Apple rasmiy vositalari zanjiri:

1. **`xcrun simctl` (Lokal iOS Simulator boshqaruvi):**
   - Simulyatorni yoqish: `xcrun simctl boot <SIMULATOR_UDID>`
   - Ilovani o'rnatish va ochish: `xcrun simctl install` / `xcrun simctl launch <SIMULATOR_UDID> <BUNDLE_ID>`
   - Deep-link ochish (`openurl`), ruxsatlarni berish (`privacy`), skrinshot/video olish (`io screenshot`).
2. **Xcode `Device Hub` (`DeviceHub.app`) + `agent-desktop` (Ichki UI boshqaruvi):**
   - Xcode 26 tarkibidagi `Device Hub` (`open -g "/Applications/Xcode.app/Contents/Applications/DeviceHub.app"`) ishlab turgan iOS Simulator ichidagi UIKit / React Native elementlar daraxtini to'g'ridan-to'g'ri macOS Accessibility (`AX`) tizimiga uzatadi.
   - Shu orqali `agent-desktop snapshot --app "Device Hub" --compact` buyrug'i iOS ilova ichidagi har bir tugma va inputni ko'radi hamda kursorni qimirlatmasdan fonda bosadi (`click`, `set-value`).
3. **`xcrun devicectl` (Haqiqiy iPhone/iPad yakuniy tekshiruvi):**
   - USB/juftlangan jismoniy iOS qurilmalarni ko'rish (`xcrun devicectl list devices`) va tayyor ilovani yakuniy tekshiruv uchun o'rnatib ishga tushirish.

---

## 2. Qanchalik yaxshi va qanchalik yomon?

### Kuchli tomonlari
- **100% fonda (`headless`) iOS UI test:** `open -g` va `agent-desktop` yordamida foydalanuvchi ishiga xalaqit bermasdan iOS ekranlarida to'liq foydalanuvchi oqimini tekshira oladi.
- **Qo'shimcha og'ir drayverlar kerak emas:** WebDriverAgent yoki Appium serverini ko'tarmasdan, Xcode'ning o'z ichki imkoniyati bilan ishlaydi.

### Zaif tomonlari va muhim tuzoqlar
- **`iPhone Mirroring.app` tuzog'i:** Avtomatlashtirilgan test uchun `iPhone Mirroring.app` ni ishlatib bo'lmaydi — u faqat video oqim ko'rsatadi (`ref_count: 0`, ichki tugmalarni o'qib bo'lmaydi). Har doim `Device Hub` + iOS Simulator ishlatish shart.
- Faqat macOS va o'rnatilgan `Xcode.app` muhitida mavjud.

---

## 3. Xavfsizlik va Ishlatish qoidalari (Cheklovlar)

- **Xavf darajasi:** `Past`
- **Amal qilinishi shart bo'lgan qoidalar:**
  1. **Ikki bosqichli QA tartibi:** Kundalik kodlash va debug jarayonida jismoniy iPhone'ga tegmasdan faqat lokal Simulator (`simctl` + `Device Hub`) ishlatiladi; `devicectl` faqat yakuniy tekshiruvda qo'llanadi.
  2. **Oynani fonda ochish:** Foydalanuvchi fokusini olib qo'ymaslik uchun `DeviceHub.app` ni `open -g` flagi bilan ochish.
  3. **`simctl erase` taqiqi:** Foydalanuvchi so'ramaguncha simulyator ma'lumotlarini tozalab yubormaslik (`erase` login sessiyalarni o'chirib yuboradi).

---

## 4. Bizga qanchalik kerak va mavjud vositalar bilan mosligi

- **`xcrun simctl` va `devicectl`:** [`agent-device`](agent-device.md) hamda [`cross-platform-qa`](cross-platform-qa.md) uchun asosiy iOS/tvOS poydevor (simulyatorni oynasiz `boot`/`shutdown` qilish, `privacy` ruxsatlari va real iPhone'da ilova o'rnatish).
- **Xcode `Device Hub` + `agent-desktop`:** endi **zaxira (`fallback`)** vazifasini bajaradi — chunki u ekranda GUI oyna ochiq turishini talab qiladi, [`agent-device`](agent-device.md) esa oynasiz fonda `~197ms` da ishlaydi.

---

## 5. Qaysi yo'nalish va vazifalarda foydali?

- **Qachon ishlatish kerak:** `xcrun simctl` orqali simulyatorni oynasiz yoqish/yopish, deep-link/ruxsatlarni boshqarish, `devicectl` orqali real iPhone/iPad'ga build uzatish hamda `agent-device` ishlamagan paytda `Device Hub` zaxirasi sifatida.
- **Qachon ishlatmaslik kerak:** Odatiy kundalik iOS/tvOS UI elementlarini bosish va tekshirishda (u yerda [`agent-device`](agent-device.md) asosiy vosita).

---

## 6. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-10-20 | Xcode tarkibida `simctl`, `devicectl` va `Device Hub` ni ishga tushirish | `✅ Ishlatyapman` | Lokal iOS Simulator va jismoniy iPhone/iPad testlarida ishlatib kelinmoqda. |
| 2026-11-16 | iOS/tvOS UI qatlamini `agent-device` ga o'tkazish | `✅ Ishlatyapman` | `xcrun simctl` (headless boot/shutdown) va `devicectl` asosiy baza bo'lib qoldi; `Device Hub` + `agent-desktop` esa zaxira (`fallback`) roliga o'tkazildi. |

