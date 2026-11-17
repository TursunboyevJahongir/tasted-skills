# `humanizer` va `stop-slop`

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/developer-tools/humanizer-stop-slop.md) | [🇷🇺 Русский](../ru/developer-tools/humanizer-stop-slop.md)

- **Manba:** [blader/humanizer](https://github.com/blader/humanizer) · [hardikpandya/stop-slop](https://github.com/hardikpandya/stop-slop)
- **Turkum:** `Developer Tools` *(Maqola va matnlardagi AI uslubi belgilarini tozalash)*
- **Turi:** `Skill` (`Markdown`)
- **Sifat bahosi:** **7.5 / 10**
- **Ishda kerak bo'lishi:** **2.0 / 10** *(kod yoki mahsulot UI'i uchun emas — faqat uzun maqola/post tahriri uchun)*
- **Tavsiya etilgan ko'lam:** `O'rnatmaslik`
- **O'rniga ishlatiladigan tizim:** [**`ponytail`**](../architecture/ponytail.md) (qisqa va aniq texnik javoblar) + [**`impeccable`**](../ui-ux/impeccable.md) (`clarify` — UI matnlari uchun)
- **Tekshirilgan sana:** `2026-11-16`
- **Joriy holati:** `🔄 Alternativi yaxshiroq`

---

## 1. Qisqacha: Nima va qanday ishlaydi?

> [!IMPORTANT]
> **Oddiy tilda (Asosiy vazifasi va foydasi):** Maqola, blog va esselardan "sun'iy intellekt yozgani bilinib turadigan" jumlalarni tozalaydi (`humanizer` `~32 KB` kontekst oladi), lekin kod yozish va ilova tugmalari uchun mo'ljallanmagan (`ponytail` va `impeccable clarify` ishlatiladi).

AI yozgan matnlardagi sun'iy ohang va shtamplarni olib tashlashga qaratilgan ikkita mashhur tahrir skilli:
- **`blader/humanizer` (`MIT`, `~32 KB` `SKILL.md`):** Vikipediyaning *"Signs of AI writing"* qo'llanmasiga asoslanib, 24 xil AI shtampini (*"delve"*, *"tapestry"*, sun'iy xulosalar, ortiqcha tirelar) tozalaydi.
- **`hardikpandya/stop-slop` (`MIT`, `~2.6 KB` `SKILL.md` + `references/`):** *"Bu X emas — bu Y"* kabi ikkilik qarama-qarshiliklar, uchlik ro'yxatlar va balandparvoz gaplarni kesib, matnga 1–5 baho beradi.

---

## 2. Nega o'rnatmadik?

- **Kodlash va UI uchun mo'ljallanmagan:** Ikkalasi ham blogpost, esse va marketing matnlari uchun yozilgan; kundalik dasturlashda amaliy ustunlik bermaydi.
- **Kontekst hajmi:** Birgina `humanizer` ishga tushganda `~32 KB` matn qoidalarini kontekstga yuklaydi.
- **Bizda o'z vazifasiga aniq mos muqobillar bor:** Agentning javoblari qisqa va lo'nda bo'lishini [**`ponytail`**](../architecture/ponytail.md), ilova ichidagi tugma/xabar matnlari tozaligini esa [**`impeccable`**](../ui-ux/impeccable.md) (`clarify`) boshqaradi.

---

## 3. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-11-16 | Manba kod auditi | `🔄 Alternativi yaxshiroq` | Uzun maqolalar uchun foydali (`7.5/10`), lekin kod va UI ish oqimimizda keraksiz yuk bo'lgani uchun o'rnatilmadi. |
