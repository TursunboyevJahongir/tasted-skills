# 2. Rejadan Toza Kod va Mustaqil Review'gacha

**🇺🇿 O'zbekcha** | [🇬🇧 English](en/02-spec-to-surgical-code.md) | [🇷🇺 Русский](ru/02-spec-to-surgical-code.md)

⬅️ [Practices Mundarijasiga qaytish](README.md)

- **Birlashtiriladigan vositalar:** [**graphify**](../reviews/architecture/graphify.md) + [**grill-me**](../reviews/architecture/grill-me.md) + [**ponytail**](../reviews/architecture/ponytail.md) + [**karpathy-guidelines**](../reviews/architecture/karpathy-guidelines.md) + [**Orca**](../reviews/developer-tools/orca.md) + [**elephant-goldfish-model**](../reviews/architecture/elephant-goldfish-model.md)
- **Qo'llaniladigan loyihalar:** Barcha Backend, Web, Mobile va Arxitektura vazifalari.

---

## 1. Nima uchun bularni birgalikda ishlatish kerak? (Umumiy foydasi)

AI agentga to'g'ridan-to'g'ri *"shu funksiyani yoz"* deyilsa:
1. Repodagi mavjud helper yoki servisni ko'rmay, yangitdan dublikat yozadi;
2. Noaniq talablarni o'zicha taxmin qilib, 20 qatorlik ishni 300 qatorlik murakkab abstraksiyaga aylantiradi;
3. Kodni yozgan agent o'z xatosini o'zi ko'rmaydi (kontekst tarafkashligi).

**Ushbu 6 ta vosita zanjiri nima beradi:**
- Kod yozishdan oldin `0` tokenli AST-graf orqali barcha bog'liq fayllar topiladi;
- Talablar qarorlar daraxti bo'ylab 100% aniqlashtiriladi;
- Eng kichik, qo'shni kodni buzmaydigan `surgical` o'zgarish yoziladi;
- Yakunda **umuman boshqa AI model** yoki **xotirasiz (*Goldfish*) subagentlar** kodni mustaqil tekshiradi.

---

## 2. Qanday birgalikda ishlatiladi? (4 bosqichli zanjir)

### 1-Qadam: Joylashuv va Bog'liqliklarni aniqlash (`graphify`)
Katta repoda `grep` bilan token sarflashdan oldin `graphify-out/` bilim grafigidan modul aloqalarini so'rash:
- O'zgartirilayotgan funksiya qaysi controller, queue yoki ekranga ulanganini soniyada ko'rsatadi.

### 2-Qadam: Kod yozishdan oldin qarorlarni pishitish (`grill-me` / `domain-modeling`)
Murakkab fiycha yoki DB o'zgarishida:
- Agent kod yozishga shoshilmasdan, siz bilan barcha chekka holatlarni (`grill-me`) birma-bir yechadi va qarorni `CONTEXT.md` / rejaga muhrlaydi.

### 3-Qadam: Minimal va jarrohlik aniqligida kod yozish (`ponytail` + `karpathy-guidelines`)
Kod yozish vaqtida ikkala skill birga ishlaydi:
- **`karpathy-guidelines`:** Taxminlarni ochiq aytadi va tegishli bo'lmagan qo'shni qatorlarga umuman tegmaydi.
- **`ponytail`:** So'ralmagan factory, wrapper, "kelajak uchun" config qo'shmaydi; barcha `caller` va testlarni yangilab, javob oxirida 1–2 qatorda nima tekshirilmagani va qanday xavf borligini ochiq yozadi.

### 4-Qadam: Mustaqil ikkinchi ko'z bilan tekshirish (`Orca` + `elephant-goldfish-model`)
Kod yozib bo'lingach, uni yozgan agentning o'ziga emas, mustaqil tekshiruvchiga topshirish:
- **Multi-Model Review (`Orca` + CLI Subagent):** Masalan, kodni `Codex` yozgan bo'lsa, CLI subagent orqali `Claude Opus` yoki `Argon` ni chaqirib diff'ni tekshirtirish.
- **Arxitektura va Hujjat-Kod mosligi (`elephant-goldfish-model`):**
  - `egm-drift-report`: Hujjat (`README` / `DESIGN.md`) va haqiqiy kod o'rtasidagi farqlarni topadi.
  - `egm-review`: Xotirasiz *Goldfish* subagentlar (`egm-design`, `egm-codebase-details`, `egm-zoom-out`) kodni 5 xil burchakdan tanqid qiladi.

---

## 3. Qo'shimcha nimalar qilish mumkin? (Pro-amaliyotlar)

- **Topilmayotgan "flaky" xatolarda (`diagnosing-bugs`):** Agar bug birinchi urinishda topilmasa, taxminiy fix yozishni to'xtatib, `diagnosing-bugs` skillini yoqish — u 6 bosqichli gipoteza va teglangan log (`[DIAG-<id>]`) bilan aniq ildiz sababni tutadi.
- **Chigal modullarni tozalashda (`improve-codebase-architecture`):** Mayda "yupqa" util fayllar ko'payib ketganda, ularni chuqur va sodda interfeysli modulga birlashtirish (`deep modules`) uchun ishlatiladi.
