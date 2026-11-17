# 6. Видео-Анализ (`video-analyzer`), Двусторонний Мост Figma (`figma`) и Дополнительные Возможности

[🇺🇿 O'zbekcha](../06-video-figma-and-db-workflows.md) | [🇬🇧 English](../en/06-video-figma-and-db-workflows.md) | **🇷🇺 Русский**

⬅️ [Вернуться к оглавлению практик](README.md)

- **Связка инструментов:** [**video-analyzer**](https://github.com/bsisduck/video-analyzer-skill) + **Figma MCP & Skills** (`figma-implement-design`, `figma-generate-design`, `figma-use`) + [**agent-desktop**](../../reviews/ru/developer-tools/agent-desktop.md) (`agent-desktop-ffi`) + [**graphify**](../../reviews/ru/architecture/graphify.md)
- **Задачи:** Разбор видео-багрепортов, клонирование анимаций и UI-потоков с видео, двусторонняя синхронизация Код <-> Figma и быстрая десктоп-автоматизация.

---

## 1. `video-analyzer` — Не только для конспектов видео (3 мощных сценария)

Так как [`video-analyzer`](https://github.com/bsisduck/video-analyzer-skill) объединяет **распознавание речи (`Whisper`) + покадровое выделение смены сцен (`ffmpeg scene detection` и сетки `3x5` / `4x4`)**, его можно использовать в трёх прикладных задачах:

### 1) Автоматический разбор видео-багрепортов от QA и клиентов (`.mp4`/`.mov`)
Когда тестировщик или пользователь присылает запись экрана со словами *«тут всё ломается»*:
- `video-analyzer` раскладывает ролик по ключевым кадрам смены сцен и точно определяет секунду, экран и текст ошибки, после чего `diagnosing-bugs` + `sentry` находят первопричину в коде.

### 2) Покадровое клонирование анимаций и переходов из референс-приложений (`video-analyzer` + `impeccable` + `animate-expo`)
Чтобы повторить плавный переход или онбординг из другого приложения:
- Запустите `video-analyzer` с частой нарезкой кадров (`5fps`);
- Передайте раскадровку в [**impeccable**](../../reviews/ru/ui-ux/impeccable.md) и [**animate-expo**](../../reviews/ru/mobile/animate-expo.md), чтобы перевести физику движения (`spring`, `stiffness`, `damping`) в код `Reanimated`.

### 3) Разоблачение рекламных Reels и демо-роликов (`video-analyzer` + `tasted-skills`)
При проверке вирусных роликов про «бесплатные AI-инструменты» через [tasted-skills](../../skills/tasted-skills/SKILL.md):
- `video-analyzer` ловит мелькающие на долю секунды плашки (`SELF-REPORTED`), платные ключи в `.env` и склейки ускоренного терминала.

---

## 2. Официальное семейство скиллов `figma` — Двусторонний мост (`Figma ↔ Код`)

Официальный Figma MCP (`mcp.figma.com`) и скиллы (`figma`, `figma-implement-design`, `figma-generate-design`, `figma-generate-library`, `figma-use`) работают **в обе стороны**:

1. **Figma -> Продакшен-код (`figma-implement-design` + `impeccable` + `asset-diet`):**
   - Читает не просто картинку, а точные токены, auto-layout и переменные узла для переноса 1:1, а экспортированные изображения сразу сжимает через `asset-diet`.
2. **Готовый Код -> Экраны в Figma (`figma-generate-design` + `figma-use`):**
   - Если страница уже свёрстана в коде, а макета в Figma нет — агент читает код и секция за секцией собирает редактируемые auto-layout экраны прямо внутри файла Figma.
3. **Кодовая база -> Дизайн-система в Figma (`figma-generate-library` + `figma-use`):**
   - Извлекает цвета, шрифты и токены из CSS/Tailwind или React Native и автоматически строит в Figma Variables (`Light/Dark` темы) и библиотеку компонентов.

---

## 3. Неочевидные возможности `agent-desktop` и `graphify`

### A. `agent-desktop` — Далеко не только для Chrome
- **Фоновое управление любым приложением macOS:** Управляет Postman, Docker Desktop, Finder, Terminal, Telegram Desktop, системными меню (`menubar`, `sheet`, `popover`, `Notification Center`) и Electron-приложениями (`launch --cdp`) без перехвата мыши.
- **`agent-desktop-ffi` (Прямой C-ABI мост):** Если вы пишете собственный инструмент на Python (`ctypes`), Go (`cgo`), Node или Swift, можно подключить `libagent_desktop_ffi.dylib` напрямую без порождения CLI-процесса на каждый шаг.

### B. `graphify` — Не только для исходного кода
- Положите в проект **PDF-спецификации, ТЗ в Markdown, схемы архитектуры (картинки) и записи созвонов**: `graphify` свяжет их с модулями кода в единый граф знаний (`graph.json` + экспорт в Obsidian Vault / Neo4j / интерактивный HTML).
