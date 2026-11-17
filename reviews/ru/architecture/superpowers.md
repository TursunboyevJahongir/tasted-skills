# `superpowers` (Obra / Jesse Vincent)

[🇺🇿 O'zbekcha](../../architecture/superpowers.md) | [🇬🇧 English](../../en/architecture/superpowers.md) | **🇷🇺 Русский**

- **Источник:** [obra/superpowers](https://github.com/obra/superpowers)
- **Категория:** `Architecture` *(Рабочий процесс, Brainstorming, планирование и обязательный TDD)*
- **Тип:** `Plugin` *(14 скиллов + хук `SessionStart` + скрипты субагентов)*
- **Оценка качества:** **6.5 / 10**
- **Полезность для нас:** **2.0 / 10**
- **Рекомендуемый охват:** `Не устанавливать` *(ранее был установлен, протестирован и удален)*
- **Период использования:** `2026-04-04 → 2026-09-01` *(протестирован и удалён)*
- **Текущий статус:** `⚠️ Не рекомендуется` *(🧪 Протестирован на практике и удален из-за замедления работы)*

---

## 1. Что это и как работает?

> [!IMPORTANT]
> **Простыми словами (Главная задача и польза):** Использовали 5 месяцев и удалили: хук `SessionStart`, лишние расспросы и принудительный TDD на каждом шаге **удваивали время работы и расход токенов (`2x`)**. Заменён лёгкими `grill-me` и `ponytail`.

Плагин «полной методологии разработки» для Claude Code, Codex, Cursor и Antigravity, состоящий из 14 процессных скиллов (`using-superpowers`, `brainstorming`, `writing-plans`, `subagent-driven-development`, `executing-plans`, `test-driven-development`, `systematic-debugging`, `using-git-worktrees`, `verification-before-completion` и др.) и скрипта `hooks/session-start`.

Механизм работы:
- **Хук `SessionStart` (`hooks/session-start`):** При старте каждой новой сессии принудительно вливает в контекст модели через блок `<EXTREMELY_IMPORTANT>` текст `using-superpowers/SKILL.md`: *«Даже если есть 1% вероятности, что какой-то скилл подходит к задаче, ты ОБЯЗАН его вызвать. Простой вопрос тоже считается задачей».*
- **Обязательная цепочка:** При любой новой функции или изменении заставляет агента проходить конвейер `brainstorming → design doc → writing-plans → using-git-worktrees → subagent-driven-development → test-driven-development (Red-Green-Refactor) → requesting-code-review`.

---

## 2. Четыре главные проблемы, выявленные на практике (Почему был удален?)

При установке и проверке на реальных задачах плагин принес больше вреда и замедления, чем пользы:

### 1. Избыточное раздумывание (Overthinking)
- Из-за правил *"The skill is overkill → Simple things become complex. Use it"* и *"1% chance"* внутри `using-superpowers` агент даже на простых и понятных задачах вместо прямого написания кода долго думает, какой процессный скилл вызвать, и добавляет лишние шаги.

### 2. Срабатывание `brainstorming` там, где не нужно, и лишние вопросы при планировании
- Frontmatter в `brainstorming/SKILL.md` (`"You MUST use this before any creative work - creating features, building components, adding functionality, modifying behavior..."`) написан настолько широко, что автоматически запускается даже при добавлении простого UI или функции.
- Даже когда пользователь ставит четкую задачу, перед написанием кода скилл требует обязательные 4 шага (`предложить варианты → написать design doc → утвердить → writing-plans`), останавливая работу лишними вопросами.
- **Наша правильная замена:** [**`grill-me` / `grilling` / `grill-with-docs`**](grill-me.md) — они не вмешиваются самовольно в каждую задачу, а вызываются явно только тогда, когда действительно нужны глубокие вопросы и проработка плана.

### 3. Бюрократический цикл (`subagent-driven-development`) в каждой задаче и резкое замедление
- При выполнении плана для каждого мелкого шага создается отдельный git worktree, папка `.superpowers/sdd/`, субагент `implementer`, субагент `task-reviewer` и крутится `fix-loop`.
- В результате практические задачи, которые решаются быстро, застревают в долгих циклах субагентов, впустую расходуя и время, и токены/квоту.

### 4. Обязательный TDD (`test-driven-development`) не подходит нашему стилю работы в Web, Mobile и Backend
- В `test-driven-development/SKILL.md` жестко прописано правило: `"The Iron Law: NO PRODUCTION CODE WITHOUT A FAILING TEST FIRST. Write code before the test? Delete it. Start over."`
- **В Web и Mobile (iOS / Android):** Для UI и интерактивных экранов писать падающий (failing) тест до написания кода совершенно не нужно — гораздо быстрее и надежнее сразу проверить результат в живом браузере и симуляторе/эмуляторе (через [`agent-desktop`](../developer-tools/agent-desktop.md) + [`Device Hub`](../mobile/ios-simulator-device-hub.md) + [`adb`](../mobile/adb.md) в процессе [`cross-platform-qa`](../mobile/cross-platform-qa.md)).
- **В Backend:** Писать тесты до начала работы, а затем подгонять под них код — это **двойная лишняя работа (`2x` затрат времени)**.

---

## 3. Анализ безопасности и санитаризации

> [!WARNING]
> **Двойной расход времени и квоты:** Хук `SessionStart` и обязательный TDD даже на UI-задачах **удваивают время разработки и расход токенов (`2x`)**.

- **Уровень риска:** `Средний` *(вредоносного кода нет, но присутствуют хук `SessionStart` и агрессивная промпт-инъекция)*
- **Проверенные детали:**
  1. `hooks/hooks.json` и `hooks/session-start` автоматически запускаются в каждой сессии и переопределяют стандартное поведение модели (`using-superpowers`).
  2. В скиллах `brainstorming`, `test-driven-development` и `writing-plans` отсутствует `disable-model-invocation: true` — они перехватывают каждый обычный запрос на написание кода (`prompt hijack`).

---

## 4. Наш набор легких и быстрых альтернатив

Вместо `superpowers` мы используем точные, быстрые и не создающие лишних циклов инструменты для каждого этапа:

| Задача | Тяжелый механизм в `superpowers` | Наше быстрое и чистое решение |
|---|---|---|
| **Вопросы и ответы по идее и плану** | `brainstorming` (включается автоматически на каждой задаче) | [**`grill-me` / `grilling`**](grill-me.md) (вызывается только когда нужно) |
| **Дисциплина кода (простота)** | Циклы `writing-plans` + `subagent-driven-development` | [**`ponytail`**](ponytail.md) + [**`karpathy-guidelines`**](karpathy-guidelines.md) (минимальное решение без лишних абстракций) |
| **Проверка Web / iOS / Android** | `test-driven-development` (обязательное написание unit-тестов заранее) | [**`cross-platform-qa`**](../mobile/cross-platform-qa.md) (`agent-desktop` + `Device Hub` + эмулятор `adb` + в конце 1 проверка на реальном телефоне) |
| **Независимое код-ревью** | Цикл `task-reviewer` после каждой мелкой задачи | [**`T3 Code`**](../developer-tools/t3-code.md) / `argon` / `antigravity-claude` (одна четкая независимая проверка по завершении работы) |

---

## 5. В каких направлениях и задачах полезен?

- **Когда использовать:** Рекомендуется не устанавливать.
- **Когда не использовать:** В повседневной разработке Web, Mobile (iOS/Android) и Backend — снижает скорость, задает лишние вопросы и навязывает двойную работу с TDD.

---

## 6. Статус и история действий

| Дата | Действие | Статус | Примечание |
|---|---|---|---|
| 2026-04-04 | Глобальная установка и проверка в реальной работе | `⚠️ Не рекомендуется` | За несколько месяцев реальных задач `SessionStart` overthinking и лишние вопросы `brainstorming` заметно замедлили работу (`2026-08-14` отключён обязательный `test-driven-development`). |
| 2026-09-01 | Полный вывод из рабочего процесса | `⚠️ Не рекомендуется` | Заменён связкой [`grill-me`](grill-me.md), [`ponytail`](ponytail.md), [`karpathy-guidelines`](karpathy-guidelines.md) и `cross-platform-qa`. |
