# 6. Video Tahlil (`watch`), Figma Ko'prigi (`figma`) va Qo'shimcha Imkoniyatlari

**🇺🇿 O'zbekcha** | [🇬🇧 English](en/06-video-figma-and-db-workflows.md) | [🇷🇺 Русский](ru/06-video-figma-and-db-workflows.md)

⬅️ [Practices Mundarijasiga qaytish](README.md)

- **Birlashtiriladigan vositalar:** `watch` (`video-analyzer`) + `figma` (`figma-implement-design`, `figma-generate-design`, `figma-use`) + [**agent-desktop**](../reviews/developer-tools/agent-desktop.md) (`agent-desktop-ffi`) + [**graphify**](../reviews/architecture/graphify.md) + `drizzle-relations-v2`
- **Qo'llaniladigan vazifalar:** Video bug-reportlarni tahlil qilish, raqobatchi UI/animatsiyasini ko'chirish, Kod <-> Figma ikki tomonlama sinxronizatsiya va desktop dasturlarni avtomatlashtirish.

---

## 1. `watch` (`video-analyzer`) — Faqat YouTube ko'rish uchun emas! (3 ta kuchli usul)

Ko'pchilik `watch` skillini faqat YouTube videoni xulosalash uchun deb o'ylaydi. Aslida u **ovoz (`Whisper`/`subtitles`) + sahna almashish kadrlari (`ffmpeg scene detection`)** ni birga o'qigani uchun quyidagi 3 ta ishda juda katta vaqt tejaydi:

### 1) QA va Mijoz yuborgan Bug-Report videolarini (`mp4`/`mov`) avtomatik tahlil qilish
Tester yoki foydalanuvchi Telegram'dan *"ilovada xato chiqyapti"* deb ekran yozuvini tashlaganda:
- `watch` videoni kadr-ba-kadr (`scene_index.csv` + `frames-selected/`) yoyib, xato aynan qaysi sekundda, qaysi ekranda va qanday xabar bilan chiqqanini o'qib beradi — ketidan `diagnosing-bugs` + `sentry` bilan ildiz sababi topiladi.

### 2) Yoqtirgan ilova yoki sayt animatsiyasini / UI oqimini 1:1 ko'chirish (`watch` + `impeccable` + `animate-expo`)
Boshqa ilovadagi chiroyli o'tish (`transition`) yoki onboarding oqimini ko'chirmoqchi bo'lsangiz:
- Ekran yozuvini `watch` ga *"5fps rejimda har bir kadrni ajrat"* deb berasiz;
- Ajratilgan kadrlarni [**impeccable**](../reviews/ui-ux/impeccable.md) va [**animate-expo**](../reviews/mobile/animate-expo.md) ga berib, harakat fizikasini (`spring`, `stiffness`, `damping`) kodga aylantirasiz.

### 3) Reklama Reels / YouTube darsliklardagi yolg'onlarni fosh qilish (`watch` + `tasted-skills`)
Ijtimoiy tarmoqdagi *"bu tekin AI tool 90% ishni qiladi"* degan videolarni [tasted-skills](../skills/tasted-skills/SKILL.md) bilan tekshirganda:
- `watch` ekranda bir soniya ko'rinib ketadigan mayda yozuvlarni (`SELF-REPORTED`, `.env` dagi pullik kalitlar, sekin kadr tezlashtirilganini) ushlab beradi.

---

## 2. `figma` Skilllar Oila-To'plami — Ikki Tomonlama Ko'prik (`Figma ↔ Kod`)

Bizda o'rnatilgan 5 ta Figma skilli (`figma`, `figma-implement-design`, `figma-generate-design`, `figma-generate-library`, `figma-use`) faqat Figma'dan kod yozish uchun emas, **teskari yo'nalishda ham** ishlaydi:

1. **Figma -> Production Kod (`figma-implement-design` + `impeccable` + `asset-diet`):**
   - Figma link/node berilganda, shunchaki skrinshotga qarab emas, balki aniq auto-layout, spacing va rang tokenlarini o'qib 1:1 komponent yozadi, rasmlarni esa `asset-diet` bilan siqadi.
2. **Tayyor Kod -> Figma Ekran (`figma-generate-design` + `figma-use`):**
   - Agar sizda kodda tayyor ishlab turgan sahifa bor bo'lsa-yu, dizaynerda uning yangi Figma varianti bo'lmasa — agentingiz kodni o'qib, Figma fayl ichiga haqiqiy auto-layout'li ekranlarni qismma-qism chizib beradi.
3. **Kod bazasidan Figma Design System yaratish (`figma-generate-library` + `figma-use`):**
   - Loyihadagi CSS/Tailwind yoki React Native rang, shrift va komponent tokenlarini o'qib, Figma'da tayyor Variable (`Light/Dark mode`) va Component Library qurib beradi.

---

## 3. `agent-desktop` va `graphify` ning Ko'p Bilinmaydigan Imkoniyatlari

### A. `agent-desktop` — Faqat Chrome uchun emas
- **Har qanday macOS dasturini fonda boshqarish:** Postman, Docker Desktop, Finder, Terminal, Telegram Desktop, tizim menyulari (`menubar`, `sheet`, `popover`, `Notification Center`) va Electron ilovalarni (`launch --cdp`) sichqonchani qimirlatmasdan boshqaradi.
- **`agent-desktop-ffi` (C-ABI tezligi):** Agar Python (`ctypes`), Go (`cgo`), Node yoki Swift ichidan tez-tez desktop avtomatizatsiya chaqirish kerak bo'lsa, CLI binary'ni qayta-qayta spawn qilmasdan `libagent_desktop_ffi.dylib` kutubxonasini to'g'ridan-to'g'ri ulab ishlash mumkin.

### B. `graphify` — Faqat kod uchun emas
- Loyiha papkasiga **texnik topshiriq (PDF/Markdown), ma'lumotlar bazasi sxemasi, arxitektura chizmalari (rasm) va uchrashuv videolari** tashlansa, `graphify` ularning barchasini kod modullari bilan bitta yagona grafga (`graph.json` + Obsidian Vault / interaktiv HTML) bog'lab beradi.

### C. `drizzle-relations-v2` — Drizzle ORM yangilashda xatosiz migratsiya
- Backend'da Drizzle ORM sxemalari va bog'lanishlarini (`relations`) yozishda eski `v1` sintaksisiga tushib qolmasdan, to'g'ridan-to'g'ri `v2` (`defineRelations` va yangi relational query filterlar) standartida yozishni ta'minlaydi.
