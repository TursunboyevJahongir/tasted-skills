# `opentelemetry` (OpenTelemetry + SigNoz / Grafana Stack)

[🇺🇿 O'zbekcha](../../backend/opentelemetry.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/backend/opentelemetry.md)

- **Source:** [open-telemetry.io](https://opentelemetry.io/) · [open-telemetry/opentelemetry-collector](https://github.com/open-telemetry/opentelemetry-collector)
- **Category:** `Backend` *(Distributed Tracing, Server/DB Metrics, and Centralized Logs Standard)*
- **Type:** `Observability Standard + SDK + Collector` *(paired with `SigNoz` or `Grafana Tempo/Loki/Prometheus` for storage & UI)*
- **Quality Score:** **9.0 / 10**
- **Relevance to Us:** **4.0 / 10** *(as a separate standalone stack — since `Sentry` already covers our primary needs)*
- **Recommended Scope:** `Skip Standalone Deployment for Now` *(adopt only when multi-service Backend + Infra metrics/logs outgrow Sentry)*
- **Used Instead:** [**`sentry`**](sentry.md) *(Self-Hosted Sentry + v8+ OTel SDK + AI Skill)*
- **Reviewed Date:** `2026-11-15`
- **Current Status:** `👍 Good Option` *(we run [`sentry`](sentry.md) instead of maintaining a second observability stack)*

---

## 1. What It Is & How It Works

> [!IMPORTANT]
> **In Plain Words (Main Job & Value):** The gold standard when you need deep host CPU/RAM and DB pool metrics across dozens of microservices, but requires maintaining `Collector + Grafana/SigNoz` — whereas `Sentry` covers all our app errors, replays, and traces in one stack.

A vendor-neutral CNCF (Cloud Native Computing Foundation) standard that collects and ships **all three observability signals (`Traces`, `Metrics`, `Logs`) in a single unified protocol (`OTLP`)** across any language or service:

1. **Unified Request Passport (`trace_id` / W3C `traceparent`):** Follows a single user request seamlessly across APIs, auth services, databases (`PostgreSQL`/`Redis`), message queues (`Workers`), and third-party payment/SMS gateways.
2. **`Traces` (Waterfall Timeline):** Breaks down a `3-second` request to the millisecond, showing exactly which service or SQL query caused the bottleneck.
3. **`Metrics` (System & App Telemetry):** Tracks real-time `RPS`, `p95`/`p99` latency, host CPU/RAM, DB connection-pool usage, and queue depth.
4. **`Logs` (Trace-Correlated Logs):** Automatically injects `trace_id` and `span_id` into every log record so logs across multiple services can be queried together for a single request.

*(Important: OpenTelemetry itself is the collection and transport pipeline, not a database or dashboard. To store and view data, you pair it with **SigNoz** or **Grafana (`Tempo` + `Loki` + `Prometheus`)**.)*

---

## 2. What Problems It Solves & How It Compares to [`sentry`](sentry.md)

### Core Problems Solved (Strengths)
- **"No `500` Error, Yet the App Feels Slow":** Catches endpoints that return `200 OK` without throwing exceptions while silently suffering from `N+1` SQL queries, missing indexes, lock contention, or slow external API calls.
- **Cross-Service Blame Attribution:** Shows in one waterfall diagram whether latency or failure originated in the API gateway, an internal microservice, or a background worker.
- **Correlating Code Latency with Server/DB Saturation:** Answers *"Why did API latency spike at 21:00?"* by overlaying trace duration directly against DB connection-pool exhaustion or memory pressure.
- **Zero Vendor Lock-in:** Instrument your code once with OTel SDKs and route telemetry to `SigNoz`, `Grafana`, `Datadog`, or `Sentry` without rewriting application code.

### Weaknesses & Where [`sentry`](sentry.md) Wins
- **Weak Exception Grouping & Mobile Crash Diagnostics:** If the same bug fires 10,000 times, raw OTel logs/traces record 10,000 separate entries; Sentry deduplicates them into 1 `Issue`, tracks `Release` regressions, and natively symbolicates iOS `dSYM` and Android `ProGuard` crashes.
- **No `Session Replay`:** OpenTelemetry has no concept of browser DOM session recording or rage/dead-click replay.
- **Extra Operational Overhead:** Requires deploying and maintaining an `otel-collector`, storage engine (`ClickHouse` or `Tempo`/`Loki`/`Prometheus`), visualization UI, and disk retention policies.

---

## 3. What You Need in General to Run OpenTelemetry (Architecture & Security)

A complete, production-safe OpenTelemetry deployment requires 4 building blocks:
1. **Application Auto-Instrumentation SDKs:**
   - `@opentelemetry/sdk-node` + `@opentelemetry/auto-instrumentations-node` for Node.js / Nest.js; `opentelemetry-distro` for Python / FastAPI (automatically instruments `HTTP`, `PostgreSQL`, `Redis`, and queue calls).
2. **`OpenTelemetry Collector` (`otel-collector`):**
   - Middleware pipeline that receives, batches, filters, and forwards telemetry from apps to storage.
   - **Mandatory Sanitization (`transform`/`attributes` processors):** Strip `Authorization` headers, cookies, JWTs, passwords, and `PII` inside the Collector before data ever hits disk.
   - **Tail-Based Sampling:** Keep `100%` of traces with errors or high latency (`>1s`) while sampling routine fast requests at `5–10%` to control storage costs.
3. **Storage & Visualization Backend (pick one):**
   - **All-in-one option:** [**SigNoz**](https://github.com/SigNoz/signoz) (`Traces + Metrics + Logs` backed by `ClickHouse` in a single UI).
   - **Modular option:** **Grafana LGTM** (`Tempo` for traces, `Loki` for logs, `Prometheus` / `VictoriaMetrics` for metrics).
4. **Disk `TTL / Retention` Rules:** Enforce explicit retention windows (e.g., `7–14 days`) for logs and traces.

---

## 4. Why We Skip a Separate Stack Right Now (`Sentry` vs `OpenTelemetry` Decision)

- Because our daily engineering spans Web, Mobile (`iOS` / `Android`), and Backend services, **we chose [`sentry`](sentry.md) instead of operating a standalone OpenTelemetry stack**: Sentry gives us smart crash/exception grouping, `Breadcrumbs`, `Session Replay`, and `v8+` OpenTelemetry-powered distributed traces in a single platform.
- Deploying a separate OpenTelemetry backend (`SigNoz` or `Grafana`) only makes sense when **deep server/DB infrastructure metrics and centralized high-volume backend log search** outgrow Sentry — and even then, OTel Collector can dual-ship errors to Sentry and metrics/logs to the OTel backend without instrumenting code twice.

---

## 5. Best Use Cases

- **When to use:** Multi-microservice backend architectures that need unified `p95`/`p99` cross-service latency waterfalls, host/DB resource metrics, and centralized trace-linked logs.
- **When not to use:** When your primary goal is catching Web/Mobile crashes, `Session Replay`, and code-level exceptions and [`sentry`](sentry.md) is already in place.

---

## 6. Status & Action History

| Date | Action | Status | Notes |
|---|---|---|---|
| 2026-11-15 | Architectural review, required stack blueprint, and comparison against [`sentry`](sentry.md) | `👍 Good Option` | Excellent industry standard (`9.0/10`), but skipped as a separate deployment because [`sentry`](sentry.md) already covers our errors, replays, and baseline traces. |
