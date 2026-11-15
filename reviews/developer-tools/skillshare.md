# `skillshare`

- **Manba:** [runkids/skillshare](https://github.com/runkids/skillshare)
- **Turkum:** `Developer Tools` *(Skill, Plugin, Agent va MCP sinxronizatsiyasi hamda xavfsizlik auditi)*
- **Turi:** `CLI + Global Skill`
- **Sifat bahosi:** **9.5 / 10**
- **Bizga kerakliligi:** **10.0 / 10**
- **Tavsiya etilgan ko'lam:** `Global CLI + Global Skill (-g)`
- **Tekshirilgan sana:** `2026-11-15`
- **Joriy holati:** `✅ Ishlatilyapti` *(barcha AI agentlarimizdagi skillarni boshqaruvchi markaziy vosita)*

---

## 1. Nima va qanday ishlaydi?

Bir nechta AI coding agentlar (**Claude Code**, **Codex**, **Antigravity**, **Cursor** va b.) uchun skill, agent, hook, plugin va MCP sozlamalarini **bitta markaziy manbadan (`~/.config/skillshare/`)** tarqatadigan va boshqaradigan CLI vosita:
- `skillshare install` / `link` / `sync -g` — skillni bitta joyga qo'shib, barcha agent papkalariga avtomatik symlink (yoki nusxa) yaratadi.
- `skillshare audit` — o'rnatilayotgan skill va skriptlarni xavfsizlik tahdidlariga (prompt injection, yashirin unicode, data exfiltration, zararli o'rnatish buyruqlari) tekshiradi va `CRITICAL` xavflarni bloklaydi.
- `skillshare analyze` — har bir agentda skillar qancha token/kontekst yeyayotganini hisoblab beradi.

---

## 2. Qanchalik yaxshi va qanchalik yomon?

### Kuchli tomonlari
- Har bir agent (`~/.claude`, `~/.codex`, `~/.agents`, `~/.gemini`) uchun qo'lda alohida nusxa ko'chirish va versiya chalkashligini butunlay yo'qotadi.
- O'rnatilgan xavfsizlik skaneri (`audit`) va avtomatik backup/trash tizimi bor.

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
| 2026-11-15 | Markaziy boshqaruv vositasi sifatida qayd etish | `✅ Ishlatilyapti` | Global rejimda 5 ta agent target (`antigravity`, `antigravity-cli`, `claude`, `codex`, `codex-local`) sinxronizatsiyasi va auditi uchun faol ishlatilmoqda. |

