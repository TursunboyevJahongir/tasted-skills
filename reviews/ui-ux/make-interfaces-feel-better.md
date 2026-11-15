# `make-interfaces-feel-better` (Design Engineering Micro-Polish)

- **Manba:** Lokal/Global skill (`make-interfaces-feel-better`)
- **Turkum:** `UI/UX` *(Web CSS mikro-detallar: radius, tabular-nums, soyalar, tugma bosilishi)*
- **Turi:** `Skill` *(6 ta Markdown fayl, 1154 qator)*
- **Sifat bahosi:** **7.5 / 10**
- **Bizga kerakliligi:** **3.5 / 10**
- **Tavsiya etilgan ko'lam:** `O'rnatmaslik / O'chirib qo'yish` *(`impeccable` va `animate-expo` bilan ustma-ust tushadi)*
- **Tekshirilgan sana:** `2026-11-15`
- **Joriy holati:** `🧪 Sinab ko'rildi` *(o'rnini `impeccable` + `animate-expo` to'liq bosadi)*

---

## 1. Nima va qanday ishlaydi?

Web interfeyslarni silliqlash bo'yicha 19 ta mikro-qoida (`SKILL.md`, `typography.md`, `surfaces.md`, `animations.md`, `icons.md`, `performance.md`):
- Ichki va tashqi burchak radiusi formulasi (`outerRadius = innerRadius + padding`);
- O'zgaruvchan raqamlarda `font-variant-numeric: tabular-nums`;
- Sarlavhalarda `text-wrap: balance`, matnda `text-wrap: pretty`, macOS'da `-webkit-font-smoothing: antialiased`;
- Tugma bosilganda `scale(0.96)`, kichik tugmalarda `44x44px` (`40x40px` desktop) bosish maydoni;
- `transition: all` taqiqi va `will-change` cheklovi;
- Yakunida esa 4 ta majburiy jadvaldan iborat (`Scope and Coverage`, `Before/After`, `Considered but Rejected`, `Verdict`) uzun review shabloni.

---

## 2. Qanchalik yaxshi va qanchalik yomon?

### Kuchli tomonlari
- Konsentrik border-radius (`outer = inner + padding`), `tabular-nums` va rasm chetidagi `1px oklch` kontur kabi CSS detallari aniq misollar bilan yozilgan.

### Zaif tomonlari va xarajati
- **`impeccable` bilan to'g'ridan-to'g'ri ustma-ust tushadi (`Auto-trigger overlap`):** Har qanday UI/frontend vazifada `impeccable` bilan bir vaqtda avtomatik yuklanib, kontekstni ikki barobar band qiladi.
- **Qotib qolgan raqamlar:** Har bir tugmaga `scale(0.96)`, har bir ikonkaga `scale(0.25) + blur(4px)` qo'yishni majburlashi loyihaning o'z dizayn tizimiga har doim ham mos kelmaydi.
- **`ponytail` ga zid uzun hisobot:** Har bir UI tekshiruvda rad etilgan nomzodlar (`Considered but Rejected`) jadvalini to'qib chiqarishni talab qiladi.

---

## 3. Xavfsizlik va Sanitarizatsiya

- **Xavf darajasi:** `Past` *(skript yoki hook yo'q, faqat auto-trigger va hisobot shabloni og'ir)*
- **Agar saqlansa tozalanishi kerak bo'lgan qism:** `Review Output Format` (`120–187`-qatorlar) olib tashlanishi va `disable-model-invocation: true` qo'yilishi kerak.

---

## 4. Bizdagi to'liq o'rinbosarlar

Uning barcha foydali qoidalari bizda allaqachon 2 ta kuchliroq skill ichida bor:
1. **[`impeccable`](impeccable.md)** (`craft-floor.md`, `polish.md`, `animate.md`, `typeset.md`) — Web hamda native iOS/Android uchun `tabular-nums`, `text-wrap: balance`, optik tekislash, soyalar, kontrast va animatsiyalarni loyiha dizayn tizimiga moslab bajaradi.
2. **[`animate-expo`](../mobile/animate-expo.md)** — Mobil (`React Native / Expo`) ilovalarda press-scale, spring, gesture va haptics'ni UI oqimida (`Reanimated`) hal qiladi.

---

## 5. Qaysi yo'nalish va vazifalarda foydali?

- **Qachon ishlatish mumkin:** Faqat `impeccable` o'rnatilmagan oddiy Tailwind/React veb-loyihada tez CSS checklist sifatida.
- **Qachon ishlatmaslik kerak:** `impeccable` va `ponytail` ishlatilayotgan global muhitda.

---

## 6. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-11-15 | `impeccable` va `animate-expo` bilan solishtirma audit | `🧪 Sinab ko'rildi` | Qoidalari `impeccable` (`craft-floor` / `polish`) va `animate-expo` ichida to'liq qamrab olingani hamda auto-trigger ustma-ust tushishi aniqlandi. |
