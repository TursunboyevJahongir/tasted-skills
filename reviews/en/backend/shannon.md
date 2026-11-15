# `Shannon` (`KeygraphHQ/shannon` — AI Pentester)

[🇺🇿 O'zbekcha](../../backend/shannon.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/backend/shannon.md)

- **Source:** [KeygraphHQ/shannon](https://github.com/KeygraphHQ/shannon)
- **Category:** `Backend` *(White-Box Web & HTTP API Security Auditing and Autonomous Pentesting)*
- **Type:** `Standalone CLI (Docker + Temporal)` + lightweight local `hacker-test` trigger skill
- **Quality Score:** **8.5 / 10**
- **Need for Us:** **6.5 / 10**
- **Recommended Scope:** `Standalone CLI (npx @keygraph/shannon@latest)` — *run on demand before major releases against local/staging only; do not install its heavy plugin globally*
- **Reviewed Date:** `2026-11-16`
- **Current Status:** `👀 Reviewed (Not Tested)` *(source audited; wired to a tiny `hacker-test` reminder skill so we can trigger local pre-release pentests on demand)*

---

## 1. What It Is and How It Works

`Shannon` (`AGPL-3.0`) is not a static linter or passive code-review prompt — it is an autonomous **White-Box AI Pentester** that attacks a running Web app and HTTP API to prove exploitability:

1. Running `npx @keygraph/shannon@latest start -u <url> -r <repo>` boots **Docker + Temporal (`temporalio/temporal:1.7.0`) + Playwright CLI + the Pi agent harness**.
2. It mounts the repository `read-only` inside an ephemeral worker container to map routes, auth guards, trust boundaries, and data flows (`pre-recon` & `recon`).
3. It then dispatches live exploitation agents against the target URL across **5 OWASP classes**:
   - **Broken Authentication** (`exploit-auth`)
   - **Broken Authorization / IDOR** (`exploit-authz` — cross-user / cross-tenant access)
   - **Injection** (`exploit-injection` — SQL/NoSQL/Command injection)
   - **XSS** (`exploit-xss`)
   - **SSRF** (`exploit-ssrf`)
4. **"No exploit, no report":** Only vulnerabilities confirmed with a working proof-of-concept (`status: exploited`) are emitted into PDF, Markdown, JSON, and SARIF 2.1.0 reports.

---

## 2. Strengths and Weaknesses

### Strengths
- **Fills an open security gap in our stack:** `elephant-goldfish-model` catches architecture and doc-code drift while `sentry` catches runtime crashes, whereas `Shannon` actively tests live endpoints for IDOR, broken permissions, auth bypass, and injection.
- **Works with existing `Codex` (`ChatGPT Plus/Pro`) subscriptions:** No separate high API bill required — authenticates via `pi` (`SHANNON_USE_PI_AUTH=1` + `SHANNON_AI_MODEL=openai-codex:gpt-5.5` or `gpt-6-sol`) *(note: v2 dropped Claude Code OAuth subscription support, which only remains on legacy `@1.9.0`)*.

### Weaknesses and Cost
- **Heavy and slow:** Requires Docker + Temporal, takes **1 to 1.5 hours** per full scan, and consumes substantial model quota.
- **OpenAI / Anthropic Cyber Safeguards:** Real-time vendor cyber guardrails can interrupt scans mid-run unless verified beforehand with `--validate-model` (and vendor enrollment such as `chatgpt.com/cyber` when required).
- **Web & HTTP API scope only:** Does not test native iOS/Android binaries, raw binary TCP protocols, or dependency CVEs.

---

## 3. Security & Pre-Install Sanitization

- **Risk Level:** `Medium` *(destructive against target database state if pointed at the wrong environment)*
- **Inspected Surface:** `plugins/shannon/skills/shannon/SKILL.md`, `compose.yml`, `docs/safety.md`, `AGPL-3.0` license.
- **Mandatory operational rules:**
  1. **Never point at production:** Exploitation agents create users, submit forms, and mutate/delete data. Target only disposable local servers (`http://host.docker.internal:<port>`) or isolated staging databases.
  2. **Skip global installation of `plugins/shannon`:** Avoid loading its large `llms-full.txt` bundle globally; instead, use a tiny (~40-token) `hacker-test` skill that activates only when explicitly asked for `"hacker test"`.
  3. **Scan only trusted own repositories:** Source-reading LLM agents are exposed to prompt injection on untrusted third-party repos.

---

## 4. Fit & Compatibility with Our Existing Stack

- Unnecessary for daily coding turns, but a strong pre-release security gate when multi-tenant permissions, auth/device guards, or billing/subscription endpoints change — invoked on demand via `"hacker test"`.

---

## 5. When to Use (and When Not To)

- **When to use:** Before major releases on a local Docker/staging environment to test Web apps and Backend HTTP APIs for IDOR, auth bypass, SQLi, XSS, and SSRF (trigger with `"hacker test"`).
- **When not to use:** Against production systems, for routine UI tweaks, or on native mobile binaries / raw TCP services.

---

## 6. Status & Action History

| Date | Action | Status | Notes |
|---|---|---|---|
| 2026-11-16 | Source code, Docker/Temporal architecture, and `ai-providers.md` audit + created lightweight `hacker-test` trigger skill | `👀 Reviewed (Not Tested)` | Approved as an on-demand `npx` pentest tool; synced a minimal local/staging-only `hacker-test` reminder skill across all agents so it is never forgotten. |
