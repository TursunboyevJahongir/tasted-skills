# 5. Ko'p-Agentli Ishlash (`Orca`) va Mustaqil Arxitektura / Kod Tekshiruvi

**🇺🇿 O'zbekcha** | [🇬🇧 English](en/05-multi-agent-and-context-handoff.md) | [🇷🇺 Русский](ru/05-multi-agent-and-context-handoff.md)

⬅️ [Practices Mundarijasiga qaytish](README.md)

- **Birlashtiriladigan vositalar:** [**Orca**](../reviews/developer-tools/orca.md) (`orca orchestration`) + [**elephant-goldfish-model**](../reviews/architecture/elephant-goldfish-model.md) + [**graphify**](../reviews/architecture/graphify.md)
- **Qo'llaniladigan vazifalar:** Katta fiychalar, parallel branch/worktree ishlari, bitta promptdan bir nechta AI modelni zanjir qilib ishlatish va chuqur kod/arxitektura tekshiruvi.

---

## 1. Nima uchun bularni birgalikda ishlatish kerak? (Umumiy foydasi)

1. Bitta AI model ham kod yozib, ham o'z kodini o'zi tekshirsa — o'zining noto'g'ri taxminini "to'g'ri" deb o'tkazib yuboradi.
2. Ish yarmida boshqa AI agentga (`Codex` -> `Claude Code` yoki `Gemini`) o'tish kerak bo'lsa, qo'lda nusxalab ko'chirish vaqt va token yeydi.

**Ushbu bog'lama nima beradi:**
- `Orca` bitta promptdan (`orca orchestration worker-start`) yordamchi AI subagentlarni Chat UI ichida jonli kartalar bilan ishga tushiradi va natijalarni bitta suhbatga yig'adi;
- Ikkinchi AI modelni xohlasa **vazifa konteksti bilan** (`Orca` worker), xohlasa **xotirasiz (*Goldfish*)** holatda (`elephant-goldfish-model`) mustaqil tekshiruvchi sifatida chaqirish imkonini beradi.

---

## 2. Qachon "Kontekstli Cross-AI Review" va qachon "Xotirasiz (Goldfish) Review" ishlatish kerak?

Ikki xil tekshiruvni adashtirmaslik kerak — har birining o'z o'rni bor:

| Vaziyat | Qaysi bog'lama ishlatiladi? | Nima uchun? |
|---|---|---|
| **Yozilgan kod/diff'ni va biznes-talabga moslikni tekshirish** | [**Orca**](../reviews/developer-tools/orca.md) (`orca orchestration worker-start` — `Codex`, `Claude Code`, `Gemini`) | Reviewer foydalanuvchi aslida nima so'raganini va nima uchun shu yo'l tanlanganini bilishi, lekin kodni boshqa AI model ko'zi bilan tekshirishi kerak (*"Codex yozdi -> Claude/Gemini tekshirdi"*). |
| **Arxitektura rejasi, yangi dizayn hujjati yoki Hujjat-Kod uzilishini tekshirish** | [**elephant-goldfish-model**](../reviews/architecture/elephant-goldfish-model.md) (`egm-review`, `egm-drift-report`) | Bu yerda suhbat tarixi **zarar beradi** — xotirasiz *Goldfish* subagentlar oldingi bahslarni ko'rmasdan, hujjat yoki kodni noldan o'qib, yashirin taxmin va xatolarni ayovsiz topadi. |

---

## 3. Qo'shimcha imkoniyatlari

### 1) TRIZ orqali "yechimi yo'q" arxitektura ziddiyatini yechish (`egm-brainstorm` / `inventive-catalyst`)
Agar tizimda *"tezlikni oshirsak ma'lumot aniqligi tushadi, aniqlikni oshirsak tizim sekinlashadi"* kabi qarama-qarshilik chiqsa:
- `egm-brainstorm` ichidagi **TRIZ (`inventive_catalyst`)** subagenti kompromiss qilmasdan ikkala talabni ham 100% bajaradigan muhandislik yechimini topishga majburlaydi.

### 2) Notanish yoki hujjatsiz reponi 10 daqiqada xaritaga tushirish (`graphify` + `egm-bootstrap`)
Yangi yoki eski hujjatsiz loyihaga kirganda:
1. Avval [**graphify**](../reviews/architecture/graphify.md) bilan lokal AST-graf (`graph.json`) quriladi;
2. Ketidan `egm-bootstrap` ishga tushirilib, har bir modul va papka uchun haqiqiy kodga asoslangan aniq `README.md` / arxitektura shartnomalari avtomatik yozdiriladi.

### 3) Parallel Git Worktree'larda 2–3 ta fiycha ustida baravar ishlash (`Orca` + `agent-device`)
- `Orca` har bir vazifani alohida git worktree'da ochadi, [**agent-device**](../reviews/mobile/agent-device.md) va [**simslim**](../reviews/mobile/simslim.md) esa worktree'lar o'rtasida simulyator sessiyalari urishib ketmasligini ta'minlaydi.
