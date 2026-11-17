# `make-interfaces-feel-better` (Jakub Krehel — Design Engineering Micro-Polish)

[🇺🇿 O'zbekcha](../../ui-ux/make-interfaces-feel-better.md) | [🇬🇧 English](../../en/ui-ux/make-interfaces-feel-better.md) | **🇷🇺 Русский**

- **Источник:** [jakubkrehel/make-interfaces-feel-better](https://github.com/jakubkrehel/make-interfaces-feel-better)
- **Категория:** `UI/UX` *(Микро-детали Web CSS: радиусы, tabular-nums, тени, нажатие кнопок)*
- **Тип:** `Skill` *(6 Markdown-файлов, 1154 строки)*
- **Оценка качества:** **7.5 / 10**
- **Полезность для нас:** **2.5 / 10**
- **Рекомендуемый охват:** `Не устанавливать` *(ранее был протестирован и удален)*
- **Период использования:** `2026-10-31 → 2026-11-15` *(протестирован и удалён)*
- 🔄 **Есть альтернатива получше:** [impeccable](impeccable.md) + [animate-expo](../mobile/animate-expo.md) *(протестирован 16 дней и удалён)*

---

## 1. Что это и как работает?

> [!IMPORTANT]
> **Простыми словами (Главная задача и польза):** Протестирован 16 дней и удалён: сжигает токены громоздкими отчётами на 4 таблицы при мелких правках UI и конфликтует с `impeccable`.

19 микро-правил полировки веб-интерфейсов (`SKILL.md`, `typography.md`, `surfaces.md`, `animations.md`, `icons.md`, `performance.md`):
- Формула внутреннего и внешнего радиуса скругления (`outerRadius = innerRadius + padding`);
- `font-variant-numeric: tabular-nums` для изменяющихся чисел;
- `text-wrap: balance` для заголовков, `text-wrap: pretty` для текста и `-webkit-font-smoothing: antialiased` на macOS;
- `scale(0.96)` при нажатии на кнопку и зона клика `44x44px` (`40x40px` на десктопе) для мелких кнопок;
- Запрет `transition: all` и ограничение `will-change`;
- В конце — длинный шаблон отчета из 4 обязательных таблиц (`Scope and Coverage`, `Before/After`, `Considered but Rejected`, `Verdict`).

---

## 2. Почему был удален? (Слабые стороны и издержки)

1. **Прямое пересечение с [impeccable](impeccable.md) (`Auto-trigger overlap`):**
   - Описание `description` перехватывает практически любую фронтенд/UI-задачу — в результате агент одновременно загружает и `impeccable`, и `make-interfaces-feel-better`, вдвое расходуя контекст и получая противоречивые правила.
2. **Жестко зашитые (rigid) шаблонные значения:**
   - Требование обязательно ставить `scale(0.96)` на каждую кнопку и `scale(0.25) + blur(4px)` на каждую иконку далеко не всегда подходит под дизайн-систему конкретного проекта.
3. **Длинный табличный отчет, противоречащий [ponytail](../architecture/ponytail.md):**
   - Значительная часть скилла (строки `120–187`) заставляет агента выдумывать отклоненных кандидатов (`Considered but Rejected`) и длинные таблицы `Before/After`.

---

## 3. Безопасность и санитаризация

- **Уровень риска:** `Низкий` *(скриптов или хуков нет, однако auto-trigger и шаблон отчета тяжелые)*

---

## 4. Что используется взамен? (Полная замена)

`make-interfaces-feel-better` был удален, а вместо него используются 2 более сильных скилла:

1. **Взамен (Web + iOS + Android UI/UX и Polish):** [**impeccable**](impeccable.md) — [pbakaus/impeccable](https://github.com/pbakaus/impeccable)
   - В его разделах `craft-floor.md`, `polish.md`, `animate.md` и `typeset.md` уже есть `tabular-nums`, `text-wrap: balance`, оптическое выравнивание, тени, зона нажатия `44×44px` и ограничения `will-change`, причем они охватывают не только Web, но и нативные iOS и Android.
2. **Взамен (Мобильные анимации React Native / Expo):** [**animate-expo**](../mobile/animate-expo.md) — [emilkowalski/skills (animate-expo)](https://github.com/emilkowalski/skills/tree/main/skills/animate-expo)
   - В мобильных приложениях решает отклик нажатия (`press feedback`), bottom-sheet, пружины и тактильный отклик (`haptics`) в UI-потоке `Reanimated` (`60/120fps`).

---

## 5. В каких направлениях и задачах полезен?

- **Когда использовать:** Не устанавливать — вместо него используются [impeccable](impeccable.md) и [animate-expo](../mobile/animate-expo.md).

---

## 6. Статус и история действий

| Дата | Действие | Статус | Примечание |
|---|---|---|---|
| 2026-10-31 | Глобальное подключение через `skillshare` и проверка в работе | 🔄 **Есть альтернатива получше:** [impeccable](impeccable.md) + [animate-expo](../mobile/animate-expo.md) | Проверялся на микро-полировке Web CSS (начал конфликтовать по auto-trigger после установки `impeccable` `2026-11-09`). |
| 2026-11-15 | Удаление из глобального окружения через `skillshare uninstall make-interfaces-feel-better -g` | 🔄 **Есть альтернатива получше:** [impeccable](impeccable.md) + [animate-expo](../mobile/animate-expo.md) | Удалён, так как [impeccable](impeccable.md) и [animate-expo](../mobile/animate-expo.md) полностью покрывают все его полезные правила без громоздких отчётов. |
