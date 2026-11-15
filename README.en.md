# Tested & Used Skills and AI Tools

[🇺🇿 O'zbekcha](README.md) | **🇬🇧 English** | [🇷🇺 Русский](README.ru.md)

<details>
<summary>Status Legend</summary>

- `✅ In Active Use` — tested and used daily in production workflows
- `🧪 Tested` — installed and tested in practice (temporarily or in an isolated project)
- `👀 Reviewed (Not Tested)` — source code audited, strong candidate, not yet installed/tested
- `⚠️ Local Only (-p) (Not Tested)` — suitable for narrow project scope, unsafe/noisy globally, not yet tested
- `⏭️ Skipped (Not Tested)` — reviewed and intentionally skipped because a stronger alternative is already active
- `⛔ Rejected` / `⛔ Rejected (Not Tested)` — rejected due to security risk, bloat, or workflow conflict

</details>

> [!TIP]
> **🛡️ Our Security Rule (Recommended for You Too):** Never install third-party skills, plugins, or MCP servers based solely on their `README` or GitHub stars. Before installing anything, **we always have our AI coding agent inspect the primary source code directly** (`SKILL.md`, scripts, hooks, network/env access) and run [**`skillshare`**](reviews/en/developer-tools/skillshare.md)'s built-in skill-check (`skillshare audit`). We strongly recommend asking your own AI agent to audit any new skill's code before installing it.

## ⭐ Top Essentials

| Name | Domain | Type | Score | Status | Date | Summary |
|---|---|---|---|---|---|---|
| [**`agent-desktop`**](reviews/en/developer-tools/agent-desktop.md) | Desktop / Web / iOS | CLI + Skill | **9.5/10** | `✅ In Active Use` | `2026-11-15` | [agent-browser.dev/desktop](https://agent-browser.dev/desktop) — drives Chrome, desktop apps, and iOS `Device Hub` in the background via macOS Accessibility (`AX`) without hijacking the cursor. |
| [**`adb`**](reviews/en/mobile/adb.md) | Mobile (Android) | CLI | **9.5/10** | `✅ In Active Use` | `2026-11-15` | Controls headless Android emulators (`-no-window`) and physical phones (`uiautomator dump`, `input tap`, `screencap`, `reverse`, `logcat`). Explicit `-s <serial>` required. |
| [**`skillshare`**](reviews/en/developer-tools/skillshare.md) | Developer Tools | CLI + Skill | **9.5/10** | `✅ In Active Use` | `2026-11-15` | Syncs skills/plugins across all AI agents (`Codex`, `Claude`, `Antigravity`) from a single source with a fast built-in **skill-check (`skillshare audit`)** during install. |
| [**`cross-platform-qa`**](reviews/en/mobile/cross-platform-qa.md) | Web / iOS / Android | Skill | **9.5/10** | `✅ In Active Use` | `2026-11-15` | 2-stage QA workflow: 1) iterate locally (`agent-desktop` + `Device Hub` + `adb` emulator), 2) run a single final verification pass on a real phone via `adb` before marking Done. |
| [**`impeccable`**](reviews/en/ui-ux/impeccable.md) | UI/UX | Skill | **9.5/10** | `✅ In Active Use` | `2026-11-15` | Primary design system and UX audit engine across web, mobile web, and native iOS/Android screens (external hooks disabled for safety). |
| [**`grill-me`**](reviews/en/architecture/grill-me.md) | Architecture / Planning | Skill Suite | **9.5/10** | `✅ In Active Use` | `2026-11-15` | Stress-tests requirements before coding by walking the design decision tree with recommended answers (`grilling` + `grill-with-docs`). |
| [**`elephant-goldfish-model`**](reviews/en/architecture/elephant-goldfish-model.md) | Architecture / Audit | Plugin (7 skills + 10 agents) | **9.5/10** | `✅ In Active Use` | `2026-11-15` | Context-rich architect (*Elephant*) + fresh-context hostile reviewers (*Goldfish*): `egm-drift-report` and 5-stage `egm-review` uncover doc-code drift and hidden production bugs across multi-repo systems. |
| [**`animate-expo`**](reviews/en/mobile/animate-expo.md) | Mobile (Expo / RN) | Skill | **9.5/10** | `✅ In Active Use` | `2026-11-15` | Builds 60/120fps UI-thread animations and gestures in Expo / React Native using `Reanimated`, `Gesture Handler`, and `expo-haptics` (protected by `LOCAL-COMPATIBILITY.md`). |
| [**`sentry`**](reviews/en/backend/sentry.md) | Backend / Web / Mobile | Self-Hosted + Skill / MCP | **9.5/10** | `✅ In Active Use` | `2026-11-15` | Full-stack error diagnostics (`Issue Grouping`, `dSYM`/`ProGuard`, `Source Maps`), `Breadcrumbs`, `Session Replay`, and `v8+` OTel-based traces investigated directly by AI agents. |
| [**`T3 Code`** + CLI Subagent](reviews/en/developer-tools/t3-code.md) | Multi-Agent | Desktop App + CLI | **9.0/10** | `✅ In Active Use` | `2026-11-15` | Multi-AI orchestration (*"let Codex implement and Claude review"* via isolated CLI subagent review loops). |
| [**`xcrun simctl` + `Device Hub`**](reviews/en/mobile/ios-simulator-device-hub.md) | Mobile (iOS) | Xcode CLI + App | **9.0/10** | `✅ In Active Use` | `2026-11-15` | Boots iOS Simulators and drives internal iOS UI elements in the background via Xcode `Device Hub` + `agent-desktop` (plus `devicectl` for physical iPhones). |
| [**`ponytail`**](reviews/en/architecture/ponytail.md) | Architecture / Code | Skill | **9.0/10** | `✅ In Active Use` | `2026-11-15` | Smallest change that completely solves the task (YAGNI), zero speculative abstraction, and concise replies readable in one pass. |
| [**`karpathy-guidelines`**](reviews/en/architecture/karpathy-guidelines.md) | Architecture / Code | Skill | **9.0/10** | `✅ In Active Use` | `2026-11-15` | Surface assumptions upfront, prioritize simplicity, and make surgical edits without touching adjacent code. |
| [**`graphify`**](reviews/en/architecture/graphify.md) | Architecture / Codebase | Skill + Python CLI | **9.0/10** | `✅ In Active Use` | `2026-11-15` | Builds a persistent knowledge graph (`graph.json` + HTML) from code (local AST, 0 tokens) and docs to trace module relationships in seconds. |
| [**`mobile-native`**](reviews/en/mobile/mobile-native.md) | Mobile Web / PWA | Skill | **8.5/10** | `✅ In Active Use` | `2026-11-15` | 11 CSS/meta fixes that make mobile web apps and PWAs feel native (`dvh/svh`, `safe-area`, `16px` inputs, `overscroll-behavior`, hover gating; protected by `LOCAL-COMPATIBILITY.md`). |

---

## By Category

### 🌐 Web

| Name | Type | Quality | Need | Status | Date | Summary |
|---|---|---|---|---|---|---|
| [**`taste-skill` v2.5**](reviews/en/web/taste-skill.md) | Landing Kit + Hook | **8.0/10** | **4.0/10** | `⚠️ Local Only (-p) (Not Tested)` | `2026-11-15` | Strong for greenfield promo/landing sites; if installed, its 600s `Stop` hook must be stripped and scoped strictly to `-p`. |

### 📱 Mobile

*All active mobile tools (`adb`, `xcrun simctl` + `Device Hub`, `cross-platform-qa`, `animate-expo`, `mobile-native`) are listed in the **⭐ Top Essentials** table above.*

### 🎨 UI/UX

| Name | Type | Quality | Need | Status | Date | Summary |
|---|---|---|---|---|---|---|
| [**`animate`**](reviews/en/ui-ux/animate.md) | Skill (2 files) | **8.5/10** | **3.0/10** | `⏭️ Skipped (Not Tested)` | `2026-11-15` | Emil Kowalski's web animation skill; auto-triggers and rules collide with our existing stack. **Instead use:** [**`impeccable`**](reviews/en/ui-ux/impeccable.md) (`animate`) + [**`animate-expo`**](reviews/en/mobile/animate-expo.md). |
| [**`unslop`**](reviews/en/ui-ux/unslop.md) | Skill + Playwright scripts | **8.5/10** | **2.5/10** | `⏭️ Skipped (Not Tested)` | `2026-11-16` | `@heydamir`'s 9-pass cleanup skill for AI/vibecoded web UIs (`CC-BY-4.0`); Web-only and collides on auto-triggers. **Instead use:** [**`impeccable`**](reviews/en/ui-ux/impeccable.md) (`craft-floor` + `polish` / `quieter` / `clarify`). |
| [**`break-ui`**](reviews/en/ui-ux/break-ui.md) | Skill (2 files) | **8.0/10** | **3.0/10** | `⏭️ Skipped (Not Tested)` | `2026-11-15` | Worst-case data stress-tester; injects temporary fixtures/toggles into the repo and stops without fixing. **Instead use:** [**`impeccable`**](reviews/en/ui-ux/impeccable.md) (`harden`). |
| [**`make-interfaces-feel-better`**](reviews/en/ui-ux/make-interfaces-feel-better.md) | Skill (6 files) | **7.5/10** | **2.5/10** | `⛔ Rejected` | `2026-11-15` | Tested and removed due to auto-trigger overlap and bloated 4-table reports. **Instead use:** [**`impeccable`**](reviews/en/ui-ux/impeccable.md) + [**`animate-expo`**](reviews/en/mobile/animate-expo.md). |
| [**`ui-ux-pro-max`**](reviews/en/ui-ux/ui-ux-pro-max.md) | Skill + CSV/Python | **7.0/10** | **3.5/10** | `⏭️ Skipped (Not Tested)` | `2026-11-15` | Weaker than `impeccable` and collides with its auto-trigger. **Instead use:** [**`impeccable`**](reviews/en/ui-ux/impeccable.md). |

### 🏗️ Architecture & Review

| Name | Type | Quality | Need | Status | Date | Summary |
|---|---|---|---|---|---|---|
| [**`agency-agents`**](reviews/en/architecture/agency-agents.md) | 283 persona prompts + installer | **6.5/10** | **2.5/10** | `⛔ Rejected (Not Tested)` | `2026-11-16` | 283 `.md` roleplay prompts across 18 divisions (`~18.5K`-token frontmatter bloat and leftover copy-paste rules). **Instead use:** [**`impeccable`**](reviews/en/ui-ux/impeccable.md), [**`ponytail`**](reviews/en/architecture/ponytail.md), [**`elephant-goldfish-model`**](reviews/en/architecture/elephant-goldfish-model.md), [**`cross-platform-qa`**](reviews/en/mobile/cross-platform-qa.md). |
| [**`superpowers`**](reviews/en/architecture/superpowers.md) | Plugin (14 skills + hook) | **6.5/10** | **2.0/10** | `⛔ Rejected` | `2026-11-15` | Tested and removed: causes overthinking (`SessionStart` hook), noisy `brainstorming` questions (replaced by `grill-me`), slow subagent loops, and mandatory TDD that doubles work across Web/Mobile/Backend. |

### ⚙️ Backend

| Name | Type | Quality | Need | Status | Date | Summary |
|---|---|---|---|---|---|---|
| [**`opentelemetry`**](reviews/en/backend/opentelemetry.md) | Standard + Collector (`SigNoz` / `Grafana`) | **9.0/10** | **4.0/10** | `⏭️ Skipped (Not Tested)` | `2026-11-15` | Industry standard for cross-service `Traces + Metrics + Logs` and host/DB telemetry (requires `Collector + SigNoz/Grafana`). **Instead use:** [**`sentry`**](reviews/en/backend/sentry.md) (covers errors, replays, and baseline traces in one stack). |
| [**`Shannon`**](reviews/en/backend/shannon.md) | Standalone CLI + [`hacker-test`](skills/hacker-test/SKILL.md) | **8.5/10** | **6.5/10** | `👀 Reviewed (Not Tested)` | `2026-11-16` | Autonomous White-Box AI pentester (Auth bypass, IDOR, Injection, XSS, SSRF). Instead of installing its heavy plugin, we trigger `npx` on demand via our lightweight [`hacker-test`](skills/hacker-test/SKILL.md) skill strictly on local/staging (never production). |

### 🛠️ Developer Tools & Memory

| Name | Type | Quality | Need | Status | Date | Summary |
|---|---|---|---|---|---|---|
| [**`SkillSpector`**](reviews/en/developer-tools/skillspector.md) | Python CLI + MCP + Skill | **9.0/10** | **3.5/10** | `⏭️ Skipped (Not Tested)` | `2026-11-16` | NVIDIA's AI skill & MCP security scanner (`AST + YARA + OSV + LLM`). Not installed to avoid an extra daily loop — **Instead use:** [**`skillshare`**](reviews/en/developer-tools/skillshare.md) (`skillshare audit` skill-check) + **direct AI agent source-code inspection**. |
| [**`OmniRoute`**](reviews/en/developer-tools/omniroute.md) | Local Proxy + 44 Admin Skills | **7.5/10** | **2.0/10** | `⛔ Rejected (Not Tested)` | `2026-11-16` | Local LLM reverse-proxy (`localhost:20128`); its 44 bundled skills are proxy admin manuals, default routing breaks long sessions (`#7287`) and silently downgrades models, and `wreq-js` TLS-stealth carries subscription ToS ban risk. **Instead use:** [**`T3 Code`**](reviews/en/developer-tools/t3-code.md) + [**`ponytail`**](reviews/en/architecture/ponytail.md). |

---

<details>
<summary>Install global <code>tasted-skills</code> and <code>hacker-test</code> skills</summary>

```bash
skillshare install TursunboyevJahongir/tasted-skills -s tasted-skills -s hacker-test -g && skillshare sync -g
```

</details>

