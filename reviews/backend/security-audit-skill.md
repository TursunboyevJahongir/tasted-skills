# `security-audit` (`cloudflare/security-audit-skill`)

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/backend/security-audit-skill.md) | [🇷🇺 Русский](../ru/backend/security-audit-skill.md)

- **Manba:** [cloudflare/security-audit-skill](https://github.com/cloudflare/security-audit-skill)
- **Turkum:** `Backend` *(Backend, Web, Mobil, CLI va Cloud manba kodi xavfsizligi auditi)*
- **Turi:** `Skill` *(`SKILL.md` + 12 ta hujum yo'riqnomasi + 2 ta 0-dependency Node JSON tekshirgichi)*
- **Sifat bahosi:** **9.0 / 10**
- **Bizga kerakliligi:** **7.5 / 10**
- **Tavsiya etilgan ko'lam:** `Global (-g)` *(toraytirilgan explicit trigger va `quick` profil himoyasi bilan)*
- **Ishlatilayotgan sana:** `2026-11-16` dan
- **Joriy holati:** `✅ Ishlatyapman` *(Docker ko'tarmasdan Backend, Web va Mobil manba kodidan zaiflik topish uchun asosiy audit skilli)*

---

## 1. Nima va qanday ishlaydi?

> [!IMPORTANT]
> **Oddiy tilda (Asosiy vazifasi va foydasi):** Reliz yoki PR oldidan hech qanday Docker server ko'tarmasdan Backend, Web va **Mobil (`deep-link`, `WebView`)** kodlarini xaker ko'zi bilan tekshirib chiqadi va yolg'on trevogalarni ikkinchi mustaqil subagent orqali elakdan o'tkazadi.

Cloudflare xavfsizlik jamoasining ichki zaiflik qidirish tizimidan (`vulnerability harness`) ajratib chiqarilgan **100% lokal, agent-neytral White-Box manba kodi xavfsizligi auditi skilli** (`MIT`, `0` tashqi npm paket, `0` tarmoq murojaati, `0` telemetriya, `0` lifecycle hook).

**6 bosqichli *Adversarial* tekshiruv mexanizmi:**
1. **Reconnaissance (`RECONNAISSANCE.md`):** Loyiha arxitekturasi, trust-boundary'lar va kirish nuqtalarini xaritaga tushirib, `architecture.md` va `coverage-ledger.json` yaratadi.
2. **Coverage-led Hunting (`HUNTING.md` + 12 ta maxsus modul):** Har bir yo'nalish bo'yicha alohida *Hunter* subagentlar tushiradi — jumladan Web/Auth (`WEB-PROTOCOL-AND-AUTH.md`), Multi-tenant va ma'lumot sizishi (`DATA-ISOLATION-AND-LIFECYCLE.md`), **Mobil `deep-link` / `WebView` / `IPC`** (`DESKTOP-MOBILE-AND-LOCAL-IPC.md`), AI prompt-injection (`AI-AND-LLM.md`), Cloud/IAM/Docker (`CLOUD-AND-DEPLOYMENT.md`) va CI/CD supply-chain (`SUPPLY-CHAIN-AND-RELEASE.md`).
3. **Adversarial Candidate Validation:** Har bir topilgan gumonli zaiflik **uni topgan agentga emas**, balki noldan ochilgan yangi *Verifier* subagentga beriladi — u topilmani kod orqali **rad etishga (yolg'onga chiqarishga)** urinadi. Soxta "best-practice checklist" shovqini shu yerda kesiladi.
4. **Structured JSON Validation:** Natijalar (`confirmed`, `needs_validation`, `rejected`) `findings.json` ga yozilib, lokal `validate-findings.cjs` va `validate-coverage-ledger.cjs` skriptlari bilan tekshiriladi.
5. **Independent Record Verification:** Yakuniy kod qatorlari va xulosalar yana bir mustaqil tekshiruvdan o'tadi.
6. **Target-Neutral Report:** Loyihaning git daraxtini iflos qilmasdan, hisobotlarni `~/security-audit-skill/<repo-nomi>/run-<N>/REPORT.md` papkasiga chiqaradi.

---

## 2. Qanchalik yaxshi va qanchalik yomon?

### Kuchli tomonlari
- **Server va Docker ko'tarmasdan keng qamrov:** Faqat HTTP API emas, balki **Expo / React Native / iOS / Android** (`deep-link`, `WebView`, lokal saqlash), CLI vositalar, GitHub Actions CI/CD, Terraform/Docker konfiguratsiyalar va LLM agent integratsiyalarini ham tekshiradi.
- **Soxta vahimasiz haqiqiy zaifliklar:** Faqat aniq trust-boundary buzilishi isbotlangan holatgina `confirmed` bo'ladi; tashqi infratuzilmaga bog'liq narsalar darajasiz `needs_validation` sifatida ajratiladi.
- **Kvota budjeti va qayta tekshirish (`Prior runs`):** Oldingi `coverage-ledger.json` ni o'qib, faqat o'zgargan fayllarni yoki qolib ketgan qismlarni tekshira oladi.

### Zaif tomonlari va xarajati
- **Subagent kvotasi sarfi:** To'liq `standard` yoki `deep` rejimi katta repoda `10–30+` subagent chaqirishi mumkin — shu sababli biz sukut bo'yicha yengil **`quick` / `scoped`** rejimiga o'tkazdik.
- **Jonli HTTP hujum qilmaydi:** Kodni o'qib tahlil qiladi; ishlab turgan serverga real brauzer va HTTP payload bilan hujum qilib sinash uchun [`Shannon` (`hacker-test`)](shannon.md) ishlatiladi.

---

## 3. Xavfsizlik va O'rnatishdan oldin tozalash (Sanitarizatsiya)

- **Xavf darajasi:** `Past` *(`0` tashqi bog'liqlik, `65/65` lokal Node testdan o'tgan, `CRITICAL = 0`)*
- **Tekshirilgan nuqtalar:** `SKILL.md`, barcha 14 ta `.md` yo'riqnoma, `validate-findings.cjs`, `validate-coverage-ledger.cjs` va `skillshare audit` (`HIGH` ogohlantirishlari faqat `ATTACK-CLASSES.md` ichidagi `"eval(), exec() bormi?"` degan matn namunasi tufayli chiqqan xavfsiz false-positive).
- **Amalga oshirilgan lokal sanitarizatsiya (`explicit-trigger-and-quick-default-1`):**
  1. **`SKILL.md` frontmatter `description` toraytirildi:** Asl tavsif oddiy JWT/auth kod yozishda ham `22 KB` `SKILL.md` ni yuklab yubormasligi uchun faqat aniq **`"security audit"`**, **`"xavfsizlik auditi"`**, **`"kod xavfsizligini tekshir"`**, **`"zaifliklarni top"`** deyilganda uyg'onadigan qilindi (jonli `"hacker test"` esa [`hacker-test`](shannon.md) da qoladi).
  2. **Sukut bo'yicha profil `standard` -> `quick` / `scoped` qilindi (`SKILL.md` 120-qator):** Foydalanuvchi ataylab `standard` yoki `deep` so'ramaguncha tejamkor `quick` (yoki ko'rsatilgan papka/diff bo'yicha `scoped`) rejimda ishlaydi.

---

## 4. Bizga qanchalik kerak va [`Shannon` (`hacker-test`)](shannon.md) bilan farqi

Ikkalasi bir-birining o'rnini bosmaydi, balki **2 bosqichli xavfsizlik zanjirini** hosil qiladi:

| Mezon | **`security-audit`** *(Cloudflare — `✅ Ishlatyapman`)* | [**`Shannon` (`hacker-test`)**](shannon.md) *(`👍 Yaxshi variant`)* |
|---|---|---|
| **Qanday ishlaydi?** | Manba kodini 6 bosqichda (`Hunter` + `Verifier` subagentlar) tahlil qiladi | Docker + Temporal + Playwright ko'tarib jonli URL'ga real hujum qiladi |
| **Qamrovi** | Backend, Web, **Mobil (`iOS`/`Android`/`Expo`)**, CLI, Cloud/CI, LLM | Faqat ishlab turgan Web ilova va HTTP API |
| **Vaqt va talab** | Server/Docker kerak emas (`quick`/`scoped`: **3–10 daqiqa**) | Docker + ishlab turgan lokal/staging server shart (**1 – 1.5 soat**) |

---

## 5. Qaysi yo'nalish va vazifalarda foydali?

- **Qachon ishlatish kerak:** PR yoki reliz oldidan yangi auth/to'lov/tenant modullarini, mobil deep-link/WebView'larni, CI/CD workflow'larni yoki butun reponi Docker ko'tarmasdan zaiflikka tekshirishda (*`"shu modulni security audit qil"`* yoki *`"xavfsizlik auditi"`*).
- **Qachon ishlatmaslik kerak:** Oddiy bir qatorli bug tuzatishda (`ponytail`) yoki ishlab turgan staging serverni jonli brauzer payloadlari bilan buzib ko'rish kerak bo'lganda (unda `"hacker test"`).

---

## 6. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh (ishlatildimi, qayerda sinab ko'rildi, nima tozalandi) |
|---|---|---|---|
| 2026-11-16 | Manba kodi, `.cjs` validatorlar (`65/65` test), `skillshare audit` tekshiruvi + sanitarizatsiya bilan global o'rnatish | `✅ Ishlatyapman` | `SKILL.md` auto-trigger'i aniq so'rovlarga toraytirildi va sukut bo'yicha `quick`/`scoped` profil o'rnatilib barcha 5 ta global agent targetiga (`skillshare sync -g`) ulandi. |

