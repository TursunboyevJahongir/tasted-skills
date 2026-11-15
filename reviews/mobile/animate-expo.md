# `animate-expo` (Emil Kowalski — Expo & React Native Motion)

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/mobile/animate-expo.md) | [🇷🇺 Русский](../ru/mobile/animate-expo.md)

- **Manba:** [emilkowalski/skills (`skills/animate-expo`)](https://github.com/emilkowalski/skills/tree/main/skills/animate-expo)
- **Turkum:** `Mobile` *(React Native, Expo, Reanimated, Gesture Handler va Haptics)*
- **Turi:** `Skill` *(`SKILL.md` + `RECIPES.md` + lokal `LOCAL-COMPATIBILITY.md` himoyasi)*
- **Sifat bahosi:** **9.5 / 10**
- **Bizga kerakliligi:** **9.0 / 10**
- **Tavsiya etilgan ko'lam:** `Global (-g)`
- **Tekshirilgan sana:** `2026-11-15`
- **Joriy holati:** `✅ Ishlatilyapti`

---

## 1. Nima va qanday ishlaydi?

React Native va Expo ilovalarda haqiqiy qurilmada (`60/120fps`) qotmasdan ishlaydigan animatsiya, jest (gesture), bottom-sheet, press feedback va haptics yozish bo'yicha amaliy muhandislik skilli (`SKILL.md` 260 qator + `RECIPES.md` tayyor retseptlar + `LOCAL-COMPATIBILITY.md` lokal moslik qoidasi).

Asosiy qaror qabul qilish zanjiri (ketma-ketlikda ishlaydi):
1. **Umuman animatsiya kerakmi? (`Frequency Gate`):** Kuniga 100+ marta bosiladigan narsalarda (tab almashishi, klaviatura ochilishi, oddiy toggle) **animatsiya qilinmaydi** (`animation: 'none'`).
2. **Qaysi oqimda (`Thread`) ishlaydi?** React Native JS oqimi (`setState`, `PanResponder`, `Animated`) o'rniga 100% **UI runtime / Reanimated worklets** (`useSharedValue`, `useAnimatedStyle`, `Gesture.Pan()`, `scheduleOnRN`) ishlatish.
3. **Qaysi xossalar o'zgaradi?** Faqat `transform` va `opacity` (Android'da `elevation` yoki `BlurView` intensity animatsiya qilinsa har kadrda qayta chizilib qotadi — buning o'rniga statik qatlam `opacity` si o'zgartiriladi).
4. **Spring yoki Timing?** Barmoq tekkan har qanday harakatda (drag, swipe, sheet) tezlikni (`velocity`) uzatish uchun **Spring** (`{ duration: 300..400, dampingRatio: 0.8..1 }`), qolgan holatlarda `Easing.bezier(0.23, 1, 0.32, 1)` (`ease-out`, `<300ms`).
5. **Haptics (`expo-haptics`):** Har bir foydalanuvchi amaliga ko'pi bilan 1 marta, vizual o'zgarish bilan aynan bitta kadrda (`scheduleOnRN(Haptics.selectionAsync)`).

---

## 2. Qanchalik yaxshi va qanchalik yomon?

### Kuchli tomonlari
- Mobil ilovalardagi eng ko'p uchraydigan "simulyatorda silliq ko'rinib, o'rtacha Android telefonda 20fps ga tushib qolish" muammosining aniq texnik sabablarini (`Yoga layout pass`, `runOnJS/scheduleOnRN per frame`, `BlurView`) kesib tashlaydi.
- `RECIPES.md` ichida press-scale, drag-to-dismiss sheet, swipe-to-delete, collapsing header va klaviaturaga bog'langan UI uchun aniq shablonlar bor.
- `impeccable` bilan ziddiyatga kirmasligi uchun `LOCAL-COMPATIBILITY.md` qo'shilgan: umumiy dizayn va ierarxiyani `impeccable` boshqaradi, `animate-expo` esa aniq mobil harakat va jestlarni yozadi.

### Zaif tomonlari va xarajati
- Asl manbada barcha loyihalarni Reanimated 4 va Expo Router'ga o'tkazishga moyillik bor — shu sababli `LOCAL-COMPATIBILITY.md` orqali *"mavjud loyihaning arxitekturasi va paketlarini majburan yangilamaslik"* cheklovi qo'yilgan.

---

## 3. Xavfsizlik va O'rnatishdan oldin tozalash (Sanitarizatsiya)

- **Xavf darajasi:** `Past`
- **Tekshirilgan va tozalangan nuqtalar:**
  1. **`Initial Response` salomlashuv blokini olib tashlash:** Asl `SKILL.md` dagi *"When this skill is first invoked without a specific question, respond only with: I'm ready to build animations..."* bloki olib tashlandi.
  2. **`LOCAL-COMPATIBILITY.md` himoyasini saqlash:** Mavjud `package.json` dagi kutubxonalarni o'zboshimchalik bilan almashtirmaslik va `reduced-motion` ni har doim qo'llash qoidasi birinchi o'ringa qo'yilgan.

---

## 4. Bizga qanchalik kerak va mavjud vositalar bilan mosligi

- **`impeccable` + `animate-expo` + `web-to-native-mobile`** — mobil ilovalarimiz uchun yagona mukammal uchlikni tashkil qiladi:
  - `web-to-native-mobile` — vebdagi funksiyani telefonga qanday moslashtirishni hal qiladi;
  - `impeccable` — ekranning vizual dizayni, tipografiyasi va joylashuvini quradi;
  - `animate-expo` — jestlar, bottom-sheet, press feedback va Reanimated worklet'larini yozadi.

---

## 5. Qaysi yo'nalish va vazifalarda foydali?

- **Qachon ishlatish kerak:** Expo / React Native ilovalarda bottom-sheet, xarita ustidagi suzuvchi panellar, barmoq bilan suriladigan kartochkalar, tugma bosilishi (`press-in` / `press-out`), haptics va 60/120fps optimizatsiyasida.
- **Qachon ishlatmaslik kerak:** Web CSS animatsiyalarida (u yerda `impeccable` ning `animate` bo'limi ishlatiladi).

---

## 6. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-11-09 | `LOCAL-COMPATIBILITY.md` moslik qoidasi bilan global o'rnatish | `✅ Ishlatilyapti` | `impeccable` va mavjud React Native/Expo loyihalar bilan moslashtirildi. |
| 2026-11-15 | `Initial Response` blokini tozalash va katalogga kiritish | `✅ Ishlatilyapti` | Barcha 5 ta global agent targetiga sinxronlangan. |
