# 4. Skill Sanitization, White-Box Pentesting & Error Telemetry

[🇺🇿 O'zbekcha](../04-skill-and-security-hygiene.md) | **🇬🇧 English** | [🇷🇺 Русский](../ru/04-skill-and-security-hygiene.md)

⬅️ [Back to Practices Table of Contents](README.md)

- **Combined Tools:** [**tasted-skills**](../../skills/tasted-skills/SKILL.md) + [**skillshare**](../../reviews/en/developer-tools/skillshare.md) + [**security-audit**](../../reviews/en/backend/security-audit-skill.md) + [**Shannon (hacker-test)**](../../reviews/en/backend/shannon.md) + [**sentry**](../../reviews/en/backend/sentry.md)
- **Target Projects:** AI developer environment security, Backend APIs, and Full-Stack production systems.

---

## 1. Why Combine These Tools? (Overall Benefit)

1. Many viral GitHub skills and plugins bundle hidden `SessionStart` / `Stop` hooks, opt-out `PostHog`/`Scarf`/`Supabase` telemetry, undisclosed paid API dependencies, or overbroad auto-trigger descriptions that hijack unrelated tasks.
2. Functional tests rarely catch authorization flaws (`IDOR`, `Broken Auth`, `SSRF`) before release.

---

## 2. How to Run Them Together (3 Defense Rings)

### Ring 1: Audit & Sanitize Third-Party Skills Before Installing (`tasted-skills` + `skillshare audit`)

Never run `npx skills add ...` or `claude plugin install ...` blindly:
1. **Primary-Source Code Inspection (`tasted-skills`):**
   - Have your AI coding agent read the actual `SKILL.md`, `plugin.json`, `package.json` (`postinstall`), `.env.example`, and scripts directly.
2. **Strip Bloat & Risks (`Sanitization`):**
   - Remove lifecycle `hooks:`, telemetry pings, and cloud upsell prompts;
   - Add `disable-model-invocation: true` to specialized skills so they only run when explicitly invoked;
   - Prefer standalone CLIs + lightweight skills over permanent MCP servers (`0` context bloat).
3. **Static Security Scan & Multi-Agent Sync (`skillshare`):**
   ```bash
   skillshare audit ~/.config/skillshare/skills/<skill-name>
   skillshare sync -g
   ```

### Ring 2: Source Security Audit (`security-audit`) + Live API Pentesting (`hacker-test` / `Shannon`)

Before shipping new auth, payment, multi-tenant (`RBAC`), mobile `deep-link`/`WebView`, or CI/CD modules, run a **2-step pre-release check**:
1. **Fast Docker-free source audit (`security-audit` — Cloudflare):** Audits Backend, Web, **iOS/Android/Expo mobile**, CLI, and Cloud/CI source code across 6 adversarial phases (`Hunter` + independent `Verifier` subagents) with zero server setup, writing verified reports to `~/security-audit-skill/<repo>/run-<N>/REPORT.md`.
2. **Live local/staging API pentest (`hacker-test` / `Shannon`):** Invokes `npx @keygraph/shannon@latest` against running local/staging Web & HTTP endpoints to prove real `IDOR`, `Auth bypass`, `Injection`, `XSS`, and `SSRF` exploits with live PoCs *(strictly forbidden against production)*.

### Ring 3: Production Error & Trace Diagnostics (`sentry`)

After deployment, connect your AI agent directly to `sentry` to investigate real-world regressions:
- Inspect grouped issues, symbolicated stack traces (`Source Maps`, `dSYM`, `ProGuard`), user `Breadcrumbs`, `Session Replay`, and slow DB/HTTP `Traces` in one place, then hand off to `diagnosing-bugs` + `ponytail` for a surgical fix.
