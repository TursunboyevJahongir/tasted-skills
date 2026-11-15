---
name: hacker-test
description: >
  Run an autonomous white-box security pentest (OWASP Broken Auth, IDOR/Authz,
  Injection, XSS, SSRF) against a local or disposable staging web app / HTTP API
  using Keygraph Shannon (`npx @keygraph/shannon@latest`). Trigger ONLY when the
  user explicitly asks for "hacker test", "xaker test", "pentest", "buzib ko'r",
  or "shannon".
license: MIT
---

# Hacker Test (On-Demand Keygraph Shannon Wrapper)

Use [KeygraphHQ/shannon](https://github.com/KeygraphHQ/shannon) on demand via `npx @keygraph/shannon@latest` to prove real, exploitable OWASP vulnerabilities (`status: exploited`) against a running local or disposable staging web app and HTTP API — without installing Shannon's heavy documentation bundle globally.

## 1. Non-Negotiable Safety Gates (Check Before Every Run)

Shannon is **not** a passive scanner — its agents register users, submit forms, inject payloads, and mutate or delete database records:

1. **NEVER target production:** Refuse immediately if the target URL points to a production domain, live server IP, or production database.
2. **Local / disposable staging only:** Require a local server (reached from inside Docker as `http://host.docker.internal:<port>`, never `http://localhost:<port>`) backed by a disposable local/staging database, or an explicitly isolated staging URL.
3. **Explicit user confirmation:** Before running `start` (without `--validate-model`), state the exact `-u <url>`, `-r <repo-path>`, and database environment, and wait for the user's `ha` / `yes`.
4. **Interactive commands:** Never run `npx @keygraph/shannon setup` inside a non-interactive agent shell, never ask the user to paste raw API keys into chat, and never run `shannon reset` unless explicitly requested.

## 2. Preflight Checklist

1. **Docker & Node 22+:** Verify `docker info` succeeds and `node -v` is `>= 22`.
2. **Target reachable from Docker:** Verify the local web/API server is listening on the host port (`curl -sI http://localhost:<port>`).
3. **Model & Credential Selection (`SHANNON_AI_MODEL`):**
   - **Option A — ChatGPT Plus/Pro (`Codex`) subscription via Pi (no separate API bill):**
     - Check if `~/.pi/agent/auth.json` exists with `openai-codex`. If missing, ask the user to run `pi` -> `/login` -> `OpenAI Codex` once in their terminal.
     - Export:
       ```bash
       export SHANNON_USE_PI_AUTH=1
       export SHANNON_AI_MODEL=openai-codex:gpt-5.5
       ```
   - **Option B — Provider API key already in environment / `~/.shannon/config.toml`:**
     - Uses `~/.shannon/config.toml` (configured once by user via `npx @keygraph/shannon@latest setup`) or env vars (`SHANNON_AI_API_KEY` + `SHANNON_AI_MODEL`, e.g. `anthropic:claude-sonnet-4-6`, `openai:gpt-5.5`, `xai:grok-4.7`).

## 3. Two-Step Execution Workflow

### Step 1: Model & Cyber-Safeguard Validation (~10s, zero attack traffic)
Always run `--validate-model` first so credential errors or OpenAI/Anthropic cyber-safeguard blocks fail immediately instead of 45 minutes into a scan:

```bash
npx @keygraph/shannon@latest start \
  -u http://host.docker.internal:<port> \
  -r /absolute/path/to/repo \
  --validate-model
```

If OpenAI (`https://chatgpt.com/cyber`) or Anthropic cyber safeguards block the probe, report the vendor enrollment link to the user and stop (or switch to another configured provider such as `xai:grok-4.7` / local model).

### Step 2: Full White-Box Exploitation Scan (~60–90 min)
Once Step 1 passes and the user confirms the local/staging target:

```bash
npx @keygraph/shannon@latest start \
  -u http://host.docker.internal:<port> \
  -r /absolute/path/to/repo
```

Useful management commands:
- Check progress: `npx @keygraph/shannon@latest status` or `npx @keygraph/shannon@latest scans`
- View logs: `npx @keygraph/shannon@latest logs`
- Stop scan (only if requested): `npx @keygraph/shannon@latest stop --yes`

## 4. Triage & Remediation After Scan

1. Read the generated Markdown and SARIF 2.1.0 reports in the Shannon workspace directory.
2. Prioritize proven exploits (`status: exploited`) across the 5 covered classes: Broken Authentication, Broken Authorization (IDOR / tenant isolation), Injection, XSS, and SSRF.
3. Verify each finding directly in the repository source code (filtering out any LLM hallucination) and present a concise list of surgical fixes before editing code.
