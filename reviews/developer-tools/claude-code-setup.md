# `claude-code-setup` (Anthropic)

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/developer-tools/claude-code-setup.md) | [🇷🇺 Русский](../ru/developer-tools/claude-code-setup.md)

- **Manba:** [anthropics/claude-plugins-official (`claude-code-setup`)](https://github.com/anthropics/claude-plugins-official/tree/main/plugins/claude-code-setup)
- **Turkum:** `Developer Tools` *(Yangi loyiha uchun boshlang'ich Claude Code sozlamalarini tavsiya qilish)*
- **Turi:** `Plugin (Read-Only Recommender Skill)`
- **Sifat bahosi:** **7.5 / 10**
- **Bizga kerakliligi:** **2.0 / 10** *(boshlovchilar uchun mo'ljallangan; bizning 5-agentli tayyor tizimimizda ortiqcha)*
- **Tavsiya etilgan ko'lam:** `O'rnatmaslik`
- **O'rniga ishlatiladigan tizim:** [**`skillshare`**](skillshare.md) + ushbu **`tasted-skills`** katalogi
- **Tekshirilgan sana:** `2026-11-16`
- **Joriy holati:** `⛔ Rad etildi`

---

## 1. Qisqacha: Nima va qanday ishlaydi?

> [!IMPORTANT]
> **Oddiy tilda (Asosiy vazifasi va foydasi):** Yangi foydalanuvchilarga boshlang'ich Claude sozlamalarini tavsiya qiluvchi oddiy maslahatchi plagin; bizda `skillshare` orqali barcha agentlar uchun yagona tizim qurilgani sababli ehtiyoj yo'q.

Anthropic'ning rasmiy `claude-plugins-official` to'plamidagi read-only yordamchi plagin: reponi (`package.json`, CI, freymvorklar) skanerlab, foydalanuvchiga qaysi boshlang'ich `CLAUDE.md` qoidalari, lint hooklar, MCP serverlar (masalan, Playwright) va subagentlarni qo'shish mumkinligini ro'yxat qilib beradi (o'zi fayl o'zgartirmaydi).

---

## 2. Nega o'rnatmadik?

- **Noldan boshlayotganlar uchun:** Hali o'z skill/agent tizimini qurmagan yangi Claude Code foydalanuvchilari uchun qulay onboarding vositasi, lekin saralangan stekda yangi qiymat bermaydi.
- **Faqat bitta muhit (`Claude Code`) va umumiy tavsiyalar:** U ko'pincha biz kontekstni shishirmaslik uchun ataylab rad etgan og'ir MCP serverlarni (masalan, brauzer/mobil MCP'lar) qayta tavsiya qiladi. Bizda esa barcha 5 ta AI muhitni bitta markazdan boshqaradigan [**`skillshare`**](skillshare.md) ishlab turibdi.

---

## 3. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-11-16 | Manba kod auditi | `⛔ Rad etildi` | Xavfsiz read-only onboarding plagini (`7.5/10`), ammo `skillshare` asosidagi ko'p-agentli tizimimizda ehtiyoj yo'q. |
