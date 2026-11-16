# `T3 Code` + CLI Subagent Ko'prigi

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/developer-tools/t3-code.md) | [🇷🇺 Русский](../ru/developer-tools/t3-code.md)

- **Manba:** [pingdotgg/t3code](https://github.com/pingdotgg/t3code)
- **Turkum:** `Developer Tools` *(Multi-Agent Orkestratsiya va Cross-AI Code Review)*
- **Turi:** `Desktop App + CLI Subagent Workflow`
- **Sifat bahosi:** **8.5 / 10**
- **Bizga kerakliligi:** **2.5 / 10**
- **Tavsiya etilgan ko'lam:** `Skip (O'chirib tashlandi)`
- **O'rniga ishlatiladigan tizim (Alternativa):** [**`Orca` (`stablyai/orca`)**](orca.md)
- **Ishlatilgan sana:** `2026-10-23 → 2026-11-16`
- **Joriy holati:** `⛔ Rad etildi` *(mobil ulanish uzilishlari, Lock Screen'da to'xtab qolishi va `Orca` ning ustun ichki multi-agent orkestratsiyasi sabab `Orca` ga o'tildi va o'chirildi)*

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

### Zaif tomonlari va nima uchun `Orca` ga o'tdik?
- **Mobil ilova xomligi (Beta):** Telefon ekrani o'chganda yoki tarmoq almashganda aloqa tez-tez uzilib qoladi va har safar qayta ulashni talab qiladi.
- **Kompyuter blokda (`Lock Screen`) ishlamasligi:** Kompyuter bloklanganda sessiyalar uzilib qoladi ([**`Orca`**](orca.md) da esa ichki `caffeinate -i -s` va fon daemoni bor).
- **UI ichida native multi-agent subagent kartalari yo'q:** [**`Orca`**](orca.md) bitta promptdan `orca orchestration worker-start` orqali `Claude`, `Codex` va `Antigravity` workerlarini Chat UI ichida jonli kartalar bilan boshqaradi (`841 MB` RAM vs `T3 Code` ning `~1.1–1.4 GB` RAM + `~3.87 GB` `~/.t3` keshi).

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
| 2026-10-23 | `T3 Code` desktop muhitini o'rnatish + CLI subagent review skillarini ulash (`2026-10-31`) | `✅ Ishlatyapman` | Desktop ilova hamda CLI subagent ko'prigi (Codex ↔ Claude ↔ Antigravity) faol qo'llanildi. |
| 2026-11-16 | [**`Orca` (`stablyai/orca`)**](orca.md) bilan jonli solishtirish va `T3 Code` ni to'liq o'chirish (`~3.87 GB` bo'shatildi) | `⛔ Rad etildi` | Mobil barqarorlik, Lock Screen (`caffeinate`) va bitta promptdan ichki multi-agent orkestratsiya sabab to'liq `Orca` ga o'tildi. |

