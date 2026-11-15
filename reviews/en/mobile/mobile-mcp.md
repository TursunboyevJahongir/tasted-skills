# `mobile-mcp` (`mobile-next/mobile-mcp`)

[🇺🇿 O'zbekcha](../../mobile/mobile-mcp.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/mobile/mobile-mcp.md)

- **Source:** [mobile-next/mobile-mcp](https://github.com/mobile-next/mobile-mcp)
- **Category:** `Mobile` *(MCP server for iOS and Android automation)*
- **Type:** `MCP Server (34 tools)` + `Plugin / Skill`
- **Quality Score:** **7.0 / 10**
- **Need for Us:** **2.0 / 10**
- **Recommended Scope:** `Do Not Install` *(use [**`agent-device`**](agent-device.md) CLI + [**`adb`**](adb.md) instead)*
- **Reviewed Date:** `2026-11-16`
- **Current Status:** `⛔ Rejected` *(benchmarked live in an isolated `/tmp` harness and rejected due to slow latency, heavy MCP context bloat, and built-in telemetry)*

---

## 1. What It Is and How It Works

`@mobilenext/mobile-mcp` is a Node.js MCP server (`stdio` / Streamable HTTP) built around `mobilewright` and WebDriverAgent that exposes 34 `mobile_*` tools (`mobile_list_elements_on_screen`, `mobile_click_on_screen_at_coordinates`, `mobile_login_to_cloud_provider`, etc.) to MCP clients.

---

## 2. Live Benchmark Findings: Why It Was Rejected

Tested head-to-head against [**`agent-device`**](agent-device.md) on an iOS 26.5 Simulator and a physical Android tablet:

1. **`~7,580 tokens` of permanent context bloat on every chat:** `tools/list` injects **34 tool schemas (`30,321 bytes`)** into every conversation — even when working on pure backend, SQL, or CSS tasks.
2. **Significantly slower (`6.5x – 37x` slower):**
   - iOS Simulator element listing took **`7,277 ms` (`~652 tokens`)** vs **`197 ms` (`~141 tokens`)** in `agent-device`.
   - Android live map screen listing took **`5,788 ms` (`~309 tokens`)** vs **`888 ms` (`~100 tokens`)** in `agent-device`.
3. **Coordinate-math interaction & no `--settle` diffs:** Forces the LLM to compute center `(x, y)` coordinates from `at=x,y size=WxH` strings and re-fetch full element lists after every tap.
4. **Built-in telemetry & commercial cloud upsell:** `src/server.ts` (lines `148, 156`) and `src/telemetry-quota.ts` fire `Scarf` and `PostHog` (`tool_invoked`, `tool_failed`, `get_more_tools`) pings by default unless `MOBILEMCP_DISABLE_TELEMETRY` is set, and bundle commercial `mobilenext.ai` cloud device allocation tools directly into the schema.

---

## 3. Security & Sanitization

- **Risk Level:** `Medium` *(default `PostHog` + `Scarf` telemetry, persistent `~/.mobilecli` state, and commercial cloud tools)*
- If ever tested in isolation: set `MOBILEMCP_DISABLE_TELEMETRY=1` and `SCARF_ANALYTICS=false`, and do not register it in global MCP configs.

---

## 4. Superior Alternative in Our Stack

- **Replaced completely by:** [**`agent-device`**](agent-device.md) (`0` MCP token overhead in CLI mode, `37x` faster on iOS, `6.5x` faster on Android, clean `MIT` with zero telemetry, plus native `tvOS` and `Android TV` support).

---

## 5. Status & Action History

| Date | Action | Status | Notes |
|---|---|---|---|
| 2026-11-16 | Source audit (`src/server.ts`, `telemetry-quota.ts`) + isolated `/tmp` live benchmark on iOS & Android | `⛔ Rejected` | Removed after benchmark due to `~7,580`-token MCP schema bloat, `5.8–7.3s` latency, and `PostHog`/`Scarf` telemetry; adopted `agent-device` instead. |
