# `animate` (Emil Kowalski — Web Motion Construction)

[🇺🇿 O'zbekcha](../../ui-ux/animate.md) | [🇬🇧 English](../../en/ui-ux/animate.md) | **🇷🇺 Русский**

- **Источник:** [emilkowalski/skills — skills/animate](https://github.com/emilkowalski/skills/tree/main/skills/animate)
- **Категория:** `UI/UX` *(Анимации Web CSS, WAAPI и библиотеки Motion)*
- **Тип:** `Skill` *(`SKILL.md` + `RECIPES.md`, ~410 строк)*
- **Оценка качества:** **8.5 / 10**
- **Полезность для нас:** **3.0 / 10**
- **Рекомендуемый охват:** `Не устанавливать`
- **Дата проверки:** `2026-11-15`
- 🔄 **Есть альтернатива получше:** [impeccable](impeccable.md) (`animate` — для Web) + [animate-expo](../mobile/animate-expo.md) (для Expo / React Native)

---

## 1. Что это и как работает?

> [!IMPORTANT]
> **Простыми словами (Главная задача и польза):** Скилл только для веб-анимаций: все его правила уже есть внутри `impeccable`, а авто-срабатывание конфликтует с мобильным `animate-expo`.

Скилл построения веб-анимаций от Эмиля Ковальски (`SKILL.md` на 209 строк + `RECIPES.md` с готовыми шаблонами компонентов):
1. **`Frequency Gate`:** Запрещает анимации на действиях, используемых 100+ раз в день (клавиатурные шорткаты, command palette).
2. **Лестница выбора инструмента:** CSS transition → CSS `@starting-style` → CSS animation → WAAPI (`element.animate()`) → `Motion` (`motion.dev`).
3. **Кривые и тайминги:** `<300ms` для UI-элементов, запрет `ease-in`, выраженный `cubic-bezier(0.23, 1, 0.32, 1)` (`--ease-out`), `scale(0.95) + opacity: 0` вместо `scale(0)`.
4. **Accessibility:** Совместное использование `prefers-reduced-motion: reduce` и `@media (hover: hover) and (pointer: fine)`.

---

## 2. Сильные и слабые стороны

### Сильные стороны
- Четкий порядок принятия решений и чистые шаблоны в `RECIPES.md` для dropdown, modal, drawer, toast и hold-to-confirm.
- Грамотно сформулирован принцип отказа от лишних анимаций («zero lines of code is a success»).

### Слабые стороны и причины конфликта
- **Прямое пересечение `auto-trigger` с [impeccable](impeccable.md):** Поле `description` (*"Use when asked to animate something, add motion, make a component feel alive, or build a transition"*) срабатывает одновременно с основным описанием `impeccable` и его разделом `reference/animate.md`, дважды занимая контекст.
- **Противоречие правил:** `animate` жестко ограничивает анимации правилом *«только `transform` и `opacity`»*, тогда как `impeccable` (`craft-floor.md` и `animate.md`) допускает уместное использование `backdrop-filter`, `mask`, `clip-path` и `View Transitions` там, где они работают плавно.
- **Внешние зависимости:** Ссылается на не установленные у нас соседние скиллы (`pick-ui-library`, `review-animations`, `improve-animations`) и содержит приветственный блок `## Initial Response`.

---

## 3. Безопасность и санитаризация

- **Уровень риска:** `Низкий` *(только Markdown, без скриптов и хуков)*
- При использовании в отдельном проекте (`-p`) необходимо удалить раздел `## Initial Response` и ссылку `../pick-ui-library/SKILL.md`.

---

## 4. Что используется взамен?

Глобальная установка не требуется, так как два наших существующих скилла полностью и без конфликтов закрывают это направление:
1. **Для анимаций Web и Mobile Web:** [**impeccable**](impeccable.md) (команда `animate` / `reference/animate.md`) — работает согласованно с общей дизайн-системой проекта (режимы `Operate` vs `Persuade`).
2. **Для анимаций React Native и Expo:** [**animate-expo**](../mobile/animate-expo.md) — скилл того же автора, написанный специально под ворклеты `Reanimated` и нативные жесты.

*(Соседние скиллы из того же репозитория — `animation-performance`, `improve-animations`, `remove-animations`, `review-animations`, `choreograph` и `gestures` — также не были добавлены глобально по этой же причине: их покрывают разделы `animate`, `quieter`, `optimize` в `impeccable` и `animate-expo`.)*

---

## 5. В каких направлениях и задачах полезен?

- **Когда использовать:** Не устанавливать глобально — вместо него используются [impeccable](impeccable.md) и [animate-expo](../mobile/animate-expo.md).

---

## 6. Статус и история действий

| Дата | Действие | Статус | Примечание |
|---|---|---|---|
| 2026-11-15 | Аудит GitHub `SKILL.md` + `RECIPES.md` и конфликтов | 🔄 **Есть альтернатива получше:** [impeccable](impeccable.md) + [animate-expo](../mobile/animate-expo.md) | Высокое качество (`8.5/10`), но пропущен из-за пересечения `auto-trigger` и конфликта правил с [impeccable](impeccable.md). |
