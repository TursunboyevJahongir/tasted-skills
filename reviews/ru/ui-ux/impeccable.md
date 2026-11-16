# `impeccable`

[🇺🇿 O'zbekcha](../../ui-ux/impeccable.md) | [🇬🇧 English](../../en/ui-ux/impeccable.md) | **🇷🇺 Русский**

- **Источник:** [pbakaus/impeccable](https://github.com/pbakaus/impeccable)
- **Категория:** `UI/UX` *(Дизайн-система и UX-аудит для Web, Mobile Web и Native iOS/Android)*
- **Тип:** `Skill` *(v4.8.1, адаптирован с локальным патчем `mobile-routing-1+apca-contrast-1`)*
- **Оценка качества:** **9.5 / 10**
- **Полезность для нас:** **9.5 / 10**
- **Рекомендуемый охват:** `Global (-g)`
- **Используется с:** `2026-11-09`
- **Текущий статус:** `✅ Использую` *(основной дизайн-скилл во всех веб- и мобильных UI/UX-задачах)*

---

## 1. Что это и как работает?

> [!IMPORTANT]
> **Простыми словами (Главная задача и польза):** Запрещает однотипные ИИ-шаблоны («AI-slop»), проектирует, проверяет и полирует интерфейсы для Web, мобильного веба и iOS/Android (`polish`, `clarify`, `harden`). Наша локальная правка **`APCA` (`|Lc| ≥ 60`)** защищает чистый белый текст на цветных кнопках от порчи старой формулой `WCAG 2`.

Комплексный скилл уровня *Design Director*, разработанный Полом Бакаусом (Paul Bakaus). Вместо готовых цветовых шаблонов он работает в 4 режимах в зависимости от задачи страницы:
- **Persuade:** Лендинги, маркетинговые и тарифные страницы (выразительный визуальный характер и конверсия).
- **Operate:** Дашборды, админ-панели, карты и рабочие веб-приложения (приоритет ясности, скорости чтения и удобства).
- **Read:** Документация, статьи и руководства.
- **Experience:** Портфолио и медиа-презентации.

Включает специализированные плейбуки (`shape`, `audit`, `polish`, `simplify`, `harden`, `adapt`), строгий порог качества (`craft-floor.md` — запрещает шаблонные AI-карточки, бессмысленный градиентный текст и фальшивый декор), а также хранение контекста продукта в `PRODUCT.md` и `DESIGN.md`. Наша версия адаптирована как для **мобильного веба**, так и для **нативных экранов iOS / Android**, а также дополнена защитой **перцептивного контраста `APCA`**.

---

## 2. Сильные и слабые стороны

### Сильные стороны
- Работает без поломки существующего стека и дизайн-системы проекта (четко разделяет границы `Refinement` и `Redesign`).
- Требует проверки реальных размеров в браузере или симуляторе после каждого изменения.
- Не скатывается в отраслевые клише, как шаблонные генераторы вроде `ui-ux-pro-max`.

### Слабые стороны и ограничения
- Из-за большого объема инструкций и reference-файлов нужно выборочно читать только нужный плейбук (`adapt.md`, `audit.md`, `craft-floor.md`).
- В исходной (`upstream`) версии `v4.8.1` контраст проверяется только по старой формуле **`WCAG 2` (`4.5:1`)** — на ярких бренд-кнопках средней светлоты это ложно бракует чистый белый текст и заставляет AI менять его на грязный чёрный текст или портить цвет бренда (решено нашим локальным патчем `apca-contrast-1` ниже).

---

## 3. Безопасность, санитаризация и локальные адаптации

- **Уровень риска:** `Низкий` *(локально адаптирован и очищен)*
- **Выполненная санитаризация (важно):**
  1. В нашей локальной установке отключены внешние `hooks` и автоматические режимы `live`/`generate` (чтобы скилл не вызывал несанкционированные CLI-агенты).
  2. Даже если режим `live` будет включен вручную в будущем, действует ограничение `IMPECCABLE_LIVE_COPY_AGENT=chat` (или `off`).

<a id="apca-contrast"></a>

### Локальный патч перцептивного контраста `APCA` (`apca-contrast-1` — что именно и как мы изменили)

**Почему это стоит добавить?**
`WCAG 2` (2008) просто делит яркость `(L1 + 0.05) / (L2 + 0.05)`, не учитывая полярность восприятия глазом (белые буквы на тёмном ≠ чёрные на светлом) и толщину шрифта. На акцентных цветах средней яркости (`L > 0.18` — **оранжевый, синий iOS `#007AFF`, зелёный, красный** в кнопках и бейджах):
- **Оранжевая или синяя кнопка + белый текст:** `WCAG 2 = 3.81–4.02` ❌ *(не проходит)*, но **`APCA = Lc 70–72` ✅** *(нужно `60`, глазом читается чётко и чисто)*.
- **Оранжевая кнопка + чёрный текст:** `WCAG 2 = 4.63` ✅ *(проходит)*, но **`APCA = Lc 38` ❌** *(читается грязно и тускло)*.

Вместо установки отдельного скилла (который конфликтовал бы по `auto-trigger` и раздувал контекст), мы точечно обновили 6 внутренних файлов `impeccable` (`Было -> Стало`):

1. **`SKILL.md` (`metadata.local-adaptation`, строка 9):**
   - **Было:** `local-adaptation: mobile-routing-1`
   - **Стало:** `local-adaptation: mobile-routing-1+apca-contrast-1`

2. **`reference/craft-floor.md` (строка 9 — главное правило, читаемое перед каждой UI-правкой):**
   - **Было:**
     ```markdown
     - **Contrast:** body and placeholder text ≥4.5:1, large text ≥3:1. On colored surfaces tint secondary text from that hue or the foreground; never gray.
     ```
   - **Стало:**
     ```markdown
     - **Contrast:** body and placeholder text ≥4.5:1 (APCA |Lc| ≥75 body, ≥60 secondary), large text ≥3:1. On mid-tone brand fills (orange, blue, green, red buttons/badges), check both WCAG 2 and APCA: keep crisp light text when APCA |Lc| ≥60 (14px+ medium/semibold) instead of flipping to muddy dark text or dulling the brand hue just to chase WCAG 4.5:1; reject dark-on-accent pairs that pass WCAG 2 but fail APCA (|Lc| <60). On colored surfaces tint secondary text from that hue or the foreground; never gray.
     ```

3. **`reference/colorize.md` (`## Contrast and perception`, строки 53–63):**
   - **Было:** только 2-колоночная таблица `WCAG AA minimum` (`body text: 4.5:1`, `large text: 3:1`, `controls, icons, focus indicators: 3:1`).
   - **Стало:** 3-колоночная таблица `WCAG AA minimum` + `APCA perceptual floor` и правило для акцентных кнопок:
     ```markdown
     Verify computed foreground/background pairs with both WCAG 2 and perceptual APCA (`|Lc|`):

     | Content | WCAG AA minimum | APCA perceptual floor |
     |---|---|---|
     | body text | 4.5:1 | `\|Lc\| ≥ 75` (`≥ 60` secondary) |
     | large text / button & badge labels (`14px+` medium/semibold) | 3:1 (4.5:1 if strict legal WCAG AA applies) | `\|Lc\| ≥ 60` |
     | controls, icons, focus indicators | 3:1 | `\|Lc\| ≥ 45` |

     On mid-tone brand fills (vivid orange, iOS blue, green, red CTAs/badges), WCAG 2 luminance math favors dark text (`~4.6:1`, APCA `~38`) over crisp white text (`~3.8–4.1:1`, APCA `70+`). Unless strict legal WCAG 2 AA compliance is explicitly required, keep white text when `APCA |Lc| ≥ 60` rather than switching to low-perceptual dark text or muddying the brand color; fix pairs that fail both (`WCAG < 4.5:1` and `APCA |Lc| < 60`).
     ```

4. **`reference/audit.md` (`### 1. Accessibility`, строка 14):**
   - **Было:**
     ```markdown
     - **Contrast issues**: Text contrast ratios < 4.5:1, or < 3:1 for large text (or 7:1 for AAA)
     ```
   - **Стало:**
     ```markdown
     - **Contrast issues**: Body/secondary text < 4.5:1 (`APCA |Lc| < 60`), or large text < 3:1. On mid-tone brand buttons/badges (`14px+` medium/semibold), evaluate both WCAG 2 and APCA: white text with `APCA |Lc| ≥ 60` (`WCAG ~3.5–4.4:1`) is perceptually legible (note only as an advisory if strict legal WCAG AA is required, not a P1 defect), whereas dark text on mid-tone accents with `APCA |Lc| < 60` is a real contrast failure even if `WCAG ≥ 4.5:1`
     ```

5. **`reference/audit.native.md` (`### 1. Accessibility`, строка 17):**
   - **Было:**
     ```markdown
     - **Contrast**: text failing contrast in either appearance, light or dark
     ```
   - **Стало:**
     ```markdown
     - **Contrast**: text failing contrast in either appearance, light or dark (check both WCAG 2 and perceptual APCA `|Lc| ≥ 60` on mid-tone brand/system tint buttons such as iOS `#007AFF`, orange, or green fills so crisp white button labels aren't falsely flagged or flipped to muddy dark text)
     ```

6. **`reference/critique.md` (accessibility-персона `Sam`, строки 734 и 741):**
   - **Было:** `Needs adequate color contrast (4.5:1 minimum)` и `Is color contrast WCAG AA compliant (4.5:1 for text)?`
   - **Стало:** `Needs adequate color contrast (4.5:1 body text; APCA |Lc| ≥ 60 on mid-tone accent buttons/badges)` и `Is color contrast legible across both WCAG AA (4.5:1 body) and perceptual APCA (|Lc| ≥ 60 on colored controls)?`

---

## 4. Полезность для нас и совместимость с существующими инструментами

- Взаимно дополняет [`animate-expo`](../mobile/animate-expo.md) для анимаций в React Native / Expo и [`mobile-native`](../mobile/mobile-native.md) для тач- и viewport-правил в мобильных браузерах/PWA.
- Благодаря наличию этого скилла нет необходимости глобально устанавливать конкурирующие UI-скиллы вроде [`ui-ux-pro-max`](ui-ux-pro-max.md), [`make-interfaces-feel-better`](make-interfaces-feel-better.md) и глобального [`taste-skill`](../web/taste-skill.md) (они конфликтуют с `impeccable`).

---

## 5. В каких направлениях и задачах полезен?

- **Когда использовать:** При проектировании нового интерфейса, улучшении существующих веб- или нативных мобильных экранов, проведении UX/accessibility-аудита и упорядочивании дизайн-токенов.
- **Когда не использовать:** В задачах чистого бэкенда, БД или не связанных с UI.

---

## 6. Статус и история действий

| Дата | Действие | Статус | Примечание |
|---|---|---|---|
| 2026-11-09 | Глобальная установка `v4.8.1` (с `mobile-routing-1` и безопасным ограничением хуков) | `✅ Использую` | Активно используется для дизайна и аудита контраста/UX в веб, мобильном вебе и React Native экранах. |
| 2026-11-16 | Добавлен локальный патч перцептивного контраста `apca-contrast-1` + `skillshare sync -g` | `✅ Использую` | Обновлены `SKILL.md`, `craft-floor.md`, `colorize.md`, `audit.md`, `audit.native.md` и `critique.md` под двойную проверку `WCAG 2 + APCA (\|Lc\| ≥ 60)` (защита белого текста на цветных бренд-кнопках). |
