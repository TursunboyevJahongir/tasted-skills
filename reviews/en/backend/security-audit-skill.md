# `security-audit` (`cloudflare/security-audit-skill`)

[🇺🇿 O'zbekcha](../../backend/security-audit-skill.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/backend/security-audit-skill.md)

- **Source:** [cloudflare/security-audit-skill](https://github.com/cloudflare/security-audit-skill)
- **Category:** `Backend` *(Source-first security auditing across Backend, Web, Mobile, CLI, and Cloud/CI)*
- **Type:** `Skill` *(`SKILL.md` + 12 domain attack-class guides + 2 zero-dependency Node JSON validators)*
- **Quality Score:** **9.0 / 10**
- **Need for Us:** **7.5 / 10**
- **Recommended Scope:** `Global (-g)` *(with narrowed explicit trigger and `quick`-profile quota guard)*
- **Active Since:** `2026-11-16`
- **Current Status:** `✅ Active` *(primary source-level vulnerability audit skill across Backend, Web, and Mobile repos without spinning up Docker)*

---

## 1. What It Is and How It Works

Extracted from Cloudflare's internal vulnerability discovery harness, `security-audit` is a **100% local, agent-neutral White-Box source-code security audit skill** (`MIT`, `0` third-party npm packages, `0` outbound network calls, `0` telemetry, `0` lifecycle hooks).

**6-Phase Adversarial Workflow:**
1. **Reconnaissance (`RECONNAISSANCE.md`):** Maps architecture, trust boundaries, and input surfaces into `architecture.md` and `coverage-ledger.json`.
2. **Coverage-Led Hunting (`HUNTING.md` + 12 domain companions):** Dispatches isolated *Hunter* subagents across Web/Auth (`WEB-PROTOCOL-AND-AUTH.md`), multi-tenant isolation (`DATA-ISOLATION-AND-LIFECYCLE.md`), **Mobile `deep-link` / `WebView` / `IPC`** (`DESKTOP-MOBILE-AND-LOCAL-IPC.md`), LLM prompt-injection (`AI-AND-LLM.md`), Cloud/IAM/containers (`CLOUD-AND-DEPLOYMENT.md`), and CI/CD supply chain (`SUPPLY-CHAIN-AND-RELEASE.md`).
3. **Adversarial Candidate Validation:** Every candidate vulnerability is handed to a **fresh, independent *Verifier* subagent** tasked with disproving it from source — eliminating noisy "best-practice checklist" false positives.
4. **Structured JSON Output:** Verdicts (`confirmed`, `needs_validation`, `rejected`) are written to `findings.json` and checked via zero-dependency `validate-findings.cjs` and `validate-coverage-ledger.cjs`.
5. **Independent Record Verification:** Fresh agents re-verify source citations before finalizing.
6. **Target-Neutral Reporting:** Writes `REPORT.md`, `FINDINGS-DETAIL.md`, and `NEEDS-VALIDATION.md` outside the repo (`~/security-audit-skill/<repo>/run-<N>`) so the git worktree stays clean.

---

## 2. Strengths and Weaknesses

### Strengths
- **Broad stack coverage with zero Docker setup:** Audits not just HTTP APIs, but also **Expo / React Native / iOS / Android** (`deep-link`, `WebView`, IPC), CLIs, GitHub Actions CI/CD, Docker/Cloud configs, and LLM tool boundaries directly from source.
- **High signal-to-noise ratio:** Requires a real crossed trust boundary and concrete impact for `confirmed`; external infrastructure unknowns become unrated `needs_validation` items instead of inflated alarms.
- **Additive across runs:** Reuses prior `coverage-ledger.json` files to focus follow-up audits on changed source paths and uncovered gaps.

### Weaknesses and Cost
- **Subagent quota spend on full runs:** Upstream `standard` and `deep` profiles can spawn `10–30+` subagents on large repos — mitigated by our local `quick` / `scoped` default below.
- **Static/bounded-local only:** Does not fire live browser/HTTP exploit payloads at a running staging app (use [`Shannon` (`hacker-test`)](shannon.md) for live dynamic exploitation).

---

## 3. Security & Pre-Install Sanitization

- **Risk Level:** `Low` *(`0` external dependencies, `65/65` local Node self-tests pass, `CRITICAL = 0`)*
- **Inspected Surface:** `SKILL.md`, all 14 `.md` guides, `validate-findings.cjs`, `validate-coverage-ledger.cjs`, and `skillshare audit` (`HIGH` static flags are benign false positives from checklist strings like `"Are there any eval(), exec()..."` inside `ATTACK-CLASSES.md`).
- **Applied Local Sanitization (`explicit-trigger-and-quick-default-1`):**
  1. **Narrowed `SKILL.md` `description` frontmatter:** Upstream's broad *"Use for security questions..."* trigger could load `22 KB` during ordinary JWT/auth coding. We restricted it to explicit audit requests (`"security audit"`, `"security-audit"`, `"xavfsizlik auditi"`, `"kod xavfsizligini tekshir"`, `"zaifliklarni top"`) and kept live pentests routed to [`hacker-test`](shannon.md).
  2. **Changed default profile from `standard` -> `quick` / `scoped` (`SKILL.md` line 120):** Conserves subagent quota unless the user explicitly asks for a `standard` or `deep` full-repo pass.

---

## 4. Fit & How It Pairs with [`Shannon` (`hacker-test`)](shannon.md)

Together they form a **2-tier pre-release security workflow**:

| Dimension | **`security-audit`** *(Cloudflare — `✅ Active`)* | [**`Shannon` (`hacker-test`)**](shannon.md) *(`👍 Good Option`)* |
|---|---|---|
| **Mechanism** | 6-phase source-first adversarial audit (`Hunter` + `Verifier` subagents) | Live Docker + Temporal + Playwright dynamic exploitation |
| **Targets** | Backend, Web, **Mobile (`iOS`/`Android`/`Expo`)**, CLI, Cloud/CI, LLM | Running local/staging Web apps & HTTP APIs only |
| **Runtime & Setup** | Zero Docker/server needed (`quick`/`scoped`: **3–10 min**) | Requires Docker + running local/staging app (**1 – 1.5 hours**) |

---

## 5. When to Use (and When Not To)

- **When to use:** Auditing new auth/payment/multi-tenant modules, mobile deep-links/WebViews, CI/CD workflows, or full repositories before release without spinning up Docker (*`"run security audit on ./src/auth"`*).
- **When not to use:** Trivial one-line fixes (`ponytail`) or when proving live HTTP/browser exploitability against a running staging server (use `"hacker test"`).

---

## 6. Status & Action History

| Date | Action | Status | Notes (where tested, what was sanitized, outcome) |
|---|---|---|---|
| 2026-11-16 | Audited source files, `.cjs` validators (`65/65` tests), and `skillshare audit`; sanitized and installed globally | `✅ Active` | Narrowed `SKILL.md` auto-trigger to explicit audit requests, set `quick`/`scoped` as the default profile, and synced across all 5 global agent targets (`skillshare sync -g`). |

