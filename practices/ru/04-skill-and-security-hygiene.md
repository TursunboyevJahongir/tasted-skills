# 4. Санитаризация Скиллов, White-Box Пентест и Мониторинг Ошибок

[🇺🇿 O'zbekcha](../04-skill-and-security-hygiene.md) | [🇬🇧 English](../en/04-skill-and-security-hygiene.md) | **🇷🇺 Русский**

⬅️ [Вернуться к оглавлению практик](README.md)

- **Связка инструментов:** [**`tasted-skills`**](../../skills/tasted-skills/SKILL.md) + [**`skillshare`**](../../reviews/ru/developer-tools/skillshare.md) + [**`Shannon` (`hacker-test`)**](../../reviews/ru/backend/shannon.md) + [**`sentry`**](../../reviews/ru/backend/sentry.md)
- **Проекты:** Безопасность AI-среды разработки, Backend API и Full-Stack production-системы.

---

## 1. Зачем использовать их в связке? (Общая выгода)

1. Многие популярные скиллы и плагины на GitHub содержат скрытые `SessionStart` / `Stop` хуки, включённую по умолчанию телеметрию (`PostHog`, `Scarf`, `Supabase`), скрытые платные API-вызовы или слишком широкие описания `description`, перехватывающие обычные задачи.
2. Обычные функциональные проверки после написания бэкенда не находят дыры в авторизации (`IDOR`, `Broken Auth`, `SSRF`).

---

## 2. Как работает связка (3 кольца защиты)

### Кольцо 1: Проверка и очистка сторонних скиллов до установки (`tasted-skills` + `skillshare audit`)

Никогда не запускайте `npx skills add ...` или `claude plugin install ...` вслепую:
1. **Прямой аудит исходников через AI-агента (`tasted-skills`):**
   - Агент проверяет `SKILL.md`, `plugin.json`, `package.json` (`postinstall`), `.env.example` и скрипты.
2. **Удаление лишнего и опасного (`Санитаризация`):**
   - Вырезаются секции `hooks:`, скрипты телеметрии и реклама облачных сервисов;
   - Специализированным скиллам добавляется `disable-model-invocation: true`, чтобы они срабатывали только по явному вызову;
   - Вместо постоянных MCP-серверов выбирается связка CLI + лёгкий скилл (`0` раздувания контекста).
3. **Статическая проверка и синхронизация (`skillshare`):**
   ```bash
   skillshare audit ~/.config/skillshare/skills/<имя-скилла>
   skillshare sync -g
   ```

### Кольцо 2: Автономный White-Box пентест API (`hacker-test` / `Shannon`)

Перед выкаткой новых модулей авторизации, платежей или ролей (`RBAC`) прогоняется автономный White-Box пентест на локальном или тестовом (`staging`) стенде:
- Лёгкий скилл `hacker-test` по запросу вызывает `npx @keygraph/shannon@latest`, анализируя исходный код и локальные эндпоинты на `IDOR`, `Auth bypass`, `Injection`, `XSS` и `SSRF` с проверкой реальными PoC *(запуск на production строго запрещён)*.

### Кольцо 3: Диагностика ошибок и трейсов в продакшене (`sentry`)

После релиза ошибки реальных пользователей разбираются напрямую через AI-агента и `sentry`:
- Сгруппированные ошибки (`Issue Grouping`), расшифрованные стек-трейсы (`Source Maps`, `dSYM`, `ProGuard`), шаги пользователя до сбоя (`Breadcrumbs`, `Session Replay`) и медленные запросы (`Traces`) анализируются в одном месте и исправляются через `diagnosing-bugs` + `ponytail`.
