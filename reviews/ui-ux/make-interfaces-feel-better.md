# `make-interfaces-feel-better` (Jakub Krehel — Design Engineering Micro-Polish)

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/ui-ux/make-interfaces-feel-better.md) | [🇷🇺 Русский](../ru/ui-ux/make-interfaces-feel-better.md)

- **Manba:** [jakubkrehel/make-interfaces-feel-better](https://github.com/jakubkrehel/make-interfaces-feel-better)
- **Turkum:** `UI/UX` *(Web CSS mikro-detallar: radius, tabular-nums, soyalar, tugma bosilishi)*
- **Turi:** `Skill` *(6 ta Markdown fayl, 1154 qator)*
- **Sifat bahosi:** **7.5 / 10**
- **Ishda kerak bo'lishi:** **2.5 / 10**
- **Tavsiya etilgan ko'lam:** `O'rnatmaslik` *(avval o'rnatib ko'rildi va olib tashlandi)*
- **O'rniga ishlatiladigan muqobillar:** [**`impeccable`**](impeccable.md) ([pbakaus/impeccable](https://github.com/pbakaus/impeccable)) + [**`animate-expo`**](../mobile/animate-expo.md) ([emilkowalski/skills](https://github.com/emilkowalski/skills/tree/main/skills/animate-expo))
- **Ishlatilgan davr:** `2026-10-31 → 2026-11-15` *(sinab ko'rilib o'chirilgan)*
- **Joriy holati:** `🔄 Alternativi yaxshiroq` *(🧪 Sinab ko'rilib, `impeccable` + `animate-expo` o'rnini to'liq bosgani sabab olib tashlandi)*

---

## 1. Nima va qanday ishlaydi?

> [!IMPORTANT]
> **Oddiy tilda (Asosiy vazifasi va foydasi):** 16 kun sinab ko'rilib o'chirildi: oddiy tugma yoki ramka tahririda ham 4 tadan uzun Markdown jadval yozib tokenni bekorga yoqadi va `impeccable` bilan bir joyda uyg'onib xalaqit beradi.

Web interfeyslarni silliqlash bo'yicha 19 ta mikro-qoida (`SKILL.md`, `typography.md`, `surfaces.md`, `animations.md`, `icons.md`, `performance.md`):
- Ichki va tashqi burchak radiusi formulasi (`outerRadius = innerRadius + padding`);
- O'zgaruvchan raqamlarda `font-variant-numeric: tabular-nums`;
- Sarlavhalarda `text-wrap: balance`, matnda `text-wrap: pretty`, macOS'da `-webkit-font-smoothing: antialiased`;
- Tugma bosilganda `scale(0.96)`, kichik tugmalarda `44x44px` (`40x40px` desktop) bosish maydoni;
- `transition: all` taqiqi va `will-change` cheklovi;
- Yakunida esa 4 ta majburiy jadvaldan iborat (`Scope and Coverage`, `Before/After`, `Considered but Rejected`, `Verdict`) uzun review shabloni.

---

## 2. Nega olib tashlandi? (Zaif tomonlari va xarajati)

1. **[`impeccable`](impeccable.md) bilan to'g'ridan-to'g'ri ustma-ust tushadi (`Auto-trigger overlap`):**
   - `description` qismi deyarli har qanday frontend/UI vazifani tutib oladi — natijada agent bir vaqtda ham `impeccable` ni, ham `make-interfaces-feel-better` ni yuklab, kontekstni ikki hissa band qiladi va qarama-qarshi qoidalar oladi.
2. **Qotib qolgan (rigid) shablon raqamlar:**
   - Har bir tugmaga majburiy `scale(0.96)`, har bir ikonkaga `scale(0.25) + blur(4px)` qo'yishni talab qilishi loyihaning o'z dizayn tizimiga har doim ham tushavermaydi.
3. **[`ponytail`](../architecture/ponytail.md) ga zid uzun hisobot jadvali:**
   - Skillning katta qismi (`120–187`-qatorlar) agentni rad etilgan sun'iy nomzodlar (`Considered but Rejected`) va uzun `Before/After` jadvallarini to'qib chiqarishga majbur qiladi.

---

## 3. Xavfsizlik va Sanitarizatsiya

- **Xavf darajasi:** `Past` *(skript yoki hook yo'q, biroq auto-trigger va hisobot shabloni og'ir)*

---

## 4. O'rniga nima ishlatiladi? (To'liq o'rinbosarlar)

`make-interfaces-feel-better` olib tashlandi va uning o'rniga quyidagi 2 ta kuchliroq skill ishlatiladi:

1. **O'rniga (Web + iOS + Android UI/UX va Polish):** [**`impeccable`**](impeccable.md) — [pbakaus/impeccable](https://github.com/pbakaus/impeccable)
   - Uning `craft-floor.md`, `polish.md`, `animate.md` va `typeset.md` bo'limlarida `tabular-nums`, `text-wrap: balance`, optik tekislash, soyalar, `44×44px` bosish maydoni va `will-change` cheklovi allaqachon bor, ustiga-ustak faqat Web emas, native iOS va Android'ni ham qamrab oladi.
2. **O'rniga (Mobil React Native / Expo animatsiyalar):** [**`animate-expo`**](../mobile/animate-expo.md) — [emilkowalski/skills (`animate-expo`)](https://github.com/emilkowalski/skills/tree/main/skills/animate-expo)
   - Mobil ilovalarda tugma bosilishi (`press feedback`), bottom-sheet, spring va haptics'ni `Reanimated` UI oqimida (`60/120fps`) hal qiladi.

---

## 5. Qaysi yo'nalish va vazifalarda foydali?

- **Qachon ishlatish kerak:** O'rnatmaslik — o'rniga [`impeccable`](impeccable.md) va [`animate-expo`](../mobile/animate-expo.md) ishlatiladi.

---

## 6. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-10-31 | Global `skillshare` bazasiga ulab sinab ko'rish | `🔄 Alternativi yaxshiroq` | Web mikro-qoidalar sifatida sinab ko'rildi (`2026-11-09` da `impeccable` qo'shilgach auto-trigger ustma-ust tushdi). |
| 2026-11-15 | `skillshare uninstall make-interfaces-feel-better -g` orqali globaldan olib tashlash | `🔄 Alternativi yaxshiroq` | [`impeccable`](impeccable.md) va [`animate-expo`](../mobile/animate-expo.md) uning barcha foydali qoidalarini to'liq qamrab olgani sababli o'chirib tashlandi. |
