# `swiftui-agent-skill` / `apple-design-skill`

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/mobile/swiftui-agent-skill.md) | [🇷🇺 Русский](../ru/mobile/swiftui-agent-skill.md)

- **Manba:** [twostraws/swiftui-agent-skill](https://github.com/twostraws/swiftui-agent-skill) · [AvdLee/SwiftUI-Agent-Skill](https://github.com/AvdLee/SwiftUI-Agent-Skill) · [dickwu/apple-design-skill](https://github.com/dickwu/apple-design-skill)
- **Turkum:** `Mobile` *(Sof SwiftUI kodlash va Apple HIG qoidalari)*
- **Turi:** `Skill`
- **Sifat bahosi:** **8.5 / 10**
- **Bizga kerakliligi:** **3.0 / 10** *(asosiy mobil ilovalarimiz React Native / Expo da; faqat sof SwiftUI moduli bo'lganda local `-p` da kerak)*
- **Tavsiya etilgan ko'lam:** `Faqat local (-p)` *(faqat native Swift/SwiftUI loyihalarda)*
- **O'rniga ishlatiladigan tizim:** [**`impeccable`**](../ui-ux/impeccable.md) (`reference/ios.md` — Apple HIG uchun) + [**`animate-expo`**](animate-expo.md) (Expo / RN uchun)
- **Tekshirilgan sana:** `2026-11-16`
- **Joriy holati:** `👍 Yaxshi variant`

---

## 1. Qisqacha: Nima va qanday ishlaydi?

> [!IMPORTANT]
> **Oddiy tilda (Asosiy vazifasi va foydasi):** Sof Apple SwiftUI (`Widget`, `Live Activity`) yozish qoidalari; bizda asosiy ilovalar `Expo` da bo'lgani uchun global o'rnatmaymiz — faqat iOS Widget yoziladigan loyihaga (`-p`) vaqtincha ulash uchun yaxshi variant.

Ochiq manbadagi yetakchi SwiftUI va Apple HIG skill'lari uchligi:
- **`twostraws/swiftui-agent-skill` (`swiftui-pro` — Paul Hudson)** va **`AvdLee/SwiftUI-Agent-Skill` (Antoine van der Lee):** Eskirgan API'lar (`NavigationView` o'rniga `NavigationStack`, `@Observable` oqimi), state boshqaruvi, VoiceOver va zamonaviy SwiftUI render xatolarini tuzatadi.
- **`dickwu/apple-design-skill`:** Apple Human Interface Guidelines (HIG) bo'yicha iOS/macOS interfeyslarini tekshiradi.

---

## 2. Nega global o'rnatmadik?

- Asosiy mobil ilovalarimiz **Expo / React Native** stekida yozilgan — global SwiftUI skilli kundalik sessiyalarda keraksiz.
- Apple HIG dizayn qoidalari bizdagi [**`impeccable`**](../ui-ux/impeccable.md) ning `reference/ios.md` va `audit.native.md` fayllarida allaqachon qamrab olingan.
- **Qachon kerak bo'ladi:** Faqat sof SwiftUI yoziladigan joylarda (masalan, iOS Home Screen Widget, Live Activity / Dynamic Island yoki WatchOS ilovasi) `twostraws/swiftui-agent-skill` ni o'sha repoga local (`-p`) ulash maqsadga muvofiq.

---

## 3. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-11-16 | Manba tekshiruvi | `👍 Yaxshi variant` | React Native / Expo stekimizda global shart emas; sof SwiftUI (Widget / Live Activity) paydo bo'lganda `-p` rejimida olinadi. |
