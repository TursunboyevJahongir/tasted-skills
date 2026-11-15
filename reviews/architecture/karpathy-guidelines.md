# `karpathy-guidelines` (Multica AI / Andrej Karpathy)

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/architecture/karpathy-guidelines.md) | [🇷🇺 Русский](../ru/architecture/karpathy-guidelines.md)

- **Manba:** [multica-ai/andrej-karpathy-skills](https://github.com/multica-ai/andrej-karpathy-skills)
- **Turkum:** `Architecture` *(LLM kod yozish xatolarini kamaytirish qoidalari)*
- **Turi:** `Skill`
- **Sifat bahosi:** **9.0 / 10**
- **Bizga kerakliligi:** **9.0 / 10**
- **Tavsiya etilgan ko'lam:** `Global (-g)`
- **Tekshirilgan sana:** `2026-11-15`
- **Joriy holati:** `✅ Faol`

---

## 1. Nima va qanday ishlaydi?

Andrej Karpathy tomonidan ta'kidlangan LLM kodlash muammolariga qarshi 4 ta asosiy tamoyilni o'z ichiga olgan ixcham Markdown skill (`SKILL.md`, 2.5 KB):
1. **Kod yozishdan oldin o'ylash (`Think Before Coding`):** Noaniq joylarni jimjit taxmin qilmasdan ochiq aytish.
2. **Soddalik birinchi o'rinda (`Simplicity First`):** So'ralmagan moslashuvchanlik va spekulyativ abstraksiyalarni yozmaslik.
3. **Jarrohlik aniqligidagi o'zgarishlar (`Surgical Changes`):** Vazifaga aloqasi bo'lmagan qo'shni kod, izoh yoki formatlashga tegmaslik.
4. **Maqsadga yo'naltirilgan bajarish (`Goal-Driven Execution`):** Tekshirib bo'ladigan muvaffaqiyat mezonlarini belgilash.

---

## 2. Qanchalik yaxshi va qanchalik yomon?

### Kuchli tomonlari
- Atigi 2.5 KB sof matn — token sarfi minimal, hech qanday sekinlashtiruvchi hook yoki subagent loopi yo'q.
- Ayniqsa mavjud ishlayotgan loyihalarda agentning "yo'l-yo'lakay boshqa joylarni ham o'zgartirib buzib ketishi" (`collateral damage`) oldini oladi.

### Zaif tomonlari va xarajati
- Hech qanday salbiy ta'siri yo'q.

---

## 3. Xavfsizlik va O'rnatishdan oldin tozalash (Sanitarizatsiya)

- **Xavf darajasi:** `Past`
- **Tekshirilgan nuqtalar:** `skillshare audit` toza (`0 findings`). Skript yoki hook mavjud emas.

---

## 4. Bizga qanchalik kerak va mavjud vositalar bilan mosligi

- `ponytail` bilan birgalikda barcha agentlarda (`Codex`, `Claude`, `Antigravity`) asosiy kod yozish gigiyenasini ta'minlaydi.

---

## 5. Qaysi yo'nalish va vazifalarda foydali?

- **Qachon ishlatish kerak:** Barcha kod yozish, tahrirlash va review vazifalarida.

---

## 6. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-11-15 | `skillshare install multica-ai/andrej-karpathy-skills -g` orqali o'rnatish | `✅ Faol` | Auditdan toza o'tdi va 5 ta global targetga sinxronlandi. |
