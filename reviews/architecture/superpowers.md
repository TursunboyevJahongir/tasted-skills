# `superpowers` (Obra / Jesse Vincent)

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/architecture/superpowers.md) | [🇷🇺 Русский](../ru/architecture/superpowers.md)

- **Manba:** [obra/superpowers](https://github.com/obra/superpowers)
- **Turkum:** `Architecture` *(Ish jarayoni, Brainstorming, Rejalashtirish va Majburiy TDD)*
- **Turi:** `Plugin` *(14 ta skill + `SessionStart` hook + subagent skriptlari)*
- **Sifat bahosi:** **6.5 / 10**
- **Ishda kerak bo'lishi:** **2.0 / 10**
- **Tavsiya etilgan ko'lam:** `O'rnatmaslik` *(avval o'rnatib sinab ko'rildi va olib tashlandi)*
- **Ishlatilgan davr:** `2026-04-04 → 2026-09-01` *(sinab ko'rilib o'chirilgan)*
- **Joriy holati:** `⚠️ Tavsiya etilmaydi` *(🧪 Sinab ko'rilib, ishni sekinlashtirgani sabab o'chirib tashlangan)*

---

## 1. Nima va qanday ishlaydi?

> [!IMPORTANT]
> **Oddiy tilda (Asosiy vazifasi va foydasi):** 5 oy ishlatib ko'rib o'chirib tashlaganmiz: har suhbat boshida `SessionStart` hook va oddiy vazifalarda ham majburiy TDD hamda uzun savol-javoblar qo'shib, **ish vaqti va token sarfini `2x` ga ko'paytirib yuboradi**. O'rnini yengil `grill-me` va `ponytail` bosdi.

Claude Code, Codex, Cursor va Antigravity uchun 14 ta jarayon skillidan (`using-superpowers`, `brainstorming`, `writing-plans`, `subagent-driven-development`, `executing-plans`, `test-driven-development`, `systematic-debugging`, `using-git-worktrees`, `verification-before-completion` va h.k.) hamda `hooks/session-start` skriptidan iborat "to'liq dasturlash metodologiyasi" plugini.

Ishlash mexanizmi:
- **`SessionStart` hook (`hooks/session-start`):** Har bir yangi sessiya boshlanganda model kontekstiga `<EXTREMELY_IMPORTANT>` bloki orqali `using-superpowers/SKILL.md` matnini majburiy ravishda quyadi: *"Agar biror skill vazifaga 1% mos kelish ehtimoli bo'lsa ham, uni chaqirishing SHART. Oddiy savol ham vazifa hisoblanadi."*
- **Majburiy zanjir:** Har qanday yangi funksiya yoki o'zgarishda agentni `brainstorming → design doc → writing-plans → using-git-worktrees → subagent-driven-development → test-driven-development (Red-Green-Refactor) → requesting-code-review` konveyeridan o'tishga majbur qiladi.

---

## 2. Amalda sinab ko'rilganda chiqqan 4 ta asosiy muammo (Nega o'chirib tashlandi?)

Oldin o'rnatib real vazifalarda ishlatib ko'rilganda, foydadan ko'ra ko'proq zarar va sekinlashish keltirib chiqardi:

### 1. Keragidan ortiq o'ylanish (Overthinking)
- `using-superpowers` ichidagi *"The skill is overkill → Simple things become complex. Use it"* va *"1% chance"* qoidalari tufayli agent hatto kichik va aniq ishlarda ham to'g'ridan-to'g'ri kod yozish o'rniga qaysi jarayon skillini chaqirish haqida uzoq o'ylanib, ortiqcha qadamlar qo'shib yuboradi.

### 2. `brainstorming` keraksiz joyda ishlab ketishi va reja paytida ortiqcha savollar berishi
- `brainstorming/SKILL.md` frontmatteri (`"You MUST use this before any creative work - creating features, building components, adding functionality, modifying behavior..."`) juda keng yozilgani sabab, oddiy UI yoki funksiya qo'shishda ham avtomatik ishga tushib ketadi.
- Foydalanuvchi aniq vazifa bersa ham, kod yozishdan oldin majburiy 4 qadamni (`variantlar taklif qilish → design doc yozish → tasdiqlatish → writing-plans`) talab qilib, keraksiz savollar bilan ishni to'xtatib qo'yadi.
- **Bizdagi to'g'ri muqobili:** **`grill-me` / `grilling` / `grill-with-docs`** — ular har bir vazifaga o'zboshimchalik bilan tiqilmaydi, faqat haqiqatan chuqur savol-javob va reja pishitish kerak bo'lganda aniq chaqiriladi.

### 3. Har bir ishda byurokratik loop (`subagent-driven-development`) va keskin sekinlashish
- Reja bajarilayotganda har bir kichik qadam uchun alohida git worktree, `.superpowers/sdd/` papkasi, `implementer` subagent, `task-reviewer` subagent va `fix-loop` aylanaveradi.
- Natijada tez bitadigan amaliy vazifalar ham uzoq davom etadigan subagent looplariga kirib qoladi, ham vaqtni, ham token/kvotani behuda sarflaydi.

### 4. Majburiy TDD (`test-driven-development`) dizayni Web, Mobile va Backend ish uslubimizga mos emasligi
- `test-driven-development/SKILL.md` da `"The Iron Law: NO PRODUCTION CODE WITHOUT A FAILING TEST FIRST. Write code before the test? Delete it. Start over."` qoidasi qat'iy qo'yilgan.
- **Web va Mobile (iOS / Android) da:** UI va interaktiv ekranlar uchun avval yiqiladigan (failing) test yozib keyin kod yozish umuman kerak emas — ularni jonli brauzer va simulyator/emulyatorda (`agent-desktop`, `agent-device` va `adb` orqali) bevosita ishlatib ko'rish ancha tez va haqiqiy natijani ko'rsatadi.
- **Backend'da:** Ishni boshlashdan oldin test yozib olib, keyin kodni o'sha testga moslab chiqish **ikki hissa ortiqcha ish (`2x` vaqt sarfi)** bo'lib ketadi.

---

## 3. Xavfsizlik va Sanitarizatsiya tahlili

> [!WARNING]
> **Vaqt va kvota zarari:** Har sessiyada `SessionStart` hook va Web/Mobil UI'da ham majburiy TDD talab qilishi sabab **ish vaqti va token sarfini `2x` oshirib yuboradi**.

- **Xavf darajasi:** `O'rta` *(zararli kod yo'q, lekin `SessionStart` hook va tajovuzkor prompt-injeksiya mavjud)*
- **Tekshirilgan nuqtalar:**
  1. `hooks/hooks.json` va `hooks/session-start` har bir sessiyada avtomatik ishga tushib, modelning standart xulq-atvorini (`using-superpowers`) ustidan bosib oladi.
  2. `brainstorming`, `test-driven-development` va `writing-plans` skillarida `disable-model-invocation: true` yo'q — ular har bir odatiy kod yozish so'rovini tutib oladi (`prompt hijack`).

---

## 4. Bizdagi yengil va tez muqobillar to'plami

`superpowers` o'rniga bizda har bir bosqich uchun aniq, tez va keraksiz loop qilmaydigan alohida vositalar ishlatiladi:

| Vazifa | `superpowers` dagi og'ir mexanizm | Bizdagi tez va toza yechim |
|---|---|---|
| **G'oya va reja savol-javobi** | `brainstorming` (har bir ishda avtomatik yoqilib ketadi) | **`grill-me` / `grilling`** (faqat kerak paytda chaqiriladi) |
| **Kod yozish intizomi (soddalik)** | `writing-plans` + `subagent-driven-development` looplari | **`ponytail` + `karpathy-guidelines`** (minimal, ortiqcha abstraksiyasiz yechim) |
| **Web / iOS / Android tekshiruvi** | `test-driven-development` (oldindan majburiy unit-test yozish) | **`agent-desktop` + `agent-device` + `adb`** (lokal emulyator + yakunda 1 marta real telefon) |
| **Mustaqil kod review** | Har bir mayda taskdan keyin `task-reviewer` loop | **`Orca` (`orca orchestration`)** (ish bitganda bitta aniq mustaqil tekshiruv) |

---

## 5. Qaysi yo'nalish va vazifalarda foydali?

- **Qachon ishlatish kerak:** O'rnatmaslik tavsiya etiladi.
- **Qachon ishlatmaslik kerak:** Kundalik Web, Mobile (iOS/Android) va Backend ishlarida — tezlikni tushiradi, ortiqcha savollar beradi va ikki hissa TDD mehnatini majburlaydi.

---

## 6. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-04-04 | Global o'rnatib amaliyotda sinashni boshlash | `⚠️ Tavsiya etilmaydi` | 14 ta jarayon skilli ulandi; ko'p oylik real ishda `SessionStart` overthinking va `brainstorming` shovqini ishni sekinlashtirdi (`2026-08-14` da majburiy `test-driven-development` o'chirib qo'yildi). |
| 2026-09-01 | Asosiy oqimdan butunlay olib tashlash | `⚠️ Tavsiya etilmaydi` | O'rniga `grill-me`, `ponytail`, `karpathy-guidelines` va `agent-device` qoldirildi. |
