# 1. Фоновый Mobile & TV QA + Maestro E2E Автотесты

[🇺🇿 O'zbekcha](../01-mobile-tv-headless-qa.md) | [🇬🇧 English](../en/01-mobile-tv-headless-qa.md) | **🇷🇺 Русский**

⬅️ [Вернуться к оглавлению практик](README.md)

- **Связка инструментов:** [**simslim**](../../reviews/ru/mobile/simslim.md) + [**avdslim**](../../reviews/ru/mobile/avdslim.md) + [**agent-device**](../../reviews/ru/mobile/agent-device.md) + [**adb**](../../reviews/ru/mobile/adb.md) + [**xcrun simctl**](../../reviews/ru/mobile/ios-simulator-device-hub.md) + [**cross-platform-qa**](../../reviews/ru/mobile/cross-platform-qa.md)
- **Проекты:** `iOS`, `Android`, `tvOS (Apple TV)`, `Android TV`, `Expo / React Native`, `Swift / Kotlin`.

---

## 1. Зачем использовать их в связке? (Общая выгода)

В классической мобильной разработке мешают три проблемы:
1. Одновременный запуск iOS Simulator (`~4 GB`) и Android Emulator (`~4.5–8.5 GB`) съедает **`8–12 GB` RAM**, загоняя систему в Swap.
2. Открытые окна симуляторов и `Maestro` / `Device Hub` перекрывают экран и забирают фокус.
3. Ручное прокликивание базовых сценариев (Вход, Карта, Заказ) после каждой новой фичи отнимает много времени.

**Что даёт наша связка:**
- **Снижение расхода RAM почти вдвое:** `simslim` (iOS `1.16 GB`) + `avdslim` (Android `2.64 GB`, нативный Apple Metal GPU) укладывают оба эмулятора в **`3.80 GB` RAM** (экономия `~3.3–8.7 GB`).
- **100% невидимый (`headless`) режим:** На экране не открывается ни одно окно, курсор мыши остаётся свободным.
- **Готовый Maestro E2E движок без установки Java:** Внутри `agent-device` уже встроен движок `--maestro` и `.ad`, прогоняющий сохранённые сценарии в фоне без установки JVM и Maestro CLI.

### 🍏 A. Установленный у нас `simslim` (Оптимизатор iOS / tvOS Simulator): БЕЗ НЕГО vs С НИМ

| Показатель | ❌ БЕЗ `simslim` (Обычный iOS 26.5 Simulator) | ✅ С `simslim` (Наш безопасный профиль) | Разница |
|---|---|---|---|
| **Фоновый (`simctl boot`) RAM** | `2,704 MB` (`~2.70 GB`) | **`1,164 MB` (`~1.16 GB`)** | **`-1.54 GB` (`-57%`)** |
| **Оконный (`Simulator.app` GUI) RAM** | `~4.0 GB` | **`~0.9 GB`** | **`-3.1 GB` (`-77.5%`)** |
| **Фоновые процессы (`launchctl`)** | `182` процесса (`Siri`, `Apple Intelligence`, `Wallpaper`, `GameCenter`...) | **`78` процессов** *(только нужные для приложения и QA)* | **`-104` службы (`-57%`)** |
| **Очистка диска (`disk-clean`)** | `simctl erase` стирает установленные приложения и логины | **Очищает `~1.51 GB` логов/кэша без удаления приложений** | **`+1.51 GB` / симулятор** |
| **Push, Deep Links, Photo Picker, GPS** | Работает | **`100% работает`** (`--except web,photos,search --keep com.apple.apsd`) | **Без потерь (`4/4 OK`)** |

### 🤖 B. Установленный у нас `avdslim` (Оптимизатор RAM и Metal GPU для Android AVD): БЕЗ НЕГО vs С НИМ

| Показатель | ❌ БЕЗ `avdslim` (Обычный API 35 AVD) | ✅ С `avdslim` (Metal GPU + Golden Snapshot) | Разница |
|---|---|---|---|
| **Реальный RAM (`Footprint`)** | `4,413 MB` (`~4.41 GB`; в стандартном Studio AVD `~8.5 GB`) | **`2,640 MB` (`~2.64 GB`)** | **`-1.77 GB` (`-40.2%`, `-69%` от Studio AVD)** |
| **Графика (`OpenGL / GPU`)** | `SwiftShader LLVM` *(медленная программная эмуляция на CPU)* | **Нативный `Apple M4 Pro GPU` (`Metal host`)** | **Плавные карты (Mapbox/Maps) и `0%` нагрузки на CPU** |
| **Время фонового (`-no-window`) старта** | `22.81s` *(холодный старт)* | **`13.79s`** *(готовый `avdslim_clean` Golden Snapshot)* | **Старт в `1.65x` быстрее** |
| **GPS (`location_mode`) и Google Maps** | Работает | **`location_mode=3` (High Accuracy) + Maps сохранены** (защита в `defaults`) | **GPS и `agent-device` работают на 100%** |

---

## 2. Как запускать связку пошагово

### A. Разовая подготовка эмуляторов (`simslim` + `avdslim`)

При создании симулятора или AVD **один раз** применяется безопасный профиль (с сохранением GPS, Push и Universal Links):

```bash
# 1. iOS / tvOS Simulator (Push, Universal Links, Photo Picker и Spotlight остаются рабочими):
simslim on <IOS_UDID> --preserve-boot-state --except web,photos,search --keep com.apple.apsd
simslim doctor <IOS_UDID> --requires push,universal-links,photos,spotlight

# 2. Android AVD (постоянная защита GPS location_mode=3 и Google Maps):
mkdir -p "$HOME/Library/Application Support/avdslim"
printf "%s\n" "--skip=location --keep=com.google.android.apps.maps" > "$HOME/Library/Application Support/avdslim/defaults"
ANDROID_HOME=~/Library/Android/sdk avdslim tune-avd <AVD_NAME>
ANDROID_HOME=~/Library/Android/sdk avdslim bake <AVD_NAME> --headless
```

### B. Повседневный `Stage 1` (Локальная фоновая проверка)

Во время разработки проверяем экраны локально в фоне, не трогая физический телефон по USB:

```bash
# iOS (фоновый запуск без окна, отклик ~197ms):
xcrun simctl boot <IOS_UDID> 2>/dev/null || true
agent-device open <BUNDLE_ID> --platform ios --udid <IOS_UDID> --foreground
agent-device press @e5 --settle
agent-device fill @e8 "Ташкент, Узбекистан" --settle
agent-device close

# Android (Golden Snapshot + Metal GPU в фоне, отклик ~888ms):
ANDROID_HOME=~/Library/Android/sdk avdslim start <AVD_NAME> --headless --no-slim
~/Library/Android/sdk/platform-tools/adb -s emulator-5554 reverse tcp:8081 tcp:8081
agent-device open <PACKAGE_NAME> --platform android --serial emulator-5554 --foreground
agent-device press @e5 --settle
agent-device close
ANDROID_HOME=~/Library/Android/sdk avdslim stop emulator-5554 -f
```

---

## 3. Дополнительные возможности (Pro-практики)

### 1) Запуск Maestro (`.yaml`) E2E-тестов в фоне без Java
Устанавливать отдельный `Maestro` CLI не нужно — обычные `.yaml`-сценарии запускаются напрямую через `agent-device`:

```yaml
# e2e/smoke.yaml
appId: com.example.app
---
- launchApp
- tapOn: "Войти"
- inputText: "901234567"
- tapOn: "Продолжить"
- assertVisible: "Главный экран"
```

```bash
# Прогон одного сценария на фоновом симуляторе:
agent-device replay ./e2e/smoke.yaml --maestro --platform ios --udid <IOS_UDID>

# Параллельный прогон всей папки E2E сразу на iOS и Android:
agent-device test ./e2e --maestro --device <IOS_UDID>,emulator-5554 --shard-all 2
```

### 2) Самовосстанавливающиеся (Self-Healing) `.ad`-скрипты (`--save-script`)
Если после редизайна старый E2E-скрипт упал, вместо ручной правки запустите его с `--save-script`:
- На упавшем шаге AI-агент сам прочитает новое дерево `@ref`, нажмёт нужную кнопку и сохранит исправленный сценарий `<stem>.healed.ad`.

### 3) Видео-доказательство и `contact-sheet` (Визуальный отчёт из фонового теста)
Снять видео фонового прогона и одной командой собрать сетку ключевых кадров (`contact-sheet.png`) с таймкодами смены экранов:

```bash
agent-device record start ./proof.mp4
# ... действия ...
agent-device record stop
agent-device record contact-sheet ./proof.mp4 --out ./proof-frames.png
```

### 4) Очистка места на SSD без удаления приложений и сессий входа
В отличие от `xcrun simctl erase` (который стирает приложения и авторизацию), `simslim disk-clean` безопасно очищает `~1.5 GB` логов и кэша на каждом симуляторе:

```bash
simslim disk-plan <IOS_UDID>
simslim disk-clean --categories caches,logs,temporary --confirm <IOS_UDID>
```
