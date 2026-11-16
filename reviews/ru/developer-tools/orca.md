# `Orca` (`stablyai/orca`) + Мультиагентная оркестрация

[🇺🇿 O'zbekcha](../../developer-tools/orca.md) | [🇬🇧 English](../../en/developer-tools/orca.md) | **🇷🇺 Русский**

- **Источник:** [stablyai/orca](https://github.com/stablyai/orca) · [orca.dev](https://orca.dev)
- **Категория:** `Developer Tools` *(Мультиагентная оркестрация, Мобильное управление и Кросс-AI код-ревью)*
- **Тип:** `Desktop App + CLI (orca orchestration) + Mobile App (iOS / Android)`
- **Оценка качества:** **9.5 / 10**
- **Насколько нужно нам:** **9.5 / 10**
- **Рекомендуемый масштаб:** `Standalone Desktop App (/Applications/Orca.app) + Глобальный скилл orchestration`
- **Используется с:** `2026-11-16`
- **Текущий статус:** `✅ Активен` *(заменил T3 Code в качестве основной мультиагентной среды)*

---

## 1. Что это и как работает?

**Orca (`stablyai/orca`)** — open-source (`MIT`) оркестратор для параллельного запуска `Codex`, `Claude Code`, `Antigravity (Gemini / Argon)` и ещё 25+ CLI-агентов в едином окне (в режиме Chat UI или терминала), изолированных Git worktree и с полноценным управлением с телефона.

**Как работает у нас (2 ключевых механизма):**
1. **Запуск цепочки из нескольких AI одним промптом (`orca orchestration worker-start`):**
   - Основной агент (например, `Codex` `GPT-6.1-Sol High`) по одному промпту сам вызывает дочерних воркеров (`--agent claude`, `--agent antigravity`, `--agent codex`) через `orca orchestration worker-start --worktree current` и завершает ход (`0` поллинга).
   - Каждый вызванный субагент отображается прямо в Chat UI отдельной интерактивной карточкой (`Started worker ↗`, `Update from worker ↗`); по завершении (`worker_done`) или при упирании в лимит (`escalation`) `Orca` автоматически будит координатора и собирает общий отчёт в один чат.
   - Глобальные CLI-скиллы `task-context`, `claude-opus`, `antigravity-claude` и `argon` также полностью работают внутри `Orca`.
2. **Мобильное приложение (`Orca IDE`) и работа при заблокированном экране (`Lock Screen`):**
   - Официальные приложения для iOS ([App Store](https://apps.apple.com/us/app/orca-ide/id6766130217)) и Android ([Google Play](https://play.google.com/store/apps/details?id=dev.orca.app)) подключаются по QR/коду (`LAN / Tailscale` или `E2EE Orca Relay` + Push-уведомления `APNs`/`FCM`).
   - Встроенный режим `Keep computer awake: On` (`/usr/bin/caffeinate -i -s -w <pid>`) удерживает Mac активным даже при заблокированном экране (`Lock Screen`), не разрывая связь с телефоном.

---

## 2. Сильные и слабые стороны (Живое сравнение с `T3 Code`)

| Критерий | **`Orca` (`stablyai/orca` v1.4.261)** | [**`T3 Code`**](t3-code.md) *(удалён)* |
|---|---|---|
| **Цепочка нескольких AI из одного промпта** | ✅ **Встроенный `orca orchestration` DAG:** живые карточки субагентов (`Claude`, `Codex`, `Antigravity`) в Chat UI, авто-пробуждение (`worker_done`) и обработка лимитов (`escalation`) | ⚠️ Только через внешние CLI-скрипты (нет карточек субагентов в UI) |
| **Стабильность мобильного приложения** | ✅ Официальное приложение в App Store / Play Store (`LAN` + `E2EE Relay` + Push) | ❌ Бета — часто вылетает при блокировке телефона или смене сети |
| **Работа при блокировке Mac (`Lock Screen`)** | ✅ Встроенный `caffeinate -i -s` (`Keep computer awake: On · Active`) + фоновый PTY-демон | ❌ Обрывает соединение при блокировке экрана |
| **Отображение квот и лимитов** | ✅ В нижней панели вживую показывает проценты `✴️ Claude`, `🌀 Codex` и `⛰️ Antigravity (Gemini)` | ⚠️ Нужно проверять вручную |
| **Потребление ресурсов (`12 репо + 3 агента`)** | ✅ **`841 MB` RAM**, **`0.2%` CPU** в покое | `~1.1–1.4 GB` RAM + `~3.87 GB` кэша на диске (`~/.t3`) |

### Слабые стороны и меры предосторожности
- По умолчанию включена телеметрия `PostHog` (обязательно отключить в `Settings -> Privacy & Telemetry`).
- Параллельный запуск нескольких воркеров расходует квоту соответствующих подписок.

---

## 3. Безопасность и санитаризация (Применённые настройки)

- **Уровень риска:** `Низкий` *(MIT open-source, локальный рантайм, `skillshare audit` пройден с `0` замечаний)*
- **Выполненные настройки при установке:**
  1. **Отключение телеметрии (`telemetry.optedIn = false`):** Аналитика `PostHog` сразу отключена в базе настроек.
  2. **Защита от сна при блокировке (`computerAwakeMode = "on"`):** Включён режим `Keep computer awake: On` и проверен процесс `/usr/bin/caffeinate -i -s -w <pid>`.
  3. **Разрешения координатора (`orchestrationCoordinatorApprovalsEnabled = true`):** В `Settings -> Orchestration` включена опция *«Let coordinators approve worker permission prompts»*, чтобы воркеры не зависали на запросах прав.
  4. **Ограничение области `orchestration` (`LOCAL-COMPATIBILITY`):** Глобальный скилл `orchestration` настроен на срабатывание только внутри сессий `Orca` (`ORCA_PANE_KEY` / `ORCA_WORKTREE_ID`) или по явному запросу; скилл `orca-cli` глобально не ставился, чтобы избежать пересечения auto-trigger с `agent-desktop`.

---

## 4. Совместимость с нашими инструментами

- Статус-хуки `Codex`, `Claude Code` и `Antigravity` (`orca agent hooks on`) и скилл `orchestration` работают в связке с `task-context`, `grill-me`, `ponytail`, `agent-desktop` и `agent-device`.
- [**`T3 Code`**](t3-code.md) полностью удалён (освобождено `~3.87 GB` диска), все 12 активных репозиториев перенесены в `Orca`.

---

## 5. В каких задачах полезно?

- **Когда использовать:** Повседневная разработка и архитектура, запуск цепочек из нескольких AI одним промптом (*«Codex пишет -> Claude/Argon проверяет»*) и управление агентами с телефона (`Orca IDE`) вдали от компьютера.
- **Когда не использовать:** Для простых вопросов или правок в одну строку не нужно порождать дополнительных воркеров (`worker-start`).

---

## 6. История статуса и выполненных действий

| Дата | Действие | Статус | Примечание |
|---|---|---|---|
| 2026-11-16 | Установка `stablyai/orca` (`v1.4.261`), отключение `PostHog`, настройка `caffeinate` + `Mobile` + `Codex/Claude/Antigravity` и живой мультиагентный тест (`run_33e8e230b9fe`) | `✅ Активен` | `T3 Code` полностью удалён; `Orca` оставлен как основной мультиагентный оркестратор. |
