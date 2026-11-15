# `T3 Code` + CLI Subagent Ko'prigi

- **Manba:** [pingdotgg/t3code](https://github.com/pingdotgg/t3code)
- **Turkum:** `Developer Tools` *(Multi-Agent Orkestratsiya va Cross-AI Code Review)*
- **Turi:** `Desktop App + CLI Subagent Workflow`
- **Sifat bahosi:** **9.0 / 10**
- **Bizga kerakliligi:** **9.5 / 10**
- **Tavsiya etilgan ko'lam:** `Standalone Desktop App + Global Consult Skilllar`
- **Tekshirilgan sana:** `2026-11-15`
- **Joriy holati:** `✅ Ishlatilyapti` *(bir nechta AI agentlarni birgalikda ishlatish uchun asosiy muhit)*

---

## 1. Nima va qanday ishlaydi?

**T3 Code** — bir nechta AI coding agentlarni (**Codex**, **Claude Code**, **Cursor** va CLI orqali ulangan boshqa agentlar) bitta qulay interfeys, alohida Git worktree/branch'lar va mavjud obunalaringiz (**BYOS — Bring Your Own Subscription**) asosida boshqaradigan open-source ish muhiti.

**Bizdagi asosiy ishlatilish usuli (Multi-AI zanjiri):**
Bitta vazifada bir nechta mustaqil AI modellarini birga ishlatish imkonini beradi. Masalan:
- *"Codex yozsin, uni Claude tekshirsin"* (yoki aksincha) deb vazifa berilganda, asosiy agent kodni yozib bo'lgach, ikkinchi AI'ni **CLI orqali alohida subagent sifatida** chaqiradi;
- Implementer va reviewer o'rtasida gitignore qilingan vazifa konteksti (`task-context`) hamda qat'iy fayl egaligi (`file ownership`) ulashiladi;
- Ikkinchi AI mustaqil ko'z bilan xatolarni topadi va xulosa toza chiqmaguncha (`PASS`) tekshiruv sikli davom etadi.

---

## 2. Qanchalik yaxshi va qanchalik yomon?

### Kuchli tomonlari
- **Qo'shimcha API to'lovisiz (BYOS):** O'zingizda allaqachon login qilingan Codex, Claude va Antigravity CLI obunalaridan to'g'ridan-to'g'ri foydalanadi.
- **Haqiqiy Cross-Model tekshiruv:** Bitta model o'z xatosini o'zi ko'rmay qolishi mumkin; Codex yozgan kodni Claude (yoki Argon) CLI subagent orqali tekshirishi sifatni keskin oshiradi.
- **Git worktree izolyatsiyasi:** Bir vaqtda bir nechta vazifani bir-biriga aralashtirmasdan parallel yurgizish qulay.

### Zaif tomonlari va xarajati
- Bir nechta CLI agent parallel yoki ketma-ket chaqirilganda har ikki obuna kvotasidan sarflanadi va review sikli qo'shimcha vaqt (1–5 daqiqa) oladi.
- Beta/Nightly relizlarda ba'zan UI yoki sessiya holati yangilanishlarini kuzatib borish kerak bo'ladi.

---

## 3. Xavfsizlik va Ishlatish qoidalari (Cheklovlar)

- **Xavf darajasi:** `Past–O'rta` *(lokal CLI agentlarni ishga tushirgani uchun fayl egaligi va ruxsat chegaralari muhim)*
- **Amal qilinishi shart bo'lgan qoidalar:**
  1. **Aniq fayl egaligi (`--write` / `read-only review`):** Tekshiruvchi (reviewer) sifatida chaqirilgan ikkinchi AI subagent faqat `read-only` rejimda tekshirishi, kodni yozuvchi agent bilan bir faylni baravar tahrirlamasligi shart.
  2. **Cheklangan review sikli:** Agentlar cheksiz bahslashib kvotani tugatmasligi uchun odatda 3 ta (istisno holatda 4 ta) review sikli chegarasini saqlash.
  3. **Maxfiy ma'lumotlarni kontekstga yozmaslik:** Subagentlarga uzatiladigan vazifa fayllarida token va parollar qirqib tashlanishi (`redacted`) va papka `.gitignore` da bo'lishi shart.

---

## 4. Bizga qanchalik kerak va mavjud vositalar bilan mosligi

Global muhitimizdagi `task-context`, `antigravity-claude`, `antigravity-consult`, `argon` va `claude-opus` skillari aynan shu ko'p-agentli CLI ish oqimini tartibga soladi — ular T3 Code va terminal sessiyalarida bitta yaxlit tizim bo'lib ishlaydi.

---

## 5. Qaysi yo'nalish va vazifalarda foydali?

- **Qachon ishlatish kerak:** Jiddiy kod o'zgarishlari, murakkab bugfix'lar, bir nechta AI modelni bir vaqtda ishlatish (*implementer + mustaqil reviewer*) va parallel branch'lardagi ishlarda.
- **Qachon ishlatmaslik kerak:** 1 qatorli oddiy tuzatishlar yoki faqat savol-javobda (bitta agentning o'zi yetarli).

---

## 6. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-11-15 | Kundalik multi-agent ish oqimi sifatida qayd etish | `✅ Ishlatilyapti` | Desktop ilova hamda CLI subagent ko'prigi (Codex ↔ Claude ↔ Antigravity) o'rnatilgan va faol qo'llanilmoqda. |

