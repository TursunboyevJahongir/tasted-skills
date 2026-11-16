# `caveman` (Julius Brussee)

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/developer-tools/caveman.md) | [🇷🇺 Русский](../ru/developer-tools/caveman.md)

- **Manba:** [JuliusBrussee/caveman](https://github.com/JuliusBrussee/caveman/blob/main/skills/caveman/SKILL.md)
- **Turkum:** `Developer Tools` *(Qisqa javob rejimi va token tejamkorligi)*
- **Turi:** `Skill` *(repo ichida ixtiyoriy `CLI / Local Proxy / Cloud Router` ham bor)*
- **Sifat bahosi:** **8.0 / 10**
- **Bizga kerakliligi:** **3.5 / 10** *(qisqa javob va minimal kod vazifasini bizda faol `ponytail` allaqachon yopadi)*
- **Tavsiya etilgan ko'lam:** `Faqat yakka SKILL.md (-p yoki on-demand /caveman)` — to'liq plugin/CLI o'rnatilmasin
- **O'rniga ishlatiladigan tizim (Alternativa):** [**`ponytail`**](../architecture/ponytail.md) *(ham qisqa javob beradi, ham ortiqcha yoziladigan kod/diff hajmini kesadi)* + [**`karpathy-guidelines`**](../architecture/karpathy-guidelines.md) + [**`T3 Code`**](t3-code.md)
- **Tekshirilgan sana:** `2026-11-16`
- **Joriy holati:** `👍 Yaxshi variant`

---

## 1. Nima va qanday ishlaydi?

`JuliusBrussee/caveman` (`v4.1.0`, `Apache-2.0`) ikki butunlay boshqa qatlamdan iborat:

1. **Yolg'iz javob skilli (`skills/caveman/SKILL.md`, `89 qator`, `4.68 KB`):** Sof Markdown qoidalar. `ASD-STE100` (aviatsiya texnik ingliz tili standarti — har bir gap max `20` so'z, aniq faol nisbat) asosida AI javoblaridan salomlashish, kirish gaplar, takroriy xulosalar va ixtiyoriy artikllarni (`a/an/the`) olib tashlaydi. Inkor so'zlar (`not/never/no/only`), kod bloklari, buyruqlar, fayl yo'llari va xato matnlariga (`payload`) tegmaydi; xavfsizlik ogohlantirishlari va qaytarib bo'lmas amallarda avtomatik ravishda to'liq tushunarli gapga qaytadi. Yonida `ultracave` (grammatikasiz fragmentlar) va `megacave` (klassik xitoy tili — 文言文) rejimlari bor.
2. **To'liq `v4.0+` ekotizimi (`@caveman-ai/cli`):** `23` ta skill, `4` ta lifecycle hook, Go/TS lokal proxy (`Read less` kiruvchi log kompressori, `Blocks`), `caveman.so` bulutli `Auto` model-router hamda tijoriy `Caveman Code` / `Caveman Cloud` xizmatlari.

---

## 2. Qanchalik yaxshi va qanchalik yomon?

### Kuchli tomonlari
- **Puxta ishlangan qisqa-javob qoidalari:** Boshqa "be brief" promptlardan farqli o'laroq, inkor ma'noni yo'qotmaslik, kod/xato satrlarini buzmaslik va murakkab vaziyatda oddiy tilga qaytish chegaralari (`When to break the rules`) juda aniq yozilgan.
- **Halol o'lchov hujjatlari (`docs/HONEST-NUMBERS.md`):** Muallif marketing raqamlaridan alohida haqiqiy A/B test natijalarini va skill zararga ishlaydigan holatlarni ochiq ko'rsatgan — uzun suhbat va tushuntirish sessiyalarida o'qish vaqtini sezilarli qisqartiradi (`JetBrains` 86 ta vazifada sifat yo'qotishsiz `-8.5%` output o'lchagan).

### Zaif tomonlari va xarajati (kontekst / token / murakkablik)
- **"65% token tejaydi" shiori kodlash sessiyalariga mos kelmaydi:** `docs/HONEST-NUMBERS.md` da rasman tan olinganidek:
  - Oddiy `Answer concisely.` ko'rsatmasiga nisbatan `caveman` medianada **atigi `3%`** kamroq chiquvchi token yozadi (`4,334 -> 4,119`), lekin qoidalarning o'zi kontekstga **`~1,160–1,532` kiruvchi token** yuk qo'shadi (`ultracave` `-35%`).
  - Kodlash agentlarida (`662` ta Claude Code sessiyasi tahlili, `#733`) chiquvchi matn jami tokenlarning **atigi `0.3%`** qismini tashkil qiladi (`99.7%` — kiruvchi fayllar va prompt-cache); yakuniy hisobdagi farq **`±0.2%`** atrofida, qisqa savol-javoblarda (`#145`) va so'rov boshiga to'lanadigan tariflarda (`#506`) esa foyda bermaydi.
- **Til va jadval cheklovi:** Fragment uslubi (`4-qoida`) va jadvallarni cheklash (`9-qoida: No decorative tables`) o'zbek/rus tillaridagi qo'shimchalar ravonligini hamda tizimli Markdown hisobotlarni siqib qo'yadi.

---

## 3. Xavfsizlik va O'rnatishdan oldin tozalash (Sanitarizatsiya)

- **Xavf darajasi:** Yolg'iz `SKILL.md` uchun `Past`; to'liq Plugin / CLI (`@caveman-ai/cli`) uchun `O'rta–Yuqori`.
- **Tekshirilgan nuqtalar:**
  - Yolg'iz `skills/caveman/SKILL.md` da skript, hook va tarmoq chaqiruvi yo'q. `skillshare audit` tekshiruvida `0 CRITICAL` va `1 HIGH` false-positive (`SKILL.md:19` dagi `` `<mode>` `` + `. Example:` birikmasini statik regex subdomen shabloniga o'xshatgan) qayd etildi.
  - `.claude-plugin/plugin.json` ichida **4 ta lifecycle hook** (`SessionStart`, `SubagentStart`, `UserPromptSubmit` — har biri `30s` timeout, `SessionEnd` — `5s`) har bir xabar va subagentda Node skriptlarini (`caveman-activate.js`, `caveman-mode-tracker.js`, `caveman-stats.js`) ishga tushiradi va faqat `${CLAUDE_PLUGIN_ROOT}` muhitiga bog'langan.
  - `@caveman-ai/cli` sukut bo'yicha **opt-out telemetriya** yoqilgan holda keladi (`SECURITY.md` 106–115): foydalanish statistikasi va **yuboruvchi IP manzili** (`90` kun saqlanadi) Supabase endpointiga yuboriladi (`DO_NOT_TRACK=1` o'chiradi).
  - `caveman login` + `Auto` model-router yoqilsa, oxirgi so'rovlarning **xom `128 KiB + 16 KiB + 16 KiB` matni** (`CLAUDE.md`, `@`-ulangan fayllar va `!` terminal natijalari bilan birga) `Caveman Cloud`ga uzatiladi hamda model almashganda Anthropic `thinking` bloklari qirqiladi (`drop_block`).
- **O'rnatishdan oldin majburiy tozalash qoidalari:**
  1. `@caveman-ai/cli`, lokal proxy va `.claude-plugin/plugin.json` hooklarini **o'rnatmaslik** — faqat bitta `skills/caveman/SKILL.md` faylini olish.
  2. `SKILL.md` frontmatter qismiga `disable-model-invocation: true` qo'shish va `"be brief"`, `"less tokens"` kabi keng auto-trigger so'zlarini olib tashlash (faqat `/caveman` bilan qo'lda yoqilsin).
  3. `SKILL.md` dagi `19-qator`ni (`ultracave`/`megacave` aliaslari va `Caveman mode: <mode>` hook bog'liqligini) o'chirib tashlash — shunda `skillshare audit` `0 findings` bilan to'liq toza o'tadi.

---

## 4. Bizga qanchalik kerak va mavjud vositalar bilan mosligi (Alternativa)

- **Bizdagi asosiy alternativa — [**`ponytail`**](../architecture/ponytail.md) (`9.5/10`, `#3` faol global skill):**
  - `caveman` faqat chatdagi gaplarni qisqartiradi, yozilayotgan kod hajmiga tegmaydi.
  - [**`ponytail`**](../architecture/ponytail.md) esa bir vaqtning o'zida **ikki muammoni** hal qiladi: javobni band odam bir o'qishda tushunadigan qisqa shaklda ushlaydi **va** eng ko'p token yeydigan joyni — ortiqcha abstraksiya, wrapper va keraksiz kod yozilishini (YAGNI) kesadi.
- Repo ichidagi qo'shimcha skillar (`surgical-patch`, `lean-build`, `cavecrew`) va `Auto` router esa bizda faol ishlayotgan [**`karpathy-guidelines`**](../architecture/karpathy-guidelines.md), [**`elephant-goldfish-model`**](../architecture/elephant-goldfish-model.md) hamda [**`T3 Code`**](t3-code.md) bilan to'liq qoplanadi.

---

## 5. Qaysi yo'nalish va vazifalarda foydali?

- **Qachon ishlatish kerak:** Agar `ponytail` ishlatilmaydigan muhitda faqat terminal ichidagi uzun inglizcha chat javoblarini minimal so'zga tushirish (`/caveman` yoki `/ultracave`) kerak bo'lsa — faqat yuqoridagi 3 band bo'yicha tozalangan yolg'iz `SKILL.md` ko'rinishida.
- **Qachon ishlatmaslik kerak:** `ponytail` faol bo'lgan kundalik kodlashda, ko'p tilli (`uz`/`ru`) tahliliy javoblarda, strukturaviy jadvalli arxitektura review'larida hamda rasmiy AI obunalari ustidan proxy/cloud-router ulashda.

---

## 6. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-11-16 | `v4.1.0` manba kodi (`SKILL.md`, `plugin.json`, `HONEST-NUMBERS.md`, `SECURITY.md`) va `skillshare audit` tekshiruvi | `👍 Yaxshi variant` | Yolg'iz `SKILL.md` sifatli (`8.0/10`), lekin CLI/proxy telemetriyasi keraksiz va kundalik ishimizda asosiy alternativa sifatida [**`ponytail`**](../architecture/ponytail.md) kuchliroq bo'lgani uchun global o'rnatilmadi. |
