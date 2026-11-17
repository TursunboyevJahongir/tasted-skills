# `agency-agents` (The Agency — 283 Persona-промпта)

[🇺🇿 O'zbekcha](../../architecture/agency-agents.md) | [🇬🇧 English](../../en/architecture/agency-agents.md) | **🇷🇺 Русский**

- **Источник:** [msitarzewski/agency-agents](https://github.com/msitarzewski/agency-agents)
- **Категория:** `Architecture` *(Набор ролевых persona-промптов: Engineering, Design, QA, Security, Marketing и др.)*
- **Тип:** `Коллекция агентов / скиллов` *(18 отделов, 283 Markdown-файла + `convert.sh` / `install.sh`)*
- **Оценка качества:** **6.5 / 10**
- **Полезность для нас:** **2.5 / 10**
- **Рекомендуемый охват:** `Не устанавливать` *(глобальная установка сильно раздувает контекст)*
- **Используемая замена:** [**`impeccable`**](../ui-ux/impeccable.md) + [**`ponytail`**](ponytail.md) + [**`karpathy-guidelines`**](karpathy-guidelines.md) + [**`elephant-goldfish-model`**](elephant-goldfish-model.md) + [**`cross-platform-qa`**](../mobile/cross-platform-qa.md)
- **Дата проверки:** `2026-11-16`
- **Текущий статус:** `⚠️ Не рекомендуется` *(нам не нужен — существующие профильные скиллы намного чище и сильнее)*

---

## 1. Что это и как работает?

> [!IMPORTANT]
> **Простыми словами (Главная задача и польза):** Набор из 283 ролевых промптов (*«ты маркетолог / ты дизайнер»*), который при полной установке **раздувает контекст на `~18,500` токенов** шаблонным текстом без глубокой инженерной пользы. Полностью заменён нашими `impeccable`, `ponytail` и `elephant-goldfish-model`.

Репозиторий позиционирует себя как *«полноценное AI-агентство у вас под рукой»*, однако внутри **нет ни оркестратора субагентов, ни MCP-сервера, ни проверочного runtime-движка**.

Реальное содержимое:
- **`283` чистых Markdown persona-промпта в 18 отделах (`divisions.json`:** `engineering`, `design`, `testing`, `security`, `gis`, `marketing`, `product`, `game-development`, `specialized` и др.**)** общим объемом `~3.98 MB` (в среднем `14.1 KB` / ~250 строк на файл).
- **`scripts/convert.sh` и `scripts/install.sh`:** Bash-скрипты, конвертирующие и копирующие эти 283 `.md` файла в форматы 17 инструментов (`Claude Code` `~/.claude/agents/`, `Codex` `~/.codex/agents/*.toml`, `Antigravity` `~/.gemini/config/skills/agency-*/SKILL.md`, `Cursor`, `ZCode` и др.).

---

## 2. Сильные и слабые стороны

### Сильные стороны
- Аккуратные и безопасные скрипты установки (`--division`, `--agent`, `--dry-run`) без скрытых хуков и телеметрии (лицензия `MIT`).
- Несколько узкоспециализированных файлов содержат действительно полезные чек-листы (например, `security-ai-generated-code-auditor.md` — утечки через `NEXT_PUBLIC_`, ложные политики `RLS USING (true)` и LLM prompt-injection; `gis-web-gis-developer.md` — `MapLibre` и vector tiles).

### Слабые стороны и почему нам не нужен
1. **Раздувание контекста (`~18 500 токенов` постоянной нагрузки):**
   Одни только заголовки `name + description` во frontmatter всех 283 агентов весят **`72.3 KB` (`~18 504 токена`)**. При полной установке в каждом запросе впустую сгорает `~18.5K` токенов только на хранение списка, а модель путается при выборе скилла.
2. **85% файлов — шаблонная ролевая «вода» и чужие остатки copy-paste:**
   - Большинство файлов построено по шаблону *«🧠 Your Identity & Memory: You remember...»* с учебными примерами кода и громоздкими таблицами отчетов.
   - В ряде ключевых агентов остались жестко зашитые куски из чужих проектов:
     - В `Frontend Developer` внезапно требуется разработка расширений для редактора кода (*"Build editor extensions with openAt, reveal, peek"*);
     - В CSS-примерах `UI Designer` используется анти-паттерн `transition: all`;
     - `Senior Developer` жестко привязан к стеку `Laravel/Livewire`;
     - `Reality Checker` требует запускать несуществующий скрипт `./qa-playwright-capture.sh http://localhost:8000` и проверять `*.blade.php` со статусом `"NEVER SKIP"`.
3. **Конфликт auto-trigger и обход `skillshare`:**
   - `convert.sh` не выставляет `disable-model-invocation: true` и пишет напрямую в `~/.gemini/config/skills/` в обход [`skillshare`](../developer-tools/skillshare.md), из-за чего агенты сталкиваются с нашими основными UI и инженерными скиллами на каждом запросе.

---

## 3. Безопасность и санитаризация

> [!WARNING]
> **Раздувание контекста:** Глобальная установка всех 283 шаблонов съедает **`~18,500` постоянных токенов**, размывая внимание агента.

- **Уровень риска:** `Низкий` *(вредоносных скриптов, сетевых вызовов или `Stop`-хуков нет, но высок вред от засорения контекста и `auto-trigger`)*
- Даже если понадобится взять идеи из одного узкого файла, не запускать `install.sh` — нужно удалить ролевое вступление (`Identity & Memory`) и шаблоны отчетов, добавить `disable-model-invocation: true` и управлять только через [`skillshare`](../developer-tools/skillshare.md).

---

## 4. Что используется у нас взамен?

Все основные направления этого репозитория у нас уже закрыты более компактными и проверенными на практике инструментами:

| Раздел в `agency-agents` | Наша чистая и сильная замена |
|---|---|
| `Frontend Developer`, `UI Designer`, `UX Architect` | [**`impeccable`**](../ui-ux/impeccable.md) + [**`mobile-native`**](../mobile/mobile-native.md) + [**`animate-expo`**](../mobile/animate-expo.md) |
| `Minimal Change Engineer` (207 строк + длинный отчет) | [**`ponytail`**](ponytail.md) + [**`karpathy-guidelines`**](karpathy-guidelines.md) (`2.5–3.5 KB`, без лишних отчетов) |
| `Software Architect`, `Code Reviewer` | [**`elephant-goldfish-model`**](elephant-goldfish-model.md) (реальные `fresh-context` субагенты Goldfish) + [**`grill-me`**](grill-me.md) |
| `Reality Checker`, `Evidence Collector` | [**`cross-platform-qa`**](../mobile/cross-platform-qa.md) ([`agent-desktop`](../developer-tools/agent-desktop.md) + [`Device Hub`](../mobile/ios-simulator-device-hub.md) + [`adb`](../mobile/adb.md)) |

---

## 5. В каких направлениях и задачах полезен?

- **Когда использовать:** Не устанавливать — максимум просматривать отдельные узкие чек-листы (`security-ai-generated-code-auditor` и т.п.) прямо на GitHub как справочник.
- **Когда не использовать:** При глобальной установке (`-g`) через `install.sh`.

---

## 6. Статус и история действий

| Дата | Действие | Статус | Примечание |
|---|---|---|---|
| 2026-11-16 | Аудит всех 283 файлов агентов, `convert.sh` / `install.sh` и нагрузки на контекст | `⚠️ Не рекомендуется` | Принято решение не устанавливать из-за раздувания frontmatter на `~18.5K` токенов, шаблонного текста и остатков copy-paste, а также полного превосходства наших текущих скиллов (`impeccable`, `ponytail`, `elephant-goldfish-model`, `cross-platform-qa`). |
