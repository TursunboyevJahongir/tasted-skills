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

<table width="100%">
  <thead>
    <tr>
      <th align="center" width="5%">#</th>
      <th align="left" width="18%">Название</th>
      <th align="left" width="24%">Основная задача</th>
      <th align="left" width="16%">Тип</th>
      <th align="center" width="9%">Оценка</th>
      <th align="center" width="14%">Статус</th>
      <th align="center" width="14%">Дата</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td align="center"><strong>1</strong></td>
      <td><a href="reviews/ru/architecture/grill-me.md"><strong><code>grill-me</code></strong></a></td>
      <td><strong>Планирование, Решения и Глубокий Debug</strong></td>
      <td>Набор скиллов</td>
      <td align="center"><strong>9.5/10</strong></td>
      <td align="center"><code>✅&nbsp;Активен</code></td>
      <td align="center">С&nbsp;<code>2026&#8209;05&#8209;23</code></td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Проработка требований по дереву решений до кода (<code>grilling</code> + <code>grill-with-docs</code> + <code>domain-modeling</code>) + очищенные on-demand скиллы <strong><code>diagnosing-bugs</code></strong> и <strong><code>improve-codebase-architecture</code></strong> из <code>mattpocock/skills</code>.</td>
    </tr>
    <tr>
      <td align="center"><strong>2</strong></td>
      <td><a href="reviews/ru/architecture/graphify.md"><strong><code>graphify</code></strong></a></td>
      <td><strong>Карта кодовой базы (Knowledge Graph)</strong></td>
      <td>Skill + Python CLI</td>
      <td align="center"><strong>9.5/10</strong></td>
      <td align="center"><code>✅&nbsp;Активен</code></td>
      <td align="center">С&nbsp;<code>2026&#8209;07&#8209;28</code></td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Построение постоянного графа знаний (<code>graph.json</code> + HTML) из кода (локальный AST, <code>0</code> токенов) и документации для мгновенного поиска связей между модулями и файлами.</td>
    </tr>
    <tr>
      <td align="center"><strong>3</strong></td>
      <td><a href="reviews/ru/architecture/ponytail.md"><strong><code>ponytail</code></strong></a></td>
      <td><strong>Минимальный чистый код (YAGNI)</strong></td>
      <td>Skill</td>
      <td align="center"><strong>9.5/10</strong></td>
      <td align="center"><code>✅&nbsp;Активен</code></td>
      <td align="center">С&nbsp;<code>2026&#8209;11&#8209;15</code></td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Базовое правило при написании любого кода: минимальное изменение, полностью решающее задачу, без лишних абстракций, и краткий ответ с первого прочтения.</td>
    </tr>
    <tr>
      <td align="center"><strong>4</strong></td>
      <td><a href="reviews/ru/architecture/karpathy-guidelines.md"><strong><code>karpathy-guidelines</code></strong></a></td>
      <td><strong>Точечные правки кода (<code>Surgical</code>)</strong></td>
      <td>Skill</td>
      <td align="center"><strong>9.5/10</strong></td>
      <td align="center"><code>✅&nbsp;Активен</code></td>
      <td align="center">С&nbsp;<code>2026&#8209;11&#8209;15</code></td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Явное озвучивание допущений, простота и точечные (<code>surgical</code>) правки без затрагивания соседнего рабочего кода.</td>
    </tr>
    <tr>
      <td align="center"><strong>5</strong></td>
      <td><a href="reviews/ru/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a></td>
      <td><strong>Основной UI/UX дизайн и аудит</strong></td>
      <td>Skill</td>
      <td align="center"><strong>9.5/10</strong></td>
      <td align="center"><code>✅&nbsp;Активен</code></td>
      <td align="center">С&nbsp;<code>2026&#8209;11&#8209;09</code></td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Проектирование, UX/контраст/типографика и полировка (<code>polish</code>, <code>clarify</code>, <code>harden</code>) для веб, мобильного веба и нативных экранов iOS/Android. <strong>💡 Совет:</strong> стоит добавить внутрь правило <strong>перцептивного контраста <code>APCA</code> (<code>|Lc| ≥ 60</code>)</strong>, чтобы <code>WCAG 2</code> (<code>4.5:1</code>) не браковал чистый белый текст на цветных бренд-кнопках (<a href="reviews/ru/ui-ux/impeccable.md#apca-contrast">точные правки</a>).</td>
    </tr>
    <tr>
      <td align="center"><strong>6</strong></td>
      <td><a href="reviews/ru/architecture/elephant-goldfish-model.md"><strong><code>elephant-goldfish-model</code></strong></a></td>
      <td><strong>Независимое Архитектурное и Код-Ревью</strong></td>
      <td>Плагин (7 скиллов + 10 агентов)</td>
      <td align="center"><strong>9.5/10</strong></td>
      <td align="center"><code>✅&nbsp;Активен</code></td>
      <td align="center">С&nbsp;<code>2026&#8209;11&#8209;15</code></td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Архитектор с памятью (<em>Elephant</em>) + субагенты-критики без контекста (<em>Goldfish</em>): <code>egm-drift-report</code> и 5-этапный <code>egm-review</code> находят расхождения документации с кодом и скрытые баги.</td>
    </tr>
    <tr>
      <td align="center"><strong>7</strong></td>
      <td><a href="reviews/ru/developer-tools/agent-desktop.md"><strong><code>agent-desktop</code></strong></a></td>
      <td><strong>Тестирование Web (<code>Chrome</code>) и Desktop UI</strong></td>
      <td>CLI + Skill</td>
      <td align="center"><strong>9.5/10</strong></td>
      <td align="center"><code>✅&nbsp;Активен</code></td>
      <td align="center">С&nbsp;<code>2026&#8209;11&#8209;15</code></td>
    </tr>
    <tr>
      <td colspan="7" width="2000"><a href="https://agent-browser.dev/desktop">agent-browser.dev/desktop</a> — фоновое управление Chrome и десктопными приложениями через macOS Accessibility (<code>AX</code>) без перехвата курсора (+ резерв для iOS <code>Device Hub</code>).</td>
    </tr>
    <tr>
      <td align="center"><strong>8</strong></td>
      <td><a href="reviews/ru/mobile/agent-device.md"><strong><code>agent-device</code></strong></a></td>
      <td><strong>Тестирование Mobile и TV (<code>iOS</code> / <code>Android</code> / <code>tvOS</code>) UI</strong></td>
      <td>CLI + Skill</td>
      <td align="center"><strong>9.5/10</strong></td>
      <td align="center"><code>✅&nbsp;Активен</code></td>
      <td align="center">С&nbsp;<code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="7" width="2000"><a href="https://agent-device.dev">agent-device.dev</a> — 0-dependency CLI от Callstack: управляет фоновым iOS/tvOS Simulator без окна (<code>~197ms</code>) и <code>-no-window</code> Android/TV Emulator (<code>~888ms</code>, в 27x меньше токенов, полный UTF-8 ввод) через <code>@ref</code> и <code>--settle</code> diff (<code>0</code> MCP-раздувания).</td>
    </tr>
    <tr>
      <td align="center"><strong>9</strong></td>
      <td><a href="reviews/ru/mobile/cross-platform-qa.md"><strong><code>cross-platform-qa</code></strong></a></td>
      <td><strong>2-этапный QA для Web / Mobile / TV</strong></td>
      <td>Skill</td>
      <td align="center"><strong>9.5/10</strong></td>
      <td align="center"><code>✅&nbsp;Активен</code></td>
      <td align="center">С&nbsp;<code>2026&#8209;11&#8209;15</code></td>
    </tr>
    <tr>
      <td colspan="7" width="2000">1-й этап — локальная проверка (<code>agent-desktop</code> Web + <code>agent-device</code> фоновые iOS/Android/TV + <code>adb</code>), 2-й этап — финальная проверка на реальном устройстве перед Done.</td>
    </tr>
    <tr>
      <td align="center"><strong>10</strong></td>
      <td><a href="reviews/ru/backend/sentry.md"><strong><code>sentry</code></strong></a></td>
      <td><strong>Full-Stack диагностика ошибок и трейсов</strong></td>
      <td>Self-Hosted + Skill / MCP</td>
      <td align="center"><strong>9.5/10</strong></td>
      <td align="center"><code>✅&nbsp;Активен</code></td>
      <td align="center">С&nbsp;<code>2026&#8209;07&#8209;08</code></td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Диагностика ошибок (<code>Issue Grouping</code>, <code>dSYM</code>/<code>ProGuard</code>, <code>Source Maps</code>), <code>Breadcrumbs</code>, <code>Session Replay</code> и <code>v8+</code> OTel-трейсов с прямым анализом через AI-агентов.</td>
    </tr>
    <tr>
      <td align="center"><strong>11</strong></td>
      <td><a href="reviews/ru/developer-tools/skillshare.md"><strong><code>skillshare</code></strong></a></td>
      <td><strong>Синхронизация скиллов и Безопасность (<code>audit</code>)</strong></td>
      <td>CLI + Skill</td>
      <td align="center"><strong>9.5/10</strong></td>
      <td align="center"><code>✅&nbsp;Активен</code></td>
      <td align="center">С&nbsp;<code>2026&#8209;05&#8209;30</code></td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Синхронизация скиллов и плагинов между всеми AI-агентами (<code>Codex</code>, <code>Claude</code>, <code>Antigravity</code>) из единого источника + встроенный <strong>skill-check (<code>skillshare audit</code>)</strong>.</td>
    </tr>
    <tr>
      <td align="center"><strong>12</strong></td>
      <td><a href="reviews/ru/mobile/animate-expo.md"><strong><code>animate-expo</code></strong></a></td>
      <td><strong>Expo / React Native 60/120fps анимации</strong></td>
      <td>Skill</td>
      <td align="center"><strong>9.5/10</strong></td>
      <td align="center"><code>✅&nbsp;Активен</code></td>
      <td align="center">С&nbsp;<code>2026&#8209;11&#8209;09</code></td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Плавные 60/120fps анимации и жесты в UI-потоке для Expo и React Native на базе <code>Reanimated</code>, <code>Gesture Handler</code> и <code>expo-haptics</code> (с защитой <code>LOCAL-COMPATIBILITY.md</code>).</td>
    </tr>
    <tr>
      <td align="center"><strong>13</strong></td>
      <td><a href="reviews/ru/developer-tools/t3-code.md"><strong><code>T3 Code</code></strong> + CLI Subagent</a></td>
      <td><strong>Мультиагентная разработка и ревью</strong></td>
      <td>Desktop App + CLI</td>
      <td align="center"><strong>9.0/10</strong></td>
      <td align="center"><code>✅&nbsp;Активен</code></td>
      <td align="center">С&nbsp;<code>2026&#8209;10&#8209;23</code></td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Совместная работа нескольких AI (<em>«Codex пишет, Claude проверяет»</em> через вызов независимого CLI-субагента для ревью).</td>
    </tr>
    <tr>
      <td align="center"><strong>14</strong></td>
      <td><a href="reviews/ru/mobile/adb.md"><strong><code>adb</code></strong></a></td>
      <td><strong>Android проброс портов (<code>reverse</code>) и <code>logcat</code></strong></td>
      <td>CLI</td>
      <td align="center"><strong>9.0/10</strong></td>
      <td align="center"><code>✅&nbsp;Активен</code></td>
      <td align="center">С&nbsp;<code>2026&#8209;09&#8209;07</code></td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Проброс портов (<code>reverse</code>), <code>logcat</code>, установка APK и низкоуровневое управление на фоновых Android-эмуляторах (<code>-no-window</code>) и реальных телефонах (<code>-s &lt;serial&gt;</code> обязателен).</td>
    </tr>
    <tr>
      <td align="center"><strong>15</strong></td>
      <td><a href="reviews/ru/mobile/ios-simulator-device-hub.md"><strong><code>xcrun simctl</code> + <code>Device Hub</code></strong></a></td>
      <td><strong>Фоновый boot iOS и <code>devicectl</code></strong></td>
      <td>Xcode CLI + App</td>
      <td align="center"><strong>9.0/10</strong></td>
      <td align="center"><code>✅&nbsp;Активен</code></td>
      <td align="center">С&nbsp;<code>2026&#8209;10&#8209;20</code></td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Фоновый запуск/остановка iOS Simulator без окна (<code>simctl boot/shutdown</code>), установка сборок на реальный iPhone (<code>devicectl</code>) и резерв <code>Device Hub</code>.</td>
    </tr>
    <tr>
      <td align="center"><strong>16</strong></td>
      <td><a href="reviews/ru/mobile/simslim.md"><strong><code>simslim</code></strong></a></td>
      <td><strong>Оптимизатор RAM и диска iOS / tvOS Simulator</strong></td>
      <td>Standalone Go CLI</td>
      <td align="center"><strong>9.0/10</strong></td>
      <td align="center"><code>✅&nbsp;Активен</code></td>
      <td align="center">С&nbsp;<code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Отключает <code>~149–180</code> лишних фоновых служб симуляторов <code>iOS</code>/<code>tvOS</code> (<code>Siri</code>, <code>Apple Intelligence</code>, <code>Wallpaper</code>): сжимает живой headless-запуск со <code>182 -&gt; 78</code> процессов и <strong><code>2.70 GB -&gt; 1.16 GB</code> RAM (<code>-57%</code>)</strong> (<code>4.0 GB -&gt; 0.9 GB</code> / <code>-77.5%</code> в GUI) и безопасно чистит <code>1.5 GB+</code> логов/кэша без сброса приложений (<code>--except web,photos,search --keep com.apple.apsd</code> сохраняет <code>push</code> и <code>agent-device</code>).</td>
    </tr>
    <tr>
      <td align="center"><strong>17</strong></td>
      <td><a href="reviews/ru/mobile/avdslim.md"><strong><code>avdslim</code></strong></a></td>
      <td><strong>Оптимизатор RAM и Metal GPU для Android AVD</strong></td>
      <td>Standalone Go CLI</td>
      <td align="center"><strong>9.0/10</strong></td>
      <td align="center"><code>✅&nbsp;Активен</code></td>
      <td align="center">С&nbsp;<code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Оптимизатор RAM и GPU для Android Emulator (<code>AVD</code>): переключает CPU-рендер <code>SwiftShader</code> на <strong>Apple Metal GPU (<code>host</code>)</strong> с <code>-lowram</code> (<code>1536 MB</code>) и Golden Snapshot, снижая память с <strong><code>4.41 GB -&gt; 2.64 GB</code> (<code>-40.2%</code>, <code>-69%</code> от 8.5 GB Studio AVD)</strong> при 100% работе GPS (<code>--skip=location --keep=com.google.android.apps.maps</code>) и <code>agent-device</code>.</td>
    </tr>
    <tr>
      <td align="center"><strong>18</strong></td>
      <td><a href="reviews/ru/backend/security-audit-skill.md"><strong><code>security-audit</code></strong></a></td>
      <td><strong>6-фазный аудит безопасности исходного кода</strong></td>
      <td>Skill</td>
      <td align="center"><strong>9.0/10</strong></td>
      <td align="center"><code>✅&nbsp;Активен</code></td>
      <td align="center">С&nbsp;<code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="7" width="2000">6-фазный <em>adversarial</em> аудит безопасности исходного кода от Cloudflare (<code>Hunter</code> + независимые <code>Verifier</code>-субагенты + Node JSON-валидаторы): находит уязвимости в Backend, Web, <strong>Mobile (<code>deep-link</code>/<code>WebView</code>/<code>IPC</code>)</strong>, CLI и CI/CD без Docker (с экономным профилем <code>quick</code>/<code>scoped</code>).</td>
    </tr>
    <tr>
      <td align="center"><strong>19</strong></td>
      <td><a href="reviews/ru/mobile/mobile-native.md"><strong><code>mobile-native</code></strong></a></td>
      <td><strong>Адаптация Mobile Web / PWA под натив</strong></td>
      <td>Skill</td>
      <td align="center"><strong>8.5/10</strong></td>
      <td align="center"><code>✅&nbsp;Активен</code></td>
      <td align="center">С&nbsp;<code>2026&#8209;11&#8209;15</code></td>
    </tr>
    <tr>
      <td colspan="7" width="2000">11 CSS/meta-решений, придающих мобильному вебу и PWA ощущение нативного приложения (<code>dvh/svh</code>, <code>safe-area</code>, инпуты <code>16px</code>, <code>overscroll-behavior</code>, hover gating; с защитой <code>LOCAL-COMPATIBILITY.md</code>).</td>
    </tr>
    <tr>
      <td align="center"><strong>20</strong></td>
      <td><a href="reviews/ru/developer-tools/assetdiet.md"><strong><code>AssetDiet</code></strong></a></td>
      <td><strong>Локальное сжатие картинок / SVG / видео / 3D</strong></td>
      <td>CLI + <a href="skills/asset-diet/SKILL.md"><code>asset-diet</code></a></td>
      <td align="center"><strong>7.5/10</strong></td>
      <td align="center"><code>✅&nbsp;Активен</code></td>
      <td align="center">С&nbsp;<code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="7" width="2000">100% локальное сжатие картинок/SVG/видео/3D (<code>Sharp</code>, <code>SVGO</code>, <code>FFmpeg</code>) с откатом. Вместо постоянного 16-tool MCP подключён через наш лёгкий скилл <a href="skills/asset-diet/SKILL.md"><code>asset-diet</code></a> для разового вызова <code>npx assetdiet-mcp@0.1.4</code>.</td>
    </tr>
  </tbody>
</table>

---

## По направлениям

### 🧠 Локальные модели

<table width="100%">
  <thead>
    <tr>
      <th align="left" width="22%">Название</th>
      <th align="left" width="27%">Тип</th>
      <th align="center" width="10%">Качество</th>
      <th align="center" width="11%">Нужно&nbsp;нам</th>
      <th align="center" width="16%">Статус</th>
      <th align="center" width="14%">Дата</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="reviews/ru/local-models/kimi-k3-in-c.md"><strong><code>kimi-k3-in-c</code></strong></a></td>
      <td>C99 CLI Engine (<code>2.78T</code> MoE)</td>
      <td align="center"><strong>8.5/10</strong></td>
      <td align="center"><strong>1.0/10</strong></td>
      <td align="center"><code>⛔&nbsp;Отклонено</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000"><strong>Назначение:</strong> C99-эксперимент потокового чтения MoE-модели <code>Kimi K3</code> (<code>2.78T</code> / <code>~104B</code> актив.) прямо с NVMe-диска без GPU. <strong>Работает ли для кодинга?</strong> Сама модель <code>Kimi K3</code> сильна в коде и логике, <strong>но в этом disk-stream режиме писать код невозможно</strong> (<code>1 токен = ~24–33 сек</code>, <code>500</code> токенов = <code>~3.5 ч</code> + <code>~50 TB</code> чтения с SSD). <strong>Железо:</strong> Мин.: <code>GPU: 0, RAM: 8–16 GB, SSD: ≥1.8 TB NVMe</code>; Для работы: <code>16× H200 (~2.25 TB VRAM)</code>. <strong>Если нужна локальная модель для кода:</strong> <code>Ollama</code> / <code>MLX</code> (<code>Qwen3-Coder</code>, <code>30–65 ток/с</code> в <code>32–64 GB</code> RAM на Mac). 📊 <a href="https://github.com/FareedKhan-dev/kimi-k3-in-c">GitHub Benchmark</a> · <a href="https://artificialanalysis.ai/leaderboards/models">Artificial Analysis</a></td>
    </tr>
    <tr>
      <td><a href="reviews/ru/local-models/minimax-m3-1-flash.md"><strong><code>MiniMax-M3.1-Flash</code></strong> <em>(Локально)</em></a></td>
      <td>Open-Weight <code>428B</code> MoE (<code>~23B</code> актив.)</td>
      <td align="center"><strong>8.0/10</strong></td>
      <td align="center"><strong>1.0/10</strong></td>
      <td align="center"><code>⛔&nbsp;Отклонено</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000"><strong>Назначение:</strong> Быстрая мультимодальная (<code>текст + фото + видео</code>, <code>1M</code> контекст) модель для чатов, <code>OCR</code>/анализа фото и видео и офисной автоматизации (<code>Automation-Bench: 62.8%</code>). <strong>Работает ли для кодинга?</strong> Подходит для простых скриптов и UI/автоматизации, но не для сложной репозиторной разработки (<code>Terminal-Bench 4.0: 38.1%</code>). <strong>Железо:</strong> Веса <code>~250–285 GB</code> не помещаются на обычный ПК (<code>Мин.: 512 GB Mac Studio</code>, для работы: <code>8× H100 / 640 GB VRAM</code>). <strong>Альтернатива:</strong> Локально — <code>Ollama</code> / <code>MLX</code> (<code>Qwen3-Coder</code>); если нужна именно эта модель — <a href="reviews/ru/external-apis/minimax-m3-1-flash-api.md">🔌 <code>MiniMax M3.1 Flash API</code></a>. 📊 <a href="https://huggingface.co/MiniMaxAI/MiniMax-M3.1-Flash">HuggingFace</a> · <a href="https://openrouter.ai/minimax/minimax-m3.1-flash">OpenRouter Stats</a></td>
    </tr>
  </tbody>
</table>

### 🔌 Внешние API

<table width="100%">
  <thead>
    <tr>
      <th align="left" width="22%">Название</th>
      <th align="left" width="27%">Тип</th>
      <th align="center" width="10%">Качество</th>
      <th align="center" width="11%">Нужно&nbsp;нам</th>
      <th align="center" width="16%">Статус</th>
      <th align="center" width="14%">Дата</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="reviews/ru/external-apis/minimax-m3-1-flash-api.md"><strong><code>MiniMax M3.1 Flash API</code></strong></a></td>
      <td>Cloud Multimodal API (<code>MiniMax</code> / <code>OpenRouter</code>)</td>
      <td align="center"><strong>8.0/10</strong></td>
      <td align="center"><strong>5.0/10</strong></td>
      <td align="center"><code>👍&nbsp;Хороший&nbsp;вариант</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000"><strong>Назначение:</strong> Очень дешёвый (<code>$0.15 / $0.60</code>, <code>Cached: $0.015</code>) и быстрый (<code>170+ ток/с</code>, окно <code>1M</code>) мультимодальный API для массовых ботов в бэкенде, переводов, <code>OCR</code>/анализа фото и видео и SaaS-автоматизации. <strong>Работает ли для кодинга?</strong> Работает для простых скриптов и вспомогательной автоматизации, но не для сложной архитектуры проекта (<code>Terminal-Bench 4.0: 38.1%</code>). <em>(Использовать только через платный Zero-Retention API; не отправлять закрытый код в <code>:free</code>).</em> 📊 <a href="https://openrouter.ai/minimax/minimax-m3.1-flash">OpenRouter Stats</a> · <a href="https://huggingface.co/MiniMaxAI/MiniMax-M3.1-Flash">HuggingFace Benchmarks</a> · <a href="https://artificialanalysis.ai/leaderboards/models">Artificial Analysis</a></td>
    </tr>
  </tbody>
</table>

### 🌐 Web

<table width="100%">
  <thead>
    <tr>
      <th align="left" width="22%">Название</th>
      <th align="left" width="27%">Тип</th>
      <th align="center" width="10%">Качество</th>
      <th align="center" width="11%">Нужно&nbsp;нам</th>
      <th align="center" width="16%">Статус</th>
      <th align="center" width="14%">Дата</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="reviews/ru/web/taste-skill.md"><strong><code>taste-skill</code> v2.5</strong></a></td>
      <td>Landing Kit + Hook</td>
      <td align="center"><strong>8.0/10</strong></td>
      <td align="center"><strong>4.0/10</strong></td>
      <td align="center"><code>👍&nbsp;Хороший&nbsp;вариант</code></td>
      <td align="center"><code>2026&#8209;11&#8209;15</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Сильный движок для промо-лендингов с нуля; при установке обязательно вырезать <code>Stop</code> хук (600с) и ставить только локально (<code>-p</code>).</td>
    </tr>
    <tr>
      <td><a href="reviews/ru/web/vercel-ui-sdk.md"><strong><code>vercel-labs/ui</code></strong></a></td>
      <td><code>@ui-sdk/*</code> Library + Skill (<code>Beta</code>)</td>
      <td align="center"><strong>8.0/10</strong></td>
      <td align="center"><strong>2.0/10</strong></td>
      <td align="center"><code>⛔&nbsp;Отклонено</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Headless UI-библиотека Vercel Labs в стадии Public Beta и скилл <code>ui-sdk</code>: заявленное <em>«управление в 2 раза быстрее без скриншотов»</em> (<code>createAgent</code>) работает только на сайтах, переписанных на <code>@ui-sdk/*</code> (не видит обычные <code>&lt;button&gt;</code>/<code>&lt;input&gt;</code> и <code>Shadcn</code>/<code>Radix</code>, нет поддержки <code>Expo</code>). <strong>Вместо него:</strong> наш текущий UI-стек + <a href="reviews/ru/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a> + <a href="reviews/ru/developer-tools/agent-desktop.md"><strong><code>agent-desktop</code></strong></a>.</td>
    </tr>
  </tbody>
</table>

### 📱 Mobile

<table width="100%">
  <thead>
    <tr>
      <th align="left" width="22%">Название</th>
      <th align="left" width="27%">Тип</th>
      <th align="center" width="10%">Качество</th>
      <th align="center" width="11%">Нужно&nbsp;нам</th>
      <th align="center" width="16%">Статус</th>
      <th align="center" width="14%">Дата</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="reviews/ru/mobile/swiftui-agent-skill.md"><strong><code>swiftui-agent-skill</code></strong></a></td>
      <td>Skill (<code>twostraws</code> / <code>AvdLee</code> / <code>apple-design</code>)</td>
      <td align="center"><strong>8.5/10</strong></td>
      <td align="center"><strong>3.0/10</strong></td>
      <td align="center"><code>👍&nbsp;Хороший&nbsp;вариант</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Чистый SwiftUI и Apple HIG; так как основной стек у нас Expo / React Native, нужен только локально (<code>-p</code>) для нативных SwiftUI-модулей (Widgets / Live Activities). <strong>Вместо него:</strong> <a href="reviews/ru/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a> (<code>reference/ios.md</code>) + <a href="reviews/ru/mobile/animate-expo.md"><strong><code>animate-expo</code></strong></a>.</td>
    </tr>
    <tr>
      <td><a href="reviews/ru/mobile/artemis.md"><strong><code>ARTEMIS</code></strong></a></td>
      <td>Python CLI / SDK + MCP (<code>google/artemis</code>)</td>
      <td align="center"><strong>8.5/10</strong></td>
      <td align="center"><strong>2.5/10</strong></td>
      <td align="center"><code>👍&nbsp;Хороший&nbsp;вариант</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Автономный Android QA-движок от Google (силён на кастомных <code>Canvas</code>/игровых экранах за счёт OCR + пиксельного зрения), но <strong>использование платное</strong> (требуется отдельный платный LLM API-ключ в <code>.env</code>), только Android (нет <code>iOS</code>/<code>tvOS</code>) и <code>3–40s</code> на шаг. <strong>Вместо него:</strong> <a href="reviews/ru/mobile/agent-device.md"><strong><code>agent-device</code></strong></a> (<code>$0</code> доплат за API, <code>iOS + Android + TV</code>, <code>197–888 ms</code>).</td>
    </tr>
    <tr>
      <td><a href="reviews/ru/mobile/mobile-mcp.md"><strong><code>mobile-mcp</code></strong></a></td>
      <td>MCP Server (34 tool)</td>
      <td align="center"><strong>7.0/10</strong></td>
      <td align="center"><strong>2.0/10</strong></td>
      <td align="center"><code>⛔&nbsp;Отклонено</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Протестировано вживую и отклонено: <code>~7,580</code> токенов постоянного раздувания MCP-схемы на каждый ход, в <code>6.5x–37x</code> медленнее <code>agent-device</code> (<code>7.3s</code> iOS, <code>5.8s</code> Android), телеметрия <code>Scarf</code> + <code>PostHog</code> и реклама облака <code>mobilenext.ai</code>. <strong>Вместо него:</strong> <a href="reviews/ru/mobile/agent-device.md"><strong><code>agent-device</code></strong></a> + <a href="reviews/ru/mobile/adb.md"><strong><code>adb</code></strong></a>.</td>
    </tr>
  </tbody>
</table>

### 🎨 UI/UX

<table width="100%">
  <thead>
    <tr>
      <th align="left" width="22%">Название</th>
      <th align="left" width="27%">Тип</th>
      <th align="center" width="10%">Качество</th>
      <th align="center" width="11%">Нужно&nbsp;нам</th>
      <th align="center" width="16%">Статус</th>
      <th align="center" width="14%">Дата</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="reviews/ru/ui-ux/animate.md"><strong><code>animate</code></strong></a></td>
      <td>Skill (2 файла)</td>
      <td align="center"><strong>8.5/10</strong></td>
      <td align="center"><strong>3.0/10</strong></td>
      <td align="center"><code>⛔&nbsp;Отклонено</code></td>
      <td align="center"><code>2026&#8209;11&#8209;15</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Скилл веб-анимаций от Эмиля Ковальски; конфликтует по auto-trigger и правилам с нашей системой. <strong>Вместо него:</strong> <a href="reviews/ru/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a> (<code>animate</code>) + <a href="reviews/ru/mobile/animate-expo.md"><strong><code>animate-expo</code></strong></a>.</td>
    </tr>
    <tr>
      <td><a href="reviews/ru/ui-ux/unslop.md"><strong><code>unslop</code></strong></a></td>
      <td>Skill + Playwright скрипты</td>
      <td align="center"><strong>8.5/10</strong></td>
      <td align="center"><strong>2.5/10</strong></td>
      <td align="center"><code>⛔&nbsp;Отклонено</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">9-проходный скилл очистки AI/vibecoded веб-экранов от <code>@heydamir</code> (<code>CC-BY-4.0</code>); только для Web и конфликтует по auto-trigger. <strong>Вместо него:</strong> <a href="reviews/ru/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a> (<code>craft-floor</code> + <code>polish</code> / <code>quieter</code> / <code>clarify</code>).</td>
    </tr>
    <tr>
      <td><a href="reviews/ru/ui-ux/break-ui.md"><strong><code>break-ui</code></strong></a></td>
      <td>Skill (2 файла)</td>
      <td align="center"><strong>8.0/10</strong></td>
      <td align="center"><strong>3.0/10</strong></td>
      <td align="center"><code>⛔&nbsp;Отклонено</code></td>
      <td align="center"><code>2026&#8209;11&#8209;15</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Стресс-тест UI экстремальными данными; добавляет временные фикстуры/переключатели в проект и останавливается без фикса. <strong>Вместо него:</strong> <a href="reviews/ru/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a> (<code>harden</code>).</td>
    </tr>
    <tr>
      <td><a href="reviews/ru/ui-ux/make-interfaces-feel-better.md"><strong><code>make-interfaces-feel-better</code></strong></a></td>
      <td>Skill (6 файлов)</td>
      <td align="center"><strong>7.5/10</strong></td>
      <td align="center"><strong>2.5/10</strong></td>
      <td align="center"><code>⛔&nbsp;Отклонено</code></td>
      <td align="center"><code>2026&#8209;10&#8209;31 → 2026&#8209;11&#8209;15</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Протестировано и удалено (из-за конфликта auto-trigger и громоздких таблиц отчётов). <strong>Вместо него:</strong> <a href="reviews/ru/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a> + <a href="reviews/ru/mobile/animate-expo.md"><strong><code>animate-expo</code></strong></a>.</td>
    </tr>
    <tr>
      <td><a href="reviews/ru/ui-ux/ui-ux-pro-max.md"><strong><code>ui-ux-pro-max</code></strong></a></td>
      <td>Skill + CSV/Python</td>
      <td align="center"><strong>7.0/10</strong></td>
      <td align="center"><strong>3.5/10</strong></td>
      <td align="center"><code>⛔&nbsp;Отклонено</code></td>
      <td align="center"><code>2026&#8209;11&#8209;15</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Слабее <code>impeccable</code> и конфликтует с ним по auto-trigger. <strong>Вместо него:</strong> <a href="reviews/ru/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a>.</td>
    </tr>
  </tbody>
</table>

### 🏗️ Архитектура и Ревью

<table width="100%">
  <thead>
    <tr>
      <th align="left" width="22%">Название</th>
      <th align="left" width="27%">Тип</th>
      <th align="center" width="10%">Качество</th>
      <th align="center" width="11%">Нужно&nbsp;нам</th>
      <th align="center" width="16%">Статус</th>
      <th align="center" width="14%">Дата</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="reviews/ru/architecture/addy-agent-skills.md"><strong><code>addy-agent-skills</code></strong></a></td>
      <td>Плагин (25 скиллов + 9 команд)</td>
      <td align="center"><strong>8.0/10</strong></td>
      <td align="center"><strong>2.5/10</strong></td>
      <td align="center"><code>⛔&nbsp;Отклонено</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Полный SDLC-конвейер от Эдди Османи (<code>/spec -&gt; /ship</code>); обязательный TDD и паузы <code>doubt-driven</code> создают лишние циклы. <strong>Вместо него:</strong> <a href="reviews/ru/architecture/grill-me.md"><strong><code>grill-me</code></strong></a> + <a href="reviews/ru/architecture/ponytail.md"><strong><code>ponytail</code></strong></a> + <a href="reviews/ru/architecture/elephant-goldfish-model.md"><strong><code>elephant-goldfish-model</code></strong></a>.</td>
    </tr>
    <tr>
      <td><a href="reviews/ru/architecture/agency-agents.md"><strong><code>agency-agents</code></strong></a></td>
      <td>283 persona-промпта + installer</td>
      <td align="center"><strong>6.5/10</strong></td>
      <td align="center"><strong>2.5/10</strong></td>
      <td align="center"><code>⛔&nbsp;Отклонено</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">283 ролевых <code>.md</code> промпта в 18 отделах (<code>~18.5K</code> токенов раздувания frontmatter и чужие остатки copy-paste). <strong>Вместо него:</strong> <a href="reviews/ru/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a>, <a href="reviews/ru/architecture/ponytail.md"><strong><code>ponytail</code></strong></a>, <a href="reviews/ru/architecture/elephant-goldfish-model.md"><strong><code>elephant-goldfish-model</code></strong></a>, <a href="reviews/ru/mobile/cross-platform-qa.md"><strong><code>cross-platform-qa</code></strong></a>.</td>
    </tr>
    <tr>
      <td><a href="reviews/ru/architecture/superpowers.md"><strong><code>superpowers</code></strong></a></td>
      <td>Плагин (14 скиллов + хук)</td>
      <td align="center"><strong>6.5/10</strong></td>
      <td align="center"><strong>2.0/10</strong></td>
      <td align="center"><code>⛔&nbsp;Отклонено</code></td>
      <td align="center"><code>2026&#8209;04&#8209;04 → 2026&#8209;09&#8209;01</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Протестировано и удалено: лишние размышления (<code>SessionStart</code> хук), ненужные вопросы <code>brainstorming</code> (альтернатива: <code>grill-me</code>), медленные циклы субагентов и принудительный TDD (2x лишней работы для Web/Mobile/Backend).</td>
    </tr>
  </tbody>
</table>

### ⚙️ Backend

<table width="100%">
  <thead>
    <tr>
      <th align="left" width="22%">Название</th>
      <th align="left" width="27%">Тип</th>
      <th align="center" width="10%">Качество</th>
      <th align="center" width="11%">Нужно&nbsp;нам</th>
      <th align="center" width="16%">Статус</th>
      <th align="center" width="14%">Дата</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="reviews/ru/backend/opentelemetry.md"><strong><code>opentelemetry</code></strong></a></td>
      <td>Стандарт + Collector (<code>SigNoz</code> / <code>Grafana</code>)</td>
      <td align="center"><strong>9.0/10</strong></td>
      <td align="center"><strong>4.0/10</strong></td>
      <td align="center"><code>👍&nbsp;Хороший&nbsp;вариант</code></td>
      <td align="center"><code>2026&#8209;11&#8209;15</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Отраслевой стандарт межсервисных <code>Traces + Metrics + Logs</code> и метрик серверов/БД (требует <code>Collector + SigNoz/Grafana</code>). <strong>Вместо него:</strong> <a href="reviews/ru/backend/sentry.md"><strong><code>sentry</code></strong></a> (закрывает ошибки, реплеи и базовые трейсы в одной платформе).</td>
    </tr>
    <tr>
      <td><a href="reviews/ru/backend/shannon.md"><strong><code>Shannon</code></strong></a></td>
      <td>Standalone CLI + <a href="skills/hacker-test/SKILL.md"><code>hacker-test</code></a></td>
      <td align="center"><strong>8.5/10</strong></td>
      <td align="center"><strong>6.5/10</strong></td>
      <td align="center"><code>👍&nbsp;Хороший&nbsp;вариант</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Автономный White-Box AI-пентестер (Auth bypass, IDOR, Injection, XSS, SSRF). Вместо тяжёлого плагина вызывается по запросу через наш лёгкий скилл <a href="skills/hacker-test/SKILL.md"><code>hacker-test</code></a> и <code>npx</code> строго на local/staging (не на production).</td>
    </tr>
  </tbody>
</table>

### 🛠️ Developer Tools и Memory

<table width="100%">
  <thead>
    <tr>
      <th align="left" width="22%">Название</th>
      <th align="left" width="27%">Тип</th>
      <th align="center" width="10%">Качество</th>
      <th align="center" width="11%">Нужно&nbsp;нам</th>
      <th align="center" width="16%">Статус</th>
      <th align="center" width="14%">Дата</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="reviews/ru/developer-tools/skillspector.md"><strong><code>SkillSpector</code></strong></a></td>
      <td>Python CLI + MCP + Skill</td>
      <td align="center"><strong>9.0/10</strong></td>
      <td align="center"><strong>3.5/10</strong></td>
      <td align="center"><code>⛔&nbsp;Отклонено</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Сканер безопасности AI-скиллов и MCP от NVIDIA (<code>AST + YARA + OSV + LLM</code>). Не устанавливали, чтобы не плодить лишний цикл — <strong>Вместо него:</strong> <a href="reviews/ru/developer-tools/skillshare.md"><strong><code>skillshare</code></strong></a> (skill-check <code>skillshare audit</code>) + <strong>прямая проверка кода через AI-агента</strong>.</td>
    </tr>
    <tr>
      <td><a href="reviews/ru/developer-tools/caveman.md"><strong><code>caveman</code></strong></a></td>
      <td>Skill <em>(+ опц. CLI/Proxy)</em></td>
      <td align="center"><strong>8.0/10</strong></td>
      <td align="center"><strong>3.5/10</strong></td>
      <td align="center"><code>👍&nbsp;Хороший&nbsp;вариант</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Режим сверхкратких ответов в терминале на базе <code>ASD-STE100</code> (<code>SKILL.md</code>); при установке брать только очищенный одиночный <code>SKILL.md</code> (<code>disable-model-invocation: true</code>) без телеметрии <code>@caveman-ai/cli</code> и хуков <code>plugin.json</code>. <strong>Вместо него:</strong> <a href="reviews/ru/architecture/ponytail.md"><strong><code>ponytail</code></strong></a> (сжимает и текст ответа, и лишний код/diff).</td>
    </tr>
    <tr>
      <td><a href="reviews/ru/developer-tools/humanizer-stop-slop.md"><strong><code>humanizer</code> + <code>stop-slop</code></strong></a></td>
      <td>Skill (<code>Markdown</code>)</td>
      <td align="center"><strong>7.5/10</strong></td>
      <td align="center"><strong>2.0/10</strong></td>
      <td align="center"><code>⛔&nbsp;Отклонено</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Редакторы статей и эссе от штампов ИИ (<code>humanizer</code> весит <code>~32 KB</code>); не для кода и не для продуктового UI. <strong>Вместо них:</strong> <a href="reviews/ru/architecture/ponytail.md"><strong><code>ponytail</code></strong></a> + <a href="reviews/ru/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a> (<code>clarify</code>).</td>
    </tr>
    <tr>
      <td><a href="reviews/ru/developer-tools/claude-code-setup.md"><strong><code>claude-code-setup</code></strong></a></td>
      <td>Плагин (Recommender Skill)</td>
      <td align="center"><strong>7.5/10</strong></td>
      <td align="center"><strong>2.0/10</strong></td>
      <td align="center"><code>⛔&nbsp;Отклонено</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Официальный read-only рекомендатель стартовых секций <code>CLAUDE.md</code>, хуков и MCP-серверов под проект. <strong>Вместо него:</strong> <a href="reviews/ru/developer-tools/skillshare.md"><strong><code>skillshare</code></strong></a>.</td>
    </tr>
    <tr>
      <td><a href="reviews/ru/developer-tools/omniroute.md"><strong><code>OmniRoute</code></strong></a></td>
      <td>Local Proxy + 44 админ-скилла</td>
      <td align="center"><strong>7.5/10</strong></td>
      <td align="center"><strong>2.0/10</strong></td>
      <td align="center"><code>⛔&nbsp;Отклонено</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Локальный LLM reverse-proxy (<code>localhost:20128</code>); его 44 скилла — лишь мануалы прокси, дефолтный роутинг рвёт длинные сессии (<code>#7287</code>) и понижает модель, а TLS-stealth (<code>wreq-js</code>) несёт риск бана подписок по ToS. <strong>Вместо него:</strong> <a href="reviews/ru/developer-tools/t3-code.md"><strong><code>T3 Code</code></strong></a> + <a href="reviews/ru/architecture/ponytail.md"><strong><code>ponytail</code></strong></a>.</td>
    </tr>
  </tbody>
</table>

---

<details>
<summary>Подключить глобальные скиллы <code>tasted-skills</code>, <code>hacker-test</code> и <code>asset-diet</code></summary>

```bash
skillshare install TursunboyevJahongir/tasted-skills -s tasted-skills -s hacker-test -s asset-diet -g && skillshare sync -g
```

</details>

