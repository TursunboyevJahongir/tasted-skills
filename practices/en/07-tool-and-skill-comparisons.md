# 7. Head-to-Head Skill & Tool Comparisons (Why We Picked One Over Another)

[🇺🇿 O'zbekcha](../07-tool-and-skill-comparisons.md) | **🇬🇧 English** | [🇷🇺 Русский](../ru/07-tool-and-skill-comparisons.md)

⬅️ [Back to Practices Table of Contents](README.md)

This guide compiles our side-by-side comparisons across every skill, CLI tool, MCP server, and model we benchmarked live and audited at the source-code level (**what we adopted vs. what we rejected and why**).

---

## 1. 📱 Mobile & TV UI Automation (`agent-device` vs. `Maestro` vs. `ARTEMIS` vs. `mobile-mcp`)

| Metric | ✅ [**`agent-device`**](../../reviews/en/mobile/agent-device.md) *(Our Primary)* | [**`Maestro CLI`**](01-mobile-tv-headless-qa.md) | [**`ARTEMIS`** (`google/artemis`)](../../reviews/en/mobile/artemis.md) | ❌ [**`mobile-mcp`**](../../reviews/en/mobile/mobile-mcp.md) |
|---|---|---|---|---|
| **Platforms** | **`iOS + Android + tvOS + Android TV`** | `iOS + Android` *(no TV)* | `Android` only *(no iOS/TV)* | `iOS + Android` |
| **Per-Action Speed** | **`197 ms` (iOS) / `888 ms` (Android)** | `~1.5 – 4 s` (JVM + driver) | `3 – 40 seconds / step` | `7.3 s` (iOS) / `5.8 s` (Android) |
| **MCP / Context Overhead** | **`0 tokens`** *(CLI, `@e1` diff ~200 tok)* | `0 tokens` *(CLI)* | Schema overhead if MCP enabled | **`~7,580 tokens / every turn`** (34 tools) |
| **Extra Runtime API Cost** | **`$0` (100% free)** | `$0` (local CLI; Cloud is paid) | **Paid** (requires billed `.env` LLM API key) | `$0` *(bundles `mobilenext.ai` cloud ads)* |
| **Dependencies** | **`0` (single binary, no Java)** | **Requires Java (`JDK 17+`)** | Python `3.12+` + LLM SDKs | Node + `Scarf`/`PostHog` telemetry |
| **Maestro `.yaml` E2E** | **Built-in (`replay/test --maestro`)** | Native `.yaml` runner | No | No |
| **Verdict** | **✅ Using Primary (`#8`)** | No separate install needed (`agent-device --maestro` covers it) | `👍` Only for custom `Canvas`/game screens | `⚠️ Not Recommended` (`6.5x–37x` slower & bloated) |

---

## 2. 📱 Mobile Emulator Optimizers (`simslim` & `avdslim`: WITHOUT vs. WITH)

| Target | ❌ Stock (Without Optimizer) | ✅ With [**`simslim`**](../../reviews/en/mobile/simslim.md) + [**`avdslim`**](../../reviews/en/mobile/avdslim.md) | Real-World Difference |
|---|---|---|---|
| **iOS 26.5 Simulator (`simctl boot` headless)** | `2.70 GB` RAM · `182` processes (`Siri`, `Apple Intelligence`, `Wallpaper`) | **`1.16 GB` RAM (`-57%`)** · **`78` processes** (`--except web,photos,search --keep com.apple.apsd`) | **`-1.54 GB` RAM saved**, Push/Links/Photos/GPS `100%` intact (`4/4 OK`) + `1.51 GB` disk logs cleaned. |
| **iOS Simulator (`GUI` window)** | `~4.0 GB` RAM | **`~0.9 GB` RAM (`-77.5%`)** | Frees `~3.1 GB` RAM in GUI mode. |
| **Android API 35 Emulator (`-no-window`)** | `4.41 GB` RAM (`8.5 GB` in Studio default) · `SwiftShader` CPU GPU · `22.81s` boot | **`2.64 GB` RAM (`-40.2%`)** · **Native Apple Metal GPU (`host`)** · **`13.79s` Golden Snapshot boot** | **`-1.77 GB` RAM saved**, hardware-accelerated Mapbox/Maps, GPS (`location_mode=3`) protected via `defaults`. |
| **Both Running Together Headlessly** | **`~7.11 – 12.5 GB` RAM** | **`3.80 GB` RAM** (`1.16 GB` iOS + `2.64 GB` Android) | **Zero macOS swap pressure (`~3.3–8.7 GB` saved).** |

---

## 3. 🌐 Web & Desktop UI Automation (`agent-desktop` vs. `vercel-labs/ui`)

| Metric | ✅ [**`agent-desktop`**](../../reviews/en/developer-tools/agent-desktop.md) *(Our Primary)* | ❌ [**`vercel-labs/ui`** (`@ui-sdk/*`)](../../reviews/en/web/vercel-ui-sdk.md) |
|---|---|---|
| **Supported Web & Desktop Apps** | **Any website (`React`, `Next.js`, `Shadcn`, `Radix`, plain HTML) + any macOS desktop app** (`Chrome`, `Telegram`, `Postman`, `Docker`, `Finder`) | **Works strictly on web apps rewritten from scratch in `@ui-sdk/*`** (blind to standard `<button>`/`<input>`) |
| **Mobile / Expo Support** | Web & Desktop (`iOS Device Hub` fallback included) | Does not support `React Native / Expo` |
| **Extra Capabilities** | Direct C-ABI (`libagent_desktop_ffi.dylib`) bindings for Python/Swift/Go | Public Beta (`0.1.0-beta`) with frequent breaking changes |
| **Verdict** | **✅ Using Primary (`#7`)** | `🔄 Better Alternative` (rewriting production UIs into `@ui-sdk/*` is impractical) |

---

## 4. 🎨 UI/UX Design & Animation Skills Comparison

### A. UI Design, Audit & Cleanup (`impeccable` + `mobile-native` vs. Alternatives)

| Skill | Scope | What It Does | Why We Picked / Rejected It |
|---|---|---|---|
| ✅ [**`impeccable`**](../../reviews/en/ui-ux/impeccable.md) + [**`mobile-native`**](../../reviews/en/mobile/mobile-native.md) | **Web + Mobile Web/PWA + Native iOS/Android** | `craft-floor` anti-slop rules + 20 commands (`polish`, `clarify`, `harden`, `quieter`, `bolder`) + **APCA contrast (`\|Lc\| ≥ 60`)** + 11 mobile web CSS/meta fixes (`dvh`, `safe-area`, `16px`). | **✅ Using Pair (`#5` & `#19`)** — covers every platform cleanly in one unified system. |
| ❌ [**`unslop`**](../../reviews/en/ui-ux/unslop.md) | Web only | 9-pass cleanup for AI/vibecoded web pages (`Playwright`). | `🔄 Better Alternative` — collides with `impeccable` auto-triggers and ignores mobile (`impeccable polish/quieter` already covers this). |
| ❌ [**`break-ui`**](../../reviews/en/ui-ux/break-ui.md) | Web only | Stress-tests UI with extreme/empty data. | `🔄 Better Alternative` — injects temporary repo fixtures and **stops without fixing** (`impeccable harden` fixes issues directly). |
| ❌ [**`make-interfaces-feel-better`**](../../reviews/en/ui-ux/make-interfaces-feel-better.md) | Web | Audits borders, radii, and shadows. | `🔄 Better Alternative` — tested for 16 days and removed due to bloated 4-table markdown reports. |
| ❌ [**`ui-ux-pro-max`**](../../reviews/en/ui-ux/ui-ux-pro-max.md) | Web | CSV/Python palette and font generator. | `🔄 Better Alternative` — weaker than `impeccable` and collides on auto-triggers. |

### B. Motion & SwiftUI (`animate-expo` + `impeccable` vs. `animate` vs. `swiftui-agent-skill`)

| Skill | Focus | Verdict & Reason |
|---|---|---|
| ✅ [**`animate-expo`**](../../reviews/en/mobile/animate-expo.md) + [**`impeccable` (`animate`)**](../../reviews/en/ui-ux/impeccable.md) | **Expo / React Native (`Reanimated` UI-thread `60/120fps` + haptics)** and **Web CSS/WAAPI motion** | **✅ Using (`#12` & `#5`)** — stutter-free animations across both mobile apps and web. |
| ❌ [**`animate`** *(Emil Kowalski)*](../../reviews/en/ui-ux/animate.md) | Web CSS/JS animation only | `🔄 Better Alternative` — already covered inside `impeccable`, and its auto-trigger collides with `animate-expo`. |
| 👍 [**`swiftui-agent-skill`**](../../reviews/en/mobile/swiftui-agent-skill.md) | Pure native SwiftUI (`iOS 26+ Liquid Glass`, `WidgetKit`, `ActivityKit`) | `👍 Good Option` — since our core stack is Expo, use strictly via `-p` when building native iOS Widgets / Live Activities. |

---

## 5. 🏗️ Planning, Code Quality, Terse Output & Multi-Agent Review

### A. Architecture & SDLC Pipelines (`grill-me` + `graphify` + `ponytail` vs. Alternatives)

| Tool / Suite | Approach | Verdict & Reason |
|---|---|---|
| ✅ [**`grill-me`**](../../reviews/en/architecture/grill-me.md) + [**`graphify`**](../../reviews/en/architecture/graphify.md) + [**`ponytail`**](../../reviews/en/architecture/ponytail.md) + [**`karpathy-guidelines`**](../../reviews/en/architecture/karpathy-guidelines.md) | `0`-token project blueprint (`graphify`, saves `~10x–20x` tokens on large repos) -> think before blindly delegating (`grill-me`, avoids 2–3x rewrite loops) -> minimal YAGNI & surgical diffs (`ponytail` + `karpathy`). | **✅ Using Core Four (`#1–#4`)** — fast, surgical, and zero bureaucratic ceremony. |
| ❌ [**`superpowers`**](../../reviews/en/architecture/superpowers.md) | 14 skills + `SessionStart` hook + mandatory TDD & subagent loops on every edit. | `⚠️ Not Recommended` — tested for 5 months and removed (`2x` slower workflow & heavy quota drain). |
| ❌ [**`addy-agent-skills`**](../../reviews/en/architecture/addy-agent-skills.md) | 25 skills + heavy `/spec -> /ship` ceremony and `doubt-driven` pauses. | `🔄 Better Alternative` — excessive overhead for daily tasks. |
| ❌ [**`agency-agents`**](../../reviews/en/architecture/agency-agents.md) | 283 `.md` persona prompts (`~18.5K` tokens of frontmatter bloat). | `⚠️ Not Recommended` — `~18.5K` token bloat & shallow copy-pasted role templates. |

### B. Terse Replies & Writing Style (`ponytail` vs. `caveman` vs. `humanizer`)

| Skill | What It Shrinks | Telemetry / Size | Verdict |
|---|---|---|---|
| ✅ [**`ponytail`**](../../reviews/en/architecture/ponytail.md) | **Shrinks both AI reply prose AND generated code/diff complexity** (YAGNI, zero speculative abstractions). | **`0` telemetry**, lightweight `SKILL.md` | **✅ Using (`#3`)** |
| 👍 [**`caveman`**](../../reviews/en/developer-tools/caveman.md) | Drops articles/conjunctions in **terminal chat prose only** (`~65%` fewer output tokens); does not prevent code bloat. | CLI package contains `fetch` telemetry & `SessionStart` hooks (must take sanitized `SKILL.md` only) | `👍` Optional (`ponytail` already covers us) |
| ❌ [**`humanizer` + `stop-slop`**](../../reviews/en/developer-tools/humanizer-stop-slop.md) | Edits long-form blog posts/essays to remove AI clichés. | `~32 KB` (`humanizer`) | `🔄 Better Alternative` (not for code/UI) |

### C. Multi-Agent Orchestration & Review (`Orca` + `EGM` vs. `T3 Code` vs. `OmniRoute`)

| Tool | Role | Verdict |
|---|---|---|
| ✅ [**`Orca`**](../../reviews/en/developer-tools/orca.md) + `orchestration` + `task-context` | **Single-Prompt Multi-Agent Chaining + Mobile Control:** Spawns live inline worker cards (`Codex`, `Claude`, `Argon`) in Chat UI, stays awake on Mac `Lock Screen` (`caffeinate`), pairs reliably via `Orca IDE`, and hands off verified `task-context` (`841 MB` RAM). | **✅ Using (`#13`)** |
| ✅ [**`elephant-goldfish-model`**](../../reviews/en/architecture/elephant-goldfish-model.md) | **Stateless (`Goldfish`) 5-Persona Review + Drift + TRIZ:** Audits specs/PRs with zero confirmation bias, catches doc-to-code drift (`egm-drift-report`), and resolves TRIZ contradictions. | **✅ Using (`#6`)** |
| ❌ [**`T3 Code`**](../../reviews/en/developer-tools/t3-code.md) | Our former multi-agent desktop app (`2026-10-23 → 2026-11-16`). | `🔄 Better Alternative` — beta mobile client dropped frequently, sessions died on Mac `Lock Screen`, and Chat UI lacked live inline worker cards (replaced by `Orca`). |
| ❌ [**`OmniRoute`**](../../reviews/en/developer-tools/omniroute.md) | Local LLM reverse-proxy (`localhost:20128`) + 44 proxy-admin skills. | `⚠️ Not Recommended` — breaks long sessions (`#7287`), silently downgrades models, and risks subscription ToS bans via `wreq-js` TLS-stealth. |

---

## 6. 🛡️ Security, Code Audit, Pentesting & Observability

| Domain | ✅ Our Chosen Tool | Compared Alternatives & Key Difference |
|---|---|---|
| **Auditing New Skills** | [**`skillshare`** (`skillshare audit`)](../../reviews/en/developer-tools/skillshare.md) + **Direct AI source-code inspection** | ❌ [**`SkillSpector`**](../../reviews/en/developer-tools/skillspector.md) (extra Python/Docker/YARA loop) · ❌ [**`claude-code-setup`**](../../reviews/en/developer-tools/claude-code-setup.md) (starter recommender only). |
| **App Security (Static vs. Live)** | [**`security-audit`**](../../reviews/en/backend/security-audit-skill.md) *(Docker-free 6-phase source audit across Backend + Web + Mobile `deep-link`/`WebView`)* **+** [**`Shannon` (`hacker-test`)**](../../reviews/en/backend/shannon.md) *(live Docker White-Box HTTP exploit testing on local/staging)* | Complementary pair: `security-audit` inspects source code (including mobile apps) with zero running servers; `hacker-test` fires live exploits against a running staging web/API server. |
| **Error Tracking & Observability** | [**`sentry`**](../../reviews/en/backend/sentry.md) *(Errors + `SourceMap`/`dSYM` + `Session Replay` + `v8+` OTel traces in one platform)* | 👍 [**`opentelemetry`**](../../reviews/en/backend/opentelemetry.md) (`Collector + SigNoz/Grafana`) — needed only when scaling to multi-service host/DB infrastructure metrics. |

---

## 7. 🧠 Local Models & 🔌 External APIs Comparison

| Model / Option | Primary Purpose | Works for Coding? | Hardware / Pricing | Verdict |
|---|---|---|---|---|
| **Local `Ollama` / `MLX` (`Qwen3-Coder` / `Qwen2.5-Coder`)** | 100% offline local coding & analysis on `32–64 GB` Macs | **Yes (`30–65 tok/s` fully in RAM)** | `~9–20 GB` Unified RAM · `$0` | **Best choice whenever a true offline local coder is needed.** |
| ❌ [**`kimi-k3-in-c`**](../../reviews/en/local-models/kimi-k3-in-c.md) | C99 experiment streaming `2.78T` MoE weights off NVMe without a GPU | **No (`1 token = ~24–33s`, `500` tokens = `~3.5h` + `~50 TB` SSD reads)** | Min: `1.8 TB` NVMe; Smooth: `16× H200 (~2.25 TB VRAM)` | `⚠️ Not Recommended` (destroys SSD endurance; unusable for coding). |
| ❌ [**`MiniMax-M3.1-Flash` *(Local)* **](../../reviews/en/local-models/minimax-m3-1-flash.md) | Self-hosting the fast multimodal (`text + image + video`, `1M` context) model | Works for simple scripts, not complex repo engineering (`Terminal-Bench: 38.1%`) | `~250–285 GB` weights; `512 GB` Mac Studio or `8× H100 (640 GB VRAM)` | `⚠️ Not Recommended` (does not fit developer workstations). |
| 👍 [**`MiniMax M3.1 Flash API`**](../../reviews/en/external-apis/minimax-m3-1-flash-api.md) | High-volume product backend bots, translation, `OCR`/image/video, and SaaS automation | Works for simple scripts/automation (not primary IDE coder) | **`$0.15 / $0.60`** (`Cached: $0.015`), **`170+ tok/s`**, `1M` context | `👍 Good Option` (for product backends via paid Zero-Retention API). |
