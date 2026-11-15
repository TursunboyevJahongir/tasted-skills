# `SkillSpector` (NVIDIA)

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/developer-tools/skillspector.md) | [🇷🇺 Русский](../ru/developer-tools/skillspector.md)

- **Manba:** [NVIDIA/SkillSpector](https://github.com/NVIDIA/SkillSpector)
- **Turkum:** `Developer Tools` *(AI Agent Skill va MCP Server xavfsizlik skaneri)*
- **Turi:** `Python CLI + MCP Server + Skill (skill-inspector)`
- **Sifat bahosi:** **9.0 / 10**
- **Bizga kerakliligi:** **3.5 / 10** *(kundalik ishda ortiqcha sikl — `skillshare audit` + AI agent orqali kod tekshiruvi yetarli)*
- **Tavsiya etilgan ko'lam:** `Doimiy o'rnatmaslik` *(faqat juda shubhali katta MCP/paket uchraganda `uvx` orqali bir martalik `--no-llm` skan)*
- **O'rniga ishlatiladigan tizim:** [**`skillshare`**](skillshare.md) (`skillshare audit`) + **AI agentga manba kodni tekshirtirish**
- **Tekshirilgan sana:** `2026-11-16`
- **Joriy holati:** `⛔ Rad etildi` *(kodi o'rganildi; mavjud yengil alternativamiz yetarli bo'lgani uchun o'rnatilmadi)*

---

## 1. Qisqacha: Nima va qanday ishlaydi?

NVIDIA tomonidan ochiq manbaga chiqarilgan (`Python 3.12 + LangGraph`), AI skill'lar va MCP serverlarni o'rnatishdan oldin **2 bosqichda** tekshiradigan korporativ xavfsizlik skaneri:
1. **Statik tahlil (`--no-llm`):** `17` kategoriya va `71+` qoida bo'yicha Python/JS AST, Taint Tracking (maxfiy ma'lumotni o'qib tarmoqqa uzatish zanjiri), YARA malware signaturalari, `OSV.dev` orqali jonli CVE qidiruvi hamda MCP Tool Poisoning / Registry Diff tekshiruvlarini bajaradi.
2. **Ixtiyoriy LLM semantik tahlili:** `SKILL.md` dagi va'da bilan ichki kod haqiqatda mos kelish-kelmasligini solishtiradi (API kalit yoki lokal `claude_cli` / `gemini_cli` / `ollama` orqali).

---

## 2. Nega o'rnatmadik? (Alternativa bilan solishtiruv)

`SkillSpector` minglab begona skill yig'ilgan katta marketplace va CI konveyerlarni avtomat filtrlash uchun kuchli yozilgan, ammo kundalik dasturchi oqimida **ortiqcha sikl** hosil qiladi:

- **Tayyor va tez muqobilimiz bor — [`skillshare`](skillshare.md) (`skillshare audit`):** Bitta yengil Go binari `~0.1` soniyada `static`, `dataflow`, `tier`, `integrity`, `structure` va `cross-skill` xavfsizlik tekshiruvlarini bajaradi hamda **`skillshare install` vaqtida avtomatik ishlaydi** (`Python 3.12 + LangGraph + YARA + boto3` kabi og'ir bog'liqliklarni saqlash shart emas).
- **AI agent orqali kodni bevosita tekshirtirish aniqroq:** Biz har bir yangi skill/MCP'ni o'rnatishdan oldin AI coding agentning o'ziga birlamchi kodini (`SKILL.md`, skriptlar, hooklar, tarmoq/env murojaatlari) o'qitib olamiz. Agent ichidan yana Python/LangGraph ko'tarib ikkinchi LLM sessiya chaqirish — aynan bir xil ishni ikki marta qilishdir.
- **False-positive (yolg'on xavf) shovqini:** Skanerning statik ball formulasida oddiy `subprocess` chaqiruvi va muhit o'zgaruvchisini o'qish darrov `DO NOT INSTALL` ballini beradi — foydali CLI skill'larda skaner vahiymasini saralashga bekorga vaqt ketadi.

> **Sizga ham tavsiya:** Har qanday begona skill, plugin yoki MCP serverni ko'r-ko'rona o'rnatmang — avval o'zingiz ishlatayotgan AI agentga *"shu repodagi barcha fayl va skriptlarni xavfsizlik hamda ortiqcha yuk bo'yicha tekshirib ber"* deb kodini o'qiting va `skillshare audit` dan o'tkazing.

---

## 3. Qachon kerak bo'lishi mumkin?

Oddiy Markdown skill'lar uchun kerak emas. Faqat kelajakda ichi minglab qator JS/Python kodli juda shubhali 3-tomonlama MCP server uchrasa, tizimga doimiy o'rnatmasdan bir martalik rejimda tekshirish mumkin:

```bash
uvx --python 3.12 --from git+https://github.com/NVIDIA/skillspector.git skillspector scan <repo-yoki-papka> --no-llm
```

---

## 4. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-11-16 | Manba kod auditi | `⛔ Rad etildi` | Kuchli skaner (`9.0/10`), lekin [`skillshare`](skillshare.md) (`audit`) + AI agent orqali birlamchi kod tekshiruvi mavjudligi sababli ortiqcha sikl qo'shmaslik uchun o'rnatilmadi. |
