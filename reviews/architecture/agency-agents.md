# `agency-agents` (The Agency — 283 Persona Prompts)

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/architecture/agency-agents.md) | [🇷🇺 Русский](../ru/architecture/agency-agents.md)

- **Manba:** [msitarzewski/agency-agents](https://github.com/msitarzewski/agency-agents)
- **Turkum:** `Architecture` *(Multi-role persona promptlar to'plami: Engineering, Design, QA, Security, Marketing va b.)*
- **Turi:** `Agent / Skill to'plami` *(18 ta bo'lim, 283 ta Markdown fayl + `convert.sh` / `install.sh`)*
- **Sifat bahosi:** **6.5 / 10**
- **Ishda kerak bo'lishi:** **2.5 / 10**
- **Tavsiya etilgan ko'lam:** `O'rnatmaslik` *(global o'rnatish kontekstni shishirib yuboradi)*
- **O'rniga ishlatiladigan muqobillar:** [**`impeccable`**](../ui-ux/impeccable.md) + [**`ponytail`**](ponytail.md) + [**`karpathy-guidelines`**](karpathy-guidelines.md) + [**`elephant-goldfish-model`**](elephant-goldfish-model.md) + [**`cross-platform-qa`**](../mobile/cross-platform-qa.md)
- **Tekshirilgan sana:** `2026-11-16`
- **Joriy holati:** `⚠️ Tavsiya etilmaydi` *(bizga kerak emas — mavjud ixtisoslashgan skillarimiz ancha toza va kuchli)*

---

## 1. Nima va qanday ishlaydi?

> [!IMPORTANT]
> **Oddiy tilda (Asosiy vazifasi va foydasi):** "Sen marketologsan", "Sen dizaynersan" kabi 283 ta shablon rol-promptlar yig'indisi; to'liq o'rnatilsa amaliy foyda bermasdan **`~18,500` token kontekstni bekorga band qiladi**. Real muhandislik skilllarimiz (`impeccable`, `ponytail`, `elephant-goldfish-model`) ulardan ancha aniq ishlaydi.

O'zini *"to'liq AI mutaxassislar agentligi"* deb tanishtiruvchi repozitoriy bo'lib, ichida hech qanday subagent orkestrator, MCP server yoki tekshiruvchi runtime dvigatel **yo'q**.

Asl tarkibi:
- **18 ta bo'limga (`divisions.json`:** `engineering`, `design`, `testing`, `security`, `gis`, `marketing`, `product`, `game-development`, `specialized` va b.**) ajratilgan jami `283 ta` sof Markdown persona-prompt fayllar** (`~3.98 MB`, har bir fayl o'rtacha `14.1 KB` / ~250 qator).
- **`scripts/convert.sh` va `scripts/install.sh`:** Shu 283 ta `.md` faylni 17 xil AI muhiti formatiga (`Claude Code` `~/.claude/agents/`, `Codex` `~/.codex/agents/*.toml`, `Antigravity` `~/.gemini/config/skills/agency-*/SKILL.md`, `Cursor`, `ZCode` va h.k.) o'girib ko'chirib beradi.

---

## 2. Qanchalik yaxshi va qanchalik yomon?

### Kuchli tomonlari
- Installer skriptlari (`--division`, `--agent`, `--dry-run`) tartibli va yashirin hook/telemetriyasiz yozilgan (`MIT` litsenziya).
- Ichidagi 2–3 ta tor sohaviy faylda foydali nazorat ro'yxatlari bor (masalan: `security-ai-generated-code-auditor.md` — `NEXT_PUBLIC_` secret leak, yolg'on `RLS USING (true)` va LLM prompt-injection; `gis-web-gis-developer.md` — `MapLibre` va vector tiles).

### Zaif tomonlari va nima uchun bizga kerak emas
1. **Kontekst portlashi (`~18,500 token` doimiy xarajat):**
   283 ta agentning faqatgina `name + description` frontmatter sarlavhalari **`72.3 KB` (`~18,504 token`)** bo'ladi. Hammasi o'rnatilsa, har bir oddiy so'rovda hech qanday ish qilinmasdan `~18.5K` token ro'yxatni ushlab turishga sarflanadi va model skill tanlashda chalg'iydi.
2. **85% fayllar shablon rol-o'yini ("AI suv") va begona qoldiqlardan iborat:**
   - Deyarli barcha fayllarda *"🧠 Your Identity & Memory: You remember..."* kabi sun'iy kirish so'zlari, umumiy darslik kodlari va uzun hisobot shablonlari bor.
   - Bir qator asosiy agentlarda boshqa loyihalardan qolib ketgan xato talablar uchraydi:
     - `Frontend Developer` ichida kutilmaganda VS Code kengaytmasi yozish (*"Build editor extensions with openAt, reveal, peek"*) talabi yozilgan;
     - `UI Designer` CSS namunasida anti-pattern hisoblangan `transition: all` ishlatilgan;
     - `Senior Developer` faqat `Laravel/Livewire` stekiga bog'lab qo'yilgan;
     - `Reality Checker` esa mavjud bo'lmagan `./qa-playwright-capture.sh http://localhost:8000` skriptini va `*.blade.php` fayllarini `"NEVER SKIP"` deb majburlaydi.
3. **Auto-trigger va `skillshare` ziddiyati:**
   - `convert.sh` Antigravity va boshqa muhitlar uchun `disable-model-invocation: true` qo'ymaydi hamda fayllarni [`skillshare`](../developer-tools/skillshare.md) ni chetlab o'tib to'g'ridan-to'g'ri global papkaga yozadi — natijada har bir UI va kod vazifasida asosiy skillarimiz bilan urishib qoladi.

---

## 3. Xavfsizlik va Sanitarizatsiya

> [!WARNING]
> **Kontekst shishishi:** Barcha 283 ta shablon rolni global o'rnatish **`~18,500` token kontekstni doimiy band qilib**, agent diqqatini chalg'itadi.

- **Xavf darajasi:** `Past` *(zararli skript, tarmoq chaqiruvi yoki `Stop` hook yo'q, ammo kontekst va `auto-trigger` zarari yuqori)*
- Agar kimdir ichidan bitta tor faylni olishni xohlasa ham, `install.sh` ni ishlatmasdan, rol-o'yini (`Identity & Memory`) va uzun hisobot jadvallarini kesib tashlab, faqat [`skillshare`](../developer-tools/skillshare.md) orqali `disable-model-invocation: true` bilan olishi kerak.

---

## 4. O'rniga bizda nima ishlatiladi?

Bu repodagi barcha asosiy yo'nalishlar bizda allaqachon ancha ixcham va amalda sinalgan vositalar bilan yopilgan:

| `agency-agents` dagi bo'lim | Bizdagi kuchli va toza muqobili |
|---|---|
| `Frontend Developer`, `UI Designer`, `UX Architect` | [**`impeccable`**](../ui-ux/impeccable.md) + [**`mobile-native`**](../mobile/mobile-native.md) + [**`animate-expo`**](../mobile/animate-expo.md) |
| `Minimal Change Engineer` (207 qator + uzun hisobot) | [**`ponytail`**](ponytail.md) + [**`karpathy-guidelines`**](karpathy-guidelines.md) (`2.5–3.5 KB`, ortiqcha hisobotsiz) |
| `Software Architect`, `Code Reviewer` | [**`elephant-goldfish-model`**](elephant-goldfish-model.md) (haqiqiy `fresh-context` Goldfish subagentlar) + [**`grill-me`**](grill-me.md) |
| `Reality Checker`, `Evidence Collector` | [**`cross-platform-qa`**](../mobile/cross-platform-qa.md) ([`agent-desktop`](../developer-tools/agent-desktop.md) + [`Device Hub`](../mobile/ios-simulator-device-hub.md) + [`adb`](../mobile/adb.md)) |

---

## 5. Qaysi yo'nalish va vazifalarda foydali?

- **Qachon ishlatish kerak:** O'rnatmaslik — faqat GitHub'ning o'zida ayrim tor checklistlarni (`security-ai-generated-code-auditor` va h.k.) o'qib ko'rish uchun ma'lumotnoma sifatida qarash mumkin.
- **Qachon ishlatmaslik kerak:** Global (`-g`) muhitda `install.sh` orqali o'rnatishda.

---

## 6. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-11-16 | 283 ta agent fayli, `convert.sh` / `install.sh` va kontekst hajmi auditi | `⚠️ Tavsiya etilmaydi` | `~18.5K` tokenlik frontmatter shishishi, ko'p fayllardagi shablon matnlar/copy-paste qoldiqlari hamda mavjud skillarimiz (`impeccable`, `ponytail`, `elephant-goldfish-model`, `cross-platform-qa`) undan ancha ustun bo'lgani sababli o'rnatmaslikka qaror qilindi. |
