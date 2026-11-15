# `xcrun simctl` + Xcode `Device Hub` (`devicectl`)

[🇺🇿 O'zbekcha](../../mobile/ios-simulator-device-hub.md) | [🇬🇧 English](../../en/mobile/ios-simulator-device-hub.md) | **🇷🇺 Русский**

- **Источник:** [Apple Xcode Command Line & Simulator Tools (`simctl` / `devicectl`)](https://developer.apple.com/documentation/xcode/interacting-with-simulator-from-the-command-line)
- **Категория:** `Mobile` *(Управление iOS Simulator и реальными iPhone/iPad)*
- **Тип:** `CLI + macOS App Bridge` *(в составе `Xcode.app`)*
- **Оценка качества:** **9.0 / 10**
- **Насколько нужно нам:** **9.5 / 10**
- **Рекомендуемый масштаб:** `Standalone Tool` *(установлен вместе с Xcode + работает в связке с `agent-desktop`)*
- **Используется с:** `2026-10-20`
- **Текущий статус:** `✅ Активен` *(основной инструмент для проверки iOS-приложений на симуляторе и устройствах)*

---

## 1. Что это и как работает?

Официальная цепочка инструментов Apple для фонового запуска, управления и проверки iOS и Expo / React Native приложений на macOS:

1. **`xcrun simctl` (Управление локальным iOS Simulator):**
   - Запуск симулятора: `xcrun simctl boot <SIMULATOR_UDID>`
   - Установка и запуск приложения: `xcrun simctl install` / `xcrun simctl launch <SIMULATOR_UDID> <BUNDLE_ID>`
   - Открытие deep-link (`openurl`), выдача разрешений (`privacy`), снятие скриншотов и видео (`io screenshot`).
2. **Xcode `Device Hub` (`DeviceHub.app`) + `agent-desktop` (Управление внутренним UI):**
   - Входящий в Xcode 26 `Device Hub` (`open -g "/Applications/Xcode.app/Contents/Applications/DeviceHub.app"`) напрямую передаёт дерево внутренних элементов UIKit / React Native запущенного iOS Simulator в систему macOS Accessibility (`AX`).
   - Благодаря этому команда `agent-desktop snapshot --app "Device Hub" --compact` видит каждую кнопку и поле ввода внутри iOS-приложения и нажимает их в фоне (`click`, `set-value`) без движения курсора.
3. **`xcrun devicectl` (Финальная проверка на реальном iPhone/iPad):**
   - Позволяет видеть подключённые по USB физические iOS-устройства (`xcrun devicectl list devices`) и устанавливать/запускать сборку для финальной проверки.

---

## 2. Сильные и слабые стороны

### Сильные стороны
- **100% фоновый (`headless`) UI-тест iOS:** С помощью `open -g` и `agent-desktop` проверяет полные пользовательские сценарии на экранах iOS, не мешая работе пользователя.
- **Не требует сторонних тяжёлых драйверов:** Работает на встроенных возможностях Xcode без подъёма серверов WebDriverAgent или Appium.

### Слабые стороны и важные подводные камни
- **Ловушка `iPhone Mirroring.app`:** Для автоматизированного тестирования нельзя использовать `iPhone Mirroring.app` — он передаёт только видеопоток (`ref_count: 0`, внутренние кнопки недоступны). Всегда нужно использовать `Device Hub` + iOS Simulator.
- Доступен только на macOS при установленном `Xcode.app`.

---

## 3. Безопасность и правила использования

- **Уровень риска:** `Низкий`
- **Обязательные правила:**
  1. **Двухэтапный порядок QA:** При повседневной разработке и отладке используется только локальный Simulator (`simctl` + `Device Hub`); `devicectl` на реальном iPhone применяется только на финальной проверке.
  2. **Запуск окна в фоне:** Открывать `DeviceHub.app` с флагом `open -g`, чтобы не перехватывать фокус окна.
  3. **Запрет `simctl erase` без запроса:** Не сбрасывать данные симулятора без команды пользователя, чтобы не стирать авторизованные сессии.

---

## 4. Совместимость с нашими текущими инструментами

- **`xcrun simctl` и `devicectl`:** Базовый фундамент жизненного цикла iOS/tvOS для [`agent-device`](agent-device.md) и [`cross-platform-qa`](cross-platform-qa.md) (фоновый `boot`/`shutdown` симулятора без окна, выдача разрешений `privacy` и установка сборок на физический iPhone).
- **Xcode `Device Hub` + `agent-desktop`:** Переведены в роль **резерва (`fallback`)** — `Device Hub` требует открытого окна на экране, тогда как [`agent-device`](agent-device.md) работает полностью без окна за `~197ms`.

---

## 5. В каких задачах полезно?

- **Когда использовать:** Фоновый запуск/остановка симуляторов через `xcrun simctl`, выдача разрешений, установка сборок на реальные iPhone/iPad через `devicectl` и резервный доступ через `Device Hub`.
- **Когда не использовать:** Для повседневного прокликивания UI iOS/tvOS (основной инструмент теперь [`agent-device`](agent-device.md)).

---

## 6. История статуса и выполненных действий

| Дата | Действие | Статус | Примечание |
|---|---|---|---|
| 2026-10-20 | Установка `simctl`, `devicectl` и `Device Hub` в составе Xcode | `✅ Активен` | Используется для локального iOS Simulator и проверки на реальных iPhone/iPad. |
| 2026-11-16 | Передача основного UI-управления iOS/tvOS в `agent-device` | `✅ Активен` | `xcrun simctl` (фоновый boot/shutdown) и `devicectl` остаются базой; связка `Device Hub` + `agent-desktop` переведена в резерв (`fallback`). |
