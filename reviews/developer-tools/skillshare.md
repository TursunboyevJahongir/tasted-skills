# `skillshare`

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/developer-tools/skillshare.md) | [🇷🇺 Русский](../ru/developer-tools/skillshare.md)

- **Manba:** [runkids/skillshare](https://github.com/runkids/skillshare)
- **Turkum:** `Developer Tools` *(Skill, Plugin, Agent va MCP sinxronizatsiyasi hamda xavfsizlik auditi)*
- **Turi:** `CLI + Global Skill`
- **Sifat bahosi:** **9.5 / 10**
- **Ishda kerak bo'lishi:** **10.0 / 10**
- **Tavsiya etilgan ko'lam:** `Global CLI + Global Skill (-g)`
- **Ishlatilayotgan sana:** `2026-05-30` dan
- **Joriy holati:** `✅ Ishlatyapman` *(barcha AI agentlarimizdagi skillarni boshqaruvchi markaziy vosita)*

---

## 1. Nima va qanday ishlaydi?

> [!IMPORTANT]
> **Oddiy tilda (Asosiy vazifasi va foydasi):** `Codex`, `Claude` va `Antigravity` papkalariga skilllarni bittalab qo'lda ko'chirib yurishni yo'qotib, hammasini bitta markazdan sinxronlaydi. Ichidagi **`skillshare audit`** esa yangi skill ichida yashirin virus, prompt-injection yoki token shishishi bor-yo'qligini `0.1` soniyada tekshirib beradi.

Bir nechta AI coding agentlar (**Claude Code**, **Codex**, **Antigravity**, **Cursor** va b.) uchun skill, agent, hook, plugin va MCP sozlamalarini **bitta markaziy manbadan (`~/.config/skillshare/`)** tarqatadigan va boshqaradigan CLI vosita:
- `skillshare install` / `link` / `sync -g` — skillni bitta joyga qo'shib, barcha agent papkalariga avtomatik symlink (yoki nusxa) yaratadi.
- **`skillshare audit` (o'rnatilgan Skill-Check / Xavfsizlik skaneri)** — yagona Go binari orqali `~0.1` soniyada 6 yo'nalishda (`static`, `dataflow`, `tier`, `integrity`, `structure`, `cross-skill`) prompt injection, yashirin unicode, data exfiltration, zararli o'rnatish buyruqlari va trigger to'qnashuvlarini tekshiradi (`text`, `json`, `sarif`, `markdown` formatlarida). Eng qulayi — **`skillshare install` paytida avtomatik ishga tushib**, `CRITICAL` xavflarni joyidayoq bloklaydi.
- `skillshare analyze` — har bir agentda skillar qancha token/kontekst yeyayotganini hisoblab beradi.

---

## 2. Qanchalik yaxshi va qanchalik yomon?

### Kuchli tomonlari
- Har bir agent (`~/.claude`, `~/.codex`, `~/.agents`, `~/.gemini`) uchun qo'lda alohida nusxa ko'chirish va versiya chalkashligini butunlay yo'qotadi.
- **Tayyor Skill-Check (`audit`) va backup/trash tizimi bor:** `skillshare audit` + AI agentga birlamchi kodni o'qitib tekshirtirish kombinatsiyasi kundalik xavfsizlikni to'liq yopgani uchun [`SkillSpector`](skillspector.md) kabi og'ir alohida skanerlarni o'rnatishga hojat qolmaydi.

### Zaif tomonlari va cheklovlari
- Interaktiv buyruqlar skript yoki agent ichidan chaqirilganda osilib qolmasligi uchun doim `--no-tui` yoki `--json` flaglarini berish talab etiladi.

---

## 3. Xavfsizlik va Ishlatish qoidalari (Cheklovlar)

- **Xavf darajasi:** `Past`
- **Amal qilinishi shart bo'lgan qoidalar:**
  1. Har qanday yangi skillni ulashdan oldin `skillshare audit <path> --no-tui` va `skillshare sync -g --dry-run` bilan oldindan tekshirish.
  2. Audit bloklagan xavfli skillni o'rganmasdan ko'r-ko'rona `--force` bilan o'tkazib yubormaslik.
  3. O'chirishda `rm -rf` emas, `skillshare uninstall` / `unlink` ishlatish (trash orqali qayta tiklash imkoniyati qoladi).

---

## 4. Bizga qanchalik kerak va mavjud vositalar bilan mosligi

Barcha global skillarimiz (jumladan ushbu `tasted-skills` ham) aynan `skillshare` orqali 5 ta agent nishoniga ulangan — butun ekotizimning poydevori.

---

## 5. Qaysi yo'nalish va vazifalarda foydali?

- **Qachon ishlatish kerak:** Yangi skill/plugin o'rnatish, o'chirish, xavfsizligini va token hajmini tekshirish hamda agentlar o'rtasida sinxronlashda.

---

## 6. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-05-30 | `Claude` va `Codex` o'rtasida yagona skill manbasini (`~/.config/skillshare/skills`) ishga tushirish | `✅ Ishlatyapman` | Barcha skillarni bitta markazga yig'ish boshlandi (`2026-10-31` da `Antigravity` bilan jami 5 ta agent targetiga kengaytirildi + `skillshare audit` skill-check). |

