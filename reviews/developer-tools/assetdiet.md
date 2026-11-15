# `AssetDiet` (`assetdiet-mcp` + `asset-diet` skilli)

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/developer-tools/assetdiet.md) | [🇷🇺 Русский](../ru/developer-tools/assetdiet.md)

- **Manba:** [092Abdullah/AssetDiet](https://github.com/092Abdullah/AssetDiet) · [npm: assetdiet-mcp](https://www.npmjs.com/package/assetdiet-mcp)
- **Turkum:** `Developer Tools` *(Lokal rasm, SVG, video va 3D fayllarni siqish hamda kod importlarini yangilash)*
- **Turi:** `Standalone CLI` + biz yozgan yengil [`asset-diet`](../../skills/asset-diet/SKILL.md) on-demand skilli
- **Sifat bahosi:** **7.5 / 10**
- **Bizga kerakliligi:** **6.5 / 10** *(doimiy 16-tool MCP sifatida emas, [`asset-diet`](../../skills/asset-diet/SKILL.md) skilli orqali faqat kerak paytda `npx` CLI rejimida)*
- **Tavsiya etilgan ko'lam:** `On-Demand npx CLI + Global yengil asset-diet skilli (-g)`
- **Tekshirilgan sana:** `2026-11-16`
- **Joriy holati:** `👍 Yaxshi variant` *(doimiy MCP ulamasdan, ushbu repodagi [`skills/asset-diet`](../../skills/asset-diet/SKILL.md) skilli barcha 5 ta agent muhitiga ulandi va real repoda sinab ko'rildi)*

---

## 1. Qisqacha: Nima va qanday ishlaydi?

Loyiha ichidagi og'ir media fayllarni bulutga yubormasdan **100% lokal** siqadigan va tartibga soladigan vosita:
- **Mahalliy dvigatellari:** `Sharp v0.35` (`libvips` — `WebP` / `AVIF`), `SVGO 3.x` (SVG tozalash), `FFmpeg` (video) va `@gltf-transform` (`GLB`/`GLTF` 3D modellar).
- **Xavfsiz o'zgartirish va rollback:** SHA-256 orqali dublikat fayllarni topadi, `safe` rejimda formatni buzmasdan lossless siqadi (`balanced` rejimda esa `.png`/`.jpg -> .webp` va kod importlarini yangilaydi) hamda `.assetdiet/backups/<runId>/` + write-ahead jurnal orqali bir buyruq bilan orqaga qaytarish (`restore`) imkonini beradi.
- **Jonli sinov natijasi:** `214` ta media faylli (`150.5 MB`) mobil/veb loyihada `audit --policy safe` `3.6` soniyada `148` ta fayldan `-15.55 MB (-10.3%)` yo'qotishsiz tejash va `18` guruh SHA-256 dublikatni aniqladi.

---

## 2. Nega doimiy MCP emas, `asset-diet` skilli orqali?

- **0 MCP kontekst shishishi:** Doimiy 16-tool MCP server ulansa, rasmga aloqasi yo'q har bitta chatda kontekstni yeydi; [`skills/asset-diet`](../../skills/asset-diet/SKILL.md) esa faqat *"rasmlarni siqib ber"* / *"asset-diet"* deyilganda ishga tushadi (`setup` va `mcp` buyruqlari taqiqlangan).
- **Expo / React Native himoyasi:** Mobil ilovalarda `app.json` ikonkalar va `.png` statik `require()` yo'llari buzilmasligi uchun skill sukut bo'yicha `--policy safe` rejimini ushlaydi hamda `.assetdiet/` zaxira papkasini Git'ga qo'shib yubormaslikni nazorat qiladi.

---

## 3. On-Demand CLI buyruqlari

```bash
# 1. Read-only audit (fayllarga tegmasdan tejash va dublikatlarni hisoblash)
npx assetdiet-mcp@0.1.4 audit . --policy safe --summary

# 2. Xavfsiz lossless siqish (asl kengaytma saqlanadi, backup yoziladi)
npx assetdiet-mcp@0.1.4 optimize . --policy safe

# 3. Zarur bo'lsa bir buyruq bilan qaytarish
npx assetdiet-mcp@0.1.4 restore --run <runId>
```

---

## 4. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-11-16 | Manba kod auditi, jonli `audit`/`doctor` sinovi va global `asset-diet` skillini ulash | `👍 Yaxshi variant` | `v0.1.4` barcha 5 ta lokal dvigatel (`Sharp`, `SVGO`, `FFmpeg`, `glTF-Transform`, `Font`) bilan tekshirildi; 16-tool MCP o'rniga yengil [`skills/asset-diet`](../../skills/asset-diet/SKILL.md) barcha 5 ta AI agentga sinxronlandi. |
