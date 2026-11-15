# `break-ui` (Emil Kowalski — Adversarial UI Stress-Testing)

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/ui-ux/break-ui.md) | [🇷🇺 Русский](../ru/ui-ux/break-ui.md)

- **Manba:** [emilkowalski/skills — `skills/break-ui`](https://github.com/emilkowalski/skills/tree/main/skills/break-ui)
- **Turkum:** `UI/UX` *(UI chekka holatlari / Edge-case data sinovi)*
- **Turi:** `Skill` *(`SKILL.md` + `CATALOG.md`, ~312 qator)*
- **Sifat bahosi:** **8.0 / 10**
- **Bizga kerakliligi:** **3.0 / 10**
- **Tavsiya etilgan ko'lam:** `O'rnatmaslik`
- **O'rniga ishlatiladigan muqobil:** [**`impeccable`**](impeccable.md) (`harden` bo'limi — `reference/harden.md`)
- **Tekshirilgan sana:** `2026-11-15`
- **Joriy holati:** `⛔ Rad etildi`

---

## 1. Nima va qanday ishlaydi?

UI komponentlarni ideal demo ma'lumotlar (`"Jane Doe"`) o'rniga real hayotdagi eng noqulay ma'lumotlar (`CATALOG.md`) bilan sinab ko'rish skilli:
- Qo'shaloq uzun ismlar (`Aleksandra Wiśniewska-Kowalczyk`), bo'linmaydigan uzun email va URL'lar, 1 harfli ism (`J`), Vetnam/Arab (`RTL`)/CJK yozuvlari, ZWJ emoji (`👩🏽‍💻`), `0` / `1` ("1 members") / `1,284` / `0.30000000000000004` sonlari, `404` avatar va `1,000+` qatorli ro'yxatlar;
- Loyiha ichiga vaqtinchalik **`Demo / Worst case / Empty / One / 1,000 rows`** switch tugmasini va fixture faylini ulab, `320px`, `200% zoom` va `RTL` da tekshiradi;
- 3 qismdan iborat jadval hisobotini chiqarib, tuzatmasdan to'xtaydi (`fix all` deyilmaguncha kodni o'zgartirmaydi).

---

## 2. Qanchalik yaxshi va qanchalik yomon?

### Kuchli tomonlari
- `CATALOG.md` dagi test ma'lumotlari sun'iy `"aaaaaaaaaa"` emas, real prodakshnda uchraydigan haqiqiy holatlardir.
- `min-width: 0`, `flex-shrink: 0`, `overflow-wrap: anywhere`, `tabular-nums`, `Intl.Segmenter` va `Intl.PluralRules` bo'yicha aniq CSS/JS yechimlari bor.

### Zaif tomonlari va konflikt sabablari
1. **[`impeccable`](impeccable.md) (`harden`) bilan to'qnashuv:** `impeccable` ning `reference/harden.md` bo'limi allaqachon uzun/qisqa matnlar, `min-width: 0`, `line-clamp`, `RTL`, tarjima kengayishi (+30–40%), `Intl` formatlash, bo'sh holatlar va ustiga-ustak **tarmoq/API xatolik holatlarini** ham tekshirib, to'g'ridan-to'g'ri tuzatib beradi.
2. **Loyiha kodiga keraksiz fixture va toggle qo'shishi:** Skill kod bazasiga yangi worst-case fixture fayli va ekran ostiga `Demo / Worst case` tugmasini qo'shib, fixture'ni repoda qoldirishni buyuradi. Bu yangi test fixture qo'shish taqiqlangan frontend loyihalarimiz qoidasiga hamda [`ponytail`](../architecture/ponytail.md) / [`karpathy-guidelines`](../architecture/karpathy-guidelines.md) tamoyillariga zid.
3. **Ikki bosqichli to'xtab qolish va uzun hisobot:** Muammoni ko'rib turib darhol tuzatish o'rniga 3 qismli hisobot yozib `fix all` buyrug'ini kutib o'tiradi.

---

## 3. Xavfsizlik va Sanitarizatsiya

- **Xavf darajasi:** `Past` *(skript yoki tashqi chaqiruv yo'q, `example.com` / `.test` domenlaridan foydalanadi)*
- Boshida `## Initial Response` salomlashuv bloki bor.

---

## 4. O'rniga nima ishlatiladi?

- **O'rniga:** [**`impeccable`**](impeccable.md) (`harden [target]` buyrug'i / `reference/harden.md`) — ortiqcha demo-toggle yoki fixture fayl yaratmasdan, komponentning CSS overflow, i18n, pluralization va API/offline xatolik holatlarini birdaniga mustahkamlaydi.

---

## 5. Qaysi yo'nalish va vazifalarda foydali?

- **Qachon ishlatish kerak:** Global o'rnatmaslik — o'rniga [`impeccable`](impeccable.md) (`harden`) ishlatiladi.

---

## 6. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-11-15 | GitHub `SKILL.md` + `CATALOG.md` va konflikt auditi | `⛔ Rad etildi` | [`impeccable`](impeccable.md) (`harden`) bu vazifani toza bajarishi va `break-ui` repoga ortiqcha fixture/toggle qo'shishi sababli o'tkazib yuborildi. |
