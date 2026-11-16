# 5. Ko'p-Agentli Ishlash (`T3 Code` + CLI Subagentlar) va Kontekstni Yo'qotmaslik

**🇺🇿 O'zbekcha** | [🇬🇧 English](en/05-multi-agent-and-context-handoff.md) | [🇷🇺 Русский](ru/05-multi-agent-and-context-handoff.md)

⬅️ [Practices Mundarijasiga qaytish](README.md)

- **Birlashtiriladigan vositalar:** [**`T3 Code`**](../reviews/developer-tools/t3-code.md) + `task-context` + CLI Subagentlar (`antigravity-claude`, `argon`, `claude-opus`, `antigravity-consult`) + [**`elephant-goldfish-model`**](../reviews/architecture/elephant-goldfish-model.md)
- **Qo'llaniladigan vazifalar:** Katta fiychalar, parallel branch/worktree ishlari, bir model kvotasi tugaganda ishni boshqa modelga uzatish va chuqur kod/arxitektura tekshiruvi.

---

## 1. Nima uchun bularni birgalikda ishlatish kerak? (Umumiy foydasi)

1. Bitta AI model ham kod yozib, ham o'z kodini o'zi tekshirsa — o'zining noto'g'ri taxminini "to'g'ri" deb o'tkazib yuboradi.
2. Ish yarmida boshqa AI agentga (`Codex` -> `Claude` yoki `Antigravity`) o'tish kerak bo'lsa, suhbat tarixini qaytadan tushuntirishga ko'p vaqt va token ketadi.

**Ushbu bog'lama nima beradi:**
- `task-context` gitignore qilingan vaqtinchalik xotira papkasida **maqsad (`intent`), qabul qilingan qarorlar (`decisions`), fayl egaligi (`ownership`) va review holatini** saqlab boradi;
- Istalgan soniyada ikkinchi AI modelni CLI subagent sifatida chaqirib, unga tayyor kontekstni berish yoki aksincha — xotirasiz (*Goldfish*) tanqidchi chaqirish imkonini beradi.

---

## 2. Qachon "Kontekstli Review" va qachon "Xotirasiz (Goldfish) Review" ishlatish kerak?

Ikki xil tekshiruvni adashtirmaslik kerak — har birining o'z o'rni bor:

| Vaziyat | Qaysi bog'lama ishlatiladi? | Nima uchun? |
|---|---|---|
| **Yozilgan kod/diff'ni va biznes-talabga moslikni tekshirish** | `task-context` + **`argon` / `antigravity-claude` / `claude-opus`** (`T3 Code` CLI subagent) | Reviewer foydalanuvchi aslida nima so'raganini va nima uchun shu yo'l tanlanganini (`task-context`) bilishi, lekin kodni boshqa model ko'zi bilan tekshirishi kerak (*"Codex yozdi -> Argon/Claude tekshirdi"*). |
| **Arxitektura rejasi, yangi dizayn hujjati yoki Hujjat-Kod uzilishini tekshirish** | [**`elephant-goldfish-model`**](../reviews/architecture/elephant-goldfish-model.md) (`egm-review`, `egm-drift-report`) | Bu yerda suhbat tarixi **zarar beradi** — xotirasiz *Goldfish* subagentlar oldingi bahslarni ko'rmasdan, hujjat yoki kodni noldan o'qib, yashirin taxmin va xatolarni ayovsiz topadi. |

---

## 3. Qo'shimcha imkoniyatlari

### 1) TRIZ orqali "yechimi yo'q" arxitektura ziddiyatini yechish (`egm-brainstorm` / `inventive-catalyst`)
Agar tizimda *"tezlikni oshirsak ma'lumot aniqligi tushadi, aniqlikni oshirsak tizim sekinlashadi"* kabi qarama-qarshilik chiqsa:
- `egm-brainstorm` ichidagi **TRIZ (`inventive_catalyst`)** subagenti kompromiss qilmasdan ikkala talabni ham 100% bajaradigan muhandislik yechimini topishga majburlaydi.

### 2) Notanish yoki hujjatsiz reponi 10 daqiqada xaritaga tushirish (`graphify` + `egm-bootstrap`)
Yangi yoki eski hujjatsiz loyihaga kirganda:
1. Avval [**`graphify`**](../reviews/architecture/graphify.md) bilan lokal AST-graf (`graph.json`) quriladi;
2. Ketidan `egm-bootstrap` ishga tushirilib, har bir modul va papka uchun haqiqiy kodga asoslangan aniq `README.md` / arxitektura shartnomalari avtomatik yozdiriladi.

### 3) Kvota tugaganda yoki model tiqilib qolganda "Estafeta" uzatish (`task-context`)
Agar bitta model murakkab bug'da aylanib qolsa yoki sessiya limiti tugasa:
- Yangi agentga shunchaki *"task-context papkasini o'qi va qolgan joyidan davom et"* deyish kifoya — u barcha oldingi qarorlar va o'zgargan fayllarni 5 soniyada tushunib oladi.

### 4) Parallel Git Worktree'larda 2–3 ta fiycha ustida baravar ishlash (`T3 Code` + `agent-device`)
- `T3 Code` har bir vazifani alohida git worktree'da ochadi, [**`agent-device`**](../reviews/mobile/agent-device.md) va [**`simslim`**](../reviews/mobile/simslim.md) esa worktree'lar o'rtasida simulyator sessiyalari urishib ketmasligini ta'minlaydi.
