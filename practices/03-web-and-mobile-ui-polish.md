# 3. Web, Mobile Web va Native UI Dizayn + Tekshiruv

**🇺🇿 O'zbekcha** | [🇬🇧 English](en/03-web-and-mobile-ui-polish.md) | [🇷🇺 Русский](ru/03-web-and-mobile-ui-polish.md)

⬅️ [Practices Mundarijasiga qaytish](README.md)

- **Birlashtiriladigan vositalar:** [**`impeccable`**](../reviews/ui-ux/impeccable.md) + [**`mobile-native`**](../reviews/mobile/mobile-native.md) + [**`animate-expo`**](../reviews/mobile/animate-expo.md) + [**`asset-diet`**](../reviews/developer-tools/assetdiet.md) + [**`agent-desktop`**](../reviews/developer-tools/agent-desktop.md)
- **Qo'llaniladigan loyihalar:** Funksional veb-ilovalar, admin panellar, Telegram Mini App / PWA va Expo / React Native ekranlari.

---

## 1. Nima uchun bularni birgalikda ishlatish kerak? (Umumiy foydasi)

Bitta UI skillning o'zi barcha qatlamlarni yopa olmaydi:
- Dizayn skilli (`impeccable`) chiroyli iyerarxiya va rang bersa-da, iOS Safari'dagi `100vh` sakrashini yoki `Reanimated` UI-thread fizikasini alohida qoidasiz hal qilmaydi;
- Yangi qo'shilgan PNG/SVG/video fayllar siqilmasa sahifa sekin yuklanadi;
- Kodda yozilgan UI haqiqiy brauzerda ko'rilmasa, ustma-ust tushgan tugmalar sezilmay qoladi.

---

## 2. Qanday birgalikda ishlatiladi? (Qatlamlar bo'yicha)

### 1) Vizual Dizayn, Matn va Chekka Holatlar (`impeccable`)
- Yangi ekran qurishda yoki mavjudini tozalashda `impeccable` ning maqsadli rejimlari chaqiriladi:
  - **`polish` / `quieter` / `bolder`:**Vizual shovqinni kamaytirish yoki zerikarli sahifaga urg'u berish;
  - **`clarify`:** Tugma, forma va xato xabarlarini qisqa va tushunarli qilish;
  - **`harden`:** Uzun ismlar (`3 line clamp`), `0` ma'lumot (`empty state`), sekin internet va xato holatlarida ekran buzilmasligini ta'minlash.

### 2) Platformaga xos sezgi (`mobile-native` vs `animate-expo`)
- **Agar loyiha Mobile Web / PWA / Mini App bo'lsa (`impeccable` + `mobile-native`):**
  - `100dvh/svh`, `env(safe-area-inset-*)` (Dynamic Island himoyasi), inputlarda `>=16px` (iOS avto-zoom'ni to'xtatish), `@media (hover: hover)` va `overscroll-behavior` avtomatik qo'llanadi.
- **Agar loyiha Expo / React Native bo'lsa (`impeccable` + `animate-expo`):**
  - Barcha bosish sezgisi (`scale` + `expo-haptics`), ekran almashishi va bottom-sheet jestlari `Reanimated` + `Gesture Handler` orqali **UI oqimida (`worklet`)** yoziladi.

### 3) Media fayllarni lokal siqish (`asset-diet`)
PR yoki deploy oldidan repoga qo'shilgan rasm, SVG, video yoki 3D modellarni `0` MCP yuki bilan on-demand siqish:
- `asset-diet` skilli `npx assetdiet-mcp@0.1.4` orqali PNG/JPG'ni WebP/AVIF'ga, SVG'ni SVGO'ga o'tkazib, zaxira (`rollback`) bilan hajmni `50–80%` ga qisqartiradi.

### 4) Jonli Brauzerda Kursorni Qimirlatmasdan Tekshirish (`agent-desktop`)
Web o'zgarish bitgach, ochiq turgan `Google Chrome` oynasini fokusni o'g'irlamasdan fonda tekshirish:
```bash
agent-desktop snapshot --app "Google Chrome" --skeleton -i --compact
agent-desktop click @<snapshot_id>:e12
```

---

## 3. Qo'shimcha nimalar qilish mumkin? (Pro-amaliyotlar)

- **Veb funksiyani mobil ilovaga ko'chirishda (`web-to-native-mobile` + `impeccable`):** Desktop jadval yoki murakkab filtrni telefonga ko'chirishdan oldin `web-to-native-mobile` orqali nima asosiy ekranda qolishi (`Keep visible`) va nima sheet/menuga o'tishi (`Relocate`) ajratib olinadi.
- **Yakuniy nashr oldidan (`client-performance-gate`):** Foydalanuvchi ilovalarida (admin paneldan tashqari) sekin tarmoq va kuchsiz qurilma rejimida FPS hamda tiklanish (`recovery`) tekshiriladi.
