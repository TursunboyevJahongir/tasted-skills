# `simslim` (`MobAI-App/simslim`)

[🇺🇿 O'zbekcha](../../mobile/simslim.md) | [🇬🇧 English](../../en/mobile/simslim.md) | **🇷🇺 Русский**

- **Источник:** [MobAI-App/simslim](https://github.com/MobAI-App/simslim)
- **Категория:** `Mobile` *(Оптимизатор RAM и диска для симуляторов iOS, tvOS, watchOS и visionOS)*
- **Тип:** `Standalone Go CLI` (`brew install mobai-app/tap/simslim`)
- **Оценка качества:** **9.0 / 10**
- **Частота нужды в работе:** **7.5 / 10**
- **Рекомендуемый масштаб:** `Global CLI (Homebrew)` — разово применяется ко всем локальным симуляторам `iOS 18.5+` / `tvOS` с безопасным профилем
- **Работает в связке с:** [**`agent-device`**](agent-device.md) + [**`xcrun simctl`**](ios-simulator-device-hub.md) + [**`cross-platform-qa`**](cross-platform-qa.md) *(примечание: закрытое приложение `MobAI Pro` / `mobai-mcp` не нужно — управление UI полностью закрывает `agent-device`)*
- **Используется с:** `2026-11-16`
- **Текущий статус:** `✅ Использую`

---

## 1. Что это и как работает?

> [!IMPORTANT]
> **Простыми словами (Главная задача и польза):** Отключает `~150+` ненужных фоновых служб Apple внутри iOS Simulator, **снижая расход RAM с `2.70 GB -> 1.16 GB` (`-57%`, а в GUI `4.0 GB -> 0.9 GB`)** и освобождая `1.5 GB+` диска на каждом симуляторе.

Чистая открытая Go-утилита (`MIT`, `0` телеметрии, `0` сетевых вызовов) для отключения ненужных фоновых демонов внутри симуляторов Apple. Обычный iOS или tvOS Simulator при запуске поднимает около `180` системных служб (`Siri`, `Apple Intelligence`, `Wallpaper PosterBoard`, `Spotlight`, `photoanalysisd`, `iCloud`, `HealthKit`, `Weather`, `News`), расходующих гигабайты оперативной памяти.

`simslim` не затрагивает саму macOS — он записывает постоянные `launchctl disable` правила строго во внутреннюю базу `launchd_sim` конкретного `<UDID>` симулятора (на `iOS/tvOS 18.5+` настройки сохраняются между перезагрузками без каких-либо фоновых демонов).

---

## 2. Не мешает ли нашей работе? (Совместимость с проектами и `agent-device`)

### A. Влияние на AI и QA-инструменты — `0%` помех
- Нет MCP-сервера, авто-скилла или фонового процесса — расход контекста в чате **`0 токенов`**.
- Аудит `profiles.go` подтвердил, что `com.apple.gamed` (`DTServiceHub`) и `com.apple.sharingd` жёстко защищены в списке `AlwaysEnabled` (*`"Required for timely XCUITest app launches"`*) — фоновый XCUITest-раннер [**`agent-device`**](agent-device.md) (`~197 ms`) работает без единого сбоя.

### B. Влияние на мобильные и TV-приложения (Что работает сразу и что важно оставить)
- **Службы, которые никогда не отключаются (работают на 100%):**
  - **GPS и геолокация (`CoreLocation`, `expo-location`, `.gpx`-маршруты):** `com.apple.locationd` не трогается — приложения с живыми картами, такси и доставкой работают штатно.
  - **Карты, GPU и видео (`Mapbox`, Metal, `AVPlayer` HLS-стриминг, `tvOS`):** Графический и медиа-конвейеры полностью сохранены.
  - **Локальное хранение токенов (`expo-secure-store`, локальный `securityd` Keychain):** Локальный Keychain работает без изменений (отключается только облачная синхронизация iCloud Keychain).
  - **Сеть (`WebSocket` / `Socket.IO`, REST API, Metro Fast Refresh):** 100% без изменений.
- **⚠️ 3 функции, которые голый `simslim on` выключает по умолчанию, и решение в одну строку:**
  1. **Push-уведомления (`FCM` / `APNs` / Notification Extensions):** дефолт гасит `com.apple.apsd` -> оставляем через `--keep com.apple.apsd`.
  2. **Universal Links (`https://...` associated domains):** дефолт гасит `web` (`com.apple.swcd`, `~50 MB`) -> оставляем через `--except web`.
  3. **Выбор фото и файлов (`Photo Picker`, `Document Picker Recents`):** дефолт гасит `photos` (`~60 MB`) и `search` (`~50 MB`) -> оставляем через `--except photos,search`. *(Для тестов Widgets / Live Activities или StoreKit IAP добавляется `--except widgets,store`).*

**Наш безопасный рабочий профиль (отключает `149` лишних служб, сохраняя `push + universal-links + photos + spotlight` в статусе `4/4 OK`):**
```bash
simslim on <UDID> --except web,photos,search --keep com.apple.apsd
# Заранее облегчить выключенные симуляторы без оставления их запущенными:
simslim on <UDID> --preserve-boot-state --except web,photos,search --keep com.apple.apsd
# Проверка нужных возможностей:
simslim doctor <UDID> --requires push,universal-links,photos,spotlight
```

---

## 3. Что меняется БЕЗ `simslim` и С НИМ? (Живой бенчмарк `iOS 26.5`)

Реальный замер на `Apple M1 Max (32 GB RAM)` при фоновом запуске `iPhone 17 Pro (iOS 26.5)` без окна (`xcrun simctl boot`), плюс эталонный GUI-замер:

| Показатель / Сценарий | БЕЗ `simslim` (`Stock`) | С `simslim` (`Slim`) | Реальный эффект |
|---|---|---|---|
| **Фоновый (`headless`) boot: процессы и RAM** *(наш безопасный профиль)* | **`182` процесса · `2.70 GB`** (`phys_footprint`) | **`78` процессов · `1.16 GB`** (`149` служб выключено) | **`-57%` процессов и `-1.54 GB` RAM экономии на каждом симуляторе** (`4/4` `push`, `universal-links`, `photos`, `spotlight` работают) |
| **Полный запуск с окном Simulator.app** *(максимальный `simslim on`)* | **`258` процессов · `4.00 GB`** | **`70` процессов · `0.90 GB`** | **`-77.5%` (`-3.1 GB`) экономии RAM** |
| **`Stage 1 QA` (`Chrome` + `iOS Sim` + `Android AVD` + `Docker` одновременно)** | Одни эмуляторы съедают `~7–8.5 GB` RAM, разгоняя Swap до `6–9 GB` | Эмуляторы держатся в районе `~4.5–5 GB` RAM без скачков Swap | Сборки Metro, бэкенд-контейнеры и `agent-device` работают стабильно и быстро |
| **Одновременный запуск `iPhone + iPad + Apple TV (tvOS)`** | `~8–12 GB` RAM (приходится гасить один симулятор ради другого) | Все три вместе занимают **`~3.0–3.5 GB` RAM** | 3 симулятора укладываются в бюджет памяти одного обычного |
| **Нагрузка на CPU в простое** | `spotlightknowledged`, `photoanalysisd` и ML-службы грузят CPU в фоне | Фоновая индексация и ML выключены | Нагрузка на CPU в простое около `0%` |
| **Очистка SSD (`simslim disk-plan` / `disk-clean`)** | `simctl erase` сносит установленные сборки и авторизацию | **`1.51 GB` безопасной очистки на одном симуляторе** (`827 MB` логов + `557 MB` кэша) | `--categories caches,logs,temporary --confirm` освобождает диск, **не трогая** приложения (`843 MB`) и сессии входа |
| **Откат к заводскому состоянию (`Rollback`)** | — | `simslim off <UDID>` | Полный возврат к `stock` за `~17–20 секунд` |

---

## 4. Безопасность и санитаризация

- **Уровень риска:** `Низкий`
- **Проверенные точки (`go.mod`, `profiles.go`, `slim.go`):**
  - Всего 4 TUI/CLI-зависимости (`bubbletea`, `lipgloss`, `go-isatty`, `urfave/cli`), полное отсутствие `net/http` и телеметрии.
  - После `simctl erase` или создания нового симулятора настройки сбрасываются к `stock` — достаточно проверить `simslim verify <UDID>` или повторить `simslim on`.
  - Устанавливать проприетарный **`MobAI Pro` (`mobai-mcp`)** из демо-роликов не нужно — бесплатный [**`agent-device`**](agent-device.md) закрывает всё управление UI.

---

## 5. В каких задачах полезно?

- **Когда использовать:** Постоянно на всех локальных симуляторах `iOS` и `tvOS` (`18.5+`), особенно при параллельном запуске нескольких эмуляторов на `Stage 1 QA` и для безопасной очистки кэша/логов на SSD (`disk-clean`).
- **Когда временно отключать (`--except` / `simslim off`):** При тестировании Siri / Speech, HealthKit, HomeKit, StoreKit IAP или виджетов экрана блокировки / Live Activities.

---

## 6. История статуса и выполненных действий

| Дата | Действие | Статус | Примечание |
|---|---|---|---|
| 2026-11-16 | Аудит Go-кода, установка `brew install mobai-app/tap/simslim` (`v0.14.0`), живой замер RAM/диска на `iPhone 17 Pro (iOS 26.5)` и применение безопасного профиля ко всем 10 локальным симуляторам | `✅ Использую` | Фоновый запуск ужался со `182 -> 78` процессов и с `2.70 GB -> 1.16 GB` RAM (`-57%`) при 100% сохранении `push`, `universal-links`, `photos`, `spotlight` и работы `agent-device`. |
