# `sentry` (Self-Hosted Sentry + AI Skill / MCP)

[🇺🇿 O'zbekcha](../../backend/sentry.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/backend/sentry.md)

- **Source:** [getsentry/self-hosted](https://github.com/getsentry/self-hosted) · [docs.sentry.io](https://docs.sentry.io/)
- **Category:** `Backend` *(Full-Stack Observability: Backend, Web & Mobile Errors, Traces, and Session Replay)*
- **Type:** `Self-Hosted Platform + SDK + AI Skill / MCP`
- **Quality Score:** **9.5 / 10**
- **Relevance to Us:** **9.5 / 10**
- **Recommended Scope:** `Global (-g)` *(across all projects via AI navigation skill / MCP)*
- **Related Alternative:** [**`opentelemetry`**](opentelemetry.md) *(Sentry v8+ SDKs run on OpenTelemetry under the hood)*
- **Active Since:** `2026-07-08`
- **Current Status:** `✅ Using` *(primary error, trace, and replay investigation platform across Backend, Web, and iOS/Android)*

---

## 1. What It Is & How It Works

A unified observability platform that captures real-time errors, slow requests, and user context across Web (`React`, `Next.js`), Mobile (`iOS`, `Android`, `React Native / Expo`), and Backend (`Nest.js`, `FastAPI`, background workers/queues):
- **Smart `Issue Grouping`:** Deduplicates thousands of identical crashes or exceptions into a single `Issue`, tracking user impact and the exact `Release` where it first appeared.
- **`Stack Trace` + `Breadcrumbs`:** Pinpoints exact source lines (`Source Maps`, iOS `dSYM`, Android `ProGuard/R8`) alongside the chronological trail of UI clicks, console logs, and network requests leading up to the failure.
- **`Distributed Tracing` (powered by OpenTelemetry):** Modern Sentry SDKs (`v8+`) use OpenTelemetry under the hood to link a frontend request through backend APIs, databases (`SQL`/`Redis`), and background queue workers under a single `trace_id`.
- **`Session Replay`:** Records a video-like DOM reconstruction of web user sessions when errors occur (including `rage/dead clicks` and network timelines).
- **AI Agent Integration (`Skill` / `MCP`):** Through a dedicated Sentry navigation skill or `MCP & CLI` connection, AI agents inspect issues, stack traces, releases, and traces directly to correlate production bugs with source code.

---

## 2. Strengths & Weaknesses (Compared to `OpenTelemetry`)

### Strengths (Where Sentry Wins)
- **Developer & User-Centric Diagnostics (`Application-centric`):** Far stronger out of the box than a raw [`opentelemetry`](opentelemetry.md) stack at exception deduplication, `Release` regression tracking, mobile `dSYM`/`ProGuard` symbolication, and UI `Breadcrumbs`.
- **Built-in `Session Replay`:** Connects browser user interactions directly to the error event without maintaining a separate replay tool (OpenTelemetry has no Session Replay specification at all).
- **Single-Stack Simplicity:** Covers errors, baseline distributed traces, and web replays in one self-hosted deployment.

### Weaknesses & Limitations
- **Not an Infrastructure Monitor:** For host CPU/RAM/disk telemetry, container metrics, DB connection-pool saturation, and high-volume raw `stdout` log indexing, [`opentelemetry`](opentelemetry.md) (+ `Grafana` / `SigNoz`) is stronger.
- Setting `100%` (`1.0`) sampling on `Session Replay` and `Tracing` for all traffic will quickly fill self-hosted disk storage.

---

## 3. Security, Privacy & General Setup Checklist

- **Risk Level:** `Low` *(self-hosted under your own control)*
- **Security & AI Investigation Rules:**
  1. **Scrub Sensitive Data (`sendDefaultPii: false` / Data Scrubbing):** Never expose passwords, `Authorization` headers, JWT/refresh tokens, payment details, or DSN keys in logs or persistent docs; keep input masking enabled in Replay (`maskAllInputs: true`).
  2. **Read-Only Guardrails for AI Agents:** Investigation must never resolve/archive issues, mutate alert rules, or alter project settings without explicit user instruction.
- **General Requirements to Unlock Full Sentry Value:**
  1. **`Source Maps` & `Debug Symbols`:** Upload Web `Source Maps`, Android `ProGuard/R8` mappings, and iOS `dSYM` files during CI builds so stack traces point to real `.ts`/`.tsx`/native lines instead of compiled bundles like `/app/main.js`.
  2. **Balanced `Tracing` Sample Rate:** Enable `tracesSampleRate: 0.1` (`10%`–`20%`) on Web and Backend SDKs to capture slow SQL queries and cross-service waterfalls without overloading storage.
  3. **Error-Triggered `Session Replay`:** Configure `replaysSessionSampleRate: 0` (or `0.05`) with **`replaysOnErrorSampleRate: 1.0`** to capture `100%` of failing sessions while keeping disk usage minimal.
  4. **Explicit `release` & `environment` Tags:** Pass git SHA / version and environment (`production` / `staging`) on every deploy.

---

## 4. Relevance & Relationship to [`opentelemetry`](opentelemetry.md)

- Because we build across Web, Mobile (`iOS` / `Android`), and Backend services simultaneously, **we chose `Sentry` as our primary observability platform instead of running a separate OpenTelemetry backend**: it unifies error grouping, mobile crash symbolication, `Breadcrumbs`, `Session Replay`, and `v8+` OTel-based traces in one place.
- Maintaining a separate [`opentelemetry`](opentelemetry.md) (`Collector + Grafana/SigNoz`) cluster is only needed if deep host/DB infrastructure metrics and centralized high-volume log storage become necessary later.

---

## 5. Best Use Cases

- **When to use:** Investigating production/staging crashes and `500` errors, catching post-release regressions, replaying failing web user sessions (`Replay` + `Breadcrumbs`), and tracing slow API/DB endpoints.
- **When not to use:** Host-level CPU/RAM/disk monitoring or storing millions of raw infrastructure log lines per minute.

---

## 6. Status & Action History

| Date | Action | Status | Notes |
|---|---|---|---|
| 2026-07-08 | Integrated Self-Hosted Sentry across projects + synced AI diagnostic skill (`2026-10-31`) | `✅ Using` | Connected across Backend, Web, and iOS/Android projects as our primary platform for error, stack-trace, breadcrumb, and trace diagnostics. |
