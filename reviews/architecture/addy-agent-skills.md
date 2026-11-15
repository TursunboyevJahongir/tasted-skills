# `addy-agent-skills` (Addy Osmani)

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/architecture/addy-agent-skills.md) | [🇷🇺 Русский](../ru/architecture/addy-agent-skills.md)

- **Manba:** [addyosmani/agent-skills](https://github.com/addyosmani/agent-skills)
- **Turkum:** `Architecture` *(To'liq SDLC konveyeri: `/spec`, `/plan`, `/build`, `/test`, `/review`, `/ship`)*
- **Turi:** `Plugin (25 ta skill + 9 command + 4 persona)`
- **Sifat bahosi:** **8.0 / 10**
- **Bizga kerakliligi:** **2.5 / 10**
- **Tavsiya etilgan ko'lam:** `O'rnatmaslik`
- **O'rniga ishlatiladigan muqobillar:** [**`grill-me`**](grill-me.md) + [**`ponytail`**](ponytail.md) + [**`karpathy-guidelines`**](karpathy-guidelines.md) + [**`elephant-goldfish-model`**](elephant-goldfish-model.md) + [**`T3 Code`**](../developer-tools/t3-code.md)
- **Tekshirilgan sana:** `2026-11-16`
- **Joriy holati:** `⏭️ O'tkazib yuborildi (sinab ko'rmadik)`

---

## 1. Qisqacha: Nima va qanday ishlaydi?

Addy Osmani tomonidan yig'ilgan 25 ta muhandislik skilli (`interview-me`, `spec-driven-development`, `test-driven-development`, `doubt-driven-development`, `code-review-and-quality`, `frontend-ui-engineering`, `performance-optimization` va b.) hamda 9 ta lifecycle buyrug'i (`/spec -> /plan -> /build -> /test -> /review -> /ship`).

---

## 2. Nega o'rnatmadik?

`superpowers` ga qaraganda ancha tartibli va toza yozilgan bo'lsa ham, kundalik ishimizda **ortiqcha sikl va dublikat** yaratadi:
- **Og'ir jarayon va to'xtashlar:** Majburiy TDD (`Red-Green-Refactor`), ~100 qatorlik PR cheklovlari hamda `doubt-driven-development` ichidagi har bitta qarordan keyin to'xtab *"boshqa modeldan (`Gemini`/`Codex`) ham so'raymi?"* deb so'rash talabi ish tezligini tushiradi.
- **Barcha kuchli nuqtalari bizda allaqachon aniqroq vositalar bilan yopilgan:**
  - `interview-me` → [**`grill-me`**](grill-me.md) (`9.5/10`)
  - `doubt-driven` / `code-review` → [**`elephant-goldfish-model`**](elephant-goldfish-model.md) + [**`T3 Code`**](../developer-tools/t3-code.md)
  - `code-simplification` → [**`ponytail`**](ponytail.md) + [**`karpathy-guidelines`**](karpathy-guidelines.md)
  - `frontend-ui-engineering` → [**`impeccable`**](../ui-ux/impeccable.md)

---

## 3. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-11-16 | Manba kod auditi | `⏭️ O'tkazib yuborildi (sinab ko'rmadik)` | Sifatli yozilgan (`8.0/10`), ammo 25 ta skilldan iborat og'ir SDLC konveyeri mavjud yengil va kuchli stekimizni dublikat qilgani uchun o'rnatilmadi. |
