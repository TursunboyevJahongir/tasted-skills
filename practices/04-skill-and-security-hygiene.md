# 4. Yangi Skill Sanitarizatsiyasi, Pentest va Xatolar Monitoringi

**🇺🇿 O'zbekcha** | [🇬🇧 English](en/04-skill-and-security-hygiene.md) | [🇷🇺 Русский](ru/04-skill-and-security-hygiene.md)

⬅️ [Practices Mundarijasiga qaytish](README.md)

- **Birlashtiriladigan vositalar:** [**`tasted-skills`**](../skills/tasted-skills/SKILL.md) + [**`skillshare`**](../reviews/developer-tools/skillshare.md) + [**`Shannon` (`hacker-test`)**](../reviews/backend/shannon.md) + [**`sentry`**](../reviews/backend/sentry.md)
- **Qo'llaniladigan loyihalar:** AI ish muhiti xavfsizligi, Backend API'lar va Full-Stack production tizimlar.

---

## 1. Nima uchun bularni birgalikda ishlatish kerak? (Umumiy foydasi)

1. GitHub va ijtimoiy tarmoqlardagi mashhur AI skill/pluginlarning ko'pida yashirin `SessionStart` / `Stop` hooklar, `PostHog`/`Scarf`/`Supabase` telemetriyasi, yashirin pullik API talabi yoki barcha vazifalarga aralashadigan keng `description` bo'ladi.
2. Backend va API yozilgach, oddiy funksional testlar avtorizatsiya teshiklarini (`IDOR`, `Broken Auth`, `SSRF`) topa olmaydi.

---

## 2. Qanday birgalikda ishlatiladi? (3 ta himoya halqasi)

### 1-Halqa: Begona Skill yoki Tool'ni o'rnatishdan oldin tozalash (`tasted-skills` + `skillshare audit`)

Hech qachon `npx skills add ...` yoki `claude plugin install ...` ni ko'r-ko'rona ishlatmang:
1. **AI agent orqali birlamchi kodni o'qitish (`tasted-skills`):**
   - Agent repo ichidagi `SKILL.md`, `plugin.json`, `package.json` (`postinstall`), `.env.example` va skriptlarni o'qiydi.
2. **Keraksiz qismlarni kesib tashlash (`Sanitarizatsiya`):**
   - `hooks:` bo'limlari, telemetriya skriptlari va begona brend/cloud reklamalari olib tashlanadi;
   - Agar skill faqat maxsus holatda kerak bo'lsa, frontmatter'ga `disable-model-invocation: true` qo'shiladi;
   - MCP server o'rniga CLI + yengil skill varianti tanlanadi (`0` kontekst shishishi).
3. **Avtomatik xavfsizlik skaneri va sinxronlash (`skillshare`):**
   ```bash
   skillshare audit ~/.config/skillshare/skills/<skill-nomi>
   skillshare sync -g
   ```

### 2-Halqa: Lokal va Staging API'larni "Xaker ko'zi bilan" tekshirish (`hacker-test` / `Shannon`)

Yangi auth, to'lov yoki rolga asoslangan (`RBAC`) API yozilganda, production'ga chiqarishdan oldin lokal/staging muhitda avtonom White-Box pentest yurgizish:
- `hacker-test` skilli og'ir plugin o'rnatmasdan, faqat so'ralgan paytda `npx @keygraph/shannon@latest` orqali kod bazasini va ishlab turgan lokal endpointlarni tahlil qilib, `IDOR`, `Auth bypass`, `SQLi/NoSQLi`, `XSS` va `SSRF` zaifliklarini real PoC bilan tekshiradi *(production URL'larda ishlatish qat'iyan man etilgan)*.

### 3-Halqa: Production xatolarni va sekin so'rovlarni tutish (`sentry`)

Nashrdan keyin real foydalanuvchilarda yuz beradigan xatolarni AI agent yordamida tahlil qilish:
- `sentry` orqali guruhlangan xatolar (`Issue Grouping`), `Source Maps` / `dSYM` / `ProGuard` stack-trace'lar, xatodan oldingi foydalanuvchi qadamlari (`Breadcrumbs`, `Session Replay`) va sekin DB/HTTP `Traces` bir joydan o'qiladi va `diagnosing-bugs` + `ponytail` bilan tuzatiladi.
