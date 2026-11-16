# 7. Сравнение Скиллов и Инструментов Между Собой (Почему Мы Выбрали Одни и Отклонили Другие)

[🇺🇿 O'zbekcha](../07-tool-and-skill-comparisons.md) | [🇬🇧 English](../en/07-tool-and-skill-comparisons.md) | **🇷🇺 Русский**

⬅️ [Вернуться к оглавлению практик](README.md)

В этом руководстве собраны прямые сравнения всех скиллов, CLI-инструментов, MCP-серверов и моделей, которые мы протестировали вживую и проверили по исходному коду (**что выбрали vs от чего отказались и почему**).

---

## 1. 📱 Автоматизация Мобильного и TV UI (`agent-device` vs `Maestro` vs `ARTEMIS` vs `mobile-mcp`)

| Показатель | ✅ [**`agent-device`**](../../reviews/ru/mobile/agent-device.md) *(Наш основной)* | [**`Maestro CLI`**](01-mobile-tv-headless-qa.md) | [**`ARTEMIS`** (`google/artemis`)](../../reviews/ru/mobile/artemis.md) | ❌ [**`mobile-mcp`**](../../reviews/ru/mobile/mobile-mcp.md) |
|---|---|---|---|---|
| **Платформы** | **`iOS + Android + tvOS + Android TV`** | `iOS + Android` *(нет TV)* | Только `Android` *(нет iOS/TV)* | `iOS + Android` |
| **Скорость 1 действия** | **`197 мс` (iOS) / `888 мс` (Android)** | `~1.5 – 4 сек` (JVM + драйвер) | `3 – 40 секунд / шаг` | `7.3 сек` (iOS) / `5.8 сек` (Android) |
| **Нагрузка на контекст** | **`0 токенов`** *(CLI, `@e1` diff ~200 ток.)* | `0 токенов` *(CLI)* | Раздувание схемы при MCP | **`~7,580 токенов / на каждый ход`** (34 тула) |
| **Доплата за API** | **`$0` (100% бесплатно)** | `$0` (локальный CLI; Cloud платный) | **Платно** (нужен платный LLM API-ключ в `.env`) | `$0` *(встроена реклама облака `mobilenext.ai`)* |
| **Зависимости** | **`0` (готовый бинарник, без Java)** | **Требует Java (`JDK 17+`)** | Python `3.12+` + LLM SDK | Node + телеметрия `Scarf`/`PostHog` |
| **Maestro `.yaml` E2E** | **Встроено (`replay/test --maestro`)** | Родной `.yaml` движок | Нет | Нет |
| **Итог** | **✅ Основной инструмент (`#8`)** | Отдельно ставить не нужно (`agent-device --maestro` достаточно) | `👍` Только для кастомных `Canvas`/игровых экранов | `⛔ Отклонено` (в `6.5x–37x` медленнее и раздут) |

---

## 2. 📱 Оптимизация Мобильных Эмуляторов (`simslim` и `avdslim`: БЕЗ НИХ vs С НИМИ)

| Платформа | ❌ Обычный (Stock) режим | ✅ С [**`simslim`**](../../reviews/ru/mobile/simslim.md) + [**`avdslim`**](../../reviews/ru/mobile/avdslim.md) | Что изменилось на практике? |
|---|---|---|---|
| **iOS 26.5 Simulator (`simctl boot` без окна)** | `2.70 GB` RAM · `182` процесса (`Siri`, `Apple Intelligence`, `Wallpaper`) | **`1.16 GB` RAM (`-57%`)** · **`78` процессов** (`--except web,photos,search --keep com.apple.apsd`) | **Экономия `-1.54 GB` RAM**, Push/Links/Photos/GPS работают на `100%` (`4/4 OK`) + очистка `1.51 GB` диска. |
| **iOS Simulator (`GUI` с окном)** | `~4.0 GB` RAM | **`~0.9 GB` RAM (`-77.5%`)** | Освобождает `~3.1 GB` RAM в оконном режиме. |
| **Android API 35 Emulator (`-no-window`)** | `4.41 GB` RAM (в Studio `8.5 GB`) · CPU-рендер `SwiftShader` · старт `22.81s` | **`2.64 GB` RAM (`-40.2%`)** · **Нативный Apple Metal GPU (`host`)** · **старт `13.79s` из Golden Snapshot** | **Экономия `-1.77 GB` RAM**, плавные карты (Mapbox/Maps) на GPU, GPS (`location_mode=3`) защищён через `defaults`. |
| **Оба эмулятора вместе в фоне** | **`~7.11 – 12.5 GB` RAM** | **`3.80 GB` RAM** (`1.16 GB` iOS + `2.64 GB` Android) | **Ноутбук не уходит в Swap (экономия `~3.3–8.7 GB`).** |

---

## 3. 🌐 Управление Web и Desktop UI (`agent-desktop` vs `vercel-labs/ui`)

| Показатель | ✅ [**`agent-desktop`**](../../reviews/ru/developer-tools/agent-desktop.md) *(Наш основной)* | ❌ [**`vercel-labs/ui`** (`@ui-sdk/*`)](../../reviews/ru/web/vercel-ui-sdk.md) |
|---|---|---|
| **На каких сайтах и программах работает?** | **Любые сайты (`React`, `Next.js`, `Shadcn`, `Radix`, обычный HTML) + любые программы macOS** (`Chrome`, `Telegram`, `Postman`, `Docker`, `Finder`) | **Работает только на сайтах, переписанных с нуля на `@ui-sdk/*`** (не видит обычные `<button>`/`<input>`) |
| **Поддержка Mobile / Expo** | Web и Desktop (включая резерв для `iOS Device Hub`) | Не работает в `React Native / Expo` |
| **Доп. возможности** | Прямой вызов C-ABI (`libagent_desktop_ffi.dylib`) из Python/Swift/Go | Public Beta (`0.1.0-beta`), частые breaking changes |
| **Итог** | **✅ Основной инструмент (`#7`)** | `⛔ Отклонено` (переписывать рабочие проекты под `@ui-sdk/*` бессмысленно) |

---

## 4. 🎨 Сравнение UI/UX и Анимационных Скиллов

### A. Дизайн, Аудит и Очистка UI (`impeccable` + `mobile-native` vs остальные)

| Скилл | Охват | Что делает? | Почему выбрали / отклонили? |
|---|---|---|---|
| ✅ [**`impeccable`**](../../reviews/ru/ui-ux/impeccable.md) + [**`mobile-native`**](../../reviews/ru/mobile/mobile-native.md) | **Web + Mobile Web/PWA + Native iOS/Android** | Защита от AI-штампов (`craft-floor`) + 20 команд (`polish`, `clarify`, `harden`, `quieter`, `bolder`) + **APCA-контраст (`\|Lc\| ≥ 60`)** + 11 фиксов мобильного веба (`dvh`, `safe-area`, `16px`). | **✅ Основная связка (`#5` и `#19`)** — закрывает все платформы в единой системе. |
| ❌ [**`unslop`**](../../reviews/ru/ui-ux/unslop.md) | Только Web | 9-шаговая очистка AI/vibecoded веб-страниц (`Playwright`). | `⛔ Отклонено` — конфликтует по auto-trigger с `impeccable`, не работает на мобилках (`impeccable polish/quieter` уже умеет это). |
| ❌ [**`break-ui`**](../../reviews/ru/ui-ux/break-ui.md) | Только Web | Стресс-тест UI экстремальными/пустыми данными. | `⛔ Отклонено` — добавляет временные фикстуры в проект и **останавливается без починки** (`impeccable harden` сразу чинит). |
| ❌ [**`make-interfaces-feel-better`**](../../reviews/ru/ui-ux/make-interfaces-feel-better.md) | Web | Проверка рамок, скруглений и теней. | `⛔ Отклонено` — удалён после 16 дней использования из-за громоздких отчётов на 4 таблицы. |
| ❌ [**`ui-ux-pro-max`**](../../reviews/ru/ui-ux/ui-ux-pro-max.md) | Web | Подбор палитр и шрифтов через CSV/Python. | `⛔ Отклонено` — слабее `impeccable` и конфликтует с его auto-trigger. |

### B. Анимации и SwiftUI (`animate-expo` + `impeccable` vs `animate` vs `swiftui-agent-skill`)

| Скилл | Направление | Решение и причина |
|---|---|---|
| ✅ [**`animate-expo`**](../../reviews/ru/mobile/animate-expo.md) + [**`impeccable` (`animate`)**](../../reviews/ru/ui-ux/impeccable.md) | **Expo / React Native (`Reanimated` UI-thread `60/120fps` + haptics)** и **Web CSS/WAAPI анимации** | **✅ Основные (`#12` и `#5`)** — плавные анимации и в мобильных приложениях, и в вебе. |
| ❌ [**`animate`** *(Эмиль Ковальски)*](../../reviews/ru/ui-ux/animate.md) | Только веб-анимации CSS/JS | `⛔ Отклонено` — правила уже есть в `impeccable`, а auto-trigger конфликтует с `animate-expo`. |
| 👍 [**`swiftui-agent-skill`**](../../reviews/ru/mobile/swiftui-agent-skill.md) | Чистый нативный SwiftUI (`iOS 26+ Liquid Glass`, `WidgetKit`, `ActivityKit`) | `👍 Хороший вариант` — так как основной стек Expo, ставится только локально (`-p`) для iOS Widgets / Live Activities. |

---

## 5. 🏗️ Планирование, Качество Кода, Краткость и Мультиагентное Ревью

### A. Архитектура и SDLC-конвейеры (`grill-me` + `graphify` + `ponytail` vs остальные)

| Инструмент | Подход | Решение и причина |
|---|---|---|
| ✅ [**`grill-me`**](../../reviews/ru/architecture/grill-me.md) + [**`graphify`**](../../reviews/ru/architecture/graphify.md) + [**`ponytail`**](../../reviews/ru/architecture/ponytail.md) + [**`karpathy-guidelines`**](../../reviews/ru/architecture/karpathy-guidelines.md) | Каркас проекта за `0` токенов (`graphify`, экономит `~10x–20x` токенов на больших репо) -> продумывание задачи до кода (`grill-me`, спасает от 2–3x переделок) -> минимальный YAGNI и `surgical` diff (`ponytail` + `karpathy`). | **✅ Основная четвёрка (`#1–#4`)** — быстро, точно и без лишней бюрократии. |
| ❌ [**`superpowers`**](../../reviews/ru/architecture/superpowers.md) | 14 скиллов + хук `SessionStart` + обязательный TDD и циклы субагентов на каждый шаг. | `⛔ Отклонено` — удалён после 5 месяцев теста (замедляет разработку в `2` раза и сжигает квоту). |
| ❌ [**`addy-agent-skills`**](../../reviews/ru/architecture/addy-agent-skills.md) | 25 скиллов + тяжёлый конвейер `/spec -> /ship` и остановки `doubt-driven`. | `⛔ Отклонено` — лишние циклы в повседневной работе. |
| ❌ [**`agency-agents`**](../../reviews/ru/architecture/agency-agents.md) | 283 `.md` ролевых промпта (`~18.5K` токенов раздувания frontmatter). | `⛔ Отклонено` — поверхностные шаблонные роли. |

### B. Краткие Ответы и Стиль Текста (`ponytail` vs `caveman` vs `humanizer`)

| Скилл | Что именно сокращает? | Телеметрия / Объём | Решение |
|---|---|---|---|
| ✅ [**`ponytail`**](../../reviews/ru/architecture/ponytail.md) | **Сокращает и текст ответа ИИ, и объём/сложность самого кода и diff'а** (YAGNI, 0 лишних абстракций). | **`0` телеметрии**, лёгкий `SKILL.md` | **✅ Основной (`#3`)** |
| 👍 [**`caveman`**](../../reviews/ru/developer-tools/caveman.md) | Вырезает артикли и связки **только из текстового ответа в терминале** (`~65%` меньше выходных токенов); на объём кода не влияет. | В CLI-пакете есть `fetch`-телеметрия и хуки `SessionStart` (брать только чистый `SKILL.md`) | `👍` Резерв (`ponytail` полностью хватает) |
| ❌ [**`humanizer` + `stop-slop`**](../../reviews/ru/developer-tools/humanizer-stop-slop.md) | Чистит длинные статьи и эссе от штампов ИИ. | `~32 KB` (`humanizer`) | `⛔ Отклонено` (не для кода и UI) |

### C. Мультиагентная Работа и Ревью (`Orca` + `EGM` vs `T3 Code` vs `OmniRoute`)

| Инструмент | Задача | Решение |
|---|---|---|
| ✅ [**`Orca`**](../../reviews/ru/developer-tools/orca.md) + `orchestration` + `task-context` | **Цепочка ИИ из одного промпта + Мобильное управление:** Живые карточки субагентов (`Codex`, `Claude`, `Argon`) прямо в Chat UI, работа при `Lock Screen` (`caffeinate`), стабильное приложение `Orca IDE` и передача эстафеты через `task-context` (`841 MB` RAM). | **✅ Использую (`#13`)** |
| ✅ [**`elephant-goldfish-model`**](../../reviews/ru/architecture/elephant-goldfish-model.md) | **Ревью без памяти (`Goldfish`, 5 персон) + Drift + ТРИЗ:** Аудит архитектуры/PR без предвзятости, поиск расхождений доков с кодом (`egm-drift-report`) и решение противоречий по ТРИЗ. | **✅ Использую (`#6`)** |
| ❌ [**`T3 Code`**](../../reviews/ru/developer-tools/t3-code.md) | Наше прежнее мультиагентное приложение (`2026-10-23 → 2026-11-16`). | `⛔ Отклонено` — бета-приложение на телефоне часто отваливалось, сессии прерывались при `Lock Screen`, нет карточек субагентов в чате (заменено на `Orca`). |
| ❌ [**`OmniRoute`**](../../reviews/ru/developer-tools/omniroute.md) | Локальный LLM reverse-proxy (`localhost:20128`) + 44 админ-скилла. | `⛔ Отклонено` — рвёт длинные сессии (`#7287`), незаметно понижает модель и несёт риск бана аккаунта из-за `wreq-js` TLS-stealth. |

---

## 6. 🛡️ Безопасность, Аудит Кода, Пентест и Мониторинг

| Направление | ✅ Выбранный нами инструмент | Сравнение с альтернативами |
|---|---|---|
| **Проверка новых скиллов** | [**`skillshare`** (`skillshare audit`)](../../reviews/ru/developer-tools/skillshare.md) + **прямая проверка исходников через AI-агента** | ❌ [**`SkillSpector`**](../../reviews/ru/developer-tools/skillspector.md) (отдельный цикл Python/Docker/YARA) · ❌ [**`claude-code-setup`**](../../reviews/ru/developer-tools/claude-code-setup.md) (только стартовые советы). |
| **Безопасность приложений (Static vs Live)** | [**`security-audit`**](../../reviews/ru/backend/security-audit-skill.md) *(6-фазный аудит исходников без Docker: Backend + Web + Mobile `deep-link`/`WebView`)* **+** [**`Shannon` (`hacker-test`)**](../../reviews/ru/backend/shannon.md) *(живой White-Box пентест HTTP API в Docker на local/staging)* | Дополняют друг друга: `security-audit` проверяет весь код (включая мобилки) без запуска серверов; `hacker-test` атакует запущенный staging веб/API сервер реальными эксплойтами. |
| **Ошибки и Наблюдаемость (`Observability`)** | [**`sentry`**](../../reviews/ru/backend/sentry.md) *(Ошибки + `SourceMap`/`dSYM` + `Session Replay` + `v8+` OTel-трейсы в одном месте)* | 👍 [**`opentelemetry`**](../../reviews/ru/backend/opentelemetry.md) (`Collector + SigNoz/Grafana`) — нужен только при масштабировании до десятков микросервисов и метрик хостов/БД. |

---

## 7. 🧠 Сравнение Локальных Моделей и 🔌 Внешних API

| Модель / Вариант | Основное назначение | Работает ли для кодинга? | Железо / Тариф | Итог |
|---|---|---|---|---|
| **Локально `Ollama` / `MLX` (`Qwen3-Coder` / `Qwen2.5-Coder`)** | 100% офлайн написание и анализ кода на `32–64 GB` Mac | **Да (`30–65 ток/с` целиком в RAM)** | `~9–20 GB` Unified RAM · `$0` | **Лучший выбор, если действительно нужен локальный офлайн-кодер.** |
| ❌ [**`kimi-k3-in-c`**](../../reviews/ru/local-models/kimi-k3-in-c.md) | C99-эксперимент потокового чтения весов `2.78T` MoE с NVMe без GPU | **Нет (`1 токен = ~24–33 сек`, `500` токенов = `~3.5 ч` + `~50 TB` чтения с SSD)** | Мин.: `1.8 TB` NVMe; Для работы: `16× H200 (~2.25 TB VRAM)` | `⛔ Отклонено` (убивает ресурс SSD, непригодно для работы). |
| ❌ [**`MiniMax-M3.1-Flash` *(Локально)* **](../../reviews/ru/local-models/minimax-m3-1-flash.md) | Локальный запуск быстрой мультимодальной (`текст + фото + видео`, `1M`) модели | Подходит для простых скриптов, но не основной кодер (`Terminal-Bench: 38.1%`) | Веса `~250–285 GB`; `512 GB` Mac Studio или `8× H100 (640 GB VRAM)` | `⛔ Отклонено` (не помещается на рабочие компьютеры). |
| 👍 [**`MiniMax M3.1 Flash API`**](../../reviews/ru/external-apis/minimax-m3-1-flash-api.md) | Массовые боты в бэкенде, переводы, `OCR`/фото/видео и SaaS-автоматизация | Работает для простых скриптов и автоматизации (не основной IDE-кодер) | **`$0.15 / $0.60`** (`Cached: $0.015`), **`170+ ток/с`**, окно `1M` | `👍 Хороший вариант` (для бэкенда продуктов через платный Zero-Retention API). |
