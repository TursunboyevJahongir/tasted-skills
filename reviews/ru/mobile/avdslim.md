# `avdslim` (`kdbhalala/avdslim`)

[🇺🇿 O'zbekcha](../../mobile/avdslim.md) | [🇬🇧 English](../../en/mobile/avdslim.md) | **🇷🇺 Русский**

- **Источник:** [kdbhalala/avdslim](https://github.com/kdbhalala/avdslim)
- **Категория:** `Mobile` *(Оптимизатор RAM, Metal GPU и Golden Snapshot для Android Emulator)*
- **Тип:** `Standalone Go CLI` (`0` внешних зависимостей, `100%` Go stdlib)
- **Оценка качества:** **9.0 / 10**
- **Частота нужды в работе:** **7.5 / 10**
- **Рекомендуемый масштаб:** `Global CLI (/opt/homebrew/bin/avdslim)` — применяется ко всем локальным Android AVD через `tune-avd` + `bake --headless` с защитой GPS в `defaults` (без `install-shim`)
- **Работает в связке с:** [**`agent-device`**](agent-device.md) + [**`adb`**](adb.md) + [**`simslim`**](simslim.md) + [**`cross-platform-qa`**](cross-platform-qa.md)
- **Используется с:** `2026-11-16`
- **Текущий статус:** `✅ Использую`

---

## 1. Что это и как работает?

> [!IMPORTANT]
> **Простыми словами (Главная задача и польза):** Переключает графику Android-эмулятора с медленного CPU на **Apple Metal GPU (`host`)** и **снижает расход RAM с `4.41 GB -> 2.64 GB` (`-69%` от стандартных `8.5 GB` в Studio)** с запуском за `14` секунд.

Открытый оптимизатор Android Virtual Device (`AVD`) под лицензией `MIT` (`go.mod` всего `45 байт` — `0` сторонних пакетов, `0` сетевых вызовов), созданный по образцу [**`simslim`**](simslim.md). Устраняет 4 главные причины, из-за которых эмулятор Android съедает `4.5 GB – 8.5 GB` памяти на Apple Silicon и Linux:

1. **Убирает ловушку программного рендера `Lavapipe / SwiftShader` (`-gpu host`):** В AVD часто остаётся `hw.gpu.mode=auto` / `hw.gpu.enabled=no`, из-за чего графика рендерится на CPU (`SwiftShader LLVM` / `lavapipe`). Команда `avdslim tune-avd` переключает эмулятор на нативное ускорение **Apple Silicon Metal GPU (`host`)**.
2. **Флаг QEMU `-lowram` и лимит `1536 MB`:** Обходит внутренний порог QEMU в 4 GB и запускает ядро Android в режиме низкой памяти (автоматически сохраняя бэкап `config.ini.bak`).
3. **Отключает 22–45+ фоновых пакетов (`pm disable-user --user 0`):** Гасит Assistant, Wellbeing, PrintSpooler, LiveWallpaper, Dialer/MMS, полностью сохраняя `FCM Push`, `Firebase Auth`, `System WebView`, `Maps SDK` и локальные сокеты.
4. **Неизменяемый `avdslim_clean` Golden Snapshot (`bake`):** Один раз выполняет чистый запуск, отключает мусор и сохраняет эталонный снапшот, который далее грузится с `-no-snapshot-save` и никогда не портится.

---

## 2. Не мешает ли нашей работе? (Важная находка с `location_mode` и защита)

Построчный аудит исходного кода (`internal/adb/client.go`, `internal/config/tuner.go`, `internal/shim/shim.go`) подтвердил:

- **Не трогает физические USB-устройства:** Жёстко фильтрует только сериалы `emulator-*` — подключённые по кабелю реальные телефоны и планшеты полностью игнорируются.
- **100% совместимость с `agent-device` и `adb`:** Проброс портов `adb reverse`, `logcat`, чтение `@e1` ссылок и UTF-8 ввод работают без изменений.
- **⚠️ Обязательная настройка для GPS и картографических приложений (`--skip=location`):**
  - В `internal/adb/client.go:49` обнаружено, что базовый `avdslim on` по умолчанию выставляет **`location_mode = 0` (выключает GPS в Android)** и отключает пакет `com.google.android.apps.maps`.
  - Чтобы живая геолокация и карты работали на 100%, в файл `~/Library/Application Support/avdslim/defaults` (в Linux — `~/.config/avdslim/defaults`) записано постоянное правило:
    ```text
    --skip=location --keep=com.google.android.apps.maps
    ```
  - Теперь все вызовы `start`, `bake` и `on` автоматически сохраняют **`location_mode = 3` (High Accuracy GPS)**. *(Звук и камеру при необходимости можно включить через `avdslim enable audio <AVD>` или `avdslim enable camera <AVD>`).*
- **Без подмены бинарников SDK:** Мы отказались от `avdslim install-shim` (подменяющего бинарник `emulator` в Android SDK) в пользу чистого CLI-запуска `avdslim start <AVD> --headless`.

---

## 3. Что меняется БЕЗ `avdslim` и С НИМ? (Живой headless-бенчмарк `API 35`)

Реальный замер на `Apple M1 Max (32 GB RAM)` при фоновом запуске телефонного AVD `Android 15 (API 35, arm64)` с `-no-window`:

| Показатель / Сценарий | БЕЗ `avdslim` (Прежний запуск) | С `avdslim` (`v1.0.16` + Golden Snapshot) | Реальный эффект |
|---|---|---|---|
| **Память в Activity Monitor (`phys_footprint`)** | **`4 413 MB` (`4.41 GB`)** *(дефолтный Pixel AVD в Studio — `~8.5 GB`)* | **`2 640 MB` (`2.64 GB`)** | **`-1 773 MB` (`-40.2%` экономии RAM; `-69%` относительно 8.5 GB Studio AVD)** |
| **Физическая занятая RAM (`Resident RSS`)** | **`4 029 MB` (`4.03 GB`)** | **`2 544 MB` (`2.54 GB`)** | **`-1 485 MB` (`-36.9%`) освобождённой физической памяти** |
| **Графический рендер (GPU)** | `SwiftShader LLVM` *(медленный программный рендер на CPU)* | **`host` (Apple Silicon Metal GPU)** | Векторные карты (`Mapbox`) и анимации рендерятся на GPU без нагрева CPU |
| **Скорость запуска и стабильность снапшота** | Битый `default_boot` (`Error -5: goldfish_pipe`), холодный старт **`22.81 s`** | Чистый `avdslim_clean` Golden Snapshot (**`13.79 s`** полный старт, защита от порчи через `-no-snapshot-save`) | Стабильный и быстрый старт из эталонного состояния |
| **Фоновые системные пакеты (`Bloat`)** | Все активны | **Отключено `22` лишних пакета** (`45+` на образах Google Play) | Ограничена фоновая активность (`max_cached_processes=4`) |
| **GPS (`location_mode`), FCM Push и `agent-device`** | Работают | **`location_mode = 3`**, установленный APK сохранён, `agent-device` работает на 100% | **0% помех** рабочим проектам |

### Совместный результат `simslim` (iOS) + `avdslim` (Android) на `Stage 1 QA`
При одновременном фоновом запуске iOS Simulator и Android Emulator суммарное потребление памяти снизилось с **`7.11 GB` (`2.70 + 4.41 GB`) до `3.80 GB` (`1.16 + 2.64 GB`)** — **`~3.31 GB` чистой экономии RAM** в каждой кроссплатформенной сессии (и до `~8.7 GB` по сравнению с дефолтными GUI-настройками).

---

## 4. Безопасность и санитаризация

- **Уровень риска:** `Низкий`
- **Проверенные точки:**
  - `0` внешних Go-зависимостей (`go.mod` = `45 байт`), проверка SHA-256 контрольной суммы, отсутствие телеметрии и сетевых запросов.
  - При создании новых AVD выбирайте образ **`Google APIs` (стандартная страница 4 KB)** — избегайте `Google Play` и `16 KB Page Size (ps16k)`, где QEMU принудительно выставляет порог `4096 MB` RAM.
  - Полный откат: `avdslim off` возвращает все пакеты и настройки гостевой ОС, `avdslim unbake <AVD>` удаляет Golden Snapshot, а `config.ini.bak` хранит исходный конфиг AVD.

---

## 5. История статуса и выполненных действий

| Дата | Действие | Статус | Примечание |
|---|---|---|---|
| 2026-11-16 | Аудит Go-кода, установка `v1.0.16`, настройка `defaults` (`--skip=location --keep=com.google.android.apps.maps`), `tune-avd` всех 4 AVD и сборка headless Golden Snapshot для телефонного и планшетного AVD `API 35` | `✅ Использую` | Подтверждено снижение с `4 413 MB -> 2 640 MB` (`-40.2%` Footprint) и переход со `SwiftShader` на `Apple Metal GPU`; интегрировано в `cross-platform-qa`. |
