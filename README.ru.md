# Проверенные и используемые Skill'ы и AI-инструменты

[🇺🇿 O'zbekcha](README.md) | [🇬🇧 English](README.en.md) | **🇷🇺 Русский**

<details>
<summary>Обозначения статусов</summary>

- `✅ Используется` — протестировано на практике, активно используется каждый день
- `🧪 Протестировано` — устанавливалось и проверялось (временно или в отдельном проекте)
- `👀 Изучено (не тестировали)` — исходный код проверен, хороший кандидат, пока не устанавливали
- `⚠️ Только локально (-p) (не тестировали)` — подходит только для узкой задачи в отдельном проекте, не для глобальной установки
- `⏭️ Пропущено (не тестировали)` — изучено и пропущено, так как уже есть более сильная альтернатива
- `⛔ Отклонено` — отклонено из-за рисков безопасности, лишней тяжеловесности или конфликтов

</details>

## ⭐ Самые необходимые

| Название | Направление | Тип | Оценка | Статус | Дата | Краткое описание |
|---|---|---|---|---|---|---|
| [**`agent-desktop`**](reviews/ru/developer-tools/agent-desktop.md) | Desktop / Web / iOS | CLI + Skill | **9.5/10** | `✅ Используется` | `2026-11-15` | [agent-browser.dev/desktop](https://agent-browser.dev/desktop) — фоновое управление Chrome, десктопными приложениями и iOS `Device Hub` через macOS Accessibility (`AX`) без перехвата курсора. |
| [**`adb`**](reviews/ru/mobile/adb.md) | Mobile (Android) | CLI | **9.5/10** | `✅ Используется` | `2026-11-15` | Управление фоновым Android-эмулятором (`-no-window`) и реальными телефонами (`uiautomator dump`, `input tap`, `screencap`, `reverse`, `logcat`). Флаг `-s <serial>` обязателен. |
| [**`skillshare`**](reviews/ru/developer-tools/skillshare.md) | Developer Tools | CLI + Skill | **9.5/10** | `✅ Используется` | `2026-11-15` | Синхронизация скиллов и плагинов между всеми AI-агентами (`Codex`, `Claude`, `Antigravity`) из единого источника и проверка безопасности (`audit`). |
| [**`cross-platform-qa`**](reviews/ru/mobile/cross-platform-qa.md) | Web / iOS / Android | Skill | **9.5/10** | `✅ Используется` | `2026-11-15` | 2-этапный QA: 1) локальная проверка на компьютере (`agent-desktop` + `Device Hub` + эмулятор `adb`), 2) финальная разовая проверка на реальном телефоне через `adb` перед Done. |
| [**`impeccable`**](reviews/ru/ui-ux/impeccable.md) | UI/UX | Skill | **9.5/10** | `✅ Используется` | `2026-11-15` | Основная дизайн-система и UX-аудит для веб, мобильного веба и нативных экранов iOS/Android (внешние хуки отключены). |
| [**`grill-me`**](reviews/ru/architecture/grill-me.md) | Architecture / Planning | Набор скиллов | **9.5/10** | `✅ Используется` | `2026-11-15` | Проработка требований до написания кода по дереву решений (`design tree`) с рекомендуемыми ответами (`grilling` + `grill-with-docs`). |
| [**`elephant-goldfish-model`**](reviews/ru/architecture/elephant-goldfish-model.md) | Architecture / Audit | Плагин (7 скиллов + 10 агентов) | **9.5/10** | `✅ Используется` | `2026-11-15` | Архитектор с памятью (*Elephant*) + субагенты-критики без контекста (*Goldfish*): `egm-drift-report` и 5-этапный `egm-review` находят расхождения документации с кодом и скрытые баги. |
| [**`animate-expo`**](reviews/ru/mobile/animate-expo.md) | Mobile (Expo / RN) | Skill | **9.5/10** | `✅ Используется` | `2026-11-15` | Плавные 60/120fps анимации и жесты в UI-потоке для Expo и React Native на базе `Reanimated`, `Gesture Handler` и `expo-haptics` (с защитой `LOCAL-COMPATIBILITY.md`). |
| [**`sentry`**](reviews/ru/backend/sentry.md) | Backend / Web / Mobile | Self-Hosted + Skill / MCP | **9.5/10** | `✅ Используется` | `2026-11-15` | Full-stack диагностика ошибок (`Issue Grouping`, `dSYM`/`ProGuard`, `Source Maps`), `Breadcrumbs`, `Session Replay` и `v8+` OTel-трейсов с прямым анализом через AI-агентов. |
| [**`T3 Code`** + CLI Subagent](reviews/ru/developer-tools/t3-code.md) | Multi-Agent | Desktop App + CLI | **9.0/10** | `✅ Используется` | `2026-11-15` | Совместная работа нескольких AI (*«Codex пишет, Claude проверяет»* через вызов независимого CLI-субагента для ревью). |
| [**`xcrun simctl` + `Device Hub`**](reviews/ru/mobile/ios-simulator-device-hub.md) | Mobile (iOS) | Xcode CLI + App | **9.0/10** | `✅ Используется` | `2026-11-15` | Запуск iOS Simulator и фоновое управление внутренними элементами iOS через Xcode `Device Hub` + `agent-desktop` (+ `devicectl` для реального iPhone). |
| [**`ponytail`**](reviews/ru/architecture/ponytail.md) | Architecture / Code | Skill | **9.0/10** | `✅ Используется` | `2026-11-15` | Минимальное изменение, полностью решающее задачу (YAGNI), код без лишних абстракций и краткий ответ, понятный с первого прочтения. |
| [**`karpathy-guidelines`**](reviews/ru/architecture/karpathy-guidelines.md) | Architecture / Code | Skill | **9.0/10** | `✅ Используется` | `2026-11-15` | Явное озвучивание допущений, простота и точечные (`surgical`) правки без затрагивания соседнего кода. |
| [**`graphify`**](reviews/ru/architecture/graphify.md) | Architecture / Codebase | Skill + Python CLI | **9.0/10** | `✅ Используется` | `2026-11-15` | Построение постоянного графа знаний (`graph.json` + HTML) из кода (локальный AST, 0 токенов) и документации для мгновенного поиска связей между модулями. |
| [**`mobile-native`**](reviews/ru/mobile/mobile-native.md) | Mobile Web / PWA | Skill | **8.5/10** | `✅ Используется` | `2026-11-15` | 11 CSS/meta-решений, придающих мобильному вебу и PWA ощущение нативного приложения (`dvh/svh`, `safe-area`, инпуты `16px`, `overscroll-behavior`, hover gating; с защитой `LOCAL-COMPATIBILITY.md`). |

---

## По направлениям

### 🌐 Web

| Название | Тип | Качество | Нужно нам | Статус | Дата | Краткое описание |
|---|---|---|---|---|---|---|
| [**`taste-skill` v2.5**](reviews/ru/web/taste-skill.md) | Landing Kit + Hook | **8.0/10** | **4.0/10** | `⚠️ Только локально (-p) (не тестировали)` | `2026-11-15` | Сильный движок для промо-лендингов с нуля; при установке обязательно вырезать `Stop` хук (600с) и ставить только локально (`-p`). |

### 📱 Mobile

*Все активные мобильные инструменты (`adb`, `xcrun simctl` + `Device Hub`, `cross-platform-qa`, `animate-expo`, `mobile-native`) находятся в таблице **⭐ Самые необходимые** выше.*

### 🎨 UI/UX

| Название | Тип | Качество | Нужно нам | Статус | Дата | Краткое описание |
|---|---|---|---|---|---|---|
| [**`animate`**](reviews/ru/ui-ux/animate.md) | Skill (2 файла) | **8.5/10** | **3.0/10** | `⏭️ Пропущено (не тестировали)` | `2026-11-15` | Скилл веб-анимаций от Эмиля Ковальски; конфликтует по auto-trigger и правилам с нашей системой. **Вместо него:** [**`impeccable`**](reviews/ru/ui-ux/impeccable.md) (`animate`) + [**`animate-expo`**](reviews/ru/mobile/animate-expo.md). |
| [**`break-ui`**](reviews/ru/ui-ux/break-ui.md) | Skill (2 файла) | **8.0/10** | **3.0/10** | `⏭️ Пропущено (не тестировали)` | `2026-11-15` | Стресс-тест UI экстремальными данными; добавляет временные фикстуры/переключатели в проект и останавливается без фикса. **Вместо него:** [**`impeccable`**](reviews/ru/ui-ux/impeccable.md) (`harden`). |
| [**`make-interfaces-feel-better`**](reviews/ru/ui-ux/make-interfaces-feel-better.md) | Skill (6 файлов) | **7.5/10** | **2.5/10** | `⛔ Отклонено` | `2026-11-15` | Протестировано и удалено (из-за конфликта auto-trigger и громоздких таблиц отчётов). **Вместо него:** [**`impeccable`**](reviews/ru/ui-ux/impeccable.md) + [**`animate-expo`**](reviews/ru/mobile/animate-expo.md). |
| [**`ui-ux-pro-max`**](reviews/ru/ui-ux/ui-ux-pro-max.md) | Skill + CSV/Python | **7.0/10** | **3.5/10** | `⏭️ Пропущено (не тестировали)` | `2026-11-15` | Слабее `impeccable` и конфликтует с ним по auto-trigger. **Вместо него:** [**`impeccable`**](reviews/ru/ui-ux/impeccable.md). |

### 🏗️ Архитектура и Ревью

| Название | Тип | Качество | Нужно нам | Статус | Дата | Краткое описание |
|---|---|---|---|---|---|---|
| [**`superpowers`**](reviews/ru/architecture/superpowers.md) | Плагин (14 скиллов + хук) | **6.5/10** | **2.0/10** | `⛔ Отклонено` | `2026-11-15` | Протестировано и удалено: лишние размышления (`SessionStart` хук), ненужные вопросы `brainstorming` (альтернатива: `grill-me`), медленные циклы субагентов и принудительный TDD (2x лишней работы для Web/Mobile/Backend). |

### ⚙️ Backend

| Название | Тип | Качество | Нужно нам | Статус | Дата | Краткое описание |
|---|---|---|---|---|---|---|
| [**`opentelemetry`**](reviews/ru/backend/opentelemetry.md) | Стандарт + Collector (`SigNoz` / `Grafana`) | **9.0/10** | **4.0/10** | `⏭️ Пропущено (не тестировали)` | `2026-11-15` | Отраслевой стандарт межсервисных `Traces + Metrics + Logs` и метрик серверов/БД (требует `Collector + SigNoz/Grafana`). **Вместо него:** [**`sentry`**](reviews/ru/backend/sentry.md) (закрывает ошибки, реплеи и базовые трейсы в одной платформе). |

### 🛠️ Developer Tools и Memory

| Название | Тип | Качество | Нужно нам | Статус | Дата | Краткое описание |
|---|---|---|---|---|---|---|
| [**`OmniRoute`**](reviews/ru/developer-tools/omniroute.md) | Local Proxy + 44 админ-скилла | **7.5/10** | **2.0/10** | `⏭️ Пропущено (не тестировали)` | `2026-11-16` | Локальный LLM reverse-proxy (`localhost:20128`); его 44 скилла — лишь мануалы прокси, дефолтный роутинг рвёт длинные сессии (`#7287`) и понижает модель, а TLS-stealth (`wreq-js`) несёт риск бана подписок по ToS. **Вместо него:** [**`T3 Code`**](reviews/ru/developer-tools/t3-code.md) + [**`ponytail`**](reviews/ru/architecture/ponytail.md). |

---

<details>
<summary>Подключить глобальный скилл <code>tasted-skills</code></summary>

```bash
skillshare install TursunboyevJahongir/tasted-skills -s tasted-skills -g && skillshare sync -g
```

</details>

