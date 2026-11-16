# Tested & Used Skills and AI Tools

[🇺🇿 O'zbekcha](README.md) | **🇬🇧 English** | [🇷🇺 Русский](README.ru.md)

<details>
<summary>Status Legend</summary>

- `✅ Active` — used daily in our workflow
- `👍 Good Option` — vetted, worth using when the right case arises
- `⛔ Rejected` — not needed, conflicting, bloated, or unsafe

</details>

> [!TIP]
> **🛡️ Our Security Rule (Recommended for You Too):** Never install third-party skills, plugins, or MCP servers based solely on their `README` or GitHub stars. Before installing anything, **we always have our AI coding agent inspect the primary source code directly** (`SKILL.md`, scripts, hooks, network/env access) and run [**`skillshare`**](reviews/en/developer-tools/skillshare.md)'s built-in skill-check (`skillshare audit`). We strongly recommend asking your own AI agent to audit any new skill's code before installing it.

## ⭐ Top Essentials (Ordered by Daily Workflow Priority)

| # | Name | Core Job | Type | Score | Status | Date | Summary |
|---|---|---|---|---|---|---|---|
| **1** | [**`grill-me`**](reviews/en/architecture/grill-me.md) | **Planning, Decisions & Deep Debug** | Skill Suite | **9.5/10** | `✅ Active` | Since `2026-05-23` | Walks the design decision tree before coding (`grilling` + `grill-with-docs` + `domain-modeling`) plus sanitized on-demand **`diagnosing-bugs`** and **`improve-codebase-architecture`** skills from `mattpocock/skills`. |
| **2** | [**`graphify`**](reviews/en/architecture/graphify.md) | **Codebase Map (Knowledge Graph)** | Skill + Python CLI | **9.5/10** | `✅ Active` | Since `2026-07-28` | Builds a persistent knowledge graph (`graph.json` + HTML) from code (local AST, `0` tokens) and docs to trace module and file relationships in seconds. |
| **3** | [**`ponytail`**](reviews/en/architecture/ponytail.md) | **Minimal Clean Code (YAGNI)** | Skill | **9.5/10** | `✅ Active` | Since `2026-11-15` | Core coding discipline: smallest change that completely solves the task, zero speculative abstraction, and concise replies readable in one pass. |
| **4** | [**`karpathy-guidelines`**](reviews/en/architecture/karpathy-guidelines.md) | **Surgical Code Edits** | Skill | **9.5/10** | `✅ Active` | Since `2026-11-15` | Surface assumptions upfront, prioritize simplicity, and make surgical edits without touching adjacent code. |
| **5** | [**`impeccable`**](reviews/en/ui-ux/impeccable.md) | **Primary UI/UX Design & Audit** | Skill | **9.5/10** | `✅ Active` | Since `2026-11-09` | Primary design system, UX/contrast/typography auditing, and UI polish (`polish`, `clarify`, `harden`) across web, mobile web, and native iOS/Android. |
| **6** | [**`elephant-goldfish-model`**](reviews/en/architecture/elephant-goldfish-model.md) | **Independent Architecture & Code Review** | Plugin (7 skills + 10 agents) | **9.5/10** | `✅ Active` | Since `2026-11-15` | Context-rich architect (*Elephant*) + fresh-context hostile reviewers (*Goldfish*): `egm-drift-report` and 5-stage `egm-review` uncover doc-code drift and hidden bugs. |
| **7** | [**`agent-desktop`**](reviews/en/developer-tools/agent-desktop.md) | **Web (`Chrome`) & Desktop UI Testing** | CLI + Skill | **9.5/10** | `✅ Active` | Since `2026-11-15` | [agent-browser.dev/desktop](https://agent-browser.dev/desktop) — drives Chrome and desktop apps in the background via macOS Accessibility (`AX`) without hijacking the cursor (also fallback for iOS `Device Hub`). |
| **8** | [**`agent-device`**](reviews/en/mobile/agent-device.md) | **Mobile & TV (`iOS` / `Android` / `tvOS`) UI Testing** | CLI + Skill | **9.5/10** | `✅ Active` | Since `2026-11-16` | [agent-device.dev](https://agent-device.dev) — Callstack's zero-dependency CLI: drives headless iOS/tvOS Simulators (`~197ms`) and `-no-window` Android/TV Emulators (`~888ms`, 27x fewer tokens, full UTF-8 input) via `@ref` handles and `--settle` diffs (`0` MCP bloat). |
| **9** | [**`cross-platform-qa`**](reviews/en/mobile/cross-platform-qa.md) | **2-Stage Web / Mobile / TV QA Gate** | Skill | **9.5/10** | `✅ Active` | Since `2026-11-15` | 1) Iterate locally (`agent-desktop` Web + `agent-device` headless iOS/Android/TV + `adb`), 2) run a single final verification pass on physical hardware before marking Done. |
| **10** | [**`sentry`**](reviews/en/backend/sentry.md) | **Full-Stack Error & Trace Diagnostics** | Self-Hosted + Skill / MCP | **9.5/10** | `✅ Active` | Since `2026-07-08` | Full-stack error diagnostics (`Issue Grouping`, `dSYM`/`ProGuard`, `Source Maps`), `Breadcrumbs`, `Session Replay`, and `v8+` OTel-based traces investigated by AI agents. |
| **11** | [**`skillshare`**](reviews/en/developer-tools/skillshare.md) | **Multi-Agent Skill Sync & Security (`audit`)** | CLI + Skill | **9.5/10** | `✅ Active` | Since `2026-05-30` | Syncs skills/plugins across all AI agents (`Codex`, `Claude`, `Antigravity`) from a single source with a fast built-in **skill-check (`skillshare audit`)**. |
| **12** | [**`animate-expo`**](reviews/en/mobile/animate-expo.md) | **Expo / React Native 60/120fps Motion** | Skill | **9.5/10** | `✅ Active` | Since `2026-11-09` | Builds 60/120fps UI-thread animations and gestures in Expo / React Native using `Reanimated`, `Gesture Handler`, and `expo-haptics` (protected by `LOCAL-COMPATIBILITY.md`). |
| **13** | [**`T3 Code`** + CLI Subagent](reviews/en/developer-tools/t3-code.md) | **Multi-Agent Code & Review Orchestration** | Desktop App + CLI | **9.0/10** | `✅ Active` | Since `2026-10-23` | Multi-AI orchestration (*"let Codex implement and Claude review"* via isolated CLI subagent review loops). |
| **14** | [**`adb`**](reviews/en/mobile/adb.md) | **Android Port Forwarding (`reverse`) & `logcat`** | CLI | **9.0/10** | `✅ Active` | Since `2026-09-07` | Handles port forwarding (`reverse`), `logcat`, APK installs, and low-level control across headless Android emulators (`-no-window`) and physical phones (`-s <serial>` required). |
| **15** | [**`xcrun simctl` + `Device Hub`**](reviews/en/mobile/ios-simulator-device-hub.md) | **iOS Windowless Boot & `devicectl`** | Xcode CLI + App | **9.0/10** | `✅ Active` | Since `2026-10-20` | Windowless iOS Simulator `boot`/`shutdown` (`simctl`), physical iPhone build installs (`devicectl`), and `Device Hub` fallback. |
| **16** | [**`mobile-native`**](reviews/en/mobile/mobile-native.md) | **Mobile Web / PWA Native Polish** | Skill | **8.5/10** | `✅ Active` | Since `2026-11-15` | 11 CSS/meta fixes that make mobile web apps and PWAs feel native (`dvh/svh`, `safe-area`, `16px` inputs, `overscroll-behavior`, hover gating; protected by `LOCAL-COMPATIBILITY.md`). |

---

## By Category

### 🧠 Local Models

| Name | Type | Quality | Need | Status | Date | Summary |
|---|---|---|---|---|---|---|
| [**`kimi-k3-in-c`**](reviews/en/local-models/kimi-k3-in-c.md) | C99 CLI Inference Engine | **8.5/10** | **1.0/10** | `⛔ Rejected` | `2026-11-16` | C99 proof-of-concept that streams the `2.78T` Kimi K3 model from disk in `8 GB RAM` with no GPU: requires **`~1.7 TB` free NVMe storage** and runs at **`~24–33s/token`** (`500` tokens of code = `~3.5 hours` + `~50 TB` of SSD reads). **Instead use:** [**`T3 Code`**](reviews/en/developer-tools/t3-code.md) + CLI Subagents (`Argon` / `Claude` / `Codex`). |

### 🌐 Web

| Name | Type | Quality | Need | Status | Date | Summary |
|---|---|---|---|---|---|---|
| [**`taste-skill` v2.5**](reviews/en/web/taste-skill.md) | Landing Kit + Hook | **8.0/10** | **4.0/10** | `👍 Good Option` | `2026-11-15` | Strong for greenfield promo/landing sites; if installed, its 600s `Stop` hook must be stripped and scoped strictly to `-p`. |

### 📱 Mobile

| Name | Type | Quality | Need | Status | Date | Summary |
|---|---|---|---|---|---|---|
| [**`swiftui-agent-skill`**](reviews/en/mobile/swiftui-agent-skill.md) | Skill (`twostraws` / `AvdLee` / `apple-design`) | **8.5/10** | **3.0/10** | `👍 Good Option` | `2026-11-16` | Idiomatic SwiftUI & Apple HIG rules; since our primary stack is Expo / React Native, reserve strictly for `-p` project installs on pure SwiftUI targets (Widgets / Live Activities). **Instead use:** [**`impeccable`**](reviews/en/ui-ux/impeccable.md) (`reference/ios.md`) + [**`animate-expo`**](reviews/en/mobile/animate-expo.md). |
| [**`mobile-mcp`**](reviews/en/mobile/mobile-mcp.md) | MCP Server (34 tools) | **7.0/10** | **2.0/10** | `⛔ Rejected` | `2026-11-16` | Benchmarked live and rejected: `~7,580` tokens of permanent MCP schema bloat per turn, `6.5x–37x` slower than `agent-device` (`7.3s` iOS, `5.8s` Android), `Scarf` + `PostHog` telemetry, and `mobilenext.ai` cloud upsell tools. **Instead use:** [**`agent-device`**](reviews/en/mobile/agent-device.md) + [**`adb`**](reviews/en/mobile/adb.md). |

### 🎨 UI/UX

| Name | Type | Quality | Need | Status | Date | Summary |
|---|---|---|---|---|---|---|
| [**`animate`**](reviews/en/ui-ux/animate.md) | Skill (2 files) | **8.5/10** | **3.0/10** | `⛔ Rejected` | `2026-11-15` | Emil Kowalski's web animation skill; auto-triggers and rules collide with our existing stack. **Instead use:** [**`impeccable`**](reviews/en/ui-ux/impeccable.md) (`animate`) + [**`animate-expo`**](reviews/en/mobile/animate-expo.md). |
| [**`unslop`**](reviews/en/ui-ux/unslop.md) | Skill + Playwright scripts | **8.5/10** | **2.5/10** | `⛔ Rejected` | `2026-11-16` | `@heydamir`'s 9-pass cleanup skill for AI/vibecoded web UIs (`CC-BY-4.0`); Web-only and collides on auto-triggers. **Instead use:** [**`impeccable`**](reviews/en/ui-ux/impeccable.md) (`craft-floor` + `polish` / `quieter` / `clarify`). |
| [**`break-ui`**](reviews/en/ui-ux/break-ui.md) | Skill (2 files) | **8.0/10** | **3.0/10** | `⛔ Rejected` | `2026-11-15` | Worst-case data stress-tester; injects temporary fixtures/toggles into the repo and stops without fixing. **Instead use:** [**`impeccable`**](reviews/en/ui-ux/impeccable.md) (`harden`). |
| [**`make-interfaces-feel-better`**](reviews/en/ui-ux/make-interfaces-feel-better.md) | Skill (6 files) | **7.5/10** | **2.5/10** | `⛔ Rejected` | `2026-10-31 → 2026-11-15` | Tested and removed due to auto-trigger overlap and bloated 4-table reports. **Instead use:** [**`impeccable`**](reviews/en/ui-ux/impeccable.md) + [**`animate-expo`**](reviews/en/mobile/animate-expo.md). |
| [**`ui-ux-pro-max`**](reviews/en/ui-ux/ui-ux-pro-max.md) | Skill + CSV/Python | **7.0/10** | **3.5/10** | `⛔ Rejected` | `2026-11-15` | Weaker than `impeccable` and collides with its auto-trigger. **Instead use:** [**`impeccable`**](reviews/en/ui-ux/impeccable.md). |

### 🏗️ Architecture & Review

| Name | Type | Quality | Need | Status | Date | Summary |
|---|---|---|---|---|---|---|
| [**`addy-agent-skills`**](reviews/en/architecture/addy-agent-skills.md) | Plugin (25 skills + 9 commands) | **8.0/10** | **2.5/10** | `⛔ Rejected` | `2026-11-16` | Addy Osmani's full SDLC pipeline (`/spec -> /ship`); mandatory TDD and `doubt-driven` escalation pauses add unnecessary loops. **Instead use:** [**`grill-me`**](reviews/en/architecture/grill-me.md) + [**`ponytail`**](reviews/en/architecture/ponytail.md) + [**`elephant-goldfish-model`**](reviews/en/architecture/elephant-goldfish-model.md). |
| [**`agency-agents`**](reviews/en/architecture/agency-agents.md) | 283 persona prompts + installer | **6.5/10** | **2.5/10** | `⛔ Rejected` | `2026-11-16` | 283 `.md` roleplay prompts across 18 divisions (`~18.5K`-token frontmatter bloat and leftover copy-paste rules). **Instead use:** [**`impeccable`**](reviews/en/ui-ux/impeccable.md), [**`ponytail`**](reviews/en/architecture/ponytail.md), [**`elephant-goldfish-model`**](reviews/en/architecture/elephant-goldfish-model.md), [**`cross-platform-qa`**](reviews/en/mobile/cross-platform-qa.md). |
| [**`superpowers`**](reviews/en/architecture/superpowers.md) | Plugin (14 skills + hook) | **6.5/10** | **2.0/10** | `⛔ Rejected` | `2026-04-04 → 2026-09-01` | Tested and removed: causes overthinking (`SessionStart` hook), noisy `brainstorming` questions (replaced by `grill-me`), slow subagent loops, and mandatory TDD that doubles work across Web/Mobile/Backend. |

### ⚙️ Backend

| Name | Type | Quality | Need | Status | Date | Summary |
|---|---|---|---|---|---|---|
| [**`opentelemetry`**](reviews/en/backend/opentelemetry.md) | Standard + Collector (`SigNoz` / `Grafana`) | **9.0/10** | **4.0/10** | `👍 Good Option` | `2026-11-15` | Industry standard for cross-service `Traces + Metrics + Logs` and host/DB telemetry (requires `Collector + SigNoz/Grafana`). **Instead use:** [**`sentry`**](reviews/en/backend/sentry.md) (covers errors, replays, and baseline traces in one stack). |
| [**`Shannon`**](reviews/en/backend/shannon.md) | Standalone CLI + [`hacker-test`](skills/hacker-test/SKILL.md) | **8.5/10** | **6.5/10** | `👍 Good Option` | `2026-11-16` | Autonomous White-Box AI pentester (Auth bypass, IDOR, Injection, XSS, SSRF). Instead of installing its heavy plugin, we trigger `npx` on demand via our lightweight [`hacker-test`](skills/hacker-test/SKILL.md) skill strictly on local/staging (never production). |

### 🛠️ Developer Tools & Memory

| Name | Type | Quality | Need | Status | Date | Summary |
|---|---|---|---|---|---|---|
| [**`SkillSpector`**](reviews/en/developer-tools/skillspector.md) | Python CLI + MCP + Skill | **9.0/10** | **3.5/10** | `⛔ Rejected` | `2026-11-16` | NVIDIA's AI skill & MCP security scanner (`AST + YARA + OSV + LLM`). Not installed to avoid an extra daily loop — **Instead use:** [**`skillshare`**](reviews/en/developer-tools/skillshare.md) (`skillshare audit` skill-check) + **direct AI agent source-code inspection**. |
| [**`caveman`**](reviews/en/developer-tools/caveman.md) | Skill *(+ optional CLI/Proxy)* | **8.0/10** | **3.5/10** | `👍 Good Option` | `2026-11-16` | `ASD-STE100`-based terse terminal response skill (`SKILL.md`); if used, take only the sanitized standalone `SKILL.md` (`disable-model-invocation: true`) without `@caveman-ai/cli` telemetry or `plugin.json` hooks. **Instead use:** [**`ponytail`**](reviews/en/architecture/ponytail.md) (cuts both reply prose and over-engineered code/diffs). |
| [**`AssetDiet`**](reviews/en/developer-tools/assetdiet.md) | Standalone CLI + [`asset-diet`](skills/asset-diet/SKILL.md) | **7.5/10** | **6.5/10** | `✅ Active` | Since `2026-11-16` | 100% local image/SVG/video/3D compression (`Sharp`, `SVGO`, `FFmpeg`) with rollback. Synced globally via our lightweight [`asset-diet`](skills/asset-diet/SKILL.md) skill to run `npx assetdiet-mcp@0.1.4` strictly on demand (`0` MCP bloat). |
| [**`humanizer` + `stop-slop`**](reviews/en/developer-tools/humanizer-stop-slop.md) | Skill (`Markdown`) | **7.5/10** | **2.0/10** | `⛔ Rejected` | `2026-11-16` | Long-form prose editors that strip AI writing clichés (`humanizer` is `~32 KB`); not built for code or product UI. **Instead use:** [**`ponytail`**](reviews/en/architecture/ponytail.md) + [**`impeccable`**](reviews/en/ui-ux/impeccable.md) (`clarify`). |
| [**`claude-code-setup`**](reviews/en/developer-tools/claude-code-setup.md) | Plugin (Recommender Skill) | **7.5/10** | **2.0/10** | `⛔ Rejected` | `2026-11-16` | Anthropic's read-only onboarding recommender for starter `CLAUDE.md` rules, hooks, and MCP servers. **Instead use:** [**`skillshare`**](reviews/en/developer-tools/skillshare.md). |
| [**`OmniRoute`**](reviews/en/developer-tools/omniroute.md) | Local Proxy + 44 Admin Skills | **7.5/10** | **2.0/10** | `⛔ Rejected` | `2026-11-16` | Local LLM reverse-proxy (`localhost:20128`); its 44 bundled skills are proxy admin manuals, default routing breaks long sessions (`#7287`) and silently downgrades models, and `wreq-js` TLS-stealth carries subscription ToS ban risk. **Instead use:** [**`T3 Code`**](reviews/en/developer-tools/t3-code.md) + [**`ponytail`**](reviews/en/architecture/ponytail.md). |

---

<details>
<summary>Install global <code>tasted-skills</code>, <code>hacker-test</code>, and <code>asset-diet</code> skills</summary>

```bash
skillshare install TursunboyevJahongir/tasted-skills -s tasted-skills -s hacker-test -s asset-diet -g && skillshare sync -g
```

</details>

