# `AssetDiet` (`assetdiet-mcp`)

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/developer-tools/assetdiet.md) | [🇷🇺 Русский](../ru/developer-tools/assetdiet.md)

- **Manba:** [092Abdullah/AssetDiet](https://github.com/092Abdullah/AssetDiet) · [npm: assetdiet-mcp](https://www.npmjs.com/package/assetdiet-mcp)
- **Turkum:** `Developer Tools` *(Lokal rasm, SVG, video va 3D fayllarni siqish hamda kod importlarini yangilash)*
- **Turi:** `CLI + MCP Server (16 tool)`
- **Sifat bahosi:** **7.5 / 10**
- **Bizga kerakliligi:** **5.0 / 10** *(doimiy MCP sifatida emas, faqat reliz oldidan `npx` CLI orqali bir martalik audit/optimizatsiya uchun)*
- **Tavsiya etilgan ko'lam:** `Doimiy MCP ulamaslik — faqat bir martalik npx CLI`
- **Tekshirilgan sana:** `2026-11-16`
- **Joriy holati:** `👍 Yaxshi variant` *(100% lokal ishlaydi; kerak bo'lganda faqat CLI rejimida chaqiriladi)*

---

## 1. Qisqacha: Nima va qanday ishlaydi?

Loyiha ichidagi og'ir media fayllarni bulutga yubormasdan **100% lokal** siqadigan va tartibga soladigan vosita:
- **dvigatellari:** `Sharp` (`libvips` — `WebP` / `AVIF`), `SVGO` (SVG tozalash), `FFmpeg` (video) va `@gltf-transform` (`GLB`/`GLTF` 3D modellar).
- **Xavfsiz o'zgartirish va rollback:** SHA-256 orqali dublikat fayllarni topadi, `.png`/`.jpg` fayllarni `.webp`/`.avif` ga o'girganda `src/` ichidagi import yo'llarini ham yangilaydi hamda `.assetdiet/backups/<runId>/` + write-ahead jurnal orqali bir buyruq bilan orqaga qaytarish (`rollback`) imkonini beradi.

---

## 2. Nega doimiy MCP qilib ulamadik?

- **16 ta MCP tool sxemasi ortiqcha yuk:** Doimiy MCP server sifatida ulansa, media fayllarga umuman aloqasi yo'q kundalik kodlash sessiyalarida ham kontekstni band qiladi.
- **Yosh loyiha:** Manba kodi toza va telemetriyasiz bo'lsa-da, yakka muallifning yangi loyihasi (hujjatlarida lokal `file:///d:/...` qoldiqlari uchraydi), shuning uchun `.png -> .webp` import almashtirishdan keyin `git diff` ni ko'zdan kechirish shart.

---

## 3. Qanday ishlatish ma'qul? (On-Demand CLI)

Hech narsani global o'rnatmasdan, veb yoki mobil loyihada statik rasmlar shishib ketganda bir martalik CLI buyrug'i sifatida ishga tushirish yetarli:

```bash
npx assetdiet-mcp audit . --policy safe
```

---

## 4. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-11-16 | Manba kod auditi | `👍 Yaxshi variant` | Asl GitHub reposi (`092Abdullah/AssetDiet`) va npm paketi topilib tekshirildi; 16-tool MCP o'rniga faqat kerak paytda `npx assetdiet-mcp` CLI rejimida ishlatish tavsiya etildi. |
