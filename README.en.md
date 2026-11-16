# Tested & Used Skills and AI Tools

[🇺🇿 O'zbekcha](README.md) | **🇬🇧 English** | [🇷🇺 Русский](README.ru.md)

- `✅ Using` — used daily in our active workflow
- `👍 Good Option` — vetted, worth reaching for when the exact use case arises
- `⛔ Rejected` — not needed, weaker than our active tool, conflicting, or unsafe

> [!TIP]
> **🛡️ Our Security Rule (Recommended for You Too):** Never install third-party skills, plugins, or MCP servers based solely on their `README` or GitHub stars. Before installing anything, **we always have our AI coding agent inspect the primary source code directly** (`SKILL.md`, scripts, hooks, network/env access) and run [**`skillshare`**](reviews/en/developer-tools/skillshare.md)'s built-in `skillshare audit` check.

📖 [Which skills and tools to combine, their additional capabilities, and **⚖️ Head-to-Head Tool & Skill Comparisons** →](practices/en/README.md)

---

## ⭐ Top Essentials (Ordered by Daily Workflow Priority)

### 1. [grill-me](reviews/en/architecture/grill-me.md) — Think tasks through before coding & deep root-cause debugging
`✅ Using` · **Score:** `9.5/10` · **Type:** Skill Suite · **Date:** Since `2026-05-23`

Prevents blindly tossing a vague *"build this task"* prompt at AI: before a single line of code is written, short focused Q&A rounds align both you and the AI on one exact plan. This stops wrong-direction implementations and repeated rewrite/review cycles (**saving `~2–3x` in wasted time and tokens**) while helping you think through edge cases upfront. *(Also includes on-demand **`diagnosing-bugs`** for elusive bugs and **`improve-codebase-architecture`**).*

### 2. [graphify](reviews/en/architecture/graphify.md) — Maps your entire project blueprint & saves up to `~10x–20x` tokens
`✅ Using` · **Score:** `9.5/10` · **Type:** Skill + Python CLI · **Date:** Since `2026-07-28`

Draws a complete structural blueprint of your project — how every file, module, and function connects — locally at **`0` LLM token cost** (`graph.json` + interactive HTML). On subsequent tasks, AI queries this map in seconds instead of reading hundreds of files blind, **cutting token spend by `~10x–20x` (`~85–95%`)** on large repositories while lifting answer accuracy (`70.8% -> 82%`).

### 3. [ponytail](reviews/en/architecture/ponytail.md) — Smallest clean code change (YAGNI) & concise one-read answers
`✅ Using` · **Score:** `9.5/10` · **Type:** Skill · **Date:** Since `2026-11-15`

Stops AI's worst habit — turning a 10-line fix into a 200-line "future-proof abstraction" accompanied by a long essay. Enforces the **smallest complete code change** that solves the problem and replies a busy engineer understands in one read (**cutting output tokens and diff bloat by `~2–4x`**).

### 4. [karpathy-guidelines](reviews/en/architecture/karpathy-guidelines.md) — Surgical edits without breaking adjacent working code
`✅ Using` · **Score:** `9.5/10` · **Type:** Skill · **Date:** Since `2026-11-15`

Prevents AI from "helpfully refactoring" neighboring lines and breaking working features. Forces the agent to state assumptions upfront instead of guessing silently and touch **only the exact lines required** by your task.

### 5. [impeccable](reviews/en/ui-ux/impeccable.md) — Primary UI/UX designer & auditor for Web and Mobile apps
`✅ Using` · **Score:** `9.5/10` · **Type:** Skill · **Date:** Since `2026-11-09`

Bans generic "AI-slop" layouts and designs, audits, and polishes Web, mobile web, and native iOS/Android screens (`polish`, `clarify`, `harden`). **💡 Key local patch:** includes our **`APCA` (`|Lc| ≥ 60`) perceptual contrast** rule so outdated `WCAG 2` math doesn't ruin crisp white text on orange, blue, or green brand buttons ([exact changes](reviews/en/ui-ux/impeccable.md#apca-contrast)).

### 6. [elephant-goldfish-model](reviews/en/architecture/elephant-goldfish-model.md) — Unbiased Architecture & Code Review via fresh-memory critics
`✅ Using` · **Score:** `9.5/10` · **Type:** Plugin (7 skills + 10 agents) · **Date:** Since `2026-11-15`

When the same AI writes a plan/code and reviews its own work, it rubber-stamps its own mistakes. This plugin spawns stateless *Goldfish* critic subagents that have never seen the prior chat to ruthlessly audit specs, code, and doc-to-code drift (`egm-drift-report`) from scratch.

### 7. [agent-desktop](reviews/en/developer-tools/agent-desktop.md) — Background Chrome & Desktop UI testing without hijacking your mouse
`✅ Using` · **Score:** `9.5/10` · **Type:** CLI + Skill · **Date:** Since `2026-11-15`

Keep working normally on your Mac while AI clicks buttons, fills forms, and verifies your already-logged-in `Google Chrome` or desktop apps silently in the background via macOS Accessibility (`AX`) — **saving `~5–10x` tokens** compared to repeated full-page screenshots.

### 8. [agent-device](reviews/en/mobile/agent-device.md) — Windowless background UI testing for `iOS`, `Android`, and `TV` apps
`✅ Using` · **Score:** `9.5/10` · **Type:** CLI + Skill · **Date:** Since `2026-11-16`

Tests iOS/tvOS (`~0.2s`) and Android/TV (`~0.9s`, full UTF-8 text input) apps completely headlessly with zero simulator windows cluttering your screen. Saves **`~7,500` tokens per turn** over MCP servers, **cuts screen-read tokens by up to `~27x`**, and runs Maestro `.yaml` E2E flows natively with no Java install.

### 9. [cross-platform-qa](reviews/en/mobile/cross-platform-qa.md) — 2-stage Web, Mobile & TV QA workflow that avoids slow USB rebuilds
`✅ Using` · **Score:** `9.5/10` · **Type:** Skill · **Date:** Since `2026-11-15`

Stops wasting time rebuilding onto physical USB phones during every code tweak: **Stage 1** runs all fast iterative UI checks locally in the background (`agent-desktop` + `agent-device`), and **Stage 2** runs a single final confirmation pass on real hardware right before marking Done.

### 10. [sentry](reviews/en/backend/sentry.md) — Production crash lines, slow API/SQL traces & video-like Session Replay
`✅ Using` · **Score:** `9.5/10` · **Type:** Self-Hosted + Skill / MCP · **Date:** Since `2026-07-08`

Eliminates guessing how a user hit a bug: captures exact source lines (`Source Maps`, `dSYM`, `ProGuard`), pre-crash user taps (`Breadcrumbs`), video-like `Session Replay`, and slow `v8+` OTel API/SQL traces so AI can pinpoint the root cause immediately.

### 11. [skillshare](reviews/en/developer-tools/skillshare.md) — Single-source skill sync across all AI agents + `0.1s` security audit
`✅ Using` · **Score:** `9.5/10` · **Type:** CLI + Skill · **Date:** Since `2026-05-30`

Removes the headache of copying skills separately into `Codex`, `Claude`, and `Antigravity` — syncs everything from one folder. Its built-in **`skillshare audit`** scanner checks new skills in `0.1s` for prompt injection, hidden scripts, data exfiltration, and token bloat.

### 12. [animate-expo](reviews/en/mobile/animate-expo.md) — Stutter-free `60/120fps` animations & gestures for Expo / React Native
`✅ Using` · **Score:** `9.5/10` · **Type:** Skill · **Date:** Since `2026-11-09`

Prevents animations that look smooth in a simulator but drop frames on real Android/iOS phones by keeping sheets, swipes, press feedback, and haptics strictly on the `Reanimated` UI thread instead of blocking the JS thread.

### 13. [Orca + CLI Subagent](reviews/en/developer-tools/orca.md) — Chain multiple AIs from one prompt & control everything from your phone
`✅ Using` · **Score:** `9.5/10` · **Type:** Desktop + Mobile App + CLI + Skill · **Date:** Since `2026-11-16`

Ask in one prompt — *"have Codex write the code, Claude check the plan, and Argon verify the result"* — and the main agent spawns live worker cards right inside Chat UI and synthesizes their findings (`orca orchestration`). Keeps working even on Mac `Lock Screen` (`caffeinate`) with rock-solid **`Orca IDE`** mobile pairing (`PostHog` telemetry disabled).

### 14. [adb](reviews/en/mobile/adb.md) — Android port forwarding (`reverse`), `logcat` crash logs & APK installs
`✅ Using` · **Score:** `9.0/10` · **Type:** CLI · **Date:** Since `2026-09-07`

Essential low-level Android bridge for wiring local backend/Metro ports (`adb reverse`), reading native crash stack traces (`logcat`), and installing APKs across headless emulators and phones (always pass `-s <serial>`).

### 15. [xcrun simctl + Device Hub](reviews/en/mobile/ios-simulator-device-hub.md) — Windowless iOS Simulator boot & physical iPhone build installation
`✅ Using` · **Score:** `9.0/10` · **Type:** Xcode CLI + App · **Date:** Since `2026-10-20`

Boots and shuts down iOS Simulators invisibly in the background (`simctl boot/shutdown`) and installs builds directly onto physical iPhones (`devicectl`).

### 16. [simslim](reviews/en/mobile/simslim.md) — Cuts iOS / tvOS Simulator RAM by `-57%` (`-77.5%` in GUI mode)
`✅ Using` · **Score:** `9.0/10` · **Type:** Standalone Go CLI · **Date:** Since `2026-11-16`

Disables `~150+` unneeded background Apple daemons (`Siri`, `Apple Intelligence`, `Wallpaper`) inside iOS Simulators, shrinking headless RAM from **`2.70 GB -> 1.16 GB` (`-57%`, or `4.0 GB -> 0.9 GB` in GUI)** and reclaiming `1.5 GB+` of log/cache disk space per simulator while keeping `push` and `agent-device` 100% intact.

### 17. [avdslim](reviews/en/mobile/avdslim.md) — Cuts Android Emulator RAM by `-40%` with native Apple Metal GPU speed
`✅ Using` · **Score:** `9.0/10` · **Type:** Standalone Go CLI · **Date:** Since `2026-11-16`

Moves Android Emulator rendering off slow CPU `SwiftShader` onto **Apple Metal GPU (`host`)** and trims memory from **`4.41 GB -> 2.64 GB` (`-69%` vs. Android Studio's `8.5 GB` default)** with `14s` Golden Snapshot boots and smooth Mapbox/Maps rendering.

### 18. [security-audit](reviews/en/backend/security-audit-skill.md) — Finds Backend, Web & Mobile security vulnerabilities with zero Docker setup
`✅ Using` · **Score:** `9.0/10` · **Type:** Skill · **Date:** Since `2026-11-16`

Audits Backend, Web, and **Mobile (`deep-link`, `WebView`)** source code like an attacker before PR/release with no servers required. Uses independent `Hunter` + `Verifier` subagents to filter out false alarms (configured to `quick/scoped` by default to save quota).

### 19. [mobile-native + web-to-native-mobile](reviews/en/mobile/mobile-native.md) — Makes mobile web/PWAs feel native & guides Web-to-App feature ports
`✅ Using` · **Score:** `8.5/10` · **Type:** Skill Suite · **Date:** Since `2026-11-15`

Fixes the 11 classic mobile browser annoyances (iOS input auto-zoom, jumping `100vh` bars, notch clipping, sticky hover states, pull-to-refresh clashes) + helps decide what to keep, simplify, or redesign when porting desktop web features into native iOS/Android apps.

### 20. [AssetDiet](reviews/en/developer-tools/assetdiet.md) — 100% local image, SVG, video & 3D compression with instant rollback
`✅ Using` · **Score:** `7.5/10` · **Type:** CLI + [`asset-diet`](skills/asset-diet/SKILL.md) · **Date:** Since `2026-11-16`

Finds and shrinks bloated PNG/JPG/WebP, SVG, video, and 3D files locally on your machine (nothing uploaded to the cloud) with 1-command rollback. Runs strictly on demand (`0` permanent MCP token overhead).

### 21. [watch + video-analyzer](practices/en/06-video-figma-and-db-workflows.md) — Frame-by-frame analysis of YouTube/Reels tutorials & QA bug recordings
`✅ Using` · **Score:** `9.0/10` · **Type:** Skill + CLI (`yt-dlp` + `ffmpeg`) · **Date:** Since `2026-10-25`

Combines `Whisper` audio transcripts with extracted scene-change frames so AI sees both what was said and what flashed on screen — ideal for auditing tech videos/Reels and pinpointing exact timestamps in user bug screen-recordings.

### 22. [figma skill suite](practices/en/06-video-figma-and-db-workflows.md) — Two-way bridge: Figma -> Production Code & Production Code -> Figma
`✅ Using` · **Score:** `9.0/10` · **Type:** 6 Skills + MCP · **Date:** Since `2026-10-20`

Translates Figma frames into 1:1 production code using real tokens (`figma-implement-design`), and pushes code-built screens back into editable Figma layouts and component libraries (`figma-generate-design`, `figma-generate-library`).

### 23. [client-performance-gate](practices/en/03-web-and-mobile-ui-polish.md) — Verifies end-user Web, Mobile Web & TV apps on slow CPUs and flaky networks
`✅ Using` · **Score:** `9.0/10` · **Type:** Skill · **Date:** Since `2026-11-10`

Ensures apps that feel fast on a developer Mac don't freeze on budget phones or smart TVs: tests `6x` CPU throttling + `3G`/offline drops and verifies automatic recovery without page reloads *(excluded on internal Admin panels)*.

### 24. [drizzle-relations-v2](practices/en/06-video-figma-and-db-workflows.md) — Prevents AI from writing outdated Drizzle `v1` database relations
`✅ Using` · **Score:** `8.5/10` · **Type:** Skill · **Date:** Since `2026-11-05`

Models trained on older code often emit deprecated Drizzle `v1 relations()` syntax; this skill gives AI the exact `v2 defineRelations` and object-based filter rules so database queries compile cleanly on the first try.

---

## By Category

### 🧠 Local Models

#### [kimi-k3-in-c](reviews/en/local-models/kimi-k3-in-c.md) — C99 experiment streaming a `2.78T` model off NVMe SSD without a GPU
`⛔ Rejected` · **Quality:** `8.5/10` · **Need:** `1.0/10` · **Type:** C99 CLI Engine (`2.78T` MoE) · **Date:** `2026-11-16`

Clever systems experiment streaming `Kimi K3` weights straight from disk without VRAM. **Why rejected:** completely unusable for real coding — `1 token = ~24–33s` (`500` tokens takes **`~3.5 hours`** and **`~50 TB` of SSD reads**, burning through drive endurance; smooth speed requires `16× H200 / ~2.25 TB VRAM`). **If you want a real local coder:** run `Ollama` / `MLX` (`Qwen3-Coder`, `30–65 tok/s` in `32–64 GB` Mac RAM). 📊 [GitHub](https://github.com/FareedKhan-dev/kimi-k3-in-c) · [Artificial Analysis](https://artificialanalysis.ai/leaderboards/models)

#### [MiniMax-M3.1-Flash *(Local)*](reviews/en/local-models/minimax-m3-1-flash.md) — Self-hosting the `428B` multimodal model on local hardware
`⛔ Rejected` · **Quality:** `8.0/10` · **Need:** `1.0/10` · **Type:** Open-Weight `428B` MoE (`~23B` active) · **Date:** `2026-11-16`

Capable multimodal (`text + image + video`, `1M` context) model, but its **`~250–285 GB` weights** cannot fit normal developer machines (`Min: 512 GB Mac Studio`, smooth: `8× H100 / 640 GB VRAM`), and it trails frontier coders on complex repos (`Terminal-Bench 4.0: 38.1%`). **Instead use:** local `Ollama` / `MLX` (`Qwen3-Coder`), or call [🔌 `MiniMax M3.1 Flash API`](reviews/en/external-apis/minimax-m3-1-flash-api.md). 📊 [HuggingFace](https://huggingface.co/MiniMaxAI/MiniMax-M3.1-Flash) · [OpenRouter](https://openrouter.ai/minimax/minimax-m3.1-flash)

### 🔌 External APIs

#### [MiniMax M3.1 Flash API](reviews/en/external-apis/minimax-m3-1-flash-api.md) — Ultra-cheap, `170+ tok/s` multimodal API for product backend bots, translation & OCR
`👍 Good Option` · **Quality:** `8.0/10` · **Need:** `5.0/10` · **Type:** Cloud Multimodal API · **Date:** `2026-11-16`

Great fit when your own app backend needs high-volume customer chat, translation, document/receipt `OCR`, or video understanding at very low cost (`$0.15 / $0.60`, `Cached: $0.015`, `1M` context). Not a primary repo-architecture coder (`Terminal-Bench: 38.1%`) *(use paid Zero-Retention API keys only; never send private code to `:free` proxy tiers)*. 📊 [OpenRouter](https://openrouter.ai/minimax/minimax-m3.1-flash) · [HuggingFace](https://huggingface.co/MiniMaxAI/MiniMax-M3.1-Flash)

### 🌐 Web

#### [taste-skill v2.5](reviews/en/web/taste-skill.md) — Starter kit for building bold marketing & promo landing pages from scratch
`👍 Good Option` · **Quality:** `8.0/10` · **Need:** `4.0/10` · **Type:** Landing Kit + Hook · **Date:** `2026-11-15`

Helpful for greenfield marketing/promo sites, but bundles a slow 600s `Stop` hook — never install globally; strip the hook and scope strictly to `-p` on landing-page repos. For daily product UI, [**`impeccable`**](reviews/en/ui-ux/impeccable.md) is cleaner.

#### [vercel-labs/ui](reviews/en/web/vercel-ui-sdk.md) — Beta UI library whose agent mode only sees apps rewritten in `@ui-sdk/*`
`⛔ Rejected` · **Quality:** `8.0/10` · **Need:** `2.0/10` · **Type:** `@ui-sdk/*` Library + Skill (`Beta`) · **Date:** `2026-11-16`

Its advertised *"screenshot-free 2x faster agent control"* is blind to standard `<button>`, `<input>`, and `Shadcn`/`Radix` components — requiring a full rewrite in `@ui-sdk/*` (with zero `Expo` support). **Instead use:** [**`agent-desktop`**](reviews/en/developer-tools/agent-desktop.md) + [**`impeccable`**](reviews/en/ui-ux/impeccable.md), which work on any existing app.

### 📱 Mobile

#### [swiftui-agent-skill](reviews/en/mobile/swiftui-agent-skill.md) — Idiomatic Apple SwiftUI rules for native Widgets & Live Activities
`👍 Good Option` · **Quality:** `8.5/10` · **Need:** `3.0/10` · **Type:** Skill · **Date:** `2026-11-16`

Well-crafted SwiftUI & Apple HIG guidance; because our core mobile stack is `Expo / React Native`, keep it out of global context and install via `-p` only when building native SwiftUI Widgets or Live Activities. **Primary mobile stack:** [**`impeccable`**](reviews/en/ui-ux/impeccable.md) + [**`animate-expo`**](reviews/en/mobile/animate-expo.md).

#### [ARTEMIS](reviews/en/mobile/artemis.md) — Google's vision/OCR autonomous Android QA agent (paid per-token runtime)
`👍 Good Option` · **Quality:** `8.5/10` · **Need:** `2.5/10` · **Type:** Python CLI / SDK + MCP · **Date:** `2026-11-16`

Strong pixel/OCR vision for custom `Canvas` or game screens that lack accessibility nodes, but **requires a separate billed LLM API key in `.env`**, takes `3–40s` per step, and has no `iOS`/`TV` support. **Instead use:** free (`$0`), `0.2–0.9s` cross-platform [**`agent-device`**](reviews/en/mobile/agent-device.md).

#### [mobile-mcp](reviews/en/mobile/mobile-mcp.md) — Bloated mobile MCP server (`~7,580` tokens/turn & `6.5x–37x` slower)
`⛔ Rejected` · **Quality:** `7.0/10` · **Need:** `2.0/10` · **Type:** MCP Server (34 tools) · **Date:** `2026-11-16`

Benchmarked live and rejected: burns **`~7,580` tokens on every message** even when idle, takes `6–7s` per action, and ships `Scarf`/`PostHog` telemetry plus cloud upsell tools. **Instead use:** [**`agent-device`**](reviews/en/mobile/agent-device.md) + [**`adb`**](reviews/en/mobile/adb.md).

### 🎨 UI/UX

#### [animate](reviews/en/ui-ux/animate.md) — Web-only animation skill that duplicates `impeccable` and collides with `animate-expo`
`⛔ Rejected` · **Quality:** `8.5/10` · **Need:** `3.0/10` · **Type:** Skill (2 files) · **Date:** `2026-11-15`

Good web motion principles from Emil Kowalski, but already covered inside `impeccable` while its auto-trigger collides with mobile `animate-expo`. **Instead use:** [**`impeccable`**](reviews/en/ui-ux/impeccable.md) (`animate`) + [**`animate-expo`**](reviews/en/mobile/animate-expo.md).

#### [unslop](reviews/en/ui-ux/unslop.md) — Web-only 9-pass cleanup skill for AI-generated pages
`⛔ Rejected` · **Quality:** `8.5/10` · **Need:** `2.5/10` · **Type:** Skill + Playwright scripts · **Date:** `2026-11-16`

Cleans up generic AI web layouts, but ignores mobile apps and collides with `impeccable`'s auto-triggers. **Instead use:** [**`impeccable`**](reviews/en/ui-ux/impeccable.md) (`polish` / `quieter` / `clarify`).

#### [break-ui](reviews/en/ui-ux/break-ui.md) — Injects extreme test data to break UI layouts, then stops without fixing them
`⛔ Rejected` · **Quality:** `8.0/10` · **Need:** `3.0/10` · **Type:** Skill (2 files) · **Date:** `2026-11-15`

Shows where long names or empty lists break a page, but leaves temporary fixture toggles in your repo without fixing the CSS/code. **Instead use:** [**`impeccable`**](reviews/en/ui-ux/impeccable.md) (`harden`), which finds and fixes edge cases directly.

#### [make-interfaces-feel-better](reviews/en/ui-ux/make-interfaces-feel-better.md) — Verbose web UI checker that dumps bloated 4-table audit reports
`⛔ Rejected` · **Quality:** `7.5/10` · **Need:** `2.5/10` · **Type:** Skill (6 files) · **Date:** `2026-10-31 → 2026-11-15`

Tested for 16 days and removed: wastes tokens generating long 4-table Markdown reports on simple UI tweaks and overlaps with `impeccable`. **Instead use:** [**`impeccable`**](reviews/en/ui-ux/impeccable.md) + [**`animate-expo`**](reviews/en/mobile/animate-expo.md).

#### [ui-ux-pro-max](reviews/en/ui-ux/ui-ux-pro-max.md) — Cookie-cutter CSV palette & font picker weaker than `impeccable`
`⛔ Rejected` · **Quality:** `7.0/10` · **Need:** `3.5/10` · **Type:** Skill + CSV/Python · **Date:** `2026-11-15`

Picks generic category templates out of static CSV tables and collides with `impeccable`. **Instead use:** [**`impeccable`**](reviews/en/ui-ux/impeccable.md).

### 🏗️ Architecture & Review

#### [addy-agent-skills](reviews/en/architecture/addy-agent-skills.md) — Heavy 25-skill `/spec -> /ship` ceremony with mandatory TDD pauses
`⛔ Rejected` · **Quality:** `8.0/10` · **Need:** `2.5/10` · **Type:** Plugin (25 skills + 9 commands) · **Date:** `2026-11-16`

Addy Osmani's full SDLC pipeline; enforces mandatory TDD and escalation pauses that slow down everyday engineering. **Instead use:** [**`grill-me`**](reviews/en/architecture/grill-me.md) + [**`ponytail`**](reviews/en/architecture/ponytail.md) + [**`elephant-goldfish-model`**](reviews/en/architecture/elephant-goldfish-model.md).

#### [agency-agents](reviews/en/architecture/agency-agents.md) — 283 shallow roleplay prompts that bloat context by `~18.5K` tokens
`⛔ Rejected` · **Quality:** `6.5/10` · **Need:** `2.5/10` · **Type:** 283 persona prompts + installer · **Date:** `2026-11-16`

Generic *"act as a marketer/designer"* templates across 18 divisions that add **`~18,500` tokens of frontmatter bloat** with copy-pasted filler. **Instead use:** [**`impeccable`**](reviews/en/ui-ux/impeccable.md), [**`ponytail`**](reviews/en/architecture/ponytail.md), [**`elephant-goldfish-model`**](reviews/en/architecture/elephant-goldfish-model.md).

#### [superpowers](reviews/en/architecture/superpowers.md) — Heavy workflow plugin that made daily coding `2x` slower
`⛔ Rejected` · **Quality:** `6.5/10` · **Need:** `2.0/10` · **Type:** Plugin (14 skills + hook) · **Date:** `2026-04-04 → 2026-09-01`

Used for 5 months and removed: injects `SessionStart` overthinking, noisy brainstorming questions, and mandatory TDD loops that **double time and token usage** across Web/Mobile/Backend tasks. **Instead use:** [**`grill-me`**](reviews/en/architecture/grill-me.md) + [**`ponytail`**](reviews/en/architecture/ponytail.md).

### ⚙️ Backend

#### [opentelemetry](reviews/en/backend/opentelemetry.md) — Full infrastructure metrics, logs & traces stack for large microservice fleets
`👍 Good Option` · **Quality:** `9.0/10` · **Need:** `4.0/10` · **Type:** Standard + Collector (`SigNoz` / `Grafana`) · **Date:** `2026-11-15`

Industry standard when you need deep host CPU/RAM, DB pool metrics, and cross-service telemetry, but requires running a dedicated `Collector + SigNoz/Grafana` stack. For app errors, replays, and baseline traces, [**`sentry`**](reviews/en/backend/sentry.md) covers everything in one box.

#### [Shannon](reviews/en/backend/shannon.md) — Autonomous White-Box AI pentester that fires real exploits at local/staging APIs
`👍 Good Option` · **Quality:** `8.5/10` · **Need:** `6.5/10` · **Type:** Standalone CLI + [`hacker-test`](skills/hacker-test/SKILL.md) · **Date:** `2026-11-16`

Attacks a running local or staging server with real `Auth bypass`, `IDOR`, `SQLi`, `XSS`, and `SSRF` payloads before major releases to prove exploitability. Triggered strictly on demand (`0` idle bloat) via our lightweight [`hacker-test`](skills/hacker-test/SKILL.md) skill *(never run against production)*.

### 🛠️ Developer Tools & Memory

#### [SkillSpector](reviews/en/developer-tools/skillspector.md) — NVIDIA's heavy Python/Docker/YARA scanner for third-party skills
`⛔ Rejected` · **Quality:** `9.0/10` · **Need:** `3.5/10` · **Type:** Python CLI + MCP + Skill · **Date:** `2026-11-16`

Capable scanner, but spinning up a separate Python/Docker/YARA pipeline for every skill check adds unnecessary friction. **Instead use:** `0.1s` [**`skillshare`**](reviews/en/developer-tools/skillshare.md) (`skillshare audit`) + **direct AI source-code inspection**.

#### [T3 Code](reviews/en/developer-tools/t3-code.md) — Our former multi-agent desktop app (uninstalled & replaced by `Orca`)
`⛔ Rejected` · **Quality:** `8.5/10` · **Need:** `2.5/10` · **Type:** Desktop App + CLI · **Date:** `2026-10-23 → 2026-11-16`

Used daily and then fully uninstalled (`~3.87 GB` freed): its beta mobile app disconnects frequently when the phone locks, sessions drop on Mac `Lock Screen`, and Chat UI lacks live inline subagent cards. **Instead use:** [**`Orca`**](reviews/en/developer-tools/orca.md), which solves all three.

#### [caveman](reviews/en/developer-tools/caveman.md) — Cuts chat reply prose by `~65%` using caveman-terse sentences
`👍 Good Option` · **Quality:** `8.0/10` · **Need:** `3.5/10` · **Type:** Skill *(+ optional CLI)* · **Date:** `2026-11-16`

Shrinks terminal chat replies, but does nothing to stop bloated code diffs (and its CLI package ships telemetry — take only the clean standalone `SKILL.md` if used). **Instead use:** [**`ponytail`**](reviews/en/architecture/ponytail.md), which trims both prose and code bloat.

#### [humanizer + stop-slop](reviews/en/developer-tools/humanizer-stop-slop.md) — Prose editors that strip AI clichés from blog posts & essays
`⛔ Rejected` · **Quality:** `7.5/10` · **Need:** `2.0/10` · **Type:** Skill (`Markdown`) · **Date:** `2026-11-16`

Useful for long-form articles (`humanizer` weighs `~32 KB`), not software engineering or product UI copy. **Instead use:** [**`ponytail`**](reviews/en/architecture/ponytail.md) + [**`impeccable`**](reviews/en/ui-ux/impeccable.md) (`clarify`).

#### [claude-code-setup](reviews/en/developer-tools/claude-code-setup.md) — Starter onboarding recommender for brand-new Claude Code users
`⛔ Rejected` · **Quality:** `7.5/10` · **Need:** `2.0/10` · **Type:** Plugin · **Date:** `2026-11-16`

Only suggests starter `CLAUDE.md` snippets and hooks; adds zero value once you already have a unified global setup. **Instead use:** [**`skillshare`**](reviews/en/developer-tools/skillshare.md).

#### [OmniRoute](reviews/en/developer-tools/omniroute.md) — Local LLM reverse-proxy that breaks long sessions and risks subscription bans
`⛔ Rejected` · **Quality:** `7.5/10` · **Need:** `2.0/10` · **Type:** Local Proxy + 44 Admin Skills · **Date:** `2026-11-16`

Tries to route paid AI subscriptions through `localhost:20128`, but drops long coding sessions (`#7287`), silently downgrades models when limits hit, and risks account ToS bans via `wreq-js` TLS-stealth. **Instead use:** [**`Orca`**](reviews/en/developer-tools/orca.md) + [**`ponytail`**](reviews/en/architecture/ponytail.md).

---

<details>
<summary>Install global <code>tasted-skills</code>, <code>hacker-test</code>, and <code>asset-diet</code> skills</summary>

```bash
skillshare install TursunboyevJahongir/tasted-skills -s tasted-skills -s hacker-test -s asset-diet -g && skillshare sync -g
```

</details>
