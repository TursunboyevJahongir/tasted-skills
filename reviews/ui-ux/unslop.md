# `unslop` (Damir Sokolovsky — `@heydamir`)

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/ui-ux/unslop.md) | [🇷🇺 Русский](../ru/ui-ux/unslop.md)

- **Manba:** [heydamir/unslop](https://github.com/heydamir/unslop)
- **Turkum:** `UI/UX` *(AI/vibecoded veb-ekranlarni dizayn redline tartibida tozalash)*
- **Turi:** `Skill + Node/Playwright Skriptlar` *(`SKILL.md`, 6 ta reference `.md` fayl, `snapshot.mjs`, `story.mjs`, `CC-BY-4.0`)*
- **Sifat bahosi:** **8.5 / 10**
- **Ishda kerak bo'lishi:** **2.5 / 10**
- **Tavsiya etilgan ko'lam:** `O'rnatmaslik`
- **Tekshirilgan sana:** `2026-11-16`
- 🔄 **Alternativi yaxshiroq:** [impeccable](impeccable.md) (`polish` / `quieter` / `clarify` / `harden` — Web va Mobil uchun) + [animate-expo](../mobile/animate-expo.md)

---

## 1. Nima va qanday ishlaydi?

> [!IMPORTANT]
> **Oddiy tilda (Asosiy vazifasi va foydasi):** AI yozgan veb-sahifalardagi shablon bezaklarni 9 bosqichda tozalaydi, lekin mobil ilovalarda ishlamaydi va `impeccable` bilan urishadi — buni `impeccable` ning `polish` / `quieter` buyruqlari toza bajaradi.

Damir Sokolovsky (`@heydamir`) tomonidan X'dagi *Unslopping* rukni asosida yozilgan veb-dizayn tozalash skilli:
1. **AI "slop" belgilarini topish (`references/signs.md`):** Binafsha-ko'k gradientlar, gradient sarlavhalar, neon glow/soyalar, `New ✨` kabi emoji nishonlar, `NAVIGATION` uslubidagi katta harfli keng tracking, tartibsiz `mt-[13px]` oraliqlar va shovqinli copy (`Welcome back! 👋`, `!!`) ro'yxatini tuzadi.
2. **5 qatorli `Direction` va majburiy to'xtash:** Ish boshlashdan oldin `Product`, `Character`, `World`, `Moments`, `Signature` ni yozib, foydalanuvchi tasdiqlamaguncha tahrirni to'xtatib turadi.
3. **9 bosqichli ketma-ket sayqal (`tokens.md`, `rtl.md`, `visuals.md`):** `Spacing` (4px setka) → `Color` (bitta neytral shkala + 1 aksent) → `Icons` (`lucide` 16–18px) → `Copy` → `Type` (faqat `400–600` qalinlik) → `Layout` → `Details` (ichma-ich radius formulasi, `tabular-nums`) → `Visuals` → `Motion`.
4. **Qo'shimcha skriptlar:** `snapshot.mjs` jonli URL'ni lokal HTML qilib saqlaydi; `story.mjs` esa `Playwright` + `ffmpeg` yordamida ijtimoiy tarmoqlar uchun 10 soniyalik "oldin/keyin" redline morphing `.mp4` videosini (`unslop by @heydamir` yozuvi bilan) render qiladi.

---

## 2. Nega o'rnatmadik? (Bizda bor muqobillar bilan solishtiruv)

### Kuchli tomonlari
- `signs.md`, `tokens.md` va ayniqsa arab/ivrit tillari uchun `rtl.md` juda did bilan, aniq raqamlarda yozilgan.
- `skillshare audit` natijasi toza (`0 CRITICAL/HIGH` — faqat `CC-BY-4.0` mualliflik havolalari va `1.3 MB` `.webp` namunalar bor).

### Zaif tomonlari va bizga kerak emasligi sabablari
- **Bizdagi [impeccable](impeccable.md) buni allaqachon va kengroq qamrab oladi:** `impeccable` ning `craft-floor.md` + `polish`, `quieter`, `distill`, `clarify`, `typeset`, `layout`, `harden` bo'limlarida aynan shu anti-slop qoidalari (gradient text, glow, emoji ikonka, soxta sparkline, bir xil kartochkalar va kontrast nazorati) allaqachon mavjud. Ustiga-ustak, `impeccable` faqat Web emas, **native iOS va Android** ekranlarini ham qo'llab-quvvatlaydi (`unslop` esa faqat HTML/CSS/Web uchun).
- **To'g'ridan-to'g'ri `auto-trigger` va qoida to'qnashuvi:** `description` qismi *"polish, clean up or redesign a screen... dashboards, apps and landing pages"* so'zlarida avtomatik uyg'onib, `impeccable` bilan urishadi. Bundan tashqari, `unslop` ba'zi keskin cheklovlarni (masalan, `700–900` shrift qalinligini butunlay taqiqlash, faqat `transform/opacity` animatsiyasi, har safar 4-qadamda to'xtab savol so'rash) majburlaydi — bu mavjud brend va dizayn tizimiga ega real loyihalarda `impeccable` ning moslashuvchan tartibiga xalaqit beradi.
- **Tashqi pullik MCP taklifi:** Rasm generatsiyasi kerak bo'lsa `fal`, `Replicate`, `OpenAI` yoki `Higgsfield` MCP serverlarini ulashni taklif qiladi; `story.mjs` redline-video generatori esa kundalik mahsulot dasturlashda kerak emas.

---

## 3. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-11-16 | Manba kod va `skillshare audit` tekshiruvi | 🔄 **Alternativi yaxshiroq:** [impeccable](impeccable.md) | Didli anti-slop skill (`8.5/10`), biroq barcha asosiy imkoniyatlari bizdagi [impeccable](impeccable.md) da kengroq (Web + Native Mobile) borligi va `auto-trigger` to'qnashuvi oldini olish uchun o'rnatilmadi. |
