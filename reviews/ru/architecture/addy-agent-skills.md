# `addy-agent-skills` (Addy Osmani)

[🇺🇿 O'zbekcha](../../architecture/addy-agent-skills.md) | [🇬🇧 English](../../en/architecture/addy-agent-skills.md) | **🇷🇺 Русский**

- **Источник:** [addyosmani/agent-skills](https://github.com/addyosmani/agent-skills)
- **Категория:** `Architecture` *(Полный SDLC-конвейер: `/spec`, `/plan`, `/build`, `/test`, `/review`, `/ship`)*
- **Тип:** `Плагин (25 скиллов + 9 команд + 4 персоны)`
- **Оценка качества:** **8.0 / 10**
- **Полезность для нас:** **2.5 / 10**
- **Рекомендуемый охват:** `Не устанавливать`
- **Используемая замена:** [**`grill-me`**](grill-me.md) + [**`ponytail`**](ponytail.md) + [**`karpathy-guidelines`**](karpathy-guidelines.md) + [**`elephant-goldfish-model`**](elephant-goldfish-model.md) + [**`T3 Code`**](../developer-tools/t3-code.md)
- **Дата проверки:** `2026-11-16`
- **Текущий статус:** `⏭️ Пропущено (не тестировали)`

---

## 1. Кратко: Что это и как работает?

Набор из 25 инженерных скиллов от Эдди Османи (`interview-me`, `spec-driven-development`, `test-driven-development`, `doubt-driven-development`, `code-review-and-quality`, `frontend-ui-engineering` и др.) и 9 команд жизненного цикла (`/spec -> /plan -> /build -> /test -> /review -> /ship`).

---

## 2. Почему мы не стали устанавливать?

Написан аккуратнее, чем `superpowers`, но в реальной работе создаёт **лишние циклы и дублирование**:
- **Тяжёлый процесс и паузы:** Обязательный TDD (`Red-Green-Refactor`), лимиты правок по ~100 строк и обязательные остановки в `doubt-driven-development` с вопросом *«запросить ли второе мнение у другой CLI-модели?»* на каждом шаге замедляют разработку.
- **Все сильные части пакета у нас уже закрыты более точными инструментами:**
  - `interview-me` → [**`grill-me`**](grill-me.md) (`9.5/10`)
  - `doubt-driven` / `code-review` → [**`elephant-goldfish-model`**](elephant-goldfish-model.md) + [**`T3 Code`**](../developer-tools/t3-code.md)
  - `code-simplification` → [**`ponytail`**](ponytail.md) + [**`karpathy-guidelines`**](karpathy-guidelines.md)
  - `frontend-ui-engineering` → [**`impeccable`**](../ui-ux/impeccable.md)

---

## 3. История статуса и выполненных действий

| Дата | Действие | Статус | Примечание |
|---|---|---|---|
| 2026-11-16 | Аудит исходного кода | `⏭️ Пропущено (не тестировали)` | Качественный пакет (`8.0/10`), но пропущен из-за громоздкости 25 скиллов и дублирования нашего текущего стека. |
