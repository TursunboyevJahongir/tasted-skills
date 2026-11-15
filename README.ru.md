# Проверенные и используемые Skill'ы и AI-инструменты

[🇺🇿 O'zbekcha](README.md) | [🇬🇧 English](README.en.md) | **🇷🇺 Русский**

<details>
<summary>Обозначения статусов</summary>

- `✅ Активен` — постоянно используется в работе
- `👍 Хороший вариант` — проверено, стоит применить в подходящей задаче
- `⛔ Отклонено` — не нужно нам, конфликтует или небезопасно

</details>

> [!TIP]
> **🛡️ Наше правило безопасности (рекомендуем и вам):** Никогда не устанавливайте чужие скиллы, плагины или MCP-серверы только по красивому `README` или количеству звёзд. Перед установкой каждого инструмента **мы обязательно поручаем нашему AI-агенту проверить исходный код напрямую** (`SKILL.md`, скрипты, хуки, сетевые вызовы и доступ к env) и прогоняем встроенный skill-check в [**`skillshare`**](reviews/ru/developer-tools/skillshare.md) (`skillshare audit`). Рекомендуем и вам всегда проверять код новых скиллов через своего AI-агента перед установкой.

## ⭐ Самые необходимые (В порядке частоты и важности в работе)

| # | Название | Основная задача | Тип | Оценка | Статус | Дата | Краткое описание |
|---|---|---|---|---|---|---|---|
| **1** | [**`grill-me`**](reviews/ru/architecture/grill-me.md) | **Планирование, Решения и Глубокий Debug** | Набор скиллов | **9.5/10** | `✅ Активен` | С `2026-05-23` | Проработка требований по дереву решений до кода (`grilling` + `grill-with-docs` + `domain-modeling`) + очищенные on-demand скиллы **`diagnosing-bugs`** и **`improve-codebase-architecture`** из `mattpocock/skills`. |
| **2** | [**`graphify`**](reviews/ru/architecture/graphify.md) | **Карта кодовой базы (Knowledge Graph)** | Skill + Python CLI | **9.5/10** | `✅ Активен` | С `2026-07-28` | Построение постоянного графа знаний (`graph.json` + HTML) из кода (локальный AST, `0` токенов) и документации для мгновенного поиска связей между модулями и файлами. |
| **3** | [**`ponytail`**](reviews/ru/architecture/ponytail.md) | **Минимальный чистый код (YAGNI)** | Skill | **9.5/10** | `✅ Активен` | С `2026-11-15` | Базовое правило при написании любого кода: минимальное изменение, полностью решающее задачу, без лишних абстракций, и краткий ответ с первого прочтения. |
| **4** | [**`karpathy-guidelines`**](reviews/ru/architecture/karpathy-guidelines.md) | **Точечные правки кода (`Surgical`)** | Skill | **9.5/10** | `✅ Активен` | С `2026-11-15` | Явное озвучивание допущений, простота и точечные (`surgical`) правки без затрагивания соседнего рабочего кода. |
| **5** | [**`impeccable`**](reviews/ru/ui-ux/impeccable.md) | **Основной UI/UX дизайн и аудит** | Skill | **9.5/10** | `✅ Активен` | С `2026-11-09` | Проектирование, UX/контраст/типографика и полировка (`polish`, `clarify`, `harden`) для веб, мобильного веба и нативных экранов iOS/Android. |
| **6** | [**`elephant-goldfish-model`**](reviews/ru/architecture/elephant-goldfish-model.md) | **Независимое Архитектурное и Код-Ревью** | Плагин (7 скиллов + 10 агентов) | **9.5/10** | `✅ Активен` | С `2026-11-15` | Архитектор с памятью (*Elephant*) + субагенты-критики без контекста (*Goldfish*): `egm-drift-report` и 5-этапный `egm-review` находят расхождения документации с кодом и скрытые баги. |
| **7** | [**`agent-desktop`**](reviews/ru/developer-tools/agent-desktop.md) | **Тестирование Web (`Chrome`) и Desktop UI** | CLI + Skill | **9.5/10** | `✅ Активен` | С `2026-11-15` | [agent-browser.dev/desktop](https://agent-browser.dev/desktop) — фоновое управление Chrome и десктопными приложениями через macOS Accessibility (`AX`) без перехвата курсора (+ резерв для iOS `Device Hub`). |
| **8** | [**`agent-device`**](reviews/ru/mobile/agent-device.md) | **Тестирование Mobile и TV (`iOS` / `Android` / `tvOS`) UI** | CLI + Skill | **9.5/10** | `✅ Активен` | С `2026-11-16` | [agent-device.dev](https://agent-device.dev) — 0-dependency CLI от Callstack: управляет фоновым iOS/tvOS Simulator без окна (`~197ms`) и `-no-window` Android/TV Emulator (`~888ms`, в 27x меньше токенов, полный UTF-8 ввод) через `@ref` и `--settle` diff (`0` MCP-раздувания). |
| **9** | [**`cross-platform-qa`**](reviews/ru/mobile/cross-platform-qa.md) | **2-этапный QA для Web / Mobile / TV** | Skill | **9.5/10** | `✅ Активен` | С `2026-11-15` | 1-й этап — локальная проверка (`agent-desktop` Web + `agent-device` фоновые iOS/Android/TV + `adb`), 2-й этап — финальная проверка на реальном устройстве перед Done. |
| **10** | [**`sentry`**](reviews/ru/backend/sentry.md) | **Full-Stack диагностика ошибок и трейсов** | Self-Hosted + Skill / MCP | **9.5/10** | `✅ Активен` | С `2026-07-08` | Диагностика ошибок (`Issue Grouping`, `dSYM`/`ProGuard`, `Source Maps`), `Breadcrumbs`, `Session Replay` и `v8+` OTel-трейсов с прямым анализом через AI-агентов. |
| **11** | [**`skillshare`**](reviews/ru/developer-tools/skillshare.md) | **Синхронизация скиллов и Безопасность (`audit`)** | CLI + Skill | **9.5/10** | `✅ Активен` | С `2026-05-30` | Синхронизация скиллов и плагинов между всеми AI-агентами (`Codex`, `Claude`, `Antigravity`) из единого источника + встроенный **skill-check (`skillshare audit`)**. |
| **12** | [**`animate-expo`**](reviews/ru/mobile/animate-expo.md) | **Expo / React Native 60/120fps анимации** | Skill | **9.5/10** | `✅ Активен` | С `2026-11-09` | Плавные 60/120fps анимации и жесты в UI-потоке для Expo и React Native на базе `Reanimated`, `Gesture Handler` и `expo-haptics` (с защитой `LOCAL-COMPATIBILITY.md`). |
| **13** | [**`T3 Code`** + CLI Subagent](reviews/ru/developer-tools/t3-code.md) | **Мультиагентная разработка и ревью** | Desktop App + CLI | **9.0/10** | `✅ Активен` | С `2026-10-23` | Совместная работа нескольких AI (*«Codex пишет, Claude проверяет»* через вызов независимого CLI-субагента для ревью). |
| **14** | [**`adb`**](reviews/ru/mobile/adb.md) | **Android проброс портов (`reverse`) и `logcat`** | CLI | **9.0/10** | `✅ Активен` | С `2026-09-07` | Проброс портов (`reverse`), `logcat`, установка APK и низкоуровневое управление на фоновых Android-эмуляторах (`-no-window`) и реальных телефонах (`-s <serial>` обязателен). |
| **15** | [**`xcrun simctl` + `Device Hub`**](reviews/ru/mobile/ios-simulator-device-hub.md) | **Фоновый boot iOS и `devicectl`** | Xcode CLI + App | **9.0/10** | `✅ Активен` | С `2026-10-20` | Фоновый запуск/остановка iOS Simulator без окна (`simctl boot/shutdown`), установка сборок на реальный iPhone (`devicectl`) и резерв `Device Hub`. |
| **16** | [**`mobile-native`**](reviews/ru/mobile/mobile-native.md) | **Адаптация Mobile Web / PWA под натив** | Skill | **8.5/10** | `✅ Активен` | С `2026-11-15` | 11 CSS/meta-решений, придающих мобильному вебу и PWA ощущение нативного приложения (`dvh/svh`, `safe-area`, инпуты `16px`, `overscroll-behavior`, hover gating; с защитой `LOCAL-COMPATIBILITY.md`). |

---

## По направлениям

### 🧠 Локальные модели

| Название | Тип | Качество | Нужно нам | Статус | Дата | Краткое описание |
|---|---|---|---|---|---|---|
| [**`kimi-k3-in-c`**](reviews/ru/local-models/kimi-k3-in-c.md) | C99 CLI Inference Engine | **8.5/10** | **1.0/10** | `⛔ Отклонено` | `2026-11-16` | C99-эксперимент запуска модели Kimi K3 (`2.78T`) на `8 GB RAM` без GPU потоковым чтением с диска: требует **`~1.7 TB` свободного места** и выдаёт **`~24–33 сек/токен`** (`500` токенов кода = `~3.5 часа` и `~50 TB` чтения с SSD). **Вместо него:** [**`T3 Code`**](reviews/ru/developer-tools/t3-code.md) + CLI Subagents (`Argon` / `Claude` / `Codex`). |

### 🌐 Web

| Название | Тип | Качество | Нужно нам | Статус | Дата | Краткое описание |
|---|---|---|---|---|---|---|
| [**`taste-skill` v2.5**](reviews/ru/web/taste-skill.md) | Landing Kit + Hook | **8.0/10** | **4.0/10** | `👍 Хороший вариант` | `2026-11-15` | Сильный движок для промо-лендингов с нуля; при установке обязательно вырезать `Stop` хук (600с) и ставить только локально (`-p`). |

### 📱 Mobile

| Название | Тип | Качество | Нужно нам | Статус | Дата | Краткое описание |
|---|---|---|---|---|---|---|
| [**`swiftui-agent-skill`**](reviews/ru/mobile/swiftui-agent-skill.md) | Skill (`twostraws` / `AvdLee` / `apple-design`) | **8.5/10** | **3.0/10** | `👍 Хороший вариант` | `2026-11-16` | Чистый SwiftUI и Apple HIG; так как основной стек у нас Expo / React Native, нужен только локально (`-p`) для нативных SwiftUI-модулей (Widgets / Live Activities). **Вместо него:** [**`impeccable`**](reviews/ru/ui-ux/impeccable.md) (`reference/ios.md`) + [**`animate-expo`**](reviews/ru/mobile/animate-expo.md). |
| [**`mobile-mcp`**](reviews/ru/mobile/mobile-mcp.md) | MCP Server (34 tool) | **7.0/10** | **2.0/10** | `⛔ Отклонено` | `2026-11-16` | Протестировано вживую и отклонено: `~7,580` токенов постоянного раздувания MCP-схемы на каждый ход, в `6.5x–37x` медленнее `agent-device` (`7.3s` iOS, `5.8s` Android), телеметрия `Scarf` + `PostHog` и реклама облака `mobilenext.ai`. **Вместо него:** [**`agent-device`**](reviews/ru/mobile/agent-device.md) + [**`adb`**](reviews/ru/mobile/adb.md). |

### 🎨 UI/UX

| Название | Тип | Качество | Нужно нам | Статус | Дата | Краткое описание |
|---|---|---|---|---|---|---|
| [**`animate`**](reviews/ru/ui-ux/animate.md) | Skill (2 файла) | **8.5/10** | **3.0/10** | `⛔ Отклонено` | `2026-11-15` | Скилл веб-анимаций от Эмиля Ковальски; конфликтует по auto-trigger и правилам с нашей системой. **Вместо него:** [**`impeccable`**](reviews/ru/ui-ux/impeccable.md) (`animate`) + [**`animate-expo`**](reviews/ru/mobile/animate-expo.md). |
| [**`unslop`**](reviews/ru/ui-ux/unslop.md) | Skill + Playwright скрипты | **8.5/10** | **2.5/10** | `⛔ Отклонено` | `2026-11-16` | 9-проходный скилл очистки AI/vibecoded веб-экранов от `@heydamir` (`CC-BY-4.0`); только для Web и конфликтует по auto-trigger. **Вместо него:** [**`impeccable`**](reviews/ru/ui-ux/impeccable.md) (`craft-floor` + `polish` / `quieter` / `clarify`). |
| [**`break-ui`**](reviews/ru/ui-ux/break-ui.md) | Skill (2 файла) | **8.0/10** | **3.0/10** | `⛔ Отклонено` | `2026-11-15` | Стресс-тест UI экстремальными данными; добавляет временные фикстуры/переключатели в проект и останавливается без фикса. **Вместо него:** [**`impeccable`**](reviews/ru/ui-ux/impeccable.md) (`harden`). |
| [**`make-interfaces-feel-better`**](reviews/ru/ui-ux/make-interfaces-feel-better.md) | Skill (6 файлов) | **7.5/10** | **2.5/10** | `⛔ Отклонено` | `2026-10-31 → 2026-11-15` | Протестировано и удалено (из-за конфликта auto-trigger и громоздких таблиц отчётов). **Вместо него:** [**`impeccable`**](reviews/ru/ui-ux/impeccable.md) + [**`animate-expo`**](reviews/ru/mobile/animate-expo.md). |
| [**`ui-ux-pro-max`**](reviews/ru/ui-ux/ui-ux-pro-max.md) | Skill + CSV/Python | **7.0/10** | **3.5/10** | `⛔ Отклонено` | `2026-11-15` | Слабее `impeccable` и конфликтует с ним по auto-trigger. **Вместо него:** [**`impeccable`**](reviews/ru/ui-ux/impeccable.md). |

### 🏗️ Архитектура и Ревью

| Название | Тип | Качество | Нужно нам | Статус | Дата | Краткое описание |
|---|---|---|---|---|---|---|
| [**`addy-agent-skills`**](reviews/ru/architecture/addy-agent-skills.md) | Плагин (25 скиллов + 9 команд) | **8.0/10** | **2.5/10** | `⛔ Отклонено` | `2026-11-16` | Полный SDLC-конвейер от Эдди Османи (`/spec -> /ship`); обязательный TDD и паузы `doubt-driven` создают лишние циклы. **Вместо него:** [**`grill-me`**](reviews/ru/architecture/grill-me.md) + [**`ponytail`**](reviews/ru/architecture/ponytail.md) + [**`elephant-goldfish-model`**](reviews/ru/architecture/elephant-goldfish-model.md). |
| [**`agency-agents`**](reviews/ru/architecture/agency-agents.md) | 283 persona-промпта + installer | **6.5/10** | **2.5/10** | `⛔ Отклонено` | `2026-11-16` | 283 ролевых `.md` промпта в 18 отделах (`~18.5K` токенов раздувания frontmatter и чужие остатки copy-paste). **Вместо него:** [**`impeccable`**](reviews/ru/ui-ux/impeccable.md), [**`ponytail`**](reviews/ru/architecture/ponytail.md), [**`elephant-goldfish-model`**](reviews/ru/architecture/elephant-goldfish-model.md), [**`cross-platform-qa`**](reviews/ru/mobile/cross-platform-qa.md). |
| [**`superpowers`**](reviews/ru/architecture/superpowers.md) | Плагин (14 скиллов + хук) | **6.5/10** | **2.0/10** | `⛔ Отклонено` | `2026-04-04 → 2026-09-01` | Протестировано и удалено: лишние размышления (`SessionStart` хук), ненужные вопросы `brainstorming` (альтернатива: `grill-me`), медленные циклы субагентов и принудительный TDD (2x лишней работы для Web/Mobile/Backend). |

### ⚙️ Backend

| Название | Тип | Качество | Нужно нам | Статус | Дата | Краткое описание |
|---|---|---|---|---|---|---|
| [**`opentelemetry`**](reviews/ru/backend/opentelemetry.md) | Стандарт + Collector (`SigNoz` / `Grafana`) | **9.0/10** | **4.0/10** | `👍 Хороший вариант` | `2026-11-15` | Отраслевой стандарт межсервисных `Traces + Metrics + Logs` и метрик серверов/БД (требует `Collector + SigNoz/Grafana`). **Вместо него:** [**`sentry`**](reviews/ru/backend/sentry.md) (закрывает ошибки, реплеи и базовые трейсы в одной платформе). |
| [**`Shannon`**](reviews/ru/backend/shannon.md) | Standalone CLI + [`hacker-test`](skills/hacker-test/SKILL.md) | **8.5/10** | **6.5/10** | `👍 Хороший вариант` | `2026-11-16` | Автономный White-Box AI-пентестер (Auth bypass, IDOR, Injection, XSS, SSRF). Вместо тяжёлого плагина вызывается по запросу через наш лёгкий скилл [`hacker-test`](skills/hacker-test/SKILL.md) и `npx` строго на local/staging (не на production). |

### 🛠️ Developer Tools и Memory

| Название | Тип | Качество | Нужно нам | Статус | Дата | Краткое описание |
|---|---|---|---|---|---|---|
| [**`SkillSpector`**](reviews/ru/developer-tools/skillspector.md) | Python CLI + MCP + Skill | **9.0/10** | **3.5/10** | `⛔ Отклонено` | `2026-11-16` | Сканер безопасности AI-скиллов и MCP от NVIDIA (`AST + YARA + OSV + LLM`). Не устанавливали, чтобы не плодить лишний цикл — **Вместо него:** [**`skillshare`**](reviews/ru/developer-tools/skillshare.md) (skill-check `skillshare audit`) + **прямая проверка кода через AI-агента**. |
| [**`AssetDiet`**](reviews/ru/developer-tools/assetdiet.md) | Standalone CLI + [`asset-diet`](skills/asset-diet/SKILL.md) | **7.5/10** | **6.5/10** | `✅ Активен` | С `2026-11-16` | 100% локальное сжатие картинок/SVG/видео/3D (`Sharp`, `SVGO`, `FFmpeg`) с откатом. Вместо постоянного 16-tool MCP подключён через наш лёгкий скилл [`asset-diet`](skills/asset-diet/SKILL.md) для разового вызова `npx assetdiet-mcp@0.1.4`. |
| [**`humanizer` + `stop-slop`**](reviews/ru/developer-tools/humanizer-stop-slop.md) | Skill (`Markdown`) | **7.5/10** | **2.0/10** | `⛔ Отклонено` | `2026-11-16` | Редакторы статей и эссе от штампов ИИ (`humanizer` весит `~32 KB`); не для кода и не для продуктового UI. **Вместо них:** [**`ponytail`**](reviews/ru/architecture/ponytail.md) + [**`impeccable`**](reviews/ru/ui-ux/impeccable.md) (`clarify`). |
| [**`claude-code-setup`**](reviews/ru/developer-tools/claude-code-setup.md) | Плагин (Recommender Skill) | **7.5/10** | **2.0/10** | `⛔ Отклонено` | `2026-11-16` | Официальный read-only рекомендатель стартовых секций `CLAUDE.md`, хуков и MCP-серверов под проект. **Вместо него:** [**`skillshare`**](reviews/ru/developer-tools/skillshare.md). |
| [**`OmniRoute`**](reviews/ru/developer-tools/omniroute.md) | Local Proxy + 44 админ-скилла | **7.5/10** | **2.0/10** | `⛔ Отклонено` | `2026-11-16` | Локальный LLM reverse-proxy (`localhost:20128`); его 44 скилла — лишь мануалы прокси, дефолтный роутинг рвёт длинные сессии (`#7287`) и понижает модель, а TLS-stealth (`wreq-js`) несёт риск бана подписок по ToS. **Вместо него:** [**`T3 Code`**](reviews/ru/developer-tools/t3-code.md) + [**`ponytail`**](reviews/ru/architecture/ponytail.md). |

---

<details>
<summary>Подключить глобальные скиллы <code>tasted-skills</code>, <code>hacker-test</code> и <code>asset-diet</code></summary>

```bash
skillshare install TursunboyevJahongir/tasted-skills -s tasted-skills -s hacker-test -s asset-diet -g && skillshare sync -g
```

</details>

