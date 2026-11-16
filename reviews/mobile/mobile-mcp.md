# `mobile-mcp` (`mobile-next/mobile-mcp`)

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/mobile/mobile-mcp.md) | [🇷🇺 Русский](../ru/mobile/mobile-mcp.md)

- **Manba:** [mobile-next/mobile-mcp](https://github.com/mobile-next/mobile-mcp)
- **Turkum:** `Mobile` *(iOS va Android uchun MCP server)*
- **Turi:** `MCP Server (34 ta tool)` + `Plugin / Skill`
- **Sifat bahosi:** **7.0 / 10**
- **Bizga kerakliligi:** **2.0 / 10**
- **Tavsiya etilgan ko'lam:** `O'rnatmaslik` *(o'rniga [**`agent-device`**](agent-device.md) CLI + [**`adb`**](adb.md))*
- **Tekshirilgan sana:** `2026-11-16`
- **Joriy holati:** `⛔ Rad etildi` *(izolyatsiya qilingan `/tmp` muhitda jonli sinab ko'rildi va tezlik, kontekst shishishi hamda telemetriya sabab rad etildi)*

---

## 1. Nima va qanday ishlaydi?

> [!IMPORTANT]
> **Oddiy tilda (Asosiy vazifasi va foydasi):** Jonli sinovda rad etildi: ishlatmasangiz ham har bitta yozishmada **`~7,580` tokenni bekorga yeb turadi**, `agent-device` dan **`6.5x–37x` sekin** (`6–7 soniya`) hamda ichida telemetriya va pullik cloud reklamalari bor.

`@mobilenext/mobile-mcp` — AI agentlarga iOS va Android qurilmalarini MCP protokoli (`stdio` yoki Streamable HTTP) orqali boshqarish imkonini beruvchi Node.js serveri (`mobilewright` / WebDriverAgent ustiga qurilgan). U 34 ta `mobile_*` toolni (`mobile_list_elements_on_screen`, `mobile_click_on_screen_at_coordinates`, `mobile_login_to_cloud_provider` va b.) agentga taqdim etadi.

---

## 2. Jonli Sinov Natijalari: Nega rad etildi?

iOS 26.5 Simulator va real Android planshetda [**`agent-device`**](agent-device.md) bilan yonma-yon sinab ko'rilganda 4 ta jiddiy kamchilik tasdiqlandi:

1. **Har bitta chatda `~7 580 token` doimiy kontekst yuki:** `tools/list` javobi **34 ta tool (`30 321 bayt`)** qaytaradi. MCP ulangan bo'lsa, siz oddiy SQL yoki backend kod yozayotganingizda ham shu `~7.6K token` har bir turnda osilib turadi.
2. **Juda sekin ishlaydi (`6.5x – 37x` sekin):**
   - iOS Simulator'da elementlarni o'qish **`7 277 ms` (`~652 token`)** oldi (`agent-device` da **`197 ms`**, `~141 token`).
   - Android jonli xarita ekranida **`5 788 ms` (`~309 token`)** oldi (`agent-device` da **`888 ms`**, `~100 token`).
3. **Koordinataga bog'langan mo'rt bosish:** `@e7` refga bosish o'rniga agent `at=x,y size=WxH` dan markaziy koordinatani hisoblab `mobile_click_on_screen_at_coordinates` chaqirishga majbur va `--settle` diff mexanizmi yo'q.
4. **Telemetriya va tijoriy bulut reklamasi:** `src/server.ts` (`148, 156`-qatorlar) va `src/telemetry-quota.ts` ichida `Scarf` hamda `PostHog` (`tool_invoked`, `tool_failed`, `get_more_tools`) telemetriyasi default holatda yoqilgan (`MOBILEMCP_DISABLE_TELEMETRY` qo'yilmasa tashqariga yuboradi), MCP toollar ichiga esa pullik `mobilenext.ai` bulut xizmati qo'shib yuborilgan.

---

## 3. Xavfsizlik va Sanitarizatsiya

- **Xavf darajasi:** `O'rta` *(default `PostHog` + `Scarf` telemetriyasi, `.mobilecli` fon jarayoni va autentifikatsiyasiz HTTP rejimi ogohlantirishi)*
- Agar kimdir vaqtincha sinab ko'rmoqchi bo'lsa: `MOBILEMCP_DISABLE_TELEMETRY=1` va `SCARF_ANALYTICS=false` berishi hamda global MCP ro'yxatiga qo'shmasligi shart.

---

## 4. Mavjud vositalarimiz bilan solishtiruv (Muqobili)

- **To'liq muqobili:** [**`agent-device`**](agent-device.md) (CLI rejimida `0` MCP yuki, iOS'da `37x` tez, Android'da `6.5x` tez, telemetriyasiz `MIT`, ustiga-ustak `tvOS` va `Android TV` ni ham qo'llaydi).

---

## 5. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-11-16 | Manba kodi (`src/server.ts`, `telemetry-quota.ts`) auditi va vaqtinchalik `/tmp` muhitda iOS + Android jonli benchmark | `⛔ Rad etildi` | `~7 580` tokenlik MCP shishishi, `5.8–7.3s` sekinlik va `PostHog`/`Scarf` telemetriyasi sabab o'chirib tashlandi; o'rniga `agent-device` qabul qilindi. |
