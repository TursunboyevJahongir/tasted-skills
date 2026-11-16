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

📖 [Какие скиллы и инструменты как использовать вместе, их доп. возможности и **⚖️ Сравнение скиллов и инструментов** →](practices/ru/README.md)

## ⭐ Самые необходимые (В порядке частоты и важности в работе)

<h4><a href="reviews/ru/architecture/grill-me.md">grill-me</a></h4>

<p>Планирование, Решения и Глубокий Debug</p>

<p>Оценка: 9.5/10 · ✅ Активен · Набор скиллов<br>Дата: С 2026-05-23</p>

<details>
<summary>Подробнее</summary>

<p>Проработка требований по дереву решений до кода (<code>grilling</code> + <code>grill-with-docs</code> + <code>domain-modeling</code>) + очищенные on-demand скиллы <strong><code>diagnosing-bugs</code></strong> и <strong><code>improve-codebase-architecture</code></strong> из <code>mattpocock/skills</code>.</p>

</details>

<hr>

<h4><a href="reviews/ru/architecture/graphify.md">graphify</a></h4>

<p>Карта кодовой базы (Knowledge Graph)</p>

<p>Оценка: 9.5/10 · ✅ Активен · Skill + Python CLI<br>Дата: С 2026-07-28</p>

<details>
<summary>Подробнее</summary>

<p>Построение постоянного графа знаний (<code>graph.json</code> + HTML) из кода (локальный AST, <code>0</code> токенов) и документации для мгновенного поиска связей между модулями и файлами.</p>

</details>

<hr>

<h4><a href="reviews/ru/architecture/ponytail.md">ponytail</a></h4>

<p>Минимальный чистый код (YAGNI)</p>

<p>Оценка: 9.5/10 · ✅ Активен · Skill<br>Дата: С 2026-11-15</p>

<details>
<summary>Подробнее</summary>

<p>Базовое правило при написании любого кода: минимальное изменение, полностью решающее задачу, без лишних абстракций, и краткий ответ с первого прочтения.</p>

</details>

<hr>

<h4><a href="reviews/ru/architecture/karpathy-guidelines.md">karpathy-guidelines</a></h4>

<p>Точечные правки кода (Surgical)</p>

<p>Оценка: 9.5/10 · ✅ Активен · Skill<br>Дата: С 2026-11-15</p>

<details>
<summary>Подробнее</summary>

<p>Явное озвучивание допущений, простота и точечные (<code>surgical</code>) правки без затрагивания соседнего рабочего кода.</p>

</details>

<hr>

<h4><a href="reviews/ru/ui-ux/impeccable.md">impeccable</a></h4>

<p>Основной UI/UX дизайн и аудит</p>

<p>Оценка: 9.5/10 · ✅ Активен · Skill<br>Дата: С 2026-11-09</p>

<details>
<summary>Подробнее</summary>

<p>Проектирование, UX/контраст/типографика и полировка (<code>polish</code>, <code>clarify</code>, <code>harden</code>) для веб, мобильного веба и нативных экранов iOS/Android. <strong>💡 Совет:</strong> стоит добавить внутрь правило <strong>перцептивного контраста <code>APCA</code> (<code>|Lc| ≥ 60</code>)</strong>, чтобы <code>WCAG 2</code> (<code>4.5:1</code>) не браковал чистый белый текст на цветных бренд-кнопках (<a href="reviews/ru/ui-ux/impeccable.md#apca-contrast">точные правки</a>).</p>

</details>

<hr>

<h4><a href="reviews/ru/architecture/elephant-goldfish-model.md">elephant-goldfish-model</a></h4>

<p>Независимое Архитектурное и Код-Ревью</p>

<p>Оценка: 9.5/10 · ✅ Активен · Плагин (7 скиллов + 10 агентов)<br>Дата: С 2026-11-15</p>

<details>
<summary>Подробнее</summary>

<p>Архитектор с памятью (<em>Elephant</em>) + субагенты-критики без контекста (<em>Goldfish</em>): <code>egm-drift-report</code> и 5-этапный <code>egm-review</code> находят расхождения документации с кодом и скрытые баги.</p>

</details>

<hr>

<h4><a href="reviews/ru/developer-tools/agent-desktop.md">agent-desktop</a></h4>

<p>Тестирование Web (Chrome) и Desktop UI</p>

<p>Оценка: 9.5/10 · ✅ Активен · CLI + Skill<br>Дата: С 2026-11-15</p>

<details>
<summary>Подробнее</summary>

<p><a href="https://agent-browser.dev/desktop">agent-browser.dev/desktop</a> — фоновое управление Chrome и десктопными приложениями через macOS Accessibility (<code>AX</code>) без перехвата курсора (+ резерв для iOS <code>Device Hub</code>).</p>

</details>

<hr>

<h4><a href="reviews/ru/mobile/agent-device.md">agent-device</a></h4>

<p>Тестирование Mobile и TV (iOS / Android / tvOS) UI</p>

<p>Оценка: 9.5/10 · ✅ Активен · CLI + Skill<br>Дата: С 2026-11-16</p>

<details>
<summary>Подробнее</summary>

<p><a href="https://agent-device.dev">agent-device.dev</a> — 0-dependency CLI от Callstack: управляет фоновым iOS/tvOS Simulator без окна (<code>~197ms</code>) и <code>-no-window</code> Android/TV Emulator (<code>~888ms</code>, в 27x меньше токенов, полный UTF-8 ввод) через <code>@ref</code> и <code>--settle</code> diff (<code>0</code> MCP-раздувания).</p>

</details>

<hr>

<h4><a href="reviews/ru/mobile/cross-platform-qa.md">cross-platform-qa</a></h4>

<p>2-этапный QA для Web / Mobile / TV</p>

<p>Оценка: 9.5/10 · ✅ Активен · Skill<br>Дата: С 2026-11-15</p>

<details>
<summary>Подробнее</summary>

<p>1-й этап — локальная проверка (<code>agent-desktop</code> Web + <code>agent-device</code> фоновые iOS/Android/TV + <code>adb</code>), 2-й этап — финальная проверка на реальном устройстве перед Done.</p>

</details>

<hr>

<h4><a href="reviews/ru/backend/sentry.md">sentry</a></h4>

<p>Full-Stack диагностика ошибок и трейсов</p>

<p>Оценка: 9.5/10 · ✅ Активен · Self-Hosted + Skill / MCP<br>Дата: С 2026-07-08</p>

<details>
<summary>Подробнее</summary>

<p>Диагностика ошибок (<code>Issue Grouping</code>, <code>dSYM</code>/<code>ProGuard</code>, <code>Source Maps</code>), <code>Breadcrumbs</code>, <code>Session Replay</code> и <code>v8+</code> OTel-трейсов с прямым анализом через AI-агентов.</p>

</details>

<hr>

<h4><a href="reviews/ru/developer-tools/skillshare.md">skillshare</a></h4>

<p>Синхронизация скиллов и Безопасность (audit)</p>

<p>Оценка: 9.5/10 · ✅ Активен · CLI + Skill<br>Дата: С 2026-05-30</p>

<details>
<summary>Подробнее</summary>

<p>Синхронизация скиллов и плагинов между всеми AI-агентами (<code>Codex</code>, <code>Claude</code>, <code>Antigravity</code>) из единого источника + встроенный <strong>skill-check (<code>skillshare audit</code>)</strong>.</p>

</details>

<hr>

<h4><a href="reviews/ru/mobile/animate-expo.md">animate-expo</a></h4>

<p>Expo / React Native 60/120fps анимации</p>

<p>Оценка: 9.5/10 · ✅ Активен · Skill<br>Дата: С 2026-11-09</p>

<details>
<summary>Подробнее</summary>

<p>Плавные 60/120fps анимации и жесты в UI-потоке для Expo и React Native на базе <code>Reanimated</code>, <code>Gesture Handler</code> и <code>expo-haptics</code> (с защитой <code>LOCAL-COMPATIBILITY.md</code>).</p>

</details>

<hr>

<h4><a href="reviews/ru/developer-tools/orca.md">Orca + CLI Subagent</a></h4>

<p>Мультиагентная оркестрация и Мобильное управление</p>

<p>Оценка: 9.5/10 · ✅ Активен · Desktop + Mobile App + CLI + Skill<br>Дата: С 2026-11-16</p>

<details>
<summary>Подробнее</summary>

<p>Запуск цепочек <code>Codex</code>, <code>Claude</code> и <code>Antigravity</code> из одного промпта через встроенный <strong><code>orchestration</code></strong> (<code>orca orchestration worker-start</code> DAG) и <code>task-context</code> + CLI-субагенты (<code>argon</code>, <code>antigravity-claude</code>, <code>claude-opus</code>) с живыми карточками в Chat UI + стабильное мобильное приложение <strong><code>Orca IDE</code></strong> и работа при Lock Screen (<code>caffeinate</code>; <code>PostHog</code> отключён).</p>

</details>

<hr>

<h4><a href="reviews/ru/mobile/adb.md">adb</a></h4>

<p>Android проброс портов (reverse) и logcat</p>

<p>Оценка: 9.0/10 · ✅ Активен · CLI<br>Дата: С 2026-09-07</p>

<details>
<summary>Подробнее</summary>

<p>Проброс портов (<code>reverse</code>), <code>logcat</code>, установка APK и низкоуровневое управление на фоновых Android-эмуляторах (<code>-no-window</code>) и реальных телефонах (<code>-s &lt;serial&gt;</code> обязателен).</p>

</details>

<hr>

<h4><a href="reviews/ru/mobile/ios-simulator-device-hub.md">xcrun simctl + Device Hub</a></h4>

<p>Фоновый boot iOS и devicectl</p>

<p>Оценка: 9.0/10 · ✅ Активен · Xcode CLI + App<br>Дата: С 2026-10-20</p>

<details>
<summary>Подробнее</summary>

<p>Фоновый запуск/остановка iOS Simulator без окна (<code>simctl boot/shutdown</code>), установка сборок на реальный iPhone (<code>devicectl</code>) и резерв <code>Device Hub</code>.</p>

</details>

<hr>

<h4><a href="reviews/ru/mobile/simslim.md">simslim</a></h4>

<p>Оптимизатор RAM и диска iOS / tvOS Simulator</p>

<p>Оценка: 9.0/10 · ✅ Активен · Standalone Go CLI<br>Дата: С 2026-11-16</p>

<details>
<summary>Подробнее</summary>

<p>Отключает <code>~149–180</code> лишних фоновых служб симуляторов <code>iOS</code>/<code>tvOS</code> (<code>Siri</code>, <code>Apple Intelligence</code>, <code>Wallpaper</code>): сжимает живой headless-запуск со <code>182 -&gt; 78</code> процессов и <strong><code>2.70 GB -&gt; 1.16 GB</code> RAM (<code>-57%</code>)</strong> (<code>4.0 GB -&gt; 0.9 GB</code> / <code>-77.5%</code> в GUI) и безопасно чистит <code>1.5 GB+</code> логов/кэша без сброса приложений (<code>--except web,photos,search --keep com.apple.apsd</code> сохраняет <code>push</code> и <code>agent-device</code>).</p>

</details>

<hr>

<h4><a href="reviews/ru/mobile/avdslim.md">avdslim</a></h4>

<p>Оптимизатор RAM и Metal GPU для Android AVD</p>

<p>Оценка: 9.0/10 · ✅ Активен · Standalone Go CLI<br>Дата: С 2026-11-16</p>

<details>
<summary>Подробнее</summary>

<p>Оптимизатор RAM и GPU для Android Emulator (<code>AVD</code>): переключает CPU-рендер <code>SwiftShader</code> на <strong>Apple Metal GPU (<code>host</code>)</strong> с <code>-lowram</code> (<code>1536 MB</code>) и Golden Snapshot, снижая память с <strong><code>4.41 GB -&gt; 2.64 GB</code> (<code>-40.2%</code>, <code>-69%</code> от 8.5 GB Studio AVD)</strong> при 100% работе GPS (<code>--skip=location --keep=com.google.android.apps.maps</code>) и <code>agent-device</code>.</p>

</details>

<hr>

<h4><a href="reviews/ru/backend/security-audit-skill.md">security-audit</a></h4>

<p>6-фазный аудит безопасности исходного кода</p>

<p>Оценка: 9.0/10 · ✅ Активен · Skill<br>Дата: С 2026-11-16</p>

<details>
<summary>Подробнее</summary>

<p>6-фазный <em>adversarial</em> аудит безопасности исходного кода от Cloudflare (<code>Hunter</code> + независимые <code>Verifier</code>-субагенты + Node JSON-валидаторы): находит уязвимости в Backend, Web, <strong>Mobile (<code>deep-link</code>/<code>WebView</code>/<code>IPC</code>)</strong>, CLI и CI/CD без Docker (с экономным профилем <code>quick</code>/<code>scoped</code>).</p>

</details>

<hr>

<h4><a href="reviews/ru/mobile/mobile-native.md">mobile-native</a> + web-to-native-mobile</h4>

<p>Mobile Web / PWA и перенос Web->App</p>

<p>Оценка: 8.5/10 · ✅ Активен · Набор скиллов<br>Дата: С 2026-11-15</p>

<details>
<summary>Подробнее</summary>

<p>11 CSS/meta-решений, придающих мобильному вебу и PWA ощущение нативного приложения (<code>dvh/svh</code>, <code>safe-area</code>, инпуты <code>16px</code>, <code>overscroll-behavior</code>, hover gating) + правила переноса веб-фич в мобильное приложение (<code>web-to-native-mobile</code>) и пунктуации UI-сообщений (<code>ui-message-punctuation</code>).</p>

</details>

<hr>

<h4><a href="reviews/ru/developer-tools/assetdiet.md">AssetDiet</a></h4>

<p>Локальное сжатие картинок / SVG / видео / 3D</p>

<p>Оценка: 7.5/10 · ✅ Активен · CLI + <a href="skills/asset-diet/SKILL.md">asset-diet</a><br>Дата: С 2026-11-16</p>

<details>
<summary>Подробнее</summary>

<p>100% локальное сжатие картинок/SVG/видео/3D (<code>Sharp</code>, <code>SVGO</code>, <code>FFmpeg</code>) с откатом. Вместо постоянного 16-tool MCP подключён через наш лёгкий скилл <a href="skills/asset-diet/SKILL.md"><code>asset-diet</code></a> для разового вызова <code>npx assetdiet-mcp@0.1.4</code>.</p>

</details>

<hr>

<h4><a href="practices/ru/06-video-figma-and-db-workflows.md">watch + video-analyzer</a></h4>

<p>Разбор видео, Reels и QA баг-видео</p>

<p>Оценка: 9.0/10 · ✅ Активен · Skill + CLI (yt-dlp + ffmpeg)<br>Дата: С 2026-10-25</p>

<details>
<summary>Подробнее</summary>

<p>Покадровый анализ роликов YouTube, Instagram Reels, Loom и клиентских видео-багрепортов со склейкой транскрипции <code>Whisper</code> и кадров смены сцен (<code>scene-change</code> / <code>5fps</code>).</p>

</details>

<hr>

<h4><a href="practices/ru/06-video-figma-and-db-workflows.md">Набор скиллов figma</a></h4>

<p>Двусторонний мост Figma &lt;-&gt; Код</p>

<p>Оценка: 9.0/10 · ✅ Активен · 6 скиллов + MCP<br>Дата: С 2026-10-20</p>

<details>
<summary>Подробнее</summary>

<p>Вёрстка кода 1:1 по макету (<code>figma-implement-design</code>) и <strong>обратная генерация экранов и дизайн-системы в Figma из готового кода</strong> (<code>figma-generate-design</code>, <code>figma-generate-library</code>, <code>figma-use</code>).</p>

</details>

<hr>

<h4><a href="practices/ru/03-web-and-mobile-ui-polish.md">client-performance-gate</a></h4>

<p>Скорость и recovery в Web / Mobile Web / WebOS</p>

<p>Оценка: 9.0/10 · ✅ Активен · Skill<br>Дата: С 2026-11-10</p>

<details>
<summary>Подробнее</summary>

<p>Проверка клиентских Web, Mobile Web и WebOS TV приложений по матрице <code>1x/6x CPU × fast/constrained/offline</code>, отклику <code>≤200ms</code> и авто-восстановлению качества без перезагрузки страницы <em>(не применяется к админкам)</em>.</p>

</details>

<hr>

<h4><a href="practices/ru/06-video-figma-and-db-workflows.md">drizzle-relations-v2</a></h4>

<p>Схемы и реляции Drizzle ORM v2</p>

<p>Оценка: 8.5/10 · ✅ Активен · Skill<br>Дата: С 2026-11-05</p>

<details>
<summary>Подробнее</summary>

<p>Защищает от устаревшего синтаксиса Drizzle <code>v1 relations()</code>, применяя <code>v2 defineRelations</code> и объектные фильтры <code>where</code>.</p>

</details>

<hr>

## По направлениям

### 🧠 Локальные модели

<h4><a href="reviews/ru/local-models/kimi-k3-in-c.md">kimi-k3-in-c</a></h4>

<p>Назначение: C99-эксперимент потокового чтения MoE-модели Kimi K3 (2.78T / ~104B актив.) прямо с NVMe-диска без GPU.</p>

<p>Качество: 8.5/10 · Нужность: 1.0/10 · ⛔ Отклонено · C99 CLI Engine (2.78T MoE)<br>Дата: 2026-11-16</p>

<details>
<summary>Подробнее</summary>

<p><strong>Назначение:</strong> C99-эксперимент потокового чтения MoE-модели <code>Kimi K3</code> (<code>2.78T</code> / <code>~104B</code> актив.) прямо с NVMe-диска без GPU. <strong>Работает ли для кодинга?</strong> Сама модель <code>Kimi K3</code> сильна в коде и логике, <strong>но в этом disk-stream режиме писать код невозможно</strong> (<code>1 токен = ~24–33 сек</code>, <code>500</code> токенов = <code>~3.5 ч</code> + <code>~50 TB</code> чтения с SSD). <strong>Железо:</strong> Мин.: <code>GPU: 0, RAM: 8–16 GB, SSD: ≥1.8 TB NVMe</code>; Для работы: <code>16× H200 (~2.25 TB VRAM)</code>. <strong>Если нужна локальная модель для кода:</strong> <code>Ollama</code> / <code>MLX</code> (<code>Qwen3-Coder</code>, <code>30–65 ток/с</code> в <code>32–64 GB</code> RAM на Mac). 📊 <a href="https://github.com/FareedKhan-dev/kimi-k3-in-c">GitHub Benchmark</a> · <a href="https://artificialanalysis.ai/leaderboards/models">Artificial Analysis</a></p>

</details>

<hr>

<h4><a href="reviews/ru/local-models/minimax-m3-1-flash.md">MiniMax-M3.1-Flash <em>(Локально)</em></a></h4>

<p>Назначение: Быстрая мультимодальная (текст + фото + видео, 1M контекст) модель для чатов, OCR/анализа фото и видео и офисной автоматизации (Automation-Bench: 62.8%).</p>

<p>Качество: 8.0/10 · Нужность: 1.0/10 · ⛔ Отклонено · Open-Weight 428B MoE (~23B актив.)<br>Дата: 2026-11-16</p>

<details>
<summary>Подробнее</summary>

<p><strong>Назначение:</strong> Быстрая мультимодальная (<code>текст + фото + видео</code>, <code>1M</code> контекст) модель для чатов, <code>OCR</code>/анализа фото и видео и офисной автоматизации (<code>Automation-Bench: 62.8%</code>). <strong>Работает ли для кодинга?</strong> Подходит для простых скриптов и UI/автоматизации, но не для сложной репозиторной разработки (<code>Terminal-Bench 4.0: 38.1%</code>). <strong>Железо:</strong> Веса <code>~250–285 GB</code> не помещаются на обычный ПК (<code>Мин.: 512 GB Mac Studio</code>, для работы: <code>8× H100 / 640 GB VRAM</code>). <strong>Альтернатива:</strong> Локально — <code>Ollama</code> / <code>MLX</code> (<code>Qwen3-Coder</code>); если нужна именно эта модель — <a href="reviews/ru/external-apis/minimax-m3-1-flash-api.md">🔌 <code>MiniMax M3.1 Flash API</code></a>. 📊 <a href="https://huggingface.co/MiniMaxAI/MiniMax-M3.1-Flash">HuggingFace</a> · <a href="https://openrouter.ai/minimax/minimax-m3.1-flash">OpenRouter Stats</a></p>

</details>

<hr>

### 🔌 Внешние API

<h4><a href="reviews/ru/external-apis/minimax-m3-1-flash-api.md">MiniMax M3.1 Flash API</a></h4>

<p>Назначение: Очень дешёвый ($0.15 / $0.60, Cached: $0.015) и быстрый (170+ ток/с, окно 1M) мультимодальный API для массовых ботов в бэкенде, переводов, OCR/анализа фото и видео и SaaS-автоматизации.</p>

<p>Качество: 8.0/10 · Нужность: 5.0/10 · 👍 Хороший вариант · Cloud Multimodal API (MiniMax / OpenRouter)<br>Дата: 2026-11-16</p>

<details>
<summary>Подробнее</summary>

<p><strong>Назначение:</strong> Очень дешёвый (<code>$0.15 / $0.60</code>, <code>Cached: $0.015</code>) и быстрый (<code>170+ ток/с</code>, окно <code>1M</code>) мультимодальный API для массовых ботов в бэкенде, переводов, <code>OCR</code>/анализа фото и видео и SaaS-автоматизации. <strong>Работает ли для кодинга?</strong> Работает для простых скриптов и вспомогательной автоматизации, но не для сложной архитектуры проекта (<code>Terminal-Bench 4.0: 38.1%</code>). <em>(Использовать только через платный Zero-Retention API; не отправлять закрытый код в <code>:free</code>).</em> 📊 <a href="https://openrouter.ai/minimax/minimax-m3.1-flash">OpenRouter Stats</a> · <a href="https://huggingface.co/MiniMaxAI/MiniMax-M3.1-Flash">HuggingFace Benchmarks</a> · <a href="https://artificialanalysis.ai/leaderboards/models">Artificial Analysis</a></p>

</details>

<hr>

### 🌐 Web

<h4><a href="reviews/ru/web/taste-skill.md">taste-skill v2.5</a></h4>

<p>Сильный движок для промо-лендингов с нуля; при установке обязательно вырезать Stop хук (600с) и ставить только локально (-p).</p>

<p>Качество: 8.0/10 · Нужность: 4.0/10 · 👍 Хороший вариант · Landing Kit + Hook<br>Дата: 2026-11-15</p>

<details>
<summary>Подробнее</summary>

<p>Сильный движок для промо-лендингов с нуля; при установке обязательно вырезать <code>Stop</code> хук (600с) и ставить только локально (<code>-p</code>).</p>

</details>

<hr>

<h4><a href="reviews/ru/web/vercel-ui-sdk.md">vercel-labs/ui</a></h4>

<p>Headless UI-библиотека Vercel Labs в стадии Public Beta и скилл ui-sdk: заявленное «управление в 2 раза быстрее без скриншотов» (createAgent) работает только на сайтах, переписанных на @ui-sdk/* (не видит обычные &lt;button&gt;/&lt;input&gt; и Shadcn/Radix, нет поддержки Expo).</p>

<p>Качество: 8.0/10 · Нужность: 2.0/10 · ⛔ Отклонено · @ui-sdk/* Library + Skill (Beta)<br>Дата: 2026-11-16</p>

<details>
<summary>Подробнее</summary>

<p>Headless UI-библиотека Vercel Labs в стадии Public Beta и скилл <code>ui-sdk</code>: заявленное <em>«управление в 2 раза быстрее без скриншотов»</em> (<code>createAgent</code>) работает только на сайтах, переписанных на <code>@ui-sdk/*</code> (не видит обычные <code>&lt;button&gt;</code>/<code>&lt;input&gt;</code> и <code>Shadcn</code>/<code>Radix</code>, нет поддержки <code>Expo</code>). <strong>Вместо него:</strong> наш текущий UI-стек + <a href="reviews/ru/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a> + <a href="reviews/ru/developer-tools/agent-desktop.md"><strong><code>agent-desktop</code></strong></a>.</p>

</details>

<hr>

### 📱 Mobile

<h4><a href="reviews/ru/mobile/swiftui-agent-skill.md">swiftui-agent-skill</a></h4>

<p>Чистый SwiftUI и Apple HIG; так как основной стек у нас Expo / React Native, нужен только локально (-p) для нативных SwiftUI-модулей (Widgets / Live Activities).</p>

<p>Качество: 8.5/10 · Нужность: 3.0/10 · 👍 Хороший вариант · Skill (twostraws / AvdLee / apple-design)<br>Дата: 2026-11-16</p>

<details>
<summary>Подробнее</summary>

<p>Чистый SwiftUI и Apple HIG; так как основной стек у нас Expo / React Native, нужен только локально (<code>-p</code>) для нативных SwiftUI-модулей (Widgets / Live Activities). <strong>Вместо него:</strong> <a href="reviews/ru/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a> (<code>reference/ios.md</code>) + <a href="reviews/ru/mobile/animate-expo.md"><strong><code>animate-expo</code></strong></a>.</p>

</details>

<hr>

<h4><a href="reviews/ru/mobile/artemis.md">ARTEMIS</a></h4>

<p>Автономный Android QA-движок от Google (силён на кастомных Canvas/игровых экранах за счёт OCR + пиксельного зрения), но использование платное (требуется отдельный платный LLM API-ключ в .env), только Android (нет iOS/tvOS) и 3–40s на шаг.</p>

<p>Качество: 8.5/10 · Нужность: 2.5/10 · 👍 Хороший вариант · Python CLI / SDK + MCP (google/artemis)<br>Дата: 2026-11-16</p>

<details>
<summary>Подробнее</summary>

<p>Автономный Android QA-движок от Google (силён на кастомных <code>Canvas</code>/игровых экранах за счёт OCR + пиксельного зрения), но <strong>использование платное</strong> (требуется отдельный платный LLM API-ключ в <code>.env</code>), только Android (нет <code>iOS</code>/<code>tvOS</code>) и <code>3–40s</code> на шаг. <strong>Вместо него:</strong> <a href="reviews/ru/mobile/agent-device.md"><strong><code>agent-device</code></strong></a> (<code>$0</code> доплат за API, <code>iOS + Android + TV</code>, <code>197–888 ms</code>).</p>

</details>

<hr>

<h4><a href="reviews/ru/mobile/mobile-mcp.md">mobile-mcp</a></h4>

<p>Протестировано вживую и отклонено: ~7,580 токенов постоянного раздувания MCP-схемы на каждый ход, в 6.5x–37x медленнее agent-device (7.3s iOS, 5.8s Android), телеметрия Scarf + PostHog и реклама облака mobilenext.ai.</p>

<p>Качество: 7.0/10 · Нужность: 2.0/10 · ⛔ Отклонено · MCP Server (34 tool)<br>Дата: 2026-11-16</p>

<details>
<summary>Подробнее</summary>

<p>Протестировано вживую и отклонено: <code>~7,580</code> токенов постоянного раздувания MCP-схемы на каждый ход, в <code>6.5x–37x</code> медленнее <code>agent-device</code> (<code>7.3s</code> iOS, <code>5.8s</code> Android), телеметрия <code>Scarf</code> + <code>PostHog</code> и реклама облака <code>mobilenext.ai</code>. <strong>Вместо него:</strong> <a href="reviews/ru/mobile/agent-device.md"><strong><code>agent-device</code></strong></a> + <a href="reviews/ru/mobile/adb.md"><strong><code>adb</code></strong></a>.</p>

</details>

<hr>

### 🎨 UI/UX

<h4><a href="reviews/ru/ui-ux/animate.md">animate</a></h4>

<p>Скилл веб-анимаций от Эмиля Ковальски; конфликтует по auto-trigger и правилам с нашей системой.</p>

<p>Качество: 8.5/10 · Нужность: 3.0/10 · ⛔ Отклонено · Skill (2 файла)<br>Дата: 2026-11-15</p>

<details>
<summary>Подробнее</summary>

<p>Скилл веб-анимаций от Эмиля Ковальски; конфликтует по auto-trigger и правилам с нашей системой. <strong>Вместо него:</strong> <a href="reviews/ru/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a> (<code>animate</code>) + <a href="reviews/ru/mobile/animate-expo.md"><strong><code>animate-expo</code></strong></a>.</p>

</details>

<hr>

<h4><a href="reviews/ru/ui-ux/unslop.md">unslop</a></h4>

<p>9-проходный скилл очистки AI/vibecoded веб-экранов от @heydamir (CC-BY-4.0); только для Web и конфликтует по auto-trigger.</p>

<p>Качество: 8.5/10 · Нужность: 2.5/10 · ⛔ Отклонено · Skill + Playwright скрипты<br>Дата: 2026-11-16</p>

<details>
<summary>Подробнее</summary>

<p>9-проходный скилл очистки AI/vibecoded веб-экранов от <code>@heydamir</code> (<code>CC-BY-4.0</code>); только для Web и конфликтует по auto-trigger. <strong>Вместо него:</strong> <a href="reviews/ru/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a> (<code>craft-floor</code> + <code>polish</code> / <code>quieter</code> / <code>clarify</code>).</p>

</details>

<hr>

<h4><a href="reviews/ru/ui-ux/break-ui.md">break-ui</a></h4>

<p>Стресс-тест UI экстремальными данными; добавляет временные фикстуры/переключатели в проект и останавливается без фикса.</p>

<p>Качество: 8.0/10 · Нужность: 3.0/10 · ⛔ Отклонено · Skill (2 файла)<br>Дата: 2026-11-15</p>

<details>
<summary>Подробнее</summary>

<p>Стресс-тест UI экстремальными данными; добавляет временные фикстуры/переключатели в проект и останавливается без фикса. <strong>Вместо него:</strong> <a href="reviews/ru/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a> (<code>harden</code>).</p>

</details>

<hr>

<h4><a href="reviews/ru/ui-ux/make-interfaces-feel-better.md">make-interfaces-feel-better</a></h4>

<p>Протестировано и удалено (из-за конфликта auto-trigger и громоздких таблиц отчётов).</p>

<p>Качество: 7.5/10 · Нужность: 2.5/10 · ⛔ Отклонено · Skill (6 файлов)<br>Дата: 2026-10-31 → 2026-11-15</p>

<details>
<summary>Подробнее</summary>

<p>Протестировано и удалено (из-за конфликта auto-trigger и громоздких таблиц отчётов). <strong>Вместо него:</strong> <a href="reviews/ru/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a> + <a href="reviews/ru/mobile/animate-expo.md"><strong><code>animate-expo</code></strong></a>.</p>

</details>

<hr>

<h4><a href="reviews/ru/ui-ux/ui-ux-pro-max.md">ui-ux-pro-max</a></h4>

<p>Слабее impeccable и конфликтует с ним по auto-trigger.</p>

<p>Качество: 7.0/10 · Нужность: 3.5/10 · ⛔ Отклонено · Skill + CSV/Python<br>Дата: 2026-11-15</p>

<details>
<summary>Подробнее</summary>

<p>Слабее <code>impeccable</code> и конфликтует с ним по auto-trigger. <strong>Вместо него:</strong> <a href="reviews/ru/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a>.</p>

</details>

<hr>

### 🏗️ Архитектура и Ревью

<h4><a href="reviews/ru/architecture/addy-agent-skills.md">addy-agent-skills</a></h4>

<p>Полный SDLC-конвейер от Эдди Османи (/spec -&gt; /ship); обязательный TDD и паузы doubt-driven создают лишние циклы.</p>

<p>Качество: 8.0/10 · Нужность: 2.5/10 · ⛔ Отклонено · Плагин (25 скиллов + 9 команд)<br>Дата: 2026-11-16</p>

<details>
<summary>Подробнее</summary>

<p>Полный SDLC-конвейер от Эдди Османи (<code>/spec -&gt; /ship</code>); обязательный TDD и паузы <code>doubt-driven</code> создают лишние циклы. <strong>Вместо него:</strong> <a href="reviews/ru/architecture/grill-me.md"><strong><code>grill-me</code></strong></a> + <a href="reviews/ru/architecture/ponytail.md"><strong><code>ponytail</code></strong></a> + <a href="reviews/ru/architecture/elephant-goldfish-model.md"><strong><code>elephant-goldfish-model</code></strong></a>.</p>

</details>

<hr>

<h4><a href="reviews/ru/architecture/agency-agents.md">agency-agents</a></h4>

<p>283 ролевых .md промпта в 18 отделах (~18.5K токенов раздувания frontmatter и чужие остатки copy-paste).</p>

<p>Качество: 6.5/10 · Нужность: 2.5/10 · ⛔ Отклонено · 283 persona-промпта + installer<br>Дата: 2026-11-16</p>

<details>
<summary>Подробнее</summary>

<p>283 ролевых <code>.md</code> промпта в 18 отделах (<code>~18.5K</code> токенов раздувания frontmatter и чужие остатки copy-paste). <strong>Вместо него:</strong> <a href="reviews/ru/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a>, <a href="reviews/ru/architecture/ponytail.md"><strong><code>ponytail</code></strong></a>, <a href="reviews/ru/architecture/elephant-goldfish-model.md"><strong><code>elephant-goldfish-model</code></strong></a>, <a href="reviews/ru/mobile/cross-platform-qa.md"><strong><code>cross-platform-qa</code></strong></a>.</p>

</details>

<hr>

<h4><a href="reviews/ru/architecture/superpowers.md">superpowers</a></h4>

<p>Протестировано и удалено: лишние размышления (SessionStart хук), ненужные вопросы brainstorming (альтернатива: grill-me), медленные циклы субагентов и принудительный TDD (2x лишней работы для Web/Mobile/Backend).</p>

<p>Качество: 6.5/10 · Нужность: 2.0/10 · ⛔ Отклонено · Плагин (14 скиллов + хук)<br>Дата: 2026-04-04 → 2026-09-01</p>

<details>
<summary>Подробнее</summary>

<p>Протестировано и удалено: лишние размышления (<code>SessionStart</code> хук), ненужные вопросы <code>brainstorming</code> (альтернатива: <code>grill-me</code>), медленные циклы субагентов и принудительный TDD (2x лишней работы для Web/Mobile/Backend).</p>

</details>

<hr>

### ⚙️ Backend

<h4><a href="reviews/ru/backend/opentelemetry.md">opentelemetry</a></h4>

<p>Отраслевой стандарт межсервисных Traces + Metrics + Logs и метрик серверов/БД (требует Collector + SigNoz/Grafana).</p>

<p>Качество: 9.0/10 · Нужность: 4.0/10 · 👍 Хороший вариант · Стандарт + Collector (SigNoz / Grafana)<br>Дата: 2026-11-15</p>

<details>
<summary>Подробнее</summary>

<p>Отраслевой стандарт межсервисных <code>Traces + Metrics + Logs</code> и метрик серверов/БД (требует <code>Collector + SigNoz/Grafana</code>). <strong>Вместо него:</strong> <a href="reviews/ru/backend/sentry.md"><strong><code>sentry</code></strong></a> (закрывает ошибки, реплеи и базовые трейсы в одной платформе).</p>

</details>

<hr>

<h4><a href="reviews/ru/backend/shannon.md">Shannon</a></h4>

<p>Автономный White-Box AI-пентестер (Auth bypass, IDOR, Injection, XSS, SSRF).</p>

<p>Качество: 8.5/10 · Нужность: 6.5/10 · 👍 Хороший вариант · Standalone CLI + <a href="skills/hacker-test/SKILL.md">hacker-test</a><br>Дата: 2026-11-16</p>

<details>
<summary>Подробнее</summary>

<p>Автономный White-Box AI-пентестер (Auth bypass, IDOR, Injection, XSS, SSRF). Вместо тяжёлого плагина вызывается по запросу через наш лёгкий скилл <a href="skills/hacker-test/SKILL.md"><code>hacker-test</code></a> и <code>npx</code> строго на local/staging (не на production).</p>

</details>

<hr>

### 🛠️ Developer Tools и Memory

<h4><a href="reviews/ru/developer-tools/skillspector.md">SkillSpector</a></h4>

<p>Сканер безопасности AI-скиллов и MCP от NVIDIA (AST + YARA + OSV + LLM).</p>

<p>Качество: 9.0/10 · Нужность: 3.5/10 · ⛔ Отклонено · Python CLI + MCP + Skill<br>Дата: 2026-11-16</p>

<details>
<summary>Подробнее</summary>

<p>Сканер безопасности AI-скиллов и MCP от NVIDIA (<code>AST + YARA + OSV + LLM</code>). Не устанавливали, чтобы не плодить лишний цикл — <strong>Вместо него:</strong> <a href="reviews/ru/developer-tools/skillshare.md"><strong><code>skillshare</code></strong></a> (skill-check <code>skillshare audit</code>) + <strong>прямая проверка кода через AI-агента</strong>.</p>

</details>

<hr>

<h4><a href="reviews/ru/developer-tools/t3-code.md">T3 Code</a></h4>

<p>Использовался и удалён (освобождено ~3.87 GB): мобильное бета-приложение часто отключается при блокировке телефона, сессии рвутся при Lock Screen на Mac и нет встроенных карточек воркеров в Chat UI.</p>

<p>Качество: 8.5/10 · Нужность: 2.5/10 · ⛔ Отклонено · Desktop App + CLI Subagent Workflow<br>Дата: 2026-10-23 → 2026-11-16</p>

<details>
<summary>Подробнее</summary>

<p>Использовался и удалён (освобождено <code>~3.87 GB</code>): мобильное бета-приложение часто отключается при блокировке телефона, сессии рвутся при <code>Lock Screen</code> на Mac и нет встроенных карточек воркеров в Chat UI. <strong>Вместо него:</strong> <a href="reviews/ru/developer-tools/orca.md"><strong><code>Orca</code> (<code>stablyai/orca</code>)</strong></a>.</p>

</details>

<hr>

<h4><a href="reviews/ru/developer-tools/caveman.md">caveman</a></h4>

<p>Режим сверхкратких ответов в терминале на базе ASD-STE100 (SKILL.md); при установке брать только очищенный одиночный SKILL.md (disable-model-invocation: true) без телеметрии @caveman-ai/cli и хуков plugin.json.</p>

<p>Качество: 8.0/10 · Нужность: 3.5/10 · 👍 Хороший вариант · Skill <em>(+ опц. CLI/Proxy)</em><br>Дата: 2026-11-16</p>

<details>
<summary>Подробнее</summary>

<p>Режим сверхкратких ответов в терминале на базе <code>ASD-STE100</code> (<code>SKILL.md</code>); при установке брать только очищенный одиночный <code>SKILL.md</code> (<code>disable-model-invocation: true</code>) без телеметрии <code>@caveman-ai/cli</code> и хуков <code>plugin.json</code>. <strong>Вместо него:</strong> <a href="reviews/ru/architecture/ponytail.md"><strong><code>ponytail</code></strong></a> (сжимает и текст ответа, и лишний код/diff).</p>

</details>

<hr>

<h4><a href="reviews/ru/developer-tools/humanizer-stop-slop.md">humanizer + stop-slop</a></h4>

<p>Редакторы статей и эссе от штампов ИИ (humanizer весит ~32 KB); не для кода и не для продуктового UI.</p>

<p>Качество: 7.5/10 · Нужность: 2.0/10 · ⛔ Отклонено · Skill (Markdown)<br>Дата: 2026-11-16</p>

<details>
<summary>Подробнее</summary>

<p>Редакторы статей и эссе от штампов ИИ (<code>humanizer</code> весит <code>~32 KB</code>); не для кода и не для продуктового UI. <strong>Вместо них:</strong> <a href="reviews/ru/architecture/ponytail.md"><strong><code>ponytail</code></strong></a> + <a href="reviews/ru/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a> (<code>clarify</code>).</p>

</details>

<hr>

<h4><a href="reviews/ru/developer-tools/claude-code-setup.md">claude-code-setup</a></h4>

<p>Официальный read-only рекомендатель стартовых секций CLAUDE.md, хуков и MCP-серверов под проект.</p>

<p>Качество: 7.5/10 · Нужность: 2.0/10 · ⛔ Отклонено · Плагин (Recommender Skill)<br>Дата: 2026-11-16</p>

<details>
<summary>Подробнее</summary>

<p>Официальный read-only рекомендатель стартовых секций <code>CLAUDE.md</code>, хуков и MCP-серверов под проект. <strong>Вместо него:</strong> <a href="reviews/ru/developer-tools/skillshare.md"><strong><code>skillshare</code></strong></a>.</p>

</details>

<hr>

<h4><a href="reviews/ru/developer-tools/omniroute.md">OmniRoute</a></h4>

<p>Локальный LLM reverse-proxy (localhost:20128); его 44 скилла — лишь мануалы прокси, дефолтный роутинг рвёт длинные сессии (#7287) и понижает модель, а TLS-stealth (wreq-js) несёт риск бана подписок по ToS.</p>

<p>Качество: 7.5/10 · Нужность: 2.0/10 · ⛔ Отклонено · Local Proxy + 44 админ-скилла<br>Дата: 2026-11-16</p>

<details>
<summary>Подробнее</summary>

<p>Локальный LLM reverse-proxy (<code>localhost:20128</code>); его 44 скилла — лишь мануалы прокси, дефолтный роутинг рвёт длинные сессии (<code>#7287</code>) и понижает модель, а TLS-stealth (<code>wreq-js</code>) несёт риск бана подписок по ToS. <strong>Вместо него:</strong> <a href="reviews/ru/developer-tools/orca.md"><strong><code>Orca</code></strong></a> + <a href="reviews/ru/architecture/ponytail.md"><strong><code>ponytail</code></strong></a>.</p>

</details>

<hr>

<details>
<summary>Подключить глобальные скиллы <code>tasted-skills</code>, <code>hacker-test</code> и <code>asset-diet</code></summary>

```bash
skillshare install TursunboyevJahongir/tasted-skills -s tasted-skills -s hacker-test -s asset-diet -g && skillshare sync -g
```

</details>

