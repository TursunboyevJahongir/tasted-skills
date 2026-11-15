# `swiftui-agent-skill` / `apple-design-skill`

[🇺🇿 O'zbekcha](../../mobile/swiftui-agent-skill.md) | [🇬🇧 English](../../en/mobile/swiftui-agent-skill.md) | **🇷🇺 Русский**

- **Источник:** [twostraws/swiftui-agent-skill](https://github.com/twostraws/swiftui-agent-skill) · [AvdLee/SwiftUI-Agent-Skill](https://github.com/AvdLee/SwiftUI-Agent-Skill) · [dickwu/apple-design-skill](https://github.com/dickwu/apple-design-skill)
- **Категория:** `Mobile` *(Чистый SwiftUI и гайдлайны Apple HIG)*
- **Тип:** `Skill`
- **Оценка качества:** **8.5 / 10**
- **Насколько нужно нам:** **3.0 / 10** *(наши основные мобильные приложения на React Native / Expo; нужен только локально `-p` для чистых SwiftUI-модулей)*
- **Рекомендуемый масштаб:** `Только локально (-p)` *(строго в нативных Swift/SwiftUI-проектах)*
- **Альтернатива у нас:** [**`impeccable`**](../ui-ux/impeccable.md) (`reference/ios.md` — для Apple HIG) + [**`animate-expo`**](animate-expo.md) (для Expo / RN)
- **Дата проверки:** `2026-11-16`
- **Текущий статус:** `👍 Хороший вариант`

---

## 1. Кратко: Что это и как работает?

Три ключевых открытых репозитория по теме SwiftUI и Apple HIG:
- **`twostraws/swiftui-agent-skill` (`swiftui-pro` от Пола Хадсона)** и **`AvdLee/SwiftUI-Agent-Skill` (Антуан ван дер Леу):** Защищают от устаревших API (`NavigationStack` вместо `NavigationView`, современный `@Observable`), ошибок вёрстки и проблем с VoiceOver.
- **`dickwu/apple-design-skill`:** Проверяет интерфейсы по Apple Human Interface Guidelines (HIG).

---

## 2. Почему не ставим глобально?

- Наш основной мобильный стек — **Expo / React Native**, поэтому глобальный SwiftUI-скилл будет лишним грузом.
- Правила Apple HIG уже встроены в наш [**`impeccable`**](../ui-ux/impeccable.md) (`reference/ios.md` и `audit.native.md`).
- **Когда пригодится:** Подключать `twostraws/swiftui-agent-skill` локально (`-p`) только при разработке нативных SwiftUI-модулей (iOS Widgets, Live Activities / Dynamic Island или watchOS).

---

## 3. История статуса и выполненных действий

| Дата | Действие | Статус | Примечание |
|---|---|---|---|
| 2026-11-16 | Проверка первоисточников | `👍 Хороший вариант` | Глобально не нужен для React Native / Expo; оставлен в резерве для `-p` установки на нативных SwiftUI-виджетах. |
