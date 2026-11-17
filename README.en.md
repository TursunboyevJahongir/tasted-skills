# Tested & Used Skills and AI Tools

[🇺🇿 O'zbekcha](README.md) | **🇬🇧 English** | [🇷🇺 Русский](README.ru.md)

**Statuses (what each badge means):**
- `✅ Using` — used daily in our workflow.
- `👍 Good Option` — good tool, worth using when the right task comes up.
- 🔄 **Better Alternative:** `[link]` — good tool, we simply have a more convenient option for its job (shown on its own line with a direct link).
- `⚠️ Not Recommended` — carries risk or practical harm (reason noted on each entry).

**Scores (two separate things):**
- **`Quality` (`1–10`)** — how well-made the tool itself is.
- **`How Often Needed` (`1–10`)** — how often it is needed in daily work *(`3/10` does NOT mean bad — just rarely needed)*.

> [!TIP]
> **🛡️ Our Security Rule (Recommended for You Too):** Never install third-party skills, plugins, or MCP servers based solely on their `README` or GitHub stars. Before installing anything, **we always have our AI coding agent inspect the primary source code directly** (`SKILL.md`, scripts, hooks, network/env access) and run [**skillshare**](reviews/en/developer-tools/skillshare.md)'s built-in `skillshare audit` check.

📖 [Combined workflow guides & additional capabilities →](practices/en/README.md) · [⚖️ Jump to Detailed Comparisons & Benchmarks below ↓](#detailed-comparisons)

---

## ⭐ Top Essentials (Ordered by Daily Workflow Priority)

### 1. [grill-me](reviews/en/architecture/grill-me.md) — Think tasks through before coding & deep root-cause debugging
`✅ Using` · **Quality:** `9.5/10` · **How Often Needed:** `9.5/10` · **Type:** Skill Suite · **Date:** Since `2026-05-23`

Prevents blindly tossing a vague *"build this task"* prompt at AI: before a single line of code is written, short focused Q&A rounds align both you and the AI on one exact plan. This stops wrong-direction implementations and repeated rewrite/review cycles (**saving `~2–3x` in wasted time and tokens**) while helping you think through edge cases upfront. *(Also includes on-demand **`diagnosing-bugs`** for elusive bugs and **`improve-codebase-architecture`**).*

### 2. [graphify](reviews/en/architecture/graphify.md) — Maps your entire project blueprint & saves up to `~10x–20x` tokens
`✅ Using` · **Quality:** `9.5/10` · **How Often Needed:** `9.5/10` · **Type:** Skill + Python CLI · **Date:** Since `2026-07-28`

Draws a complete structural blueprint of your project — how every file, module, and function connects — locally at **`0` LLM token cost** (`graph.json` + interactive HTML). On subsequent tasks, AI queries this map in seconds instead of reading hundreds of files blind.

<details>
<summary>📊 Comparison & Stats (WITHOUT `graphify` vs. WITH `graphify`)</summary>

- **WITHOUT `graphify` (raw file search):** AI repeatedly reads dozens of files (`~15,000–40,000` tokens) to trace dependencies, reaching `~70.8%` accuracy on cross-module questions.
- **WITH `graphify`:** Local AST graph builds for `0` tokens, **cutting per-task token spend by `~10x–20x` (`~85–95%`)** while lifting answer accuracy to **`82%`**.
- 📖 [Full review →](reviews/en/architecture/graphify.md) · [Summary comparison below ↓](#detailed-comparisons)

</details>

### 3. [ponytail](reviews/en/architecture/ponytail.md) — Smallest clean code change (YAGNI) & concise one-read answers
`✅ Using` · **Quality:** `9.5/10` · **How Often Needed:** `9.5/10` · **Type:** Skill · **Date:** Since `2026-11-15`

Stops AI's worst habit — turning a 10-line fix into a 200-line "future-proof abstraction" accompanied by a long essay. Enforces the **smallest complete code change** that solves the problem and replies a busy engineer understands in one read (**cutting output tokens and diff bloat by `~2–4x`**).

### 4. [karpathy-guidelines](reviews/en/architecture/karpathy-guidelines.md) — Surgical edits without breaking adjacent working code
`✅ Using` · **Quality:** `9.5/10` · **How Often Needed:** `9.5/10` · **Type:** Skill · **Date:** Since `2026-11-15`

Prevents AI from "helpfully refactoring" neighboring lines and breaking working features. Forces the agent to state assumptions upfront instead of guessing silently and touch **only the exact lines required** by your task.

### 5. [impeccable](reviews/en/ui-ux/impeccable.md) — Primary UI/UX designer & auditor for Web and Mobile apps
`✅ Using` · **Quality:** `9.5/10` · **How Often Needed:** `9.5/10` · **Type:** Skill · **Date:** Since `2026-11-09`

Bans generic "AI-slop" layouts and designs, audits, and polishes Web, mobile web, and native iOS/Android screens (`polish`, `clarify`, `harden`). **💡 Key local patch:** includes our **`APCA` (`|Lc| ≥ 60`) perceptual contrast** rule so outdated `WCAG 2` math doesn't ruin crisp white text on orange, blue, or green brand buttons ([exact changes](reviews/en/ui-ux/impeccable.md#apca-contrast)).

### 6. [elephant-goldfish-model](reviews/en/architecture/elephant-goldfish-model.md) — Unbiased Architecture & Code Review via fresh-memory critics
`✅ Using` · **Quality:** `9.5/10` · **How Often Needed:** `9.5/10` · **Type:** Plugin (7 skills + 10 agents) · **Date:** Since `2026-11-15`

When the same AI writes a plan/code and reviews its own work, it rubber-stamps its own mistakes. This plugin spawns stateless *Goldfish* critic subagents that have never seen the prior chat to ruthlessly audit specs, code, and doc-to-code drift (`egm-drift-report`) from scratch.

### 7. [agent-desktop](reviews/en/developer-tools/agent-desktop.md) — Background Chrome & Desktop UI testing without hijacking your mouse
`✅ Using` · **Quality:** `9.5/10` · **How Often Needed:** `10.0/10` · **Type:** CLI + Skill · **Date:** Since `2026-11-15`

Keep working normally on your Mac while AI clicks buttons, fills forms, and verifies your already-logged-in `Google Chrome` or desktop apps silently in the background via macOS Accessibility (`AX`) — **saving `~5–10x` tokens** compared to repeated full-page screenshots.

### 8. [agent-device](reviews/en/mobile/agent-device.md) — Windowless background UI testing for `iOS`, `Android`, and `TV` apps
`✅ Using` · **Quality:** `9.5/10` · **How Often Needed:** `9.5/10` · **Type:** CLI + Skill · **Date:** Since `2026-11-16`

Tests iOS/tvOS (`~0.2s`) and Android/TV (`~0.9s`, full UTF-8 text input) apps completely headlessly with zero simulator windows cluttering your screen, and runs Maestro `.yaml` E2E flows natively with no Java install.

<details>
<summary>📊 Comparison & Stats (`agent-device` vs. `mobile-mcp` vs. `ARTEMIS` vs. `adb`)</summary>

- **With `agent-device`:** **`0` permanent MCP tokens**; windowless iOS **`197 ms` (`~141` tokens)**; live Android map **`888 ms` (`~100` tokens)**; **`$0` extra API cost**.
- **With `mobile-mcp`:** **`~7,580` tokens burned on every turn**; iOS `7,277 ms` (`37x` slower), Android `5,788 ms` (`6.5x` slower).
- **With `ARTEMIS`:** Android-only (no `iOS`/`TV`), `3–40s` per step, and requires a separate billed LLM API key in `.env`.
- 📖 [Full review →](reviews/en/mobile/agent-device.md) · [Summary comparison below ↓](#detailed-comparisons)

</details>

### 9. [sentry](reviews/en/backend/sentry.md) — Production crash lines, slow API/SQL traces & video-like Session Replay
`✅ Using` · **Quality:** `9.5/10` · **How Often Needed:** `9.5/10` · **Type:** Self-Hosted + Skill / MCP · **Date:** Since `2026-07-08`

Eliminates guessing how a user hit a bug: captures exact source lines (`Source Maps`, `dSYM`, `ProGuard`), pre-crash user taps (`Breadcrumbs`), video-like `Session Replay`, and slow `v8+` OTel API/SQL traces so AI can pinpoint the root cause immediately.

### 10. [skillshare](reviews/en/developer-tools/skillshare.md) — Single-source skill sync across all AI agents + `0.1s` security audit
`✅ Using` · **Quality:** `9.5/10` · **How Often Needed:** `10.0/10` · **Type:** CLI + Skill · **Date:** Since `2026-05-30`

Removes the headache of copying skills separately into `Codex`, `Claude`, and `Antigravity` — syncs everything from one folder. Its built-in **`skillshare audit`** scanner checks new skills in `0.1s` for prompt injection, hidden scripts, data exfiltration, and token bloat.

### 11. [animate-expo](reviews/en/mobile/animate-expo.md) — Stutter-free `60/120fps` animations & gestures for Expo / React Native
`✅ Using` · **Quality:** `9.5/10` · **How Often Needed:** `9.0/10` · **Type:** Skill · **Date:** Since `2026-11-09`

Prevents animations that look smooth in a simulator but drop frames on real Android/iOS phones by keeping sheets, swipes, press feedback, and haptics strictly on the `Reanimated` UI thread instead of blocking the JS thread.

### 12. [Orca](reviews/en/developer-tools/orca.md) — Chain multiple AIs from one prompt & control everything from your phone
`✅ Using` · **Quality:** `9.5/10` · **How Often Needed:** `9.5/10` · **Type:** Desktop + Mobile App + CLI + Skill · **Date:** Since `2026-11-16`

Ask in one prompt — *"have Codex write the code, Claude check the plan, and Gemini verify the result"* — and the main agent spawns live worker cards right inside Chat UI and synthesizes their findings (`orca orchestration`). Keeps working even on Mac `Lock Screen` (`caffeinate`) with rock-solid **`Orca IDE`** mobile pairing (`PostHog` telemetry disabled).

<details>
<summary>📊 Comparison & Stats (`Orca` vs. `T3 Code`)</summary>

- **With `Orca`:** **`841 MB` RAM** (`0.2%` idle CPU across 12 repos + 3 agents), live inline subagent cards (`orca orchestration`), stays alive on Mac `Lock Screen` (`caffeinate`), official App Store / Play Store mobile app.
- **With `T3 Code`:** `~1.1–1.4 GB` RAM + `~3.87 GB` `~/.t3` cache, disconnects on Mac `Lock Screen` and mobile screen lock, no inline subagent cards in Chat UI.
- 📖 [Full review →](reviews/en/developer-tools/orca.md) · [Summary comparison below ↓](#detailed-comparisons)

</details>

### 13. [adb](reviews/en/mobile/adb.md) — Android port forwarding (`reverse`), `logcat` crash logs & APK installs
`✅ Using` · **Quality:** `9.0/10` · **How Often Needed:** `10.0/10` · **Type:** CLI · **Date:** Since `2026-09-07`

Essential low-level Android bridge for wiring local backend/Metro ports (`adb reverse`), reading native crash stack traces (`logcat`), and installing APKs across headless emulators and phones (always pass `-s <serial>`).

### 14. [xcrun simctl + Device Hub](reviews/en/mobile/ios-simulator-device-hub.md) — Windowless iOS Simulator boot & physical iPhone build installation
`✅ Using` · **Quality:** `9.0/10` · **How Often Needed:** `9.5/10` · **Type:** Xcode CLI + App · **Date:** Since `2026-10-20`

Boots and shuts down iOS Simulators invisibly in the background (`simctl boot/shutdown`) and installs builds directly onto physical iPhones (`devicectl`).

### 15. [simslim](reviews/en/mobile/simslim.md) — Cuts iOS / tvOS Simulator RAM by `-57%` (`-77.5%` in GUI mode)
`✅ Using` · **Quality:** `9.0/10` · **How Often Needed:** `7.5/10` · **Type:** Standalone Go CLI · **Date:** Since `2026-11-16`

Disables `~150+` unneeded background Apple daemons (`Siri`, `Apple Intelligence`, `Wallpaper`) inside iOS Simulators, shrinking memory usage and cleaning excess logs/caches while keeping `push` and `agent-device` 100% intact.

<details>
<summary>📊 Comparison & Stats (WITHOUT `simslim` vs. WITH `simslim`)</summary>

- **WITHOUT `simslim` (Stock iOS 26.5 Simulator):** **`2.70 GB` RAM** headlessly (`182` processes), **`~4.0 GB` RAM** in GUI; `simctl erase` wipes installed apps & logins.
- **WITH `simslim`:** **`1.16 GB` RAM headlessly (`-57%`, `-1.54 GB` saved, `78` processes)**, **`~0.9 GB` RAM in GUI (`-77.5%`)**, **`+1.51 GB` disk reclaimed** without wiping apps, Push/Universal Links/GPS `4/4 OK`.
- 📖 [Full review →](reviews/en/mobile/simslim.md) · [Summary comparison below ↓](#detailed-comparisons)

</details>

### 16. [avdslim](reviews/en/mobile/avdslim.md) — Cuts Android Emulator RAM by `-40%` with native Apple Metal GPU speed
`✅ Using` · **Quality:** `9.0/10` · **How Often Needed:** `7.5/10` · **Type:** Standalone Go CLI · **Date:** Since `2026-11-16`

Moves Android Emulator rendering off slow CPU `SwiftShader` onto **Apple Metal GPU (`host`)** and trims memory and boot times via Golden Snapshots while preserving GPS and Google Maps (`defaults` guard).

<details>
<summary>📊 Comparison & Stats (WITHOUT `avdslim` vs. WITH `avdslim`)</summary>

- **WITHOUT `avdslim` (Stock API 35 AVD):** **`4.41 GB` RAM** (`~8.5 GB` on default Android Studio AVDs), slow CPU `SwiftShader` rendering, `22.81s` cold boot.
- **WITH `avdslim`:** **`2.64 GB` RAM (`-40.2%`, `-69%` vs. Studio default)**, native **Apple Metal GPU (`host`)**, **`13.79s` warm Golden Snapshot boot** (`1.65x` faster).
- 📖 [Full review →](reviews/en/mobile/avdslim.md) · [Summary comparison below ↓](#detailed-comparisons)

</details>

### 17. [security-audit](reviews/en/backend/security-audit-skill.md) — Finds Backend, Web & Mobile security vulnerabilities with zero Docker setup
`✅ Using` · **Quality:** `9.0/10` · **How Often Needed:** `7.5/10` · **Type:** Skill · **Date:** Since `2026-11-16`

Audits Backend, Web, and **Mobile (`deep-link`, `WebView`)** source code like an attacker before PR/release with no servers required. Uses independent `Hunter` + `Verifier` subagents to filter out false alarms (configured to `quick/scoped` by default to save quota).

### 18. [mobile-native](reviews/en/mobile/mobile-native.md) — Makes mobile web apps, PWAs & Mini Apps feel genuinely native on phones
`✅ Using` · **Quality:** `8.5/10` · **How Often Needed:** `7.5/10` · **Type:** Skill · **Date:** Since `2026-11-15`

Fixes the 11 classic mobile browser annoyances (iOS input auto-zoom, jumping `100vh` bars, notch clipping, sticky hover states, pull-to-refresh clashes) with focused platform CSS and meta rules.

### 19. [AssetDiet](reviews/en/developer-tools/assetdiet.md) — 100% local image, SVG, video & 3D compression with instant rollback
`✅ Using` · **Quality:** `7.5/10` · **How Often Needed:** `6.5/10` · **Type:** CLI + [asset-diet](skills/asset-diet/SKILL.md) · **Date:** Since `2026-11-16`

Finds and shrinks bloated PNG/JPG/WebP, SVG, video, and 3D files locally on your machine (nothing uploaded to the cloud) with 1-command rollback. Runs strictly on demand (`0` permanent MCP token overhead).

### 20. [video-analyzer](practices/en/06-video-and-desktop-workflows.md) — Frame-by-frame analysis of YouTube/Reels tutorials & QA bug recordings
`✅ Using` · **Quality:** `9.0/10` · **How Often Needed:** `7.5/10` · **Type:** Skill + CLI (`ffmpeg` + `Whisper`) · **Date:** Since `2026-10-25`

Combines `Whisper` audio transcripts with extracted scene-change frames ([bsisduck/video-analyzer-skill](https://github.com/bsisduck/video-analyzer-skill)) so AI sees both what was said and what flashed on screen — ideal for auditing tech videos/Reels and pinpointing exact timestamps in bug screen-recordings.

### 21. [Jev (TypeSafe AI)](reviews/en/external-apis/jev.md) — Sub-second (`~0.3s`), ultra-cheap server API for `true/false` & `select` image/text decisions
`✅ Using` · **Quality:** `9.0/10` · **How Often Needed:** `8.0/10` · **Type:** Cloud Decision Engine API (`System-1`) · **Date:** Since `2026-10`

**Crucial distinction — this is NOT a generative chat or image-editing AI:** it is a non-autoregressive **decision (`judgment`) engine** that takes an image or text and returns **`true / false`** (`usable / unusable`) or **picks one option out of several (`select`)** with a `0–100%` confidence score. Across our media/video platform and other server backends, we needed to validate incoming images and pick best video frames across 3 options: **1) Paid GPT Vision API** — easy setup, but slow and expensive on image uploads; **2) Server-authenticated AI subscription (`GPT-6 Luna` `Medium`)** — cheaper since it uses our subscription, but multi-check image validation still takes **at least `~10 seconds` (`9–12s`)**, leaving users waiting; **3) `Jev`** — paid, yet **tiny in cost (`$0.042 / 1M` input, `$0.00` free output)** and **blazingly fast (`~0.3s`)**, easily outweighing its setup complexity when used in its exact lane. 📊 [typesafe.ai](https://typesafe.ai/) · [docs.typesafe.ai](https://docs.typesafe.ai/)

> [!WARNING]
> **Use Strictly in Its Lane with Fallback Guards:** 1) Not plug-and-play — calibrate typed questions against real edge cases first; 2) Always pair it with a stronger AI (`GPT-6 Luna` / `Codex` / GPT) and escalate whenever `Jev` is uncertain (**confidence `< 80%`**); 3) Never assume 100% connectivity — enforce strict timeouts (`3–6s`) and automatic failover so occasional timeouts or connection drops never stall production!

<details>
<summary>📊 Comparison & Stats (`Jev` vs. `GPT Vision API` vs. `GPT-6 Luna Medium`)</summary>

- **Option 1 — Paid `GPT Vision API` (`GPT-5`):** `$1.25` input / `$10.00` output per `1M` tokens, `~4–10+s` latency — costly at image upload scale.
- **Option 2 — Server AI Subscription (`GPT-6 Luna Medium`):** Low marginal cost on subscription (`$0.10 / $0.50` on API), but 6-question image validation takes **`p50: ~9.02–12.4 seconds`** — users wait too long.
- **Option 3 — `Jev` (`TypeSafe AI`) + `<80%` Fallback:** **`$0.042 / 1M` input** & **`$0.00` output (`~2.4x–10x` cheaper than `Luna` API, `~30x–100x+` cheaper than `GPT-5`)**, 6-question image check **`p50: ~0.30–0.35s` (`~25–30x` faster)**, best-of-6 video frame selection `~3.3s`.
- 📖 [Full review & server fallback architecture →](reviews/en/external-apis/jev.md) · [Summary comparison below ↓](#detailed-comparisons)

</details>

---

## By Category

### 🧠 Local Models

#### [kimi-k3-in-c](reviews/en/local-models/kimi-k3-in-c.md) — C99 experiment streaming a `2.78T` model off NVMe SSD without a GPU
`⚠️ Not Recommended` · **Quality:** `8.5/10` *(as C99 experiment)* · **How Often Needed:** `1.0/10` · **Type:** C99 CLI Engine (`2.78T` MoE) · **Date:** `2026-11-16`<br>
🔄 **Better Alternative:** [Ollama](https://ollama.com/library/qwen3-coder) / `MLX` (`Qwen3-Coder`)

Clever systems experiment streaming `Kimi K3` weights straight from disk without VRAM, but **unusable for practical coding** (`Ollama / MLX Qwen3-Coder` fits completely inside `32–64 GB` Mac RAM). 📊 [GitHub](https://github.com/FareedKhan-dev/kimi-k3-in-c) · [Artificial Analysis](https://artificialanalysis.ai/leaderboards/models)

> [!WARNING]
> **Hardware & Privacy Risk:** A single `500`-token reply triggers **`~50 TB` of NVMe SSD reads**, rapidly burning out soldered laptop SSD endurance (`TBW`); never connect private code to `:free` community proxies either.

<details>
<summary>📊 Comparison & Stats (`kimi-k3-in-c` vs. `Ollama / MLX Qwen3-Coder`)</summary>

- **With `kimi-k3-in-c`:** Needs `≥1.8 TB` free NVMe; `1 token = ~24–33s` (`500` tokens = **`~3.5 hours`** + **`~50 TB` SSD reads**); smooth speed requires `16× H200 (~2.25 TB VRAM)`.
- **With local `Ollama` / `MLX` (`Qwen3-Coder`):** Fits in `~9–20 GB` RAM at **`30–65 tokens/s`** (`~1000x` faster, `500` tokens = `~10s`) with zero SSD wear.
- 📖 [Full review →](reviews/en/local-models/kimi-k3-in-c.md) · [Summary comparison below ↓](#detailed-comparisons)

</details>

#### [MiniMax-M3.1-Flash *(Local)*](reviews/en/local-models/minimax-m3-1-flash.md) — Self-hosting the `428B` multimodal model on local hardware
`⚠️ Not Recommended` · **Quality:** `8.0/10` · **How Often Needed:** `1.0/10` · **Type:** Open-Weight `428B` MoE (`~23B` active) · **Date:** `2026-11-16`<br>
🔄 **Better Alternative:** [Ollama (Qwen3-Coder)](https://ollama.com/library/qwen3-coder) *(local coding)* · [MiniMax M3.1 Flash API](reviews/en/external-apis/minimax-m3-1-flash-api.md) *(cloud API)*

Capable multimodal (`text + image + video`, `1M` context) model, but its **`~250–285 GB` weights** cannot fit developer workstations and it is not a primary frontier repo coder (`Terminal-Bench 4.0: 38.1%`). 📊 [HuggingFace](https://huggingface.co/MiniMaxAI/MiniMax-M3.1-Flash) · [OpenRouter](https://openrouter.ai/minimax/minimax-m3.1-flash)

> [!WARNING]
> **Risk:** Forcing disk-offload/swap on `32–64 GB` laptops degrades SSD health, unverified community quants require `trust_remote_code=True` (`RCE` risk), and free web credits / `:free` endpoints may log proprietary code for training.

<details>
<summary>📊 Comparison & Stats (Local `M3.1-Flash` vs. Cloud API vs. `Qwen3-Coder`)</summary>

- **Local `MiniMax-M3.1-Flash`:** `~0.5–3 tok/s` on disk offload; smooth `100–170+ tok/s` requires an `8× H100 (640 GB VRAM)` server.
- **Cloud `MiniMax M3.1 Flash API`:** `0 GB` local disk, **`170+ tok/s`**, `$0.15 / $0.60` (`Cached: $0.015`).
- **Local `Ollama / MLX (Qwen3-Coder)`:** **`30–65 tok/s`** inside `32–64 GB` Mac RAM, `Apache-2.0`, 100% offline.
- 📖 [Full review →](reviews/en/local-models/minimax-m3-1-flash.md) · [Summary comparison below ↓](#detailed-comparisons)

</details>

### 🔌 External APIs

> 💡 **Note:** Our primary production API for sub-second (`~0.3s`), ultra-cheap (`$0.042 / $0`) image & text validation (`true/false`) and multi-option `select` decisions is listed above in Top Essentials: [**#21. Jev (TypeSafe AI)**](reviews/en/external-apis/jev.md) (`✅ Using`).

#### [MiniMax M3.1 Flash API](reviews/en/external-apis/minimax-m3-1-flash-api.md) — Ultra-cheap, `170+ tok/s` multimodal API for product backend bots, translation & OCR
`👍 Good Option` · **Quality:** `8.0/10` · **How Often Needed:** `5.0/10` · **Type:** Cloud Multimodal API · **Date:** `2026-11-16`

Great fit when your own app backend needs high-volume customer chat, translation, document/receipt `OCR`, or video understanding at very low cost (`$0.15 / $0.60`, `Cached: $0.015`, `1M` context). Not a replacement for primary IDE coding models (`Terminal-Bench: 38.1%`). 📊 [OpenRouter](https://openrouter.ai/minimax/minimax-m3.1-flash) · [HuggingFace](https://huggingface.co/MiniMaxAI/MiniMax-M3.1-Flash) · [Artificial Analysis](https://artificialanalysis.ai/leaderboards/models)

> [!WARNING]
> **Privacy Rule:** Never send private repository code or `.env` secrets to free `MiniMax Code` check-in credits or `:free` endpoints — use paid `Zero-Data-Retention` API keys only.

<details>
<summary>📊 Comparison & Stats (`MiniMax M3.1 Flash API` vs. Frontier APIs)</summary>

- **High-volume backend/OCR/bots (`MiniMax M3.1 Flash API`):** `$0.15 / $0.60` (`Cached: $0.015`), **`170–200+ tok/s`**, `Automation-Bench: 62.8%` — **`~25–33x` cheaper** than `$4/$20` frontier APIs.
- **Complex repo engineering (`Claude Opus` / `Codex`):** `Terminal-Bench 4.0: 51.8%` vs. `M3.1-Flash: 38.1%`, `NL2Repo: 75.3%` vs. `61.2%`.
- 📖 [Full review →](reviews/en/external-apis/minimax-m3-1-flash-api.md) · [Summary comparison below ↓](#detailed-comparisons)

</details>

### 🌐 Web

#### [Hallmark v2](reviews/en/web/hallmark.md) — Top engine for building greenfield Landing Pages & lossless full-page Redesigns
`👍 Good Option` · **Quality:** `9.0/10` · **How Often Needed:** `4.5/10` · **Type:** Skill + `sloplint` CLI (50 themes) · **Date:** `2026-11-17`

Standout choice whenever you need to **build a new landing page or promo site from scratch** or fully redesign an existing web page without dropping a single link or form input. Keep it off permanent global auto-trigger (so it doesn't interfere with daily app/mobile work) and use it **specifically when needed** via project scope (`-p`) or explicit `/hallmark` invocation.

<details>
<summary>📊 Comparison & Stats (`Hallmark v2` vs. `impeccable` vs. `taste-skill v2.5`)</summary>

- **Why `impeccable` cannot replace `Hallmark` on landing pages:** `Hallmark` brings **50 browsable themes** ([usehallmark.com](https://www.usehallmark.com)), **755 licensed real photos**, `capture.mjs` live product screenshotting, lossless redesign link/form verification (`sloplint --before/--kept`), and a `5,700+`-line `sloplint` checker that catches dead forms and invented stats across `8` Chrome viewport widths.
- **Why `impeccable` stays our daily primary:** `Hallmark` is Web-only (no `Expo` / `iOS` / `Android`), its 7-step pipeline is heavy for everyday dashboards/apps, and its `WCAG 2` contrast check flags crisp white text on blue/orange brand buttons (`impeccable` uses perceptual `APCA`).
- **vs. `taste-skill v2.5`:** `Hallmark v2` (`9.0/10`) beats `taste-skill` (`8.0/10`) cleanly — no blocking 600s `Stop` hook, plus mechanical browser linting.
- 📖 [Full review →](reviews/en/web/hallmark.md) · [Summary comparison below ↓](#detailed-comparisons)

</details>

#### [taste-skill v2.5](reviews/en/web/taste-skill.md) — Starter kit for building bold marketing & promo landing pages from scratch
`👍 Good Option` · **Quality:** `8.0/10` · **How Often Needed:** `3.5/10` · **Type:** Landing Kit + Hook · **Date:** `2026-11-15`<br>
🔄 **Better Alternative:** [Hallmark v2](reviews/en/web/hallmark.md) *(landing pages)* · [impeccable](reviews/en/ui-ux/impeccable.md) *(daily product UI)*

Good option for WebGL-heavy promo sites, though `Hallmark v2` is stronger and cleaner for most landing pages. *If using `taste-skill`, strip its 600s `Stop` hook and scope strictly to `-p`.*

#### [vercel-labs/ui](reviews/en/web/vercel-ui-sdk.md) — Beta UI library whose agent mode only sees apps rewritten in `@ui-sdk/*`
🔄 **Better Alternative:** [agent-desktop](reviews/en/developer-tools/agent-desktop.md) + [impeccable](reviews/en/ui-ux/impeccable.md)<br>
**Quality:** `8.0/10` · **How Often Needed:** `2.0/10` · **Type:** `@ui-sdk/*` Library + Skill (`Beta`) · **Date:** `2026-11-16`

Interesting Vercel Labs concept (`8.0/10`), but its *"screenshot-free 2x faster agent control"* works strictly on apps rewritten in `@ui-sdk/*` (blind to standard `<button>`, `<input>`, `Shadcn`/`Radix`, and `Expo`).

<details>
<summary>📊 Comparison & Stats (`vercel-labs/ui` vs. `agent-desktop`)</summary>

- **With `vercel-labs/ui`:** Sees `0%` of standard `React` / `Next.js` / `Shadcn` elements unless rewritten in `@ui-sdk/*` (`0.1.0-beta`).
- **With `agent-desktop`:** Drives any existing website and macOS app in `~200–300 ms` with `0` code changes.
- 📖 [Full review →](reviews/en/web/vercel-ui-sdk.md) · [Summary comparison below ↓](#detailed-comparisons)

</details>

### 📱 Mobile

#### [swiftui-agent-skill](reviews/en/mobile/swiftui-agent-skill.md) — Idiomatic Apple SwiftUI rules for native Widgets & Live Activities
`👍 Good Option` · **Quality:** `8.5/10` · **How Often Needed:** `3.0/10` · **Type:** Skill · **Date:** `2026-11-16`<br>
🔄 **Better Alternative *(for daily Expo)*:** [impeccable](reviews/en/ui-ux/impeccable.md) + [animate-expo](reviews/en/mobile/animate-expo.md)

High-quality SwiftUI & Apple HIG guidance (`8.5/10`). Rated `3.0/10` on frequency solely because our main mobile stack is `Expo / React Native` — reach for it via `-p` whenever building native iOS Widgets or Live Activities.

#### [ARTEMIS](reviews/en/mobile/artemis.md) — Google's vision/OCR autonomous Android QA agent
`👍 Good Option` · **Quality:** `8.5/10` · **How Often Needed:** `2.5/10` · **Type:** Python CLI / SDK + MCP · **Date:** `2026-11-16`<br>
🔄 **Better Alternative *(daily QA)*:** [agent-device](reviews/en/mobile/agent-device.md)

Strong pixel/OCR vision (`AndroidWorld: 99%+`) for custom `Canvas` or game screens that lack accessibility nodes, needed only in rare Android vision-QA cases (`2.5/10`).

> [!WARNING]
> **Hidden Runtime Cost:** Although the code is open-source, running it is **paid** — requires a separate billed per-token LLM API key in `.env`, and `artemis mcp --install all` should never be installed globally.

<details>
<summary>📊 Comparison & Stats (`ARTEMIS` vs. `agent-device`)</summary>

- **With `ARTEMIS`:** Android-only (no `iOS`/`tvOS`), **`3–40s` per step**, requires billed `.env` LLM API keys, `~1 GB+` `.venv`.
- **With `agent-device`:** `iOS + Android + tvOS + Android TV`, **`0.2–0.9s` per action (`4x–45x` faster)**, **`$0` extra API cost**, built-in `--maestro`.
- 📖 [Full review →](reviews/en/mobile/artemis.md) · [Summary comparison below ↓](#detailed-comparisons)

</details>

#### [mobile-mcp](reviews/en/mobile/mobile-mcp.md) — Mobile MCP server (`~7,580` tokens/turn & `6.5x–37x` slower)
`⚠️ Not Recommended` · **Quality:** `7.0/10` · **How Often Needed:** `2.0/10` · **Type:** MCP Server (34 tools) · **Date:** `2026-11-16`<br>
🔄 **Better Alternative:** [agent-device](reviews/en/mobile/agent-device.md) + [adb](reviews/en/mobile/adb.md)

MCP server for mobile UI control that lost heavily in live speed and token benchmarks.

> [!WARNING]
> **Why Not Recommended:** Burns **`~7,580` tokens on every message** even when idle and bundles `Scarf` + `PostHog` telemetry alongside `mobilenext.ai` cloud upsell tools.

<details>
<summary>📊 Comparison & Stats (`mobile-mcp` vs. `agent-device`)</summary>

- **With `mobile-mcp`:** `~7,580` tokens of permanent schema bloat per turn; iOS `7,277 ms`, Android `5,788 ms`.
- **With `agent-device`:** `0` permanent token bloat; iOS **`197 ms` (`37x` faster)**, Android **`888 ms` (`6.5x` faster)**, `0` telemetry.
- 📖 [Full review →](reviews/en/mobile/mobile-mcp.md) · [Summary comparison below ↓](#detailed-comparisons)

</details>

### 🎨 UI/UX

#### [animate](reviews/en/ui-ux/animate.md) — Emil Kowalski's Web animation skill
🔄 **Better Alternative:** [impeccable](reviews/en/ui-ux/impeccable.md) (`animate`) + [animate-expo](reviews/en/mobile/animate-expo.md)<br>
**Quality:** `8.5/10` · **How Often Needed:** `3.0/10` · **Type:** Skill (2 files) · **Date:** `2026-11-15`

Well-crafted web motion rules (`8.5/10`), but Web-only and its auto-trigger collides with mobile `animate-expo`.

#### [unslop](reviews/en/ui-ux/unslop.md) — Web-only 9-pass cleanup skill for AI-generated pages
🔄 **Better Alternative:** [impeccable](reviews/en/ui-ux/impeccable.md) (`polish` / `quieter` / `clarify`)<br>
**Quality:** `8.5/10` · **How Often Needed:** `2.5/10` · **Type:** Skill + Playwright scripts · **Date:** `2026-11-16`

Solid cleanup pass for generic AI web pages (`8.5/10`), but ignores mobile apps and collides with `impeccable`'s auto-triggers.

#### [break-ui](reviews/en/ui-ux/break-ui.md) — Stress-tests UI layouts with extreme/empty text
🔄 **Better Alternative:** [impeccable](reviews/en/ui-ux/impeccable.md) (`harden`)<br>
**Quality:** `8.0/10` · **How Often Needed:** `3.0/10` · **Type:** Skill (2 files) · **Date:** `2026-11-15`

Good concept (`8.0/10`) for surfacing long-string or empty-state layout bugs, but leaves temporary fixture toggles inside your repo without fixing the CSS/code.

<details>
<summary>📊 Comparison (`break-ui` vs. `impeccable harden`)</summary>

- **With `break-ui`:** Injects temporary mock/toggle code into the repo and stops after reporting broken layouts (requires manual cleanup).
- **With `impeccable` (`harden`):** Audits and fixes text overflow, `i18n` expansion, and empty/error states directly in code with zero repo litter.
- 📖 [Full review →](reviews/en/ui-ux/break-ui.md) · [Summary comparison below ↓](#detailed-comparisons)

</details>

#### [make-interfaces-feel-better](reviews/en/ui-ux/make-interfaces-feel-better.md) — Detail-oriented Web UI polish checker
🔄 **Better Alternative:** [impeccable](reviews/en/ui-ux/impeccable.md) + [animate-expo](reviews/en/mobile/animate-expo.md)<br>
**Quality:** `7.5/10` · **How Often Needed:** `2.5/10` · **Type:** Skill (6 files) · **Date:** `2026-10-31 → 2026-11-15`

Decent border/radius/shadow tips, but removed after 16 days because it dumps verbose 4-table Markdown reports on minor UI edits.

#### [ui-ux-pro-max](reviews/en/ui-ux/ui-ux-pro-max.md) — CSV-based color palette & font picker
🔄 **Better Alternative:** [impeccable](reviews/en/ui-ux/impeccable.md) (with `APCA` contrast)<br>
**Quality:** `7.0/10` · **How Often Needed:** `3.5/10` · **Type:** Skill + CSV/Python · **Date:** `2026-11-15`

Suggests starter palettes from static CSV tables, producing cookie-cutter themes while colliding with `impeccable`.

### 🏗️ Architecture & Review

#### [addy-agent-skills](reviews/en/architecture/addy-agent-skills.md) — Addy Osmani's 25-skill `/spec -> /ship` engineering suite
🔄 **Better Alternative:** [grill-me](reviews/en/architecture/grill-me.md) + [ponytail](reviews/en/architecture/ponytail.md) + [elephant-goldfish-model](reviews/en/architecture/elephant-goldfish-model.md)<br>
**Quality:** `8.0/10` · **How Often Needed:** `2.5/10` · **Type:** Plugin (25 skills + 9 commands) · **Date:** `2026-11-16`

Thoughtful engineering discipline (`8.0/10`), but enforces mandatory TDD and multi-gate pauses on routine tasks.

#### [agency-agents](reviews/en/architecture/agency-agents.md) — Collection of 283 roleplay persona prompts
`⚠️ Not Recommended` · **Quality:** `6.5/10` · **How Often Needed:** `2.5/10` · **Type:** 283 persona prompts + installer · **Date:** `2026-11-16`<br>
🔄 **Better Alternative:** [impeccable](reviews/en/ui-ux/impeccable.md) + [ponytail](reviews/en/architecture/ponytail.md) + [elephant-goldfish-model](reviews/en/architecture/elephant-goldfish-model.md)

283 *"act as a marketer/designer"* persona files across 18 divisions.

> [!WARNING]
> **Context Bloat Risk:** Installing all personas globally adds **`~18,500` tokens of permanent frontmatter noise**, diluting agent focus on real engineering rules.

#### [superpowers](reviews/en/architecture/superpowers.md) — 14-skill workflow plugin with mandatory TDD & `SessionStart` hooks
`⚠️ Not Recommended` · **Quality:** `6.5/10` · **How Often Needed:** `2.0/10` · **Type:** Plugin (14 skills + hook) · **Date:** `2026-04-04 → 2026-09-01`<br>
🔄 **Better Alternative:** [grill-me](reviews/en/architecture/grill-me.md) + [ponytail](reviews/en/architecture/ponytail.md) + [agent-device](reviews/en/mobile/agent-device.md)

Tested for 5 months and removed.

> [!WARNING]
> **Time & Quota Drain:** Its `SessionStart` hook, noisy brainstorming prompts, and mandatory TDD loops on UI work **double both task duration and token spend (`2x`)**.

<details>
<summary>📊 Comparison & Stats (`superpowers` vs. `grill-me + ponytail`)</summary>

- **With `superpowers`:** Per-session hook overhead + mandatory upfront unit tests on Web/Mobile UI -> **`~2x` slower & `~2x` higher quota burn**.
- **With `grill-me + ponytail + agent-device`:** Targeted planning when needed, minimal surgical diffs, and live emulator/browser verification (`~2–3x` faster).
- 📖 [Full review →](reviews/en/architecture/superpowers.md) · [Summary comparison below ↓](#detailed-comparisons)

</details>

### ⚙️ Backend

#### [opentelemetry](reviews/en/backend/opentelemetry.md) — Infrastructure metrics, logs & traces standard for large microservice fleets
`👍 Good Option` · **Quality:** `9.0/10` · **How Often Needed:** `4.0/10` · **Type:** Standard + Collector (`SigNoz` / `Grafana`) · **Date:** `2026-11-15`<br>
🔄 **Better Alternative *(at our current scale)*:** [sentry](reviews/en/backend/sentry.md)

Top-tier standard (`9.0/10`) when scaling to deep host CPU/RAM, DB pool metrics, and dozens of microservices, though it requires operating `Collector + SigNoz/Grafana`. All our current error, replay, and baseline trace needs are covered in one place by `sentry`.

#### [Shannon](reviews/en/backend/shannon.md) — Autonomous White-Box AI pentester for local/staging APIs
`👍 Good Option` · **Quality:** `8.5/10` · **How Often Needed:** `6.5/10` · **Type:** Standalone CLI + [hacker-test](skills/hacker-test/SKILL.md) · **Date:** `2026-11-16`

Fires real `Auth bypass`, `IDOR`, `SQLi`, `XSS`, and `SSRF` exploits against local/staging servers before major releases to prove exploitability (`0` idle bloat via [hacker-test](skills/hacker-test/SKILL.md)). Pair with Docker-free 👉 [security-audit](reviews/en/backend/security-audit-skill.md) on everyday PRs.

> [!WARNING]
> **Strict Safety Boundary:** Sends live mutating exploit payloads — **never run against production**; target local or disposable staging environments only!

### 🛠️ Developer Tools & Memory

#### [REA](reviews/en/developer-tools/rea.md) — Reverse engineer closed-source apps, `.asar`s, `.apk`s & native binaries without source code
`👍 Good Option` · **Quality:** `9.0/10` · **How Often Needed:** `3.5/10` · **Type:** Standalone CLI + [rea](skills/rea/SKILL.md) · **Date:** `2026-11-17`

Recovers how a feature works inside shipped third-party desktop/mobile/web apps without source code (`Electron .asar`, JS bundles, Android `.apk`, `.NET`, `Mach-O`/`ELF`/`PE`) with Evidence IDs (`9.0/10`), and checks your own release artifacts for leaked `.map`/`.dSYM` files (`audit-release-exposure`). Triggered on demand via our [rea](skills/rea/SKILL.md) skill (`"rea"`), which **checks/auto-upgrades Node.js to a compatible release if needed, installs target-specific prerequisites (`openjdk`, `jadx`, `apktool`, `ghidra`, `rizin`)**, and runs **temporarily at `0` idle token cost**. *(For our own source repositories, use 👉 [graphify](reviews/en/architecture/graphify.md)).*

> [!WARNING]
> **Context Bloat Trap:** Never register global MCP via `npx rea-agents setup` — its `200+` MCP tools add **`~300 KB` (`~75,000+` tokens)** of schema overhead per session! Always invoke temporarily through our [rea](skills/rea/SKILL.md) wrapper skill.

<details>
<summary>📊 Comparison & Stats (Global `REA` MCP vs. our `rea` wrapper skill)</summary>

- **With default `npx rea-agents setup`:** `200+` tools (`~75,000+` tokens/session) + `~198 KB` (`~50K` tokens) skill references + `189.6 MB` npm footprint; fails on `Node 24.20.0`.
- **With our [rea](skills/rea/SKILL.md) wrapper skill:** **`0` idle tokens** in daily coding chats; when signaled with `"rea"`, auto-selects or upgrades to compatible `Node 26+`/`24.22+`, detects/installs only target-needed decompilers, executes in `/tmp`, and cleans up afterward.
- 📖 [Full review →](reviews/en/developer-tools/rea.md) · [Summary comparison below ↓](#detailed-comparisons)

</details>

#### [SkillSpector](reviews/en/developer-tools/skillspector.md) — NVIDIA's Python/Docker/YARA security scanner for skills
🔄 **Better Alternative:** [skillshare](reviews/en/developer-tools/skillshare.md) (`skillshare audit`) + direct AI source inspection<br>
**Quality:** `9.0/10` · **How Often Needed:** `3.5/10` · **Type:** Python CLI + MCP + Skill · **Date:** `2026-11-16`

Very well-engineered scanner from NVIDIA (`9.0/10`), just heavier than needed for everyday skill checks due to its Python/Docker/YARA pipeline.

<details>
<summary>📊 Comparison & Stats (`SkillSpector` vs. `skillshare audit + AI inspection`)</summary>

- **With `SkillSpector`:** Requires Python + Docker + YARA + LLM API keys; takes tens of seconds per scan.
- **With `skillshare audit` + AI code review:** **`0.1s` static scan** + our AI agent inspects logic collisions, hidden telemetry, and context bloat directly (`$0` extra setup).
- 📖 [Full review →](reviews/en/developer-tools/skillspector.md) · [Summary comparison below ↓](#detailed-comparisons)

</details>

#### [T3 Code](reviews/en/developer-tools/t3-code.md) — Our former multi-agent desktop app (replaced by `Orca`)
🔄 **Better Alternative:** [Orca](reviews/en/developer-tools/orca.md)<br>
**Quality:** `8.5/10` · **How Often Needed:** `2.5/10` · **Type:** Desktop App + CLI · **Date:** `2026-10-23 → 2026-11-16`

Solid multi-agent desktop app (`8.5/10`) that we used daily for weeks before uninstalling (`~3.87 GB` freed) due to beta mobile disconnects, Mac `Lock Screen` drops, and missing inline subagent cards.

<details>
<summary>📊 Comparison & Stats (`T3 Code` vs. `Orca`)</summary>

- **With `T3 Code`:** `~1.1–1.4 GB` RAM + `~3.87 GB` `~/.t3` cache; drops on Mac `Lock Screen`; beta mobile app disconnects when locked.
- **With `Orca`:** **`841 MB` RAM** across 12 repos, built-in `caffeinate` (`Lock Screen`-safe), official iOS/Android app, and inline `orca orchestration` worker cards.
- 📖 [Full review →](reviews/en/developer-tools/t3-code.md) · [Summary comparison below ↓](#detailed-comparisons)

</details>

#### [caveman](reviews/en/developer-tools/caveman.md) — Cuts chat reply prose by `~65%` using terse phrasing
`👍 Good Option` · **Quality:** `8.0/10` · **How Often Needed:** `3.5/10` · **Type:** Skill *(+ optional CLI)* · **Date:** `2026-11-16`<br>
🔄 **Better Alternative:** [ponytail](reviews/en/architecture/ponytail.md)

Shrinks terminal chat chatter (`~65%` fewer output words), though it doesn't stop bloated code diffs. *(If using `caveman`, copy only the standalone `SKILL.md` without `@caveman-ai/cli` telemetry).*

<details>
<summary>📊 Comparison & Stats (`caveman` vs. `ponytail`)</summary>

- **With `caveman`:** Trims chat text by `~65%`, leaves code verbosity untouched (`@caveman-ai/cli` includes telemetry & `SessionStart` hooks).
- **With `ponytail`:** Keeps replies brief AND **shrinks generated code/diff complexity by `~2–4x`** (YAGNI), `0` telemetry.
- 📖 [Full review →](reviews/en/developer-tools/caveman.md) · [Summary comparison below ↓](#detailed-comparisons)

</details>

#### [humanizer + stop-slop](reviews/en/developer-tools/humanizer-stop-slop.md) — Prose editors that strip AI clichés from blog posts & essays
🔄 **Better Alternative:** [ponytail](reviews/en/architecture/ponytail.md) + [impeccable](reviews/en/ui-ux/impeccable.md) (`clarify`)<br>
**Quality:** `7.5/10` · **How Often Needed:** `2.0/10` · **Type:** Skill (`Markdown`) · **Date:** `2026-11-16`

Good for long-form essay writers (`humanizer` weighs `~32 KB`), simply not designed for software code or product UI copy.

#### [claude-code-setup](reviews/en/developer-tools/claude-code-setup.md) — Starter onboarding recommender for new Claude Code users
🔄 **Better Alternative:** [skillshare](reviews/en/developer-tools/skillshare.md)<br>
**Quality:** `7.5/10` · **How Often Needed:** `2.0/10` · **Type:** Plugin · **Date:** `2026-11-16`

Suggests starter `CLAUDE.md` sections and hooks for beginners; unnecessary once you run a unified cross-agent setup.

#### [OmniRoute](reviews/en/developer-tools/omniroute.md) — Local LLM reverse-proxy (`localhost:20128`) for rotating subscriptions
`⚠️ Not Recommended` · **Quality:** `7.5/10` · **How Often Needed:** `2.0/10` · **Type:** Local Proxy + 44 Admin Skills · **Date:** `2026-11-16`<br>
🔄 **Better Alternative:** [Orca](reviews/en/developer-tools/orca.md) + [ponytail](reviews/en/architecture/ponytail.md)

Local reverse-proxy aimed at pooling cheap API keys (its 44 bundled skills are proxy config manuals, not coding skills).

> [!WARNING]
> **Account Ban (`ToS`) & Session-Drop Risk:** Routing paid `Claude` / `ChatGPT` / `Google` subscriptions through `wreq-js` TLS-stealth **risks account suspension (`ToS ban`)**, breaks long coding sessions (`#7287`), and silently downgrades models mid-task.

<details>
<summary>📊 Comparison & Stats (`OmniRoute` vs. `Orca + ponytail`)</summary>

- **With `OmniRoute`:** `sessionAffinityTtlMs = 0` breaks prompt caching, 10-minute `StreamIdleTimeoutError` (`#7287`), silent quality downgrades, and TLS-stealth `ToS` ban risk.
- **With `Orca + ponytail`:** `0%` ban risk (official CLIs), `100%` prompt-cache preservation, live status-bar quota meters, and explicit model handoff.
- 📖 [Full review →](reviews/en/developer-tools/omniroute.md) · [Summary comparison below ↓](#detailed-comparisons)

</details>

---

<a id="detailed-comparisons"></a>
## ⚖️ Detailed Comparisons & Benchmarks (Why We Picked Each Primary Tool)

For the full 7-domain side-by-side benchmark tables, see: 👉 [**Open Full 7-Domain Comparison Matrix (practices/en/07-tool-and-skill-comparisons.md) →**](practices/en/07-tool-and-skill-comparisons.md)

- **📱 Mobile & TV UI Automation:**
  - ✅ [**agent-device**](reviews/en/mobile/agent-device.md): `iOS + Android + tvOS + Android TV`, **`197–888 ms`**, `0` MCP bloat, **`$0` API cost**, no Java needed, built-in `--maestro`.
  - ⚖️ Alternatives: `Maestro CLI` (`1.5–4s`, requires Java `JDK 17+`) · [**ARTEMIS**](reviews/en/mobile/artemis.md) (Android-only, `3–40s`, requires billed `.env` LLM API keys) · ⚠️ [**mobile-mcp**](reviews/en/mobile/mobile-mcp.md) (`~7,580` tokens/turn, `6–7s` slow, telemetry/ads).
- **📱 Mobile Emulator RAM & GPU Optimizers (`WITHOUT vs. WITH`):**
  - ✅ [**simslim**](reviews/en/mobile/simslim.md) (iOS 26.5): headless RAM **`2.70 GB -> 1.16 GB` (`-57%`)**, GUI **`4.0 GB -> 0.9 GB` (`-77.5%`)**, processes `182 -> 78`, **`+1.51 GB`** disk reclaimed without wiping apps.
  - ✅ [**avdslim**](reviews/en/mobile/avdslim.md) (Android API 35): RAM **`4.41 GB -> 2.64 GB` (`-40.2%`, `-69%` vs. Studio 8.5 GB)**, native **Apple Metal GPU (`host`)** instead of CPU `SwiftShader`, Golden Snapshot boot `22.8s -> 13.8s`.
- **🌐 Web & Desktop UI Automation:**
  - ✅ [**agent-desktop**](reviews/en/developer-tools/agent-desktop.md): drives any existing website and macOS app headlessly (`~5–10x` fewer tokens).
  - 🔄 [**vercel-labs/ui**](reviews/en/web/vercel-ui-sdk.md): works strictly on sites rewritten in `@ui-sdk/*` (no `Expo` or standard HTML support).
- **🎨 UI/UX Design, Landing Pages & Motion:**
  - ✅ Daily App / Web / Mobile UI: [**impeccable**](reviews/en/ui-ux/impeccable.md) + [**mobile-native**](reviews/en/mobile/mobile-native.md) + [**animate-expo**](reviews/en/mobile/animate-expo.md) (`APCA` contrast + `60/120fps` UI-thread motion).
  - 👍 On-demand Greenfield Landing Pages (`-p` / `/hallmark`): [**Hallmark v2**](reviews/en/web/hallmark.md) (`50` browsable themes, `755` real photos, `capture.mjs`, and `sloplint --before/--kept` — capabilities `impeccable` does not bundle; also stronger than [**taste-skill v2.5**](reviews/en/web/taste-skill.md)).
  - 🔄 Alternatives: [**unslop**](reviews/en/ui-ux/unslop.md) & [**animate**](reviews/en/ui-ux/animate.md) (Web-only, trigger collisions) · [**break-ui**](reviews/en/ui-ux/break-ui.md) (breaks UI without fixing) · [**make-interfaces-feel-better**](reviews/en/ui-ux/make-interfaces-feel-better.md) (verbose 4-table reports).
- **🏗️ Planning, YAGNI, Terse Output & Multi-Agent Orchestration:**
  - ✅ [**grill-me**](reviews/en/architecture/grill-me.md) + [**graphify**](reviews/en/architecture/graphify.md) (`10x–20x` token savings) + [**ponytail**](reviews/en/architecture/ponytail.md) (`2–4x` smaller prose & diffs) + [**Orca**](reviews/en/developer-tools/orca.md) (`841 MB` RAM, `Lock Screen`-safe + mobile app + inline worker cards).
  - ⚖️ Alternatives: [**T3 Code**](reviews/en/developer-tools/t3-code.md) (replaced by `Orca` due to `Lock Screen`/mobile drops) · [**caveman**](reviews/en/developer-tools/caveman.md) (chat prose only) · ⚠️ [**superpowers**](reviews/en/architecture/superpowers.md) (`2x` slower) · ⚠️ [**OmniRoute**](reviews/en/developer-tools/omniroute.md) (session drops & ToS ban risk).
- **🛡️ Security Audit, Pentesting & Observability:**
  - ✅ [**skillshare audit**](reviews/en/developer-tools/skillshare.md) (`0.1s` skill check) + [**security-audit**](reviews/en/backend/security-audit-skill.md) (Docker-free source audit) + [**Shannon**](reviews/en/backend/shannon.md) (live staging exploit pentest) + [**sentry**](reviews/en/backend/sentry.md) (errors + Replay + traces).
  - ⚖️ Alternatives: [**SkillSpector**](reviews/en/developer-tools/skillspector.md) (heavy Docker/YARA pipeline) · [**opentelemetry**](reviews/en/backend/opentelemetry.md) (`Collector + SigNoz/Grafana` for large clusters) · 👍 [**REA**](reviews/en/developer-tools/rea.md) (for inspecting closed-source `.asar`/`.apk`/binaries temporarily via [rea](skills/rea/SKILL.md) and `audit-release-exposure`).
- **🧠 Local Models & 🔌 External APIs:**
  - ✅ Sub-second server decisions (`true/false` & `select`): [**Jev (TypeSafe AI)**](reviews/en/external-apis/jev.md) (`~0.3s`, `$0.042/$0` with `<80%` & timeout fallback — eliminates `GPT-6 Luna Medium`'s `~9–12s` wait) · Generative backend chat/OCR: [**MiniMax M3.1 Flash API**](reviews/en/external-apis/minimax-m3-1-flash-api.md) (`$0.15/$0.60`, `170+ tok/s`) · Offline local coder: **`Ollama` / `MLX` (`Qwen3-Coder`)** (`30–65 tok/s` in `32–64 GB` Mac RAM).
  - ⚠️ Not recommended on developer laptops: [**kimi-k3-in-c**](reviews/en/local-models/kimi-k3-in-c.md) (`1 token = ~30s`, `~50 TB` SSD reads) · [**MiniMax-M3.1-Flash *(Local)* **](reviews/en/local-models/minimax-m3-1-flash.md) (`285 GB` weights, needs `640 GB VRAM`).

---

<details>
<summary>Install global <code>tasted-skills</code>, <code>hacker-test</code>, <code>asset-diet</code>, and <code>rea</code> skills</summary>

```bash
skillshare install TursunboyevJahongir/tasted-skills -s tasted-skills -s hacker-test -s asset-diet -s rea -g && skillshare sync -g
```

</details>
