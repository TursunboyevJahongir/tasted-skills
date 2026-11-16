# 6. Видео-Анализ (`watch`), Двусторонний Мост Figma (`figma`) и Нестандартные Возможности

[🇺🇿 O'zbekcha](../06-video-figma-and-db-workflows.md) | [🇬🇧 English](../en/06-video-figma-and-db-workflows.md) | **🇷🇺 Русский**

⬅️ [Вернуться к оглавлению практик](README.md)

- **Связка инструментов:** `watch` (`video-analyzer`) + `figma` (`figma-implement-design`, `figma-generate-design`, `figma-use`) + [**`agent-desktop`**](../../reviews/ru/developer-tools/agent-desktop.md) (`agent-desktop-ffi`) + [**`graphify`**](../../reviews/ru/architecture/graphify.md) + `drizzle-relations-v2`
- **Задачи:** Разбор видео-багрепортов, клонирование анимаций и UI-потоков с видео, двусторонняя синхронизация Код <-> Figma и быстрая десктоп-автоматизация.

---

## 1. `watch` (`video-analyzer`) — Не только для пересказа YouTube (3 мощных сценария)

Так как `watch` объединяет **распознавание речи (`Whisper`/субтитры) + покадровое выделение смены сцен (`ffmpeg scene detection`)**, его можно использовать в трёх нестандартных задачах:

### 1) Автоматический разбор видео-багрепортов от QA и клиентов (`.mp4`/`.mov`)
Когда тестировщик или пользователь присылает запись экрана из Telegram со словами *«тут всё ломается»*:
- `watch` раскладывает ролик по смене кадров (`frames-selected/` + `scene_index.csv`) и точно определяет секунду, экран и текст ошибки, после чего `diagnosing-bugs` + `sentry` находят первопричину в коде.

### 2) Покадровое клонирование анимаций и переходов из референс-приложений (`watch` + `impeccable` + `animate-expo`)
Чтобы повторить плавный переход или онбординг из другого приложения:
- Запустите `watch` с частой нарезкой кадров (`5fps`);
- Передайте раскадровку в [**`impeccable`**](../../reviews/ru/ui-ux/impeccable.md) и [**`animate-expo`**](../../reviews/ru/mobile/animate-expo.md), чтобы перевести физику движения (`spring`, `stiffness`, `damping`) в код `Reanimated`.

### 3) Разоблачение рекламных Reels и демо-роликов (`watch` + `tasted-skills`)
При проверке вирусных роликов про «бесплатные AI-инструменты» через [`tasted-skills`](../../skills/tasted-skills/SKILL.md):
- `watch` ловит мелькающие на долю секунды плашки (`SELF-REPORTED`), платные ключи в `.env` и склейки ускоренного терминала.

---

## 2. Семейство скиллов `figma` — Двусторонний мост (`Figma ↔ Код`)

Установленные 5 скиллов (`figma`, `figma-implement-design`, `figma-generate-design`, `figma-generate-library`, `figma-use`) работают **в обе стороны**:

1. **Figma -> Продакшен-код (`figma-implement-design` + `impeccable` + `asset-diet`):**
   - Читает не просто картинку, а точные токены, auto-layout и переменные узла для переноса 1:1, а экспортированные изображения сразу сжимает через `asset-diet`.
2. **Готовый Код -> Экраны в Figma (`figma-generate-design` + `figma-use`):**
   - Если страница уже свёрстана в коде, а макета в Figma нет — агент читает код и секция за секцией собирает редактируемые auto-layout экраны прямо внутри файла Figma.
3. **Кодовая база -> Дизайн-система в Figma (`figma-generate-library` + `figma-use`):**
   - Извлекает цвета, шрифты и токены из CSS/Tailwind или React Native и автоматически строит в Figma Variables (`Light/Dark` темы) и библиотеку компонентов.

---

## 3. Неочевидные возможности `agent-desktop`, `graphify` и `drizzle-relations-v2`

### A. `agent-desktop` — Далеко не только для Chrome
- **Фоновое управление любым приложением macOS:** Управляет Postman, Docker Desktop, Finder, Terminal, Telegram Desktop, системными меню (`menubar`, `sheet`, `popover`, `Notification Center`) и Electron-приложениями (`launch --cdp`) без перехвата мыши.
- **`agent-desktop-ffi` (Прямой C-ABI мост):** Если вы пишете собственный инструмент на Python (`ctypes`), Go (`cgo`), Node или Swift, можно подключить `libagent_desktop_ffi.dylib` напрямую без порождения CLI-процесса на каждый шаг.

### B. `graphify` — Не только для исходного кода
- Положите в проект **PDF-спецификации, ТЗ в Markdown, схемы архитектуры (картинки) и записи созвонов**: `graphify` свяжет их с модулями кода в единый граф знаний (`graph.json` + экспорт в Obsidian Vault / Neo4j / интерактивный HTML).

### C. `drizzle-relations-v2` — Чистая миграция Drizzle ORM на v2
- Не даёт моделям писать устаревший синтаксис связей Drizzle `v1`, сразу применяя актуальный `defineRelations` и реляционные фильтры `v2`.
