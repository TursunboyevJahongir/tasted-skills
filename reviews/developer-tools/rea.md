# `REA` (`morluto/rea` — Reverse Engineer Anything)

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/developer-tools/rea.md) | [🇷🇺 Русский](../ru/developer-tools/rea.md)

- **Manba:** [morluto/rea](https://github.com/morluto/rea) · [rea.tools](https://rea.tools/) · [rea-agents (npm)](https://www.npmjs.com/package/rea-agents)
- **Turkum:** `Developer Tools` *(Yopiq dasturlar, APK, Electron `.asar` va Binar fayllarni Reverse Engineering qilish)*
- **Turi:** `Standalone CLI + On-Demand Skill` ([skills/rea](../../skills/rea/SKILL.md)) *(MCP serveri o'chirilgan)*
- **Sifat bahosi:** **9.0 / 10**
- **Bizga kerakliligi:** **3.5 / 10**
- **Tavsiya etilgan ko'lam:** `On-Demand CLI + Global yengil rea wrapper skilli` *(global MCP sifatida aslo o'rnatilmaydi)*
- **Tekshirilgan sana:** `2026-11-17`
- **Joriy holati:** `👍 Yaxshi variant` *(doimiy MCP ulanmagan; global `rea` skilli orqali faqat signal berilganda kerakli yordamchi dasturlarni tekshirib vaqtinchalik ishga tushadi)*

---

## 1. Nima va qanday ishlaydi?

> [!IMPORTANT]
> **Oddiy tilda (Asosiy vazifasi va foydasi):** Manba kodi (source code) qo'lingizda bo'lmagan **begona tayyor dastur, Electron `.asar`, siqilgan veb-bundle, Android `.apk` yoki native binar fayllarni ichidan ochib, biror funksiya qanday yozilganini dalillari bilan ko'rsatib beradi**. O'zining standart MCP serveri `~75,000+` token yegani uchun uni doimiy ulamaymiz — o'rniga [rea](../../skills/rea/SKILL.md) wrapper skillimiz orqali **`0` doimiy token yuki bilan** faqat `"rea"` deb signal berilganda vaqtinchalik ishga tushiramiz.

`morluto/rea` (`npm: rea-agents@6.9.0`, `MIT`) — yopiq va kompilyatsiya qilingan dasturlarni lokal tahlil qiladigan keng qamrovli TypeScript CLI + MCP tizimi:
- **Ichki tayyor (0 qo'shimcha dastur talab qiladigan) tahlillari:** Electron `.asar` va JavaScript bundle'lardan modul/IPC/route grafigini tiklash (`analyze-javascript-application`), reliz paketda `.map`/`.dSYM`/sirlar qolib ketmaganini tekshirish (`audit-release-exposure`), `.NET` CIL (`inspect-managed-members`), `Go` va `Rust` binarlari, Android `APK` imzosi va `Flutter` / `Unity IL2CPP` (`global-metadata.dat`), `Godot .pck`, `Mach-O`/`ELF`/`PE` xavfsizlik bayroqlari (`inspect-binary-hardening`), `SQLite` va `GGUF`/`safetensors`.
- **Tashqi dekompilyatorlar bilan chuqur tahlil:** Android `.apk` ichidagi Java/Kotlin klass va metodlarni o'qish (`jadx` + `openjdk` + `apktool`), native binarlardan C/C++/Swift psevdokod va chaqiruv grafigini chiqarish (`Ghidra`, `Hopper`, `IDA Pro` yoki `Rizin`), `WASM` (`wabt`) hamda `.pcap` tarmoq trafik tahlili (`wireshark`/`tshark`).
- Har bir natija SHA-256 bilan himoyalangan **`Evidence` (`evidence_id`, `coverage`, `limitations`, `unknowns`)** shaklida qaytadi — AI taxmin to'qimasdan faqat isbotlangan dalilga tayanadi.

---

## 2. Qanchalik yaxshi va qanchalik yomon?

### Kuchli tomonlari
- `0` telemetriya, `0` bulutga fayl yuborish — barcha tahlil 100% lokal kompyuterda kechadi.
- Begona dasturdagi yoqqan funksiyani (masalan, Notion/Telegram Desktop ichidagi yechimni yoki begona `.apk` API mantiqini) manba kodisiz tushunib, o'z loyihamizda qayta qurishda juda kuchli.
- `audit-release-exposure` buyrug'i o'zimiz chiqarayotgan build ichida tasodifan debug fayllar (`.map`, `.dSYM`) qolib ketmaganini tez tekshiradi.

### Zaif tomonlari va xarajati (Nega global MCP o'rnatib bo'lmaydi?)
- **Ulkan MCP kontekst yuki (`~75,000+` token):** Standart `npx rea-agents setup` yoki `.claude-plugin` / `.codex-plugin` o'rnatilsa, 45+ oiladagi **`200+` ta MCP tool** ro'yxati ulanadi (`compact` rejimda ham `tools/list` hajmi `~300 KB` ≈ **`~75,000+` token**). Asl skill papkasining o'zi ham `~10.7 KB` `SKILL.md` + **`~198 KB` (`~50,000` token)** `references/` dan iborat.
- **Og'ir paket va qat'iy Node talabi:** `rea-agents@6.9.0` ochilganda **`189.6 MB` (`10,585` ta fayl)** joy oladi va faqat `Node.js ^22.23.4 || ^24.22.1 || >=26.12.1` da ishlaydi (masalan, `Node 24.20.0` da yiqiladi).
- **Katta JSON chiqishi:** Real dasturning to'liq Evidence fayli `10–300 MB` gacha boradi — uni chatga to'g'ridan-to'g'ri chiqarib bo'lmaydi (`/tmp` ga saqlab, `inspect-analysis-view` bilan qismlab o'qish shart).

---

## 3. Xavfsizlik va Bizning Yechimimiz ([skills/rea](../../skills/rea/SKILL.md))

- **Xavf darajasi:** `Past–O'rta` *(statik tahlilda toza; dinamik `capture-*`/`Frida` rejimida begona dasturni foydalanuvchi huquqi bilan ishga tushiradi)*
- **Qanday sanitarizatsiya qildik va avtomatlashtirdik:**
  1. **Asl MCP va `200 KB` skill o'rnatilmadi:** `npx rea-agents setup` umuman ishlatilmaydi -> kundalik sessiyalarda **`0` token yuk**.
  2. **Maxsus [skills/rea](../../skills/rea/SKILL.md) + [rea-session.sh](../../skills/rea/scripts/rea-session.sh) yaratildi:**
     - Faqat `"rea"`, `"/rea"`, `"rea bilan tekshir"` deb signal berilgandagina uyg'onadi.
     - **`preflight` va `ensure-node` bosqichi:** Avval kompyuterdagi mos Node (`v26.12.1+` / `v24.22.1+`) ni qidiradi — **agar kompyuterdagi Node eski bo'lsa, uni avtomatik kerakli versiyaga yangilab/o'rnatib oladi** (`fnm install 24` yoki `brew upgrade node`), shuningdek `openjdk` (`JAVA_HOME`) va `GHIDRA_INSTALL_DIR` ni avtomatik ulaydi; keyin **tekshirilayotgan nishon turiga qarab** (`Electron .asar`, `Web URL`, `Android .apk`, `Native Mach-O/ELF/PE`, `.wasm`, `.pcap`) qaysi qo'shimcha dasturlar yetishmayotganini aniqlab, aynan keraklisini (`brew install openjdk jadx apktool` yoki `brew install --cask ghidra` / `rizin`) o'rnatib olgach tekshiruvni boshlaydi.
     - **`run` va `cleanup` bosqichi:** Barcha ishlarni vaqtinchalik `/tmp/rea-ephemeral` papkasida bajarib, ish tugagach vaqtinchalik fayllarni tozalab tashlaydi.

---

## 4. Bizga qanchalik kerak va mavjud vositalar bilan mosligi

| Vazifa | Qaysi vosita ishlatiladi? |
|---|---|
| **O'zimizning manba kodi bor loyihalarimiz arxitekturasi** | [**graphify**](../architecture/graphify.md) (`0` token AST qolip, `~10x–20x` tejamkor) — `REA` ishlatilmaydi |
| **O'z kodimiz xavfsizlik auditi (PR / reliz oldidan)** | [**security-audit**](../backend/security-audit-skill.md) + [**Shannon (hacker-test)**](../backend/shannon.md) |
| **Manba kodi yo'q begona `.asar` / `.apk` / binar / bundle tahlili** | **`REA` (`rea` skilli orqali vaqtinchalik CLI)** |

---

## 5. Qaysi yo'nalish va vazifalarda foydali?

- **Qachon ishlatish kerak:** Begona desktop/mobil/veb ilovadagi biror funksiya, protokol yoki animatsiya/bridge qanday qurilganini manba kodisiz ko'rib olish kerak bo'lganda; yoki o'zimizning tayyor build papkamizni `audit-release-exposure` bilan tekshirishda.
- **Qachon ishlatmaslik kerak:** O'zimizning Git repolarimizda oddiy kod o'qish, arxitektura tahlili yoki UI test qilishda.

---

## 6. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-11-17 | Manba kodi, MCP sxema yuki (`~75K` tok) va CLI auditi + yengil `rea` wrapper skilli | `👍 Yaxshi variant` | Global MCP rad etildi; `skills/rea/SKILL.md` + `scripts/rea-session.sh` yaratilib global sinxronlandi (`preflight` + kerakli app'larni avto-aniqlash + `/tmp` cleanup bilan sinovdan o'tdi). |
