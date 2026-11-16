# Tested & Used Skills and AI Tools

[🇺🇿 O'zbekcha](README.md) | **🇬🇧 English** | [🇷🇺 Русский](README.ru.md)

<details>
<summary>Status Legend</summary>

- `✅ Using` — used daily in our workflow
- `👍 Good Option` — vetted, worth using when the right case arises
- `⛔ Rejected` — not needed, conflicting, bloated, or unsafe

</details>

> [!TIP]
> **🛡️ Our Security Rule (Recommended for You Too):** Never install third-party skills, plugins, or MCP servers based solely on their `README` or GitHub stars. Before installing anything, **we always have our AI coding agent inspect the primary source code directly** (`SKILL.md`, scripts, hooks, network/env access) and run [**`skillshare`**](reviews/en/developer-tools/skillshare.md)'s built-in skill-check (`skillshare audit`). We strongly recommend asking your own AI agent to audit any new skill's code before installing it.

📖 [Which skills and tools to use together, their additional capabilities, and **⚖️ Head-to-Head Tool & Skill Comparisons** →](practices/en/README.md)

## ⭐ Top Essentials (Ordered by Daily Workflow Priority)

<h4><a href="reviews/en/architecture/grill-me.md">grill-me</a></h4>

<p>Planning, Decisions &amp; Deep Debug</p>

<p>Score: 9.5/10 · ✅ Using · Skill Suite<br>Date: Since 2026-05-23</p>

<details>
<summary>Details</summary>

<p>Walks the design decision tree before coding (<code>grilling</code> + <code>grill-with-docs</code> + <code>domain-modeling</code>) plus sanitized on-demand <strong><code>diagnosing-bugs</code></strong> and <strong><code>improve-codebase-architecture</code></strong> skills from <code>mattpocock/skills</code>.</p>

</details>

<hr>

<h4><a href="reviews/en/architecture/graphify.md">graphify</a></h4>

<p>Codebase Map (Knowledge Graph)</p>

<p>Score: 9.5/10 · ✅ Using · Skill + Python CLI<br>Date: Since 2026-07-28</p>

<details>
<summary>Details</summary>

<p>Builds a persistent knowledge graph (<code>graph.json</code> + HTML) from code (local AST, <code>0</code> tokens) and docs to trace module and file relationships in seconds.</p>

</details>

<hr>

<h4><a href="reviews/en/architecture/ponytail.md">ponytail</a></h4>

<p>Minimal Clean Code (YAGNI)</p>

<p>Score: 9.5/10 · ✅ Using · Skill<br>Date: Since 2026-11-15</p>

<details>
<summary>Details</summary>

<p>Core coding discipline: smallest change that completely solves the task, zero speculative abstraction, and concise replies readable in one pass.</p>

</details>

<hr>

<h4><a href="reviews/en/architecture/karpathy-guidelines.md">karpathy-guidelines</a></h4>

<p>Surgical Code Edits</p>

<p>Score: 9.5/10 · ✅ Using · Skill<br>Date: Since 2026-11-15</p>

<details>
<summary>Details</summary>

<p>Surface assumptions upfront, prioritize simplicity, and make surgical edits without touching adjacent code.</p>

</details>

<hr>

<h4><a href="reviews/en/ui-ux/impeccable.md">impeccable</a></h4>

<p>Primary UI/UX Design &amp; Audit</p>

<p>Score: 9.5/10 · ✅ Using · Skill<br>Date: Since 2026-11-09</p>

<details>
<summary>Details</summary>

<p>Primary design system, UX/contrast/typography auditing, and UI polish (<code>polish</code>, <code>clarify</code>, <code>harden</code>) across web, mobile web, and native iOS/Android. <strong>💡 Tip:</strong> worth patching in an <strong><code>APCA</code> (<code>|Lc| ≥ 60</code>) perceptual contrast</strong> rule so <code>WCAG 2</code> (<code>4.5:1</code>) doesn't falsely fail crisp white text on mid-tone brand buttons (<a href="reviews/en/ui-ux/impeccable.md#apca-contrast">exact changes</a>).</p>

</details>

<hr>

<h4><a href="reviews/en/architecture/elephant-goldfish-model.md">elephant-goldfish-model</a></h4>

<p>Independent Architecture &amp; Code Review</p>

<p>Score: 9.5/10 · ✅ Using · Plugin (7 skills + 10 agents)<br>Date: Since 2026-11-15</p>

<details>
<summary>Details</summary>

<p>Context-rich architect (<em>Elephant</em>) + fresh-context hostile reviewers (<em>Goldfish</em>): <code>egm-drift-report</code> and 5-stage <code>egm-review</code> uncover doc-code drift and hidden bugs.</p>

</details>

<hr>

<h4><a href="reviews/en/developer-tools/agent-desktop.md">agent-desktop</a></h4>

<p>Web (Chrome) &amp; Desktop UI Testing</p>

<p>Score: 9.5/10 · ✅ Using · CLI + Skill<br>Date: Since 2026-11-15</p>

<details>
<summary>Details</summary>

<p><a href="https://agent-browser.dev/desktop">agent-browser.dev/desktop</a> — drives Chrome and desktop apps in the background via macOS Accessibility (<code>AX</code>) without hijacking the cursor (also fallback for iOS <code>Device Hub</code>).</p>

</details>

<hr>

<h4><a href="reviews/en/mobile/agent-device.md">agent-device</a></h4>

<p>Mobile &amp; TV (iOS / Android / tvOS) UI Testing</p>

<p>Score: 9.5/10 · ✅ Using · CLI + Skill<br>Date: Since 2026-11-16</p>

<details>
<summary>Details</summary>

<p><a href="https://agent-device.dev">agent-device.dev</a> — Callstack's zero-dependency CLI: drives headless iOS/tvOS Simulators (<code>~197ms</code>) and <code>-no-window</code> Android/TV Emulators (<code>~888ms</code>, 27x fewer tokens, full UTF-8 input) via <code>@ref</code> handles and <code>--settle</code> diffs (<code>0</code> MCP bloat).</p>

</details>

<hr>

<h4><a href="reviews/en/mobile/cross-platform-qa.md">cross-platform-qa</a></h4>

<p>2-Stage Web / Mobile / TV QA Gate</p>

<p>Score: 9.5/10 · ✅ Using · Skill<br>Date: Since 2026-11-15</p>

<details>
<summary>Details</summary>

<p>1) Iterate locally (<code>agent-desktop</code> Web + <code>agent-device</code> headless iOS/Android/TV + <code>adb</code>), 2) run a single final verification pass on physical hardware before marking Done.</p>

</details>

<hr>

<h4><a href="reviews/en/backend/sentry.md">sentry</a></h4>

<p>Full-Stack Error &amp; Trace Diagnostics</p>

<p>Score: 9.5/10 · ✅ Using · Self-Hosted + Skill / MCP<br>Date: Since 2026-07-08</p>

<details>
<summary>Details</summary>

<p>Full-stack error diagnostics (<code>Issue Grouping</code>, <code>dSYM</code>/<code>ProGuard</code>, <code>Source Maps</code>), <code>Breadcrumbs</code>, <code>Session Replay</code>, and <code>v8+</code> OTel-based traces investigated by AI agents.</p>

</details>

<hr>

<h4><a href="reviews/en/developer-tools/skillshare.md">skillshare</a></h4>

<p>Multi-Agent Skill Sync &amp; Security (audit)</p>

<p>Score: 9.5/10 · ✅ Using · CLI + Skill<br>Date: Since 2026-05-30</p>

<details>
<summary>Details</summary>

<p>Syncs skills/plugins across all AI agents (<code>Codex</code>, <code>Claude</code>, <code>Antigravity</code>) from a single source with a fast built-in <strong>skill-check (<code>skillshare audit</code>)</strong>.</p>

</details>

<hr>

<h4><a href="reviews/en/mobile/animate-expo.md">animate-expo</a></h4>

<p>Expo / React Native 60/120fps Motion</p>

<p>Score: 9.5/10 · ✅ Using · Skill<br>Date: Since 2026-11-09</p>

<details>
<summary>Details</summary>

<p>Builds 60/120fps UI-thread animations and gestures in Expo / React Native using <code>Reanimated</code>, <code>Gesture Handler</code>, and <code>expo-haptics</code> (protected by <code>LOCAL-COMPATIBILITY.md</code>).</p>

</details>

<hr>

<h4><a href="reviews/en/developer-tools/orca.md">Orca + CLI Subagent</a></h4>

<p>Multi-Agent Orchestration &amp; Mobile Control</p>

<p>Score: 9.5/10 · ✅ Using · Desktop + Mobile App + CLI + Skill<br>Date: Since 2026-11-16</p>

<details>
<summary>Details</summary>

<p>Chains <code>Codex</code>, <code>Claude</code>, and <code>Antigravity</code> from a single prompt via native <strong><code>orchestration</code></strong> (<code>orca orchestration worker-start</code> DAGs) and <code>task-context</code> + CLI subagents (<code>argon</code>, <code>antigravity-claude</code>, <code>claude-opus</code>) with live Chat UI worker cards + reliable <strong><code>Orca IDE</code> mobile app</strong> and Lock-Screen wake (<code>caffeinate</code>; <code>PostHog</code> disabled).</p>

</details>

<hr>

<h4><a href="reviews/en/mobile/adb.md">adb</a></h4>

<p>Android Port Forwarding (reverse) &amp; logcat</p>

<p>Score: 9.0/10 · ✅ Using · CLI<br>Date: Since 2026-09-07</p>

<details>
<summary>Details</summary>

<p>Handles port forwarding (<code>reverse</code>), <code>logcat</code>, APK installs, and low-level control across headless Android emulators (<code>-no-window</code>) and physical phones (<code>-s &lt;serial&gt;</code> required).</p>

</details>

<hr>

<h4><a href="reviews/en/mobile/ios-simulator-device-hub.md">xcrun simctl + Device Hub</a></h4>

<p>iOS Windowless Boot &amp; devicectl</p>

<p>Score: 9.0/10 · ✅ Using · Xcode CLI + App<br>Date: Since 2026-10-20</p>

<details>
<summary>Details</summary>

<p>Windowless iOS Simulator <code>boot</code>/<code>shutdown</code> (<code>simctl</code>), physical iPhone build installs (<code>devicectl</code>), and <code>Device Hub</code> fallback.</p>

</details>

<hr>

<h4><a href="reviews/en/mobile/simslim.md">simslim</a></h4>

<p>iOS / tvOS Simulator RAM &amp; Disk Optimizer</p>

<p>Score: 9.0/10 · ✅ Using · Standalone Go CLI<br>Date: Since 2026-11-16</p>

<details>
<summary>Details</summary>

<p>Disables <code>~149–180</code> unneeded <code>iOS</code>/<code>tvOS</code> Simulator background daemons (<code>Siri</code>, <code>Apple Intelligence</code>, <code>Wallpaper</code>): cuts live headless boot from <code>182 -&gt; 78</code> processes and <strong><code>2.70 GB -&gt; 1.16 GB</code> RAM (<code>-57%</code>)</strong> (<code>4.0 GB -&gt; 0.9 GB</code> / <code>-77.5%</code> in GUI) plus reclaims <code>1.5 GB+</code> logs/caches per device (<code>--except web,photos,search --keep com.apple.apsd</code> keeps <code>push</code> &amp; <code>agent-device</code> 100% intact).</p>

</details>

<hr>

<h4><a href="reviews/en/mobile/avdslim.md">avdslim</a></h4>

<p>Android AVD RAM &amp; Metal GPU Optimizer</p>

<p>Score: 9.0/10 · ✅ Using · Standalone Go CLI<br>Date: Since 2026-11-16</p>

<details>
<summary>Details</summary>

<p>Android Emulator (<code>AVD</code>) RAM &amp; GPU optimizer: switches CPU <code>SwiftShader</code> to native <strong>Apple Metal GPU (<code>host</code>)</strong> with <code>-lowram</code> (<code>1536 MB</code>) and Golden Snapshots, cutting memory from <strong><code>4.41 GB -&gt; 2.64 GB</code> (<code>-40.2%</code>, <code>-69%</code> vs 8.5 GB Studio AVDs)</strong> while preserving GPS (<code>--skip=location --keep=com.google.android.apps.maps</code>) and <code>agent-device</code>.</p>

</details>

<hr>

<h4><a href="reviews/en/backend/security-audit-skill.md">security-audit</a></h4>

<p>6-Phase Source-Code Security Audit</p>

<p>Score: 9.0/10 · ✅ Using · Skill<br>Date: Since 2026-11-16</p>

<details>
<summary>Details</summary>

<p>Cloudflare's 6-phase <em>adversarial</em> source-code security audit (<code>Hunter</code> + fresh <code>Verifier</code> subagents + zero-dep Node JSON validators): finds Backend, Web, <strong>Mobile (<code>deep-link</code>/<code>WebView</code>/<code>IPC</code>)</strong>, CLI, and CI/CD vulnerabilities with zero Docker setup (sanitized with <code>quick</code>/<code>scoped</code> default).</p>

</details>

<hr>

<h4><a href="reviews/en/mobile/mobile-native.md">mobile-native</a> + web-to-native-mobile</h4>

<p>Mobile Web / PWA &amp; Web-to-App Porting</p>

<p>Score: 8.5/10 · ✅ Using · Skill Suite<br>Date: Since 2026-11-15</p>

<details>
<summary>Details</summary>

<p>11 CSS/meta fixes that make mobile web apps and PWAs feel native (<code>dvh/svh</code>, <code>safe-area</code>, <code>16px</code> inputs, <code>overscroll-behavior</code>, hover gating) + desktop-to-mobile feature porting rules (<code>web-to-native-mobile</code>) and UI copy punctuation rules (<code>ui-message-punctuation</code>).</p>

</details>

<hr>

<h4><a href="reviews/en/developer-tools/assetdiet.md">AssetDiet</a></h4>

<p>Local Image / SVG / Video / 3D Compression</p>

<p>Score: 7.5/10 · ✅ Using · CLI + <a href="skills/asset-diet/SKILL.md">asset-diet</a><br>Date: Since 2026-11-16</p>

<details>
<summary>Details</summary>

<p>100% local image/SVG/video/3D compression (<code>Sharp</code>, <code>SVGO</code>, <code>FFmpeg</code>) with rollback. Synced globally via our lightweight <a href="skills/asset-diet/SKILL.md"><code>asset-diet</code></a> skill to run <code>npx assetdiet-mcp@0.1.4</code> strictly on demand (<code>0</code> MCP bloat).</p>

</details>

<hr>

<h4><a href="practices/en/06-video-figma-and-db-workflows.md">watch + video-analyzer</a></h4>

<p>Video, Reel &amp; QA Bug-Video Analysis</p>

<p>Score: 9.0/10 · ✅ Using · Skill + CLI (yt-dlp + ffmpeg)<br>Date: Since 2026-10-25</p>

<details>
<summary>Details</summary>

<p>Frame-by-frame analysis of YouTube videos, Instagram Reels, Looms, and customer QA screen recordings combining <code>Whisper</code> audio transcripts with <code>scene-change</code> (or <code>5fps</code>) frame extraction.</p>

</details>

<hr>

<h4><a href="practices/en/06-video-figma-and-db-workflows.md">figma Skill Suite</a></h4>

<p>Two-Way Figma &lt;-&gt; Code Bridge</p>

<p>Score: 9.0/10 · ✅ Using · 6 Skills + MCP<br>Date: Since 2026-10-20</p>

<details>
<summary>Details</summary>

<p>1:1 design-to-code implementation (<code>figma-implement-design</code>) plus <strong>reverse code-to-Figma screen and design-system generation</strong> (<code>figma-generate-design</code>, <code>figma-generate-library</code>, <code>figma-use</code>).</p>

</details>

<hr>

<h4><a href="practices/en/03-web-and-mobile-ui-polish.md">client-performance-gate</a></h4>

<p>Web / Mobile Web / WebOS Speed &amp; Recovery Gate</p>

<p>Score: 9.0/10 · ✅ Using · Skill<br>Date: Since 2026-11-10</p>

<details>
<summary>Details</summary>

<p>Verifies end-user Web, Mobile Web, and WebOS TV apps across a 4-profile <code>1x/6x CPU × fast/constrained/offline</code> matrix, <code>≤200ms</code> input budget, and reload-free recovery once headroom returns <em>(excludes Admin panels)</em>.</p>

</details>

<hr>

<h4><a href="practices/en/06-video-figma-and-db-workflows.md">drizzle-relations-v2</a></h4>

<p>Drizzle ORM v2 Schema &amp; Relations</p>

<p>Score: 8.5/10 · ✅ Using · Skill<br>Date: Since 2026-11-05</p>

<details>
<summary>Details</summary>

<p>Prevents legacy Drizzle <code>v1 relations()</code> hallucinations by enforcing <code>v2 defineRelations</code> syntax and object-based relational <code>where</code> filters.</p>

</details>

<hr>

## By Category

### 🧠 Local Models

<h4><a href="reviews/en/local-models/kimi-k3-in-c.md">kimi-k3-in-c</a></h4>

<p>Purpose: C99 experiment streaming the 2.78T (~104B active) Kimi K3 MoE model straight off NVMe storage without a GPU.</p>

<p>Quality: 8.5/10 · Need: 1.0/10 · ⛔ Rejected · C99 CLI Engine (2.78T MoE)<br>Date: 2026-11-16</p>

<details>
<summary>Details</summary>

<p><strong>Purpose:</strong> C99 experiment streaming the <code>2.78T</code> (<code>~104B</code> active) <code>Kimi K3</code> MoE model straight off NVMe storage without a GPU. <strong>Works for coding?</strong> The base <code>Kimi K3</code> model is a strong coder/reasoner, <strong>but this disk-streaming engine is unusable for coding</strong> (<code>1 token = ~24–33s</code>, <code>500</code> tokens = <code>~3.5h</code> + <code>~50 TB</code> SSD reads). <strong>Specs:</strong> Min: <code>GPU: 0, RAM: 8–16 GB, SSD: ≥1.8 TB NVMe</code>; Smooth: <code>16× H200 (~2.25 TB VRAM)</code>. <strong>If a local coder is needed:</strong> <code>Ollama</code> / <code>MLX</code> (<code>Qwen3-Coder</code>, <code>30–65 tok/s</code> in <code>32–64 GB</code> Mac RAM). 📊 <a href="https://github.com/FareedKhan-dev/kimi-k3-in-c">GitHub Benchmark</a> · <a href="https://artificialanalysis.ai/leaderboards/models">Artificial Analysis</a></p>

</details>

<hr>

<h4><a href="reviews/en/local-models/minimax-m3-1-flash.md">MiniMax-M3.1-Flash <em>(Local)</em></a></h4>

<p>Purpose: Fast multimodal (text + image + video, 1M context) model built for chat, OCR/vision/video analysis, and office automation (Automation-Bench: 62.8%).</p>

<p>Quality: 8.0/10 · Need: 1.0/10 · ⛔ Rejected · Open-Weight 428B MoE (~23B active)<br>Date: 2026-11-16</p>

<details>
<summary>Details</summary>

<p><strong>Purpose:</strong> Fast multimodal (<code>text + image + video</code>, <code>1M</code> context) model built for chat, <code>OCR</code>/vision/video analysis, and office automation (<code>Automation-Bench: 62.8%</code>). <strong>Works for coding?</strong> Handles simple scripts and UI/automation tasks, but is not a frontier repo coder (<code>Terminal-Bench 4.0: 38.1%</code>). <strong>Specs:</strong> <code>~250–285 GB</code> weights do not fit normal workstations (<code>Min: 512 GB Mac Studio</code>, smooth: <code>8× H100 / 640 GB VRAM</code>). <strong>Alternatives:</strong> Local <code>Ollama</code> / <code>MLX</code> (<code>Qwen3-Coder</code>); or use this model via <a href="reviews/en/external-apis/minimax-m3-1-flash-api.md">🔌 <code>MiniMax M3.1 Flash API</code></a>. 📊 <a href="https://huggingface.co/MiniMaxAI/MiniMax-M3.1-Flash">HuggingFace</a> · <a href="https://openrouter.ai/minimax/minimax-m3.1-flash">OpenRouter Stats</a></p>

</details>

<hr>

### 🔌 External APIs

<h4><a href="reviews/en/external-apis/minimax-m3-1-flash-api.md">MiniMax M3.1 Flash API</a></h4>

<p>Purpose: Ultra-low-cost ($0.15 / $0.60, Cached: $0.015), high-speed (170+ tok/s, 1M context) multimodal API for high-volume product backend bots, translation, OCR/image/video analysis, and SaaS automation.</p>

<p>Quality: 8.0/10 · Need: 5.0/10 · 👍 Good Option · Cloud Multimodal API (MiniMax / OpenRouter)<br>Date: 2026-11-16</p>

<details>
<summary>Details</summary>

<p><strong>Purpose:</strong> Ultra-low-cost (<code>$0.15 / $0.60</code>, <code>Cached: $0.015</code>), high-speed (<code>170+ tok/s</code>, <code>1M</code> context) multimodal API for high-volume product backend bots, translation, <code>OCR</code>/image/video analysis, and SaaS automation. <strong>Works for coding?</strong> Works for simple scripts and helper automation, not complex multi-file repository architecture (<code>Terminal-Bench 4.0: 38.1%</code>). <em>(Use paid Zero-Retention API keys only; never send private code to <code>:free</code> tiers).</em> 📊 <a href="https://openrouter.ai/minimax/minimax-m3.1-flash">OpenRouter Stats</a> · <a href="https://huggingface.co/MiniMaxAI/MiniMax-M3.1-Flash">HuggingFace Benchmarks</a> · <a href="https://artificialanalysis.ai/leaderboards/models">Artificial Analysis</a></p>

</details>

<hr>

### 🌐 Web

<h4><a href="reviews/en/web/taste-skill.md">taste-skill v2.5</a></h4>

<p>Strong for greenfield promo/landing sites; if installed, its 600s Stop hook must be stripped and scoped strictly to -p.</p>

<p>Quality: 8.0/10 · Need: 4.0/10 · 👍 Good Option · Landing Kit + Hook<br>Date: 2026-11-15</p>

<details>
<summary>Details</summary>

<p>Strong for greenfield promo/landing sites; if installed, its 600s <code>Stop</code> hook must be stripped and scoped strictly to <code>-p</code>.</p>

</details>

<hr>

<h4><a href="reviews/en/web/vercel-ui-sdk.md">vercel-labs/ui</a></h4>

<p>Vercel Labs&#x27; Public Beta headless UI primitives and ui-sdk skill: its &quot;screenshot-free 2x faster agent control&quot; (createAgent) works strictly on apps rewritten in @ui-sdk/* (blind to plain &lt;button&gt;/&lt;input&gt; and Shadcn/Radix, no Expo support).</p>

<p>Quality: 8.0/10 · Need: 2.0/10 · ⛔ Rejected · @ui-sdk/* Library + Skill (Beta)<br>Date: 2026-11-16</p>

<details>
<summary>Details</summary>

<p>Vercel Labs' Public Beta headless UI primitives and <code>ui-sdk</code> skill: its <em>"screenshot-free 2x faster agent control"</em> (<code>createAgent</code>) works strictly on apps rewritten in <code>@ui-sdk/*</code> (blind to plain <code>&lt;button&gt;</code>/<code>&lt;input&gt;</code> and <code>Shadcn</code>/<code>Radix</code>, no <code>Expo</code> support). <strong>Instead use:</strong> our existing UI stack + <a href="reviews/en/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a> + <a href="reviews/en/developer-tools/agent-desktop.md"><strong><code>agent-desktop</code></strong></a>.</p>

</details>

<hr>

### 📱 Mobile

<h4><a href="reviews/en/mobile/swiftui-agent-skill.md">swiftui-agent-skill</a></h4>

<p>Idiomatic SwiftUI &amp; Apple HIG rules; since our primary stack is Expo / React Native, reserve strictly for -p project installs on pure SwiftUI targets (Widgets / Live Activities).</p>

<p>Quality: 8.5/10 · Need: 3.0/10 · 👍 Good Option · Skill (twostraws / AvdLee / apple-design)<br>Date: 2026-11-16</p>

<details>
<summary>Details</summary>

<p>Idiomatic SwiftUI &amp; Apple HIG rules; since our primary stack is Expo / React Native, reserve strictly for <code>-p</code> project installs on pure SwiftUI targets (Widgets / Live Activities). <strong>Instead use:</strong> <a href="reviews/en/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a> (<code>reference/ios.md</code>) + <a href="reviews/en/mobile/animate-expo.md"><strong><code>animate-expo</code></strong></a>.</p>

</details>

<hr>

<h4><a href="reviews/en/mobile/artemis.md">ARTEMIS</a></h4>

<p>Google&#x27;s autonomous Android QA engine (strong OCR + pixel vision on custom Canvas/game screens), but paid at runtime (requires a separate billed per-token LLM API key in .env), Android-only (no iOS/tvOS), and 3–40s/step.</p>

<p>Quality: 8.5/10 · Need: 2.5/10 · 👍 Good Option · Python CLI / SDK + MCP (google/artemis)<br>Date: 2026-11-16</p>

<details>
<summary>Details</summary>

<p>Google's autonomous Android QA engine (strong OCR + pixel vision on custom <code>Canvas</code>/game screens), but <strong>paid at runtime</strong> (requires a separate billed per-token LLM API key in <code>.env</code>), Android-only (no <code>iOS</code>/<code>tvOS</code>), and <code>3–40s/step</code>. <strong>Instead use:</strong> <a href="reviews/en/mobile/agent-device.md"><strong><code>agent-device</code></strong></a> (<code>$0</code> extra API cost, <code>iOS + Android + TV</code>, <code>197–888 ms</code>).</p>

</details>

<hr>

<h4><a href="reviews/en/mobile/mobile-mcp.md">mobile-mcp</a></h4>

<p>Benchmarked live and rejected: ~7,580 tokens of permanent MCP schema bloat per turn, 6.5x–37x slower than agent-device (7.3s iOS, 5.8s Android), Scarf + PostHog telemetry, and mobilenext.ai cloud upsell tools.</p>

<p>Quality: 7.0/10 · Need: 2.0/10 · ⛔ Rejected · MCP Server (34 tools)<br>Date: 2026-11-16</p>

<details>
<summary>Details</summary>

<p>Benchmarked live and rejected: <code>~7,580</code> tokens of permanent MCP schema bloat per turn, <code>6.5x–37x</code> slower than <code>agent-device</code> (<code>7.3s</code> iOS, <code>5.8s</code> Android), <code>Scarf</code> + <code>PostHog</code> telemetry, and <code>mobilenext.ai</code> cloud upsell tools. <strong>Instead use:</strong> <a href="reviews/en/mobile/agent-device.md"><strong><code>agent-device</code></strong></a> + <a href="reviews/en/mobile/adb.md"><strong><code>adb</code></strong></a>.</p>

</details>

<hr>

### 🎨 UI/UX

<h4><a href="reviews/en/ui-ux/animate.md">animate</a></h4>

<p>Emil Kowalski&#x27;s web animation skill; auto-triggers and rules collide with our existing stack.</p>

<p>Quality: 8.5/10 · Need: 3.0/10 · ⛔ Rejected · Skill (2 files)<br>Date: 2026-11-15</p>

<details>
<summary>Details</summary>

<p>Emil Kowalski's web animation skill; auto-triggers and rules collide with our existing stack. <strong>Instead use:</strong> <a href="reviews/en/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a> (<code>animate</code>) + <a href="reviews/en/mobile/animate-expo.md"><strong><code>animate-expo</code></strong></a>.</p>

</details>

<hr>

<h4><a href="reviews/en/ui-ux/unslop.md">unslop</a></h4>

<p>@heydamir&#x27;s 9-pass cleanup skill for AI/vibecoded web UIs (CC-BY-4.0); Web-only and collides on auto-triggers.</p>

<p>Quality: 8.5/10 · Need: 2.5/10 · ⛔ Rejected · Skill + Playwright scripts<br>Date: 2026-11-16</p>

<details>
<summary>Details</summary>

<p><code>@heydamir</code>'s 9-pass cleanup skill for AI/vibecoded web UIs (<code>CC-BY-4.0</code>); Web-only and collides on auto-triggers. <strong>Instead use:</strong> <a href="reviews/en/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a> (<code>craft-floor</code> + <code>polish</code> / <code>quieter</code> / <code>clarify</code>).</p>

</details>

<hr>

<h4><a href="reviews/en/ui-ux/break-ui.md">break-ui</a></h4>

<p>Worst-case data stress-tester; injects temporary fixtures/toggles into the repo and stops without fixing.</p>

<p>Quality: 8.0/10 · Need: 3.0/10 · ⛔ Rejected · Skill (2 files)<br>Date: 2026-11-15</p>

<details>
<summary>Details</summary>

<p>Worst-case data stress-tester; injects temporary fixtures/toggles into the repo and stops without fixing. <strong>Instead use:</strong> <a href="reviews/en/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a> (<code>harden</code>).</p>

</details>

<hr>

<h4><a href="reviews/en/ui-ux/make-interfaces-feel-better.md">make-interfaces-feel-better</a></h4>

<p>Tested and removed due to auto-trigger overlap and bloated 4-table reports.</p>

<p>Quality: 7.5/10 · Need: 2.5/10 · ⛔ Rejected · Skill (6 files)<br>Date: 2026-10-31 → 2026-11-15</p>

<details>
<summary>Details</summary>

<p>Tested and removed due to auto-trigger overlap and bloated 4-table reports. <strong>Instead use:</strong> <a href="reviews/en/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a> + <a href="reviews/en/mobile/animate-expo.md"><strong><code>animate-expo</code></strong></a>.</p>

</details>

<hr>

<h4><a href="reviews/en/ui-ux/ui-ux-pro-max.md">ui-ux-pro-max</a></h4>

<p>Weaker than impeccable and collides with its auto-trigger.</p>

<p>Quality: 7.0/10 · Need: 3.5/10 · ⛔ Rejected · Skill + CSV/Python<br>Date: 2026-11-15</p>

<details>
<summary>Details</summary>

<p>Weaker than <code>impeccable</code> and collides with its auto-trigger. <strong>Instead use:</strong> <a href="reviews/en/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a>.</p>

</details>

<hr>

### 🏗️ Architecture & Review

<h4><a href="reviews/en/architecture/addy-agent-skills.md">addy-agent-skills</a></h4>

<p>Addy Osmani&#x27;s full SDLC pipeline (/spec -&gt; /ship); mandatory TDD and doubt-driven escalation pauses add unnecessary loops.</p>

<p>Quality: 8.0/10 · Need: 2.5/10 · ⛔ Rejected · Plugin (25 skills + 9 commands)<br>Date: 2026-11-16</p>

<details>
<summary>Details</summary>

<p>Addy Osmani's full SDLC pipeline (<code>/spec -&gt; /ship</code>); mandatory TDD and <code>doubt-driven</code> escalation pauses add unnecessary loops. <strong>Instead use:</strong> <a href="reviews/en/architecture/grill-me.md"><strong><code>grill-me</code></strong></a> + <a href="reviews/en/architecture/ponytail.md"><strong><code>ponytail</code></strong></a> + <a href="reviews/en/architecture/elephant-goldfish-model.md"><strong><code>elephant-goldfish-model</code></strong></a>.</p>

</details>

<hr>

<h4><a href="reviews/en/architecture/agency-agents.md">agency-agents</a></h4>

<p>283 .md roleplay prompts across 18 divisions (~18.5K-token frontmatter bloat and leftover copy-paste rules).</p>

<p>Quality: 6.5/10 · Need: 2.5/10 · ⛔ Rejected · 283 persona prompts + installer<br>Date: 2026-11-16</p>

<details>
<summary>Details</summary>

<p>283 <code>.md</code> roleplay prompts across 18 divisions (<code>~18.5K</code>-token frontmatter bloat and leftover copy-paste rules). <strong>Instead use:</strong> <a href="reviews/en/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a>, <a href="reviews/en/architecture/ponytail.md"><strong><code>ponytail</code></strong></a>, <a href="reviews/en/architecture/elephant-goldfish-model.md"><strong><code>elephant-goldfish-model</code></strong></a>, <a href="reviews/en/mobile/cross-platform-qa.md"><strong><code>cross-platform-qa</code></strong></a>.</p>

</details>

<hr>

<h4><a href="reviews/en/architecture/superpowers.md">superpowers</a></h4>

<p>Tested and removed: causes overthinking (SessionStart hook), noisy brainstorming questions (replaced by grill-me), slow subagent loops, and mandatory TDD that doubles work across Web/Mobile/Backend.</p>

<p>Quality: 6.5/10 · Need: 2.0/10 · ⛔ Rejected · Plugin (14 skills + hook)<br>Date: 2026-04-04 → 2026-09-01</p>

<details>
<summary>Details</summary>

<p>Tested and removed: causes overthinking (<code>SessionStart</code> hook), noisy <code>brainstorming</code> questions (replaced by <code>grill-me</code>), slow subagent loops, and mandatory TDD that doubles work across Web/Mobile/Backend.</p>

</details>

<hr>

### ⚙️ Backend

<h4><a href="reviews/en/backend/opentelemetry.md">opentelemetry</a></h4>

<p>Industry standard for cross-service Traces + Metrics + Logs and host/DB telemetry (requires Collector + SigNoz/Grafana).</p>

<p>Quality: 9.0/10 · Need: 4.0/10 · 👍 Good Option · Standard + Collector (SigNoz / Grafana)<br>Date: 2026-11-15</p>

<details>
<summary>Details</summary>

<p>Industry standard for cross-service <code>Traces + Metrics + Logs</code> and host/DB telemetry (requires <code>Collector + SigNoz/Grafana</code>). <strong>Instead use:</strong> <a href="reviews/en/backend/sentry.md"><strong><code>sentry</code></strong></a> (covers errors, replays, and baseline traces in one stack).</p>

</details>

<hr>

<h4><a href="reviews/en/backend/shannon.md">Shannon</a></h4>

<p>Autonomous White-Box AI pentester (Auth bypass, IDOR, Injection, XSS, SSRF).</p>

<p>Quality: 8.5/10 · Need: 6.5/10 · 👍 Good Option · Standalone CLI + <a href="skills/hacker-test/SKILL.md">hacker-test</a><br>Date: 2026-11-16</p>

<details>
<summary>Details</summary>

<p>Autonomous White-Box AI pentester (Auth bypass, IDOR, Injection, XSS, SSRF). Instead of installing its heavy plugin, we trigger <code>npx</code> on demand via our lightweight <a href="skills/hacker-test/SKILL.md"><code>hacker-test</code></a> skill strictly on local/staging (never production).</p>

</details>

<hr>

### 🛠️ Developer Tools & Memory

<h4><a href="reviews/en/developer-tools/skillspector.md">SkillSpector</a></h4>

<p>NVIDIA&#x27;s AI skill &amp; MCP security scanner (AST + YARA + OSV + LLM).</p>

<p>Quality: 9.0/10 · Need: 3.5/10 · ⛔ Rejected · Python CLI + MCP + Skill<br>Date: 2026-11-16</p>

<details>
<summary>Details</summary>

<p>NVIDIA's AI skill &amp; MCP security scanner (<code>AST + YARA + OSV + LLM</code>). Not installed to avoid an extra daily loop — <strong>Instead use:</strong> <a href="reviews/en/developer-tools/skillshare.md"><strong><code>skillshare</code></strong></a> (<code>skillshare audit</code> skill-check) + <strong>direct AI agent source-code inspection</strong>.</p>

</details>

<hr>

<h4><a href="reviews/en/developer-tools/t3-code.md">T3 Code</a></h4>

<p>Used and uninstalled (~3.87 GB reclaimed): its beta mobile app disconnects frequently when the phone locks, sessions drop on Mac Lock Screen, and it lacks native inline worker cards in Chat UI.</p>

<p>Quality: 8.5/10 · Need: 2.5/10 · ⛔ Rejected · Desktop App + CLI Subagent Workflow<br>Date: 2026-10-23 → 2026-11-16</p>

<details>
<summary>Details</summary>

<p>Used and uninstalled (<code>~3.87 GB</code> reclaimed): its beta mobile app disconnects frequently when the phone locks, sessions drop on Mac <code>Lock Screen</code>, and it lacks native inline worker cards in Chat UI. <strong>Instead use:</strong> <a href="reviews/en/developer-tools/orca.md"><strong><code>Orca</code> (<code>stablyai/orca</code>)</strong></a>.</p>

</details>

<hr>

<h4><a href="reviews/en/developer-tools/caveman.md">caveman</a></h4>

<p>ASD-STE100-based terse terminal response skill (SKILL.md); if used, take only the sanitized standalone SKILL.md (disable-model-invocation: true) without @caveman-ai/cli telemetry or plugin.json hooks.</p>

<p>Quality: 8.0/10 · Need: 3.5/10 · 👍 Good Option · Skill <em>(+ optional CLI/Proxy)</em><br>Date: 2026-11-16</p>

<details>
<summary>Details</summary>

<p><code>ASD-STE100</code>-based terse terminal response skill (<code>SKILL.md</code>); if used, take only the sanitized standalone <code>SKILL.md</code> (<code>disable-model-invocation: true</code>) without <code>@caveman-ai/cli</code> telemetry or <code>plugin.json</code> hooks. <strong>Instead use:</strong> <a href="reviews/en/architecture/ponytail.md"><strong><code>ponytail</code></strong></a> (cuts both reply prose and over-engineered code/diffs).</p>

</details>

<hr>

<h4><a href="reviews/en/developer-tools/humanizer-stop-slop.md">humanizer + stop-slop</a></h4>

<p>Long-form prose editors that strip AI writing clichés (humanizer is ~32 KB); not built for code or product UI.</p>

<p>Quality: 7.5/10 · Need: 2.0/10 · ⛔ Rejected · Skill (Markdown)<br>Date: 2026-11-16</p>

<details>
<summary>Details</summary>

<p>Long-form prose editors that strip AI writing clichés (<code>humanizer</code> is <code>~32 KB</code>); not built for code or product UI. <strong>Instead use:</strong> <a href="reviews/en/architecture/ponytail.md"><strong><code>ponytail</code></strong></a> + <a href="reviews/en/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a> (<code>clarify</code>).</p>

</details>

<hr>

<h4><a href="reviews/en/developer-tools/claude-code-setup.md">claude-code-setup</a></h4>

<p>Anthropic&#x27;s read-only onboarding recommender for starter CLAUDE.md rules, hooks, and MCP servers.</p>

<p>Quality: 7.5/10 · Need: 2.0/10 · ⛔ Rejected · Plugin (Recommender Skill)<br>Date: 2026-11-16</p>

<details>
<summary>Details</summary>

<p>Anthropic's read-only onboarding recommender for starter <code>CLAUDE.md</code> rules, hooks, and MCP servers. <strong>Instead use:</strong> <a href="reviews/en/developer-tools/skillshare.md"><strong><code>skillshare</code></strong></a>.</p>

</details>

<hr>

<h4><a href="reviews/en/developer-tools/omniroute.md">OmniRoute</a></h4>

<p>Local LLM reverse-proxy (localhost:20128); its 44 bundled skills are proxy admin manuals, default routing breaks long sessions (#7287) and silently downgrades models, and wreq-js TLS-stealth carries subscription ToS ban risk.</p>

<p>Quality: 7.5/10 · Need: 2.0/10 · ⛔ Rejected · Local Proxy + 44 Admin Skills<br>Date: 2026-11-16</p>

<details>
<summary>Details</summary>

<p>Local LLM reverse-proxy (<code>localhost:20128</code>); its 44 bundled skills are proxy admin manuals, default routing breaks long sessions (<code>#7287</code>) and silently downgrades models, and <code>wreq-js</code> TLS-stealth carries subscription ToS ban risk. <strong>Instead use:</strong> <a href="reviews/en/developer-tools/orca.md"><strong><code>Orca</code></strong></a> + <a href="reviews/en/architecture/ponytail.md"><strong><code>ponytail</code></strong></a>.</p>

</details>

<hr>

<details>
<summary>Install global <code>tasted-skills</code>, <code>hacker-test</code>, and <code>asset-diet</code> skills</summary>

```bash
skillshare install TursunboyevJahongir/tasted-skills -s tasted-skills -s hacker-test -s asset-diet -g && skillshare sync -g
```

</details>

