# 🧩 Практики и Связки Инструментов (Practices)

[🇺🇿 O'zbekcha](../README.md) | [🇬🇧 English](../en/README.md) | **🇷🇺 Русский**

⬅️ [Вернуться в главный каталог (`README.ru.md`)](../../README.ru.md)

В этом разделе собраны готовые **связки скиллов и CLI-инструментов**: что с чем комбинировать, **какую практическую выгоду даёт каждая связка** и какие **скрытые возможности** можно включить без установки лишнего софта (например, запуск Maestro `.yaml` E2E-тестов в фоне без Java, двукратное снижение расхода RAM эмуляторов и независимое кросс-модельное код-ревью).

---

## 📖 Оглавление (Готовые связки и сценарии)

| # | Практика (Руководство) | Связка инструментов (`Что + С чем`) | Главная польза и дополнительные возможности |
|---|---|---|---|
| **1** | [**Фоновый Mobile & TV QA + Maestro E2E Автотесты**](01-mobile-tv-headless-qa.md) | [**`simslim`**](../../reviews/ru/mobile/simslim.md) + [**`avdslim`**](../../reviews/ru/mobile/avdslim.md) + [**`agent-device`**](../../reviews/ru/mobile/agent-device.md) + [**`adb`**](../../reviews/ru/mobile/adb.md) + [**`xcrun simctl`**](../../reviews/ru/mobile/ios-simulator-device-hub.md) + [**`cross-platform-qa`**](../../reviews/ru/mobile/cross-platform-qa.md) | Фоновый запуск эмуляторов iOS (`1.16 GB`) и Android (`2.64 GB`, Metal GPU) без окон на экране (экономия `~3.3 GB` RAM), чистый UTF-8 ввод и **прогон Maestro `.yaml` / `.ad` E2E-сценариев (`--maestro`) и самовосстанавливающихся (`healed.ad`) тестов** без установки Java и Maestro CLI. |
| **2** | [**От Проектирования и Графа до Чистого Кода и Независимого Ревью**](02-spec-to-surgical-code.md) | [**`graphify`**](../../reviews/ru/architecture/graphify.md) + [**`grill-me`**](../../reviews/ru/architecture/grill-me.md) + [**`ponytail`**](../../reviews/ru/architecture/ponytail.md) + [**`karpathy-guidelines`**](../../reviews/ru/architecture/karpathy-guidelines.md) + [**`T3 Code`**](../../reviews/ru/developer-tools/t3-code.md) + [**`elephant-goldfish-model`**](../../reviews/ru/architecture/elephant-goldfish-model.md) | Мгновенный поиск связей в большом репозитории через AST-граф (`0` токенов), проработка решений до кода, минимальный YAGNI diff и независимая проверка другой моделью (*«Codex пишет, Claude/Argon проверяет»*). |
| **3** | [**Дизайн, Анимации и Проверка Web, Mobile Web и Native UI**](03-web-and-mobile-ui-polish.md) | [**`impeccable`**](../../reviews/ru/ui-ux/impeccable.md) + [**`mobile-native`**](../../reviews/ru/mobile/mobile-native.md) + [**`animate-expo`**](../../reviews/ru/mobile/animate-expo.md) + [**`asset-diet`**](../../reviews/ru/developer-tools/assetdiet.md) + [**`agent-desktop`**](../../reviews/ru/developer-tools/agent-desktop.md) | Защита от шаблонных ИИ-интерфейсов, ощущение нативного приложения в мобильном вебе (`dvh`, `safe-area`, инпуты `16px`), `60/120fps` UI-thread анимации в Expo, локальное сжатие медиа и фоновая проверка в Chrome без захвата курсора. |
| **4** | [**Санитаризация Скиллов, White-Box Пентест и Мониторинг Ошибок**](04-skill-and-security-hygiene.md) | [**`tasted-skills`**](../../skills/tasted-skills/SKILL.md) + [**`skillshare`**](../../reviews/ru/developer-tools/skillshare.md) + [**`Shannon` (`hacker-test`)**](../../reviews/ru/backend/shannon.md) + [**`sentry`**](../../reviews/ru/backend/sentry.md) | Проверка исходного кода чужих скиллов и удаление опасных хуков/телеметрии перед установкой (`skillshare audit`), разовый автономный пентест локальных/staging API и разбор боевых ошибок/трейсов в `sentry`. |

---

## 💡 Главные принципы этих связок

1. **Никакого постоянного раздувания контекста (`0` MCP-шума):** Вместо тяжёлых постоянных MCP-серверов (`~7,500+` токенов на каждый шаг) мы комбинируем быстрые CLI (`agent-device`, `agent-desktop`, `simslim`, `avdslim`) и лёгкие on-demand скиллы (`asset-diet`, `hacker-test`).
2. **Экономия ресурсов Mac (`RAM`, `GPU`, `SSD`):** Связка `simslim` + `avdslim` + фоновый (`headless`) режим позволяет гонять Web, iOS и Android параллельно без ухода в глубокий Swap и без перехвата фокуса окон.
3. **Никаких скрытых платных API-вызовов:** Вместо прослоек, вызывающих платные sub-LLM на каждый тап (`ARTEMIS`, `Caveman Auto`), ваш основной coding-агент напрямую управляет компактным `@e1` деревом.
