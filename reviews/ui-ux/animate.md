# `animate` (Emil Kowalski — Web Motion Construction)

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/ui-ux/animate.md) | [🇷🇺 Русский](../ru/ui-ux/animate.md)

- **Manba:** [emilkowalski/skills — skills/animate](https://github.com/emilkowalski/skills/tree/main/skills/animate)
- **Turkum:** `UI/UX` *(Web CSS, WAAPI va Motion kutubxonasi animatsiyalari)*
- **Turi:** `Skill` *(`SKILL.md` + `RECIPES.md`, ~410 qator)*
- **Sifat bahosi:** **8.5 / 10**
- **Ishda kerak bo'lishi:** **3.0 / 10**
- **Tavsiya etilgan ko'lam:** `O'rnatmaslik`
- **Tekshirilgan sana:** `2026-11-15`
- 🔄 **Alternativi yaxshiroq:** [impeccable](impeccable.md) (`animate` — Web uchun) + [animate-expo](../mobile/animate-expo.md) (Expo / React Native uchun)

---

## 1. Nima va qanday ishlaydi?

> [!IMPORTANT]
> **Oddiy tilda (Asosiy vazifasi va foydasi):** Faqat veb-brauzer animatsiyalari uchun yozilgan skill; uning qoidalari bizdagi `impeccable` ichida allaqachon bor, o'rnatilsa mobil `animate-expo` skilli bilan trigger to'qnashuvi beradi.

Emil Kowalski'ning veb-animatsiya qurish skilli (`SKILL.md` 209 qator + `RECIPES.md` tayyor komponent shablonlari):
1. **`Frequency Gate`:** Kuniga 100+ marta ishlatiladigan amallarda (klaviatura shortcut'lari, command palette) animatsiyani taqiqlaydi.
2. **Vosita tanlash zinapoyasi:** CSS transition → CSS `@starting-style` → CSS animation → WAAPI (`element.animate()`) → `Motion` (`motion.dev`).
3. **Egrilik va vaqt me'yorlari:** UI elementlarda `<300ms`, `ease-in` taqiqi, kuchli `cubic-bezier(0.23, 1, 0.32, 1)` (`--ease-out`), `scale(0)` o'rniga `scale(0.95) + opacity: 0`.
4. **Accessibility:** `prefers-reduced-motion: reduce` va `@media (hover: hover) and (pointer: fine)` ni birga yozish.

---

## 2. Qanchalik yaxshi va qanchalik yomon?

### Kuchli tomonlari
- Juda aniq qaror qabul qilish tartibi va `RECIPES.md` ichida dropdown, modal, drawer, toast, hold-to-confirm kabi toza shablonlar bor.
- Keraksiz joyda animatsiya qo'shmaslik ("zero lines of code is a success") tamoyili puxta yozilgan.

### Zaif tomonlari va konflikt sabablari
- **[impeccable](impeccable.md) bilan to'g'ridan-to'g'ri `auto-trigger` to'qnashuvi:** `description` qismi *"Use when asked to animate something, add motion, make a component feel alive, or build a transition"* deb yozilgan — bu aynan `impeccable` ning asosiy tavsifi va `reference/animate.md` bo'limi bilan bir vaqtda ishga tushib, kontekstni ikki marta band qiladi.
- **Qoida ziddiyati:** `animate` qat'iy ravishda *"faqat `transform` va `opacity`"* deb cheklaydi, holbuki `impeccable` (`craft-floor.md` va `animate.md`) silliq ishlagan joyda `backdrop-filter`, `mask`, `clip-path` va `View Transitions` dan o'rinli foydalanishga ruxsat beradi.
- **Tashqi bog'liqliklar:** Matn ichida bizda o'rnatilmagan boshqa skillarga (`pick-ui-library`, `review-animations`, `improve-animations`) havola qiladi va boshida `## Initial Response` salomlashuv bloki bor.

---

## 3. Xavfsizlik va Sanitarizatsiya

- **Xavf darajasi:** `Past` *(skript yoki hook yo'q, faqat Markdown)*
- Agar alohida loyihada (`-p`) ishlatilsa, `## Initial Response` bo'limini va `../pick-ui-library/SKILL.md` havolasini olib tashlash kerak bo'ladi.

---

## 4. O'rniga nima ishlatiladi?

Global o'rnatish shart emas, chunki mavjud ikki skillimiz bu yo'nalishni to'liq va ziddiyatsiz yopadi:
1. **Web va Mobil Web animatsiyalar uchun:** [**impeccable**](impeccable.md) (`animate` buyrug'i / `reference/animate.md`) — loyihaning umumiy dizayn tizimi (`Operate` vs `Persuade` rejimi) bilan uyg'un holda ishlaydi.
2. **React Native va Expo animatsiyalar uchun:** [**animate-expo**](../mobile/animate-expo.md) — xuddi shu muallifning `Reanimated` worklet va native jestlar uchun yozilgan skilli.

*(Xuddi shu repodagi `animation-performance`, `improve-animations`, `remove-animations`, `review-animations`, `choreograph` va `gestures` ham aynan shu sababli globalga qo'shilmadi — ularni `impeccable` ning `animate`, `quieter`, `optimize` bo'limlari hamda `animate-expo` qamrab oladi.)*

---

## 5. Qaysi yo'nalish va vazifalarda foydali?

- **Qachon ishlatish kerak:** Global o'rnatmaslik — o'rniga [impeccable](impeccable.md) va [animate-expo](../mobile/animate-expo.md) ishlatiladi.

---

## 6. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-11-15 | GitHub `SKILL.md` + `RECIPES.md` va konflikt auditi | 🔄 **Alternativi yaxshiroq:** [impeccable](impeccable.md) + [animate-expo](../mobile/animate-expo.md) | Sifati baland (`8.5/10`), lekin [impeccable](impeccable.md) bilan `auto-trigger` va qoida to'qnashuvi berishi sababli o'tkazib yuborildi. |
