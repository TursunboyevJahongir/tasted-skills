# 3. Дизайн, Анимации и Проверка Web, Mobile Web и Native UI

[🇺🇿 O'zbekcha](../03-web-and-mobile-ui-polish.md) | [🇬🇧 English](../en/03-web-and-mobile-ui-polish.md) | **🇷🇺 Русский**

⬅️ [Вернуться к оглавлению практик](README.md)

- **Связка инструментов:** [**`impeccable`**](../../reviews/ru/ui-ux/impeccable.md) + [**`mobile-native`**](../../reviews/ru/mobile/mobile-native.md) + [**`animate-expo`**](../../reviews/ru/mobile/animate-expo.md) + [**`asset-diet`**](../../reviews/ru/developer-tools/assetdiet.md) + [**`agent-desktop`**](../../reviews/ru/developer-tools/agent-desktop.md)
- **Проекты:** Функциональные веб-приложения, админ-панели, Telegram Mini Apps / PWA и экраны Expo / React Native.

---

## 1. Зачем использовать их в связке? (Общая выгода)

Один UI-скилл не закрывает все уровни качества интерфейса:
- Дизайн-скилл (`impeccable`) выстраивает иерархию, цвета и типографику, но без специализированных правил не решит скачки `100vh` в iOS Safari или физику жестов в UI-потоке `Reanimated`;
- Несжатые PNG/SVG/видео тормозят загрузку;
- Без проверки в реальном браузере легко пропустить съехавшую вёрстку.

---

## 2. Как запускать связку по уровням

### 1) Визуальная иерархия, UX-тексты и граничные состояния (`impeccable`)
- При создании или доработке экрана вызываются целевые режимы `impeccable`:
  - **`polish` / `quieter` / `bolder`:** Убирают визуальный шум или усиливают акценты;
  - **`clarify`:** Делают подписи кнопок, формы и сообщения об ошибках короткими и понятными;
  - **`harden`:** Проверяют длинные строки (`line-clamp`), пустые состояния (`empty state`), медленную сеть и восстановление после ошибок.

### 2) Нативное поведение платформы (`mobile-native` vs `animate-expo`)
- **Для Mobile Web / PWA / Mini Apps (`impeccable` + `mobile-native`):**
  - Включает `100dvh/svh`, отступы `env(safe-area-inset-*)` под вырез/Dynamic Island, шрифт `>=16px` в инпутах (защита от авто-зума iOS Safari), `@media (hover: hover)` и `overscroll-behavior`.
- **Для Expo / React Native (`impeccable` + `animate-expo`):**
  - Реализует отклик нажатий (`scale` + `expo-haptics`), переходы экранов и шторки в **UI-потоке (`worklet`)** через `Reanimated` и `Gesture Handler`.

### 3) Локальное сжатие медиа-ассетов (`asset-diet`)
Перед PR или релизом сжимает новые картинки, SVG, видео и 3D-модели локально с `0` постоянного MCP-шума:
- Скилл `asset-diet` по запросу запускает `npx assetdiet-mcp@0.1.4` (`Sharp`, `SVGO`, `FFmpeg`, `glTF-Transform`) с возможностью отката (`rollback`), уменьшая вес файлов на `50–80%`.

### 4) Фоновая проверка в браузере без захвата курсора (`agent-desktop`)
После правок проверяет живую страницу в открытом окне `Google Chrome` через macOS Accessibility (`AX`), не уводя фокус окна:
```bash
agent-desktop snapshot --app "Google Chrome" --skeleton -i --compact
agent-desktop click @<snapshot_id>:e12
```

---

## 3. Дополнительные возможности

- **Сборка промо-лендингов с нуля и полный веб-редизайн без потерь ([`Hallmark v2`](../../reviews/ru/web/hallmark.md) — по необходимости через `-p` / `/hallmark`):** Для ежедневных продуктовых и мобильных экранов основным остается `impeccable`, а когда нужно собрать новый лендинг или обновить старую веб-страницу без потери ссылок и форм (`sloplint --before/--kept`), точечно подключается `Hallmark v2` (`50` готовых тем + `755` лицензированных фото + `capture.mjs`).
- **Перенос веб-функций в мобильное приложение (`web-to-native-mobile` + `impeccable`):** Перед переносом широкой десктопной таблицы или фильтра на телефон помогает решить, что оставить на виду (`Keep visible`), что переделать в шторку (`Redesign` / `Relocate`), а что убрать.
- **Предрелизный контроль FPS и адаптивности (`client-performance-gate`):** Для клиентских веб/мобильных/WebOS приложений (кроме админ-панелей) проверяет плавность и деградацию при замедлении CPU/сети.
