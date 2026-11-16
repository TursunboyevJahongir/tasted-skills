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

📖 [Which skills and tools to use together, their additional capabilities, and **⚖️ Head-to-Head Tool & Skill Comparisons** →](practices/en/README.md)

## ⭐ Top Essentials (Ordered by Daily Workflow Priority)

<table width="100%">
  <thead>
    <tr>
      <th align="center" width="5%">#</th>
      <th align="left" width="18%">Name</th>
      <th align="left" width="24%">Core Job</th>
      <th align="left" width="16%">Type</th>
      <th align="center" width="9%">Score</th>
      <th align="center" width="14%">Status</th>
      <th align="center" width="14%">Date</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td align="center"><strong>1</strong></td>
      <td><a href="reviews/en/architecture/grill-me.md"><strong><code>grill-me</code></strong></a></td>
      <td><strong>Planning, Decisions &amp; Deep Debug</strong></td>
      <td>Skill Suite</td>
      <td align="center"><strong>9.5/10</strong></td>
      <td align="center"><code>✅&nbsp;Active</code></td>
      <td align="center">Since&nbsp;<code>2026&#8209;05&#8209;23</code></td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Walks the design decision tree before coding (<code>grilling</code> + <code>grill-with-docs</code> + <code>domain-modeling</code>) plus sanitized on-demand <strong><code>diagnosing-bugs</code></strong> and <strong><code>improve-codebase-architecture</code></strong> skills from <code>mattpocock/skills</code>.</td>
    </tr>
    <tr>
      <td align="center"><strong>2</strong></td>
      <td><a href="reviews/en/architecture/graphify.md"><strong><code>graphify</code></strong></a></td>
      <td><strong>Codebase Map (Knowledge Graph)</strong></td>
      <td>Skill + Python CLI</td>
      <td align="center"><strong>9.5/10</strong></td>
      <td align="center"><code>✅&nbsp;Active</code></td>
      <td align="center">Since&nbsp;<code>2026&#8209;07&#8209;28</code></td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Builds a persistent knowledge graph (<code>graph.json</code> + HTML) from code (local AST, <code>0</code> tokens) and docs to trace module and file relationships in seconds.</td>
    </tr>
    <tr>
      <td align="center"><strong>3</strong></td>
      <td><a href="reviews/en/architecture/ponytail.md"><strong><code>ponytail</code></strong></a></td>
      <td><strong>Minimal Clean Code (YAGNI)</strong></td>
      <td>Skill</td>
      <td align="center"><strong>9.5/10</strong></td>
      <td align="center"><code>✅&nbsp;Active</code></td>
      <td align="center">Since&nbsp;<code>2026&#8209;11&#8209;15</code></td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Core coding discipline: smallest change that completely solves the task, zero speculative abstraction, and concise replies readable in one pass.</td>
    </tr>
    <tr>
      <td align="center"><strong>4</strong></td>
      <td><a href="reviews/en/architecture/karpathy-guidelines.md"><strong><code>karpathy-guidelines</code></strong></a></td>
      <td><strong>Surgical Code Edits</strong></td>
      <td>Skill</td>
      <td align="center"><strong>9.5/10</strong></td>
      <td align="center"><code>✅&nbsp;Active</code></td>
      <td align="center">Since&nbsp;<code>2026&#8209;11&#8209;15</code></td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Surface assumptions upfront, prioritize simplicity, and make surgical edits without touching adjacent code.</td>
    </tr>
    <tr>
      <td align="center"><strong>5</strong></td>
      <td><a href="reviews/en/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a></td>
      <td><strong>Primary UI/UX Design &amp; Audit</strong></td>
      <td>Skill</td>
      <td align="center"><strong>9.5/10</strong></td>
      <td align="center"><code>✅&nbsp;Active</code></td>
      <td align="center">Since&nbsp;<code>2026&#8209;11&#8209;09</code></td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Primary design system, UX/contrast/typography auditing, and UI polish (<code>polish</code>, <code>clarify</code>, <code>harden</code>) across web, mobile web, and native iOS/Android. <strong>💡 Tip:</strong> worth patching in an <strong><code>APCA</code> (<code>|Lc| ≥ 60</code>) perceptual contrast</strong> rule so <code>WCAG 2</code> (<code>4.5:1</code>) doesn't falsely fail crisp white text on mid-tone brand buttons (<a href="reviews/en/ui-ux/impeccable.md#apca-contrast">exact changes</a>).</td>
    </tr>
    <tr>
      <td align="center"><strong>6</strong></td>
      <td><a href="reviews/en/architecture/elephant-goldfish-model.md"><strong><code>elephant-goldfish-model</code></strong></a></td>
      <td><strong>Independent Architecture &amp; Code Review</strong></td>
      <td>Plugin (7 skills + 10 agents)</td>
      <td align="center"><strong>9.5/10</strong></td>
      <td align="center"><code>✅&nbsp;Active</code></td>
      <td align="center">Since&nbsp;<code>2026&#8209;11&#8209;15</code></td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Context-rich architect (<em>Elephant</em>) + fresh-context hostile reviewers (<em>Goldfish</em>): <code>egm-drift-report</code> and 5-stage <code>egm-review</code> uncover doc-code drift and hidden bugs.</td>
    </tr>
    <tr>
      <td align="center"><strong>7</strong></td>
      <td><a href="reviews/en/developer-tools/agent-desktop.md"><strong><code>agent-desktop</code></strong></a></td>
      <td><strong>Web (<code>Chrome</code>) &amp; Desktop UI Testing</strong></td>
      <td>CLI + Skill</td>
      <td align="center"><strong>9.5/10</strong></td>
      <td align="center"><code>✅&nbsp;Active</code></td>
      <td align="center">Since&nbsp;<code>2026&#8209;11&#8209;15</code></td>
    </tr>
    <tr>
      <td colspan="7" width="2000"><a href="https://agent-browser.dev/desktop">agent-browser.dev/desktop</a> — drives Chrome and desktop apps in the background via macOS Accessibility (<code>AX</code>) without hijacking the cursor (also fallback for iOS <code>Device Hub</code>).</td>
    </tr>
    <tr>
      <td align="center"><strong>8</strong></td>
      <td><a href="reviews/en/mobile/agent-device.md"><strong><code>agent-device</code></strong></a></td>
      <td><strong>Mobile &amp; TV (<code>iOS</code> / <code>Android</code> / <code>tvOS</code>) UI Testing</strong></td>
      <td>CLI + Skill</td>
      <td align="center"><strong>9.5/10</strong></td>
      <td align="center"><code>✅&nbsp;Active</code></td>
      <td align="center">Since&nbsp;<code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="7" width="2000"><a href="https://agent-device.dev">agent-device.dev</a> — Callstack's zero-dependency CLI: drives headless iOS/tvOS Simulators (<code>~197ms</code>) and <code>-no-window</code> Android/TV Emulators (<code>~888ms</code>, 27x fewer tokens, full UTF-8 input) via <code>@ref</code> handles and <code>--settle</code> diffs (<code>0</code> MCP bloat).</td>
    </tr>
    <tr>
      <td align="center"><strong>9</strong></td>
      <td><a href="reviews/en/mobile/cross-platform-qa.md"><strong><code>cross-platform-qa</code></strong></a></td>
      <td><strong>2-Stage Web / Mobile / TV QA Gate</strong></td>
      <td>Skill</td>
      <td align="center"><strong>9.5/10</strong></td>
      <td align="center"><code>✅&nbsp;Active</code></td>
      <td align="center">Since&nbsp;<code>2026&#8209;11&#8209;15</code></td>
    </tr>
    <tr>
      <td colspan="7" width="2000">1) Iterate locally (<code>agent-desktop</code> Web + <code>agent-device</code> headless iOS/Android/TV + <code>adb</code>), 2) run a single final verification pass on physical hardware before marking Done.</td>
    </tr>
    <tr>
      <td align="center"><strong>10</strong></td>
      <td><a href="reviews/en/backend/sentry.md"><strong><code>sentry</code></strong></a></td>
      <td><strong>Full-Stack Error &amp; Trace Diagnostics</strong></td>
      <td>Self-Hosted + Skill / MCP</td>
      <td align="center"><strong>9.5/10</strong></td>
      <td align="center"><code>✅&nbsp;Active</code></td>
      <td align="center">Since&nbsp;<code>2026&#8209;07&#8209;08</code></td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Full-stack error diagnostics (<code>Issue Grouping</code>, <code>dSYM</code>/<code>ProGuard</code>, <code>Source Maps</code>), <code>Breadcrumbs</code>, <code>Session Replay</code>, and <code>v8+</code> OTel-based traces investigated by AI agents.</td>
    </tr>
    <tr>
      <td align="center"><strong>11</strong></td>
      <td><a href="reviews/en/developer-tools/skillshare.md"><strong><code>skillshare</code></strong></a></td>
      <td><strong>Multi-Agent Skill Sync &amp; Security (<code>audit</code>)</strong></td>
      <td>CLI + Skill</td>
      <td align="center"><strong>9.5/10</strong></td>
      <td align="center"><code>✅&nbsp;Active</code></td>
      <td align="center">Since&nbsp;<code>2026&#8209;05&#8209;30</code></td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Syncs skills/plugins across all AI agents (<code>Codex</code>, <code>Claude</code>, <code>Antigravity</code>) from a single source with a fast built-in <strong>skill-check (<code>skillshare audit</code>)</strong>.</td>
    </tr>
    <tr>
      <td align="center"><strong>12</strong></td>
      <td><a href="reviews/en/mobile/animate-expo.md"><strong><code>animate-expo</code></strong></a></td>
      <td><strong>Expo / React Native 60/120fps Motion</strong></td>
      <td>Skill</td>
      <td align="center"><strong>9.5/10</strong></td>
      <td align="center"><code>✅&nbsp;Active</code></td>
      <td align="center">Since&nbsp;<code>2026&#8209;11&#8209;09</code></td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Builds 60/120fps UI-thread animations and gestures in Expo / React Native using <code>Reanimated</code>, <code>Gesture Handler</code>, and <code>expo-haptics</code> (protected by <code>LOCAL-COMPATIBILITY.md</code>).</td>
    </tr>
    <tr>
      <td align="center"><strong>13</strong></td>
      <td><a href="reviews/en/developer-tools/t3-code.md"><strong><code>T3 Code</code></strong> + CLI Subagent</a></td>
      <td><strong>Multi-Agent Code &amp; Review Orchestration</strong></td>
      <td>Desktop App + CLI + Skill</td>
      <td align="center"><strong>9.0/10</strong></td>
      <td align="center"><code>✅&nbsp;Active</code></td>
      <td align="center">Since&nbsp;<code>2026&#8209;10&#8209;23</code></td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Multi-AI orchestration via <code>task-context</code> + CLI subagents (<code>argon</code>, <code>antigravity-claude</code>, <code>claude-opus</code>, <code>antigravity-consult</code>) and <strong><code>orchestration</code></strong> (Orca <code>worker-start</code> DAGs) for independent implementation and review.</td>
    </tr>
    <tr>
      <td align="center"><strong>14</strong></td>
      <td><a href="reviews/en/mobile/adb.md"><strong><code>adb</code></strong></a></td>
      <td><strong>Android Port Forwarding (<code>reverse</code>) &amp; <code>logcat</code></strong></td>
      <td>CLI</td>
      <td align="center"><strong>9.0/10</strong></td>
      <td align="center"><code>✅&nbsp;Active</code></td>
      <td align="center">Since&nbsp;<code>2026&#8209;09&#8209;07</code></td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Handles port forwarding (<code>reverse</code>), <code>logcat</code>, APK installs, and low-level control across headless Android emulators (<code>-no-window</code>) and physical phones (<code>-s &lt;serial&gt;</code> required).</td>
    </tr>
    <tr>
      <td align="center"><strong>15</strong></td>
      <td><a href="reviews/en/mobile/ios-simulator-device-hub.md"><strong><code>xcrun simctl</code> + <code>Device Hub</code></strong></a></td>
      <td><strong>iOS Windowless Boot &amp; <code>devicectl</code></strong></td>
      <td>Xcode CLI + App</td>
      <td align="center"><strong>9.0/10</strong></td>
      <td align="center"><code>✅&nbsp;Active</code></td>
      <td align="center">Since&nbsp;<code>2026&#8209;10&#8209;20</code></td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Windowless iOS Simulator <code>boot</code>/<code>shutdown</code> (<code>simctl</code>), physical iPhone build installs (<code>devicectl</code>), and <code>Device Hub</code> fallback.</td>
    </tr>
    <tr>
      <td align="center"><strong>16</strong></td>
      <td><a href="reviews/en/mobile/simslim.md"><strong><code>simslim</code></strong></a></td>
      <td><strong>iOS / tvOS Simulator RAM &amp; Disk Optimizer</strong></td>
      <td>Standalone Go CLI</td>
      <td align="center"><strong>9.0/10</strong></td>
      <td align="center"><code>✅&nbsp;Active</code></td>
      <td align="center">Since&nbsp;<code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Disables <code>~149–180</code> unneeded <code>iOS</code>/<code>tvOS</code> Simulator background daemons (<code>Siri</code>, <code>Apple Intelligence</code>, <code>Wallpaper</code>): cuts live headless boot from <code>182 -&gt; 78</code> processes and <strong><code>2.70 GB -&gt; 1.16 GB</code> RAM (<code>-57%</code>)</strong> (<code>4.0 GB -&gt; 0.9 GB</code> / <code>-77.5%</code> in GUI) plus reclaims <code>1.5 GB+</code> logs/caches per device (<code>--except web,photos,search --keep com.apple.apsd</code> keeps <code>push</code> &amp; <code>agent-device</code> 100% intact).</td>
    </tr>
    <tr>
      <td align="center"><strong>17</strong></td>
      <td><a href="reviews/en/mobile/avdslim.md"><strong><code>avdslim</code></strong></a></td>
      <td><strong>Android AVD RAM &amp; Metal GPU Optimizer</strong></td>
      <td>Standalone Go CLI</td>
      <td align="center"><strong>9.0/10</strong></td>
      <td align="center"><code>✅&nbsp;Active</code></td>
      <td align="center">Since&nbsp;<code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Android Emulator (<code>AVD</code>) RAM &amp; GPU optimizer: switches CPU <code>SwiftShader</code> to native <strong>Apple Metal GPU (<code>host</code>)</strong> with <code>-lowram</code> (<code>1536 MB</code>) and Golden Snapshots, cutting memory from <strong><code>4.41 GB -&gt; 2.64 GB</code> (<code>-40.2%</code>, <code>-69%</code> vs 8.5 GB Studio AVDs)</strong> while preserving GPS (<code>--skip=location --keep=com.google.android.apps.maps</code>) and <code>agent-device</code>.</td>
    </tr>
    <tr>
      <td align="center"><strong>18</strong></td>
      <td><a href="reviews/en/backend/security-audit-skill.md"><strong><code>security-audit</code></strong></a></td>
      <td><strong>6-Phase Source-Code Security Audit</strong></td>
      <td>Skill</td>
      <td align="center"><strong>9.0/10</strong></td>
      <td align="center"><code>✅&nbsp;Active</code></td>
      <td align="center">Since&nbsp;<code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Cloudflare's 6-phase <em>adversarial</em> source-code security audit (<code>Hunter</code> + fresh <code>Verifier</code> subagents + zero-dep Node JSON validators): finds Backend, Web, <strong>Mobile (<code>deep-link</code>/<code>WebView</code>/<code>IPC</code>)</strong>, CLI, and CI/CD vulnerabilities with zero Docker setup (sanitized with <code>quick</code>/<code>scoped</code> default).</td>
    </tr>
    <tr>
      <td align="center"><strong>19</strong></td>
      <td><a href="reviews/en/mobile/mobile-native.md"><strong><code>mobile-native</code></strong></a> + <code>web-to-native-mobile</code></td>
      <td><strong>Mobile Web / PWA &amp; Web-to-App Porting</strong></td>
      <td>Skill Suite</td>
      <td align="center"><strong>8.5/10</strong></td>
      <td align="center"><code>✅&nbsp;Active</code></td>
      <td align="center">Since&nbsp;<code>2026&#8209;11&#8209;15</code></td>
    </tr>
    <tr>
      <td colspan="7" width="2000">11 CSS/meta fixes that make mobile web apps and PWAs feel native (<code>dvh/svh</code>, <code>safe-area</code>, <code>16px</code> inputs, <code>overscroll-behavior</code>, hover gating) + desktop-to-mobile feature porting rules (<code>web-to-native-mobile</code>) and UI copy punctuation rules (<code>ui-message-punctuation</code>).</td>
    </tr>
    <tr>
      <td align="center"><strong>20</strong></td>
      <td><a href="reviews/en/developer-tools/assetdiet.md"><strong><code>AssetDiet</code></strong></a></td>
      <td><strong>Local Image / SVG / Video / 3D Compression</strong></td>
      <td>CLI + <a href="skills/asset-diet/SKILL.md"><code>asset-diet</code></a></td>
      <td align="center"><strong>7.5/10</strong></td>
      <td align="center"><code>✅&nbsp;Active</code></td>
      <td align="center">Since&nbsp;<code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="7" width="2000">100% local image/SVG/video/3D compression (<code>Sharp</code>, <code>SVGO</code>, <code>FFmpeg</code>) with rollback. Synced globally via our lightweight <a href="skills/asset-diet/SKILL.md"><code>asset-diet</code></a> skill to run <code>npx assetdiet-mcp@0.1.4</code> strictly on demand (<code>0</code> MCP bloat).</td>
    </tr>
    <tr>
      <td align="center"><strong>21</strong></td>
      <td><a href="practices/en/06-video-figma-and-db-workflows.md"><strong><code>watch</code> + <code>video-analyzer</code></strong></a></td>
      <td><strong>Video, Reel &amp; QA Bug-Video Analysis</strong></td>
      <td>Skill + CLI (<code>yt-dlp</code> + <code>ffmpeg</code>)</td>
      <td align="center"><strong>9.0/10</strong></td>
      <td align="center"><code>✅&nbsp;Active</code></td>
      <td align="center">Since&nbsp;<code>2026&#8209;10&#8209;25</code></td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Frame-by-frame analysis of YouTube videos, Instagram Reels, Looms, and customer QA screen recordings combining <code>Whisper</code> audio transcripts with <code>scene-change</code> (or <code>5fps</code>) frame extraction.</td>
    </tr>
    <tr>
      <td align="center"><strong>22</strong></td>
      <td><a href="practices/en/06-video-figma-and-db-workflows.md"><strong><code>figma</code> Skill Suite</strong></a></td>
      <td><strong>Two-Way <code>Figma &lt;-&gt; Code</code> Bridge</strong></td>
      <td>6 Skills + MCP</td>
      <td align="center"><strong>9.0/10</strong></td>
      <td align="center"><code>✅&nbsp;Active</code></td>
      <td align="center">Since&nbsp;<code>2026&#8209;10&#8209;20</code></td>
    </tr>
    <tr>
      <td colspan="7" width="2000">1:1 design-to-code implementation (<code>figma-implement-design</code>) plus <strong>reverse code-to-Figma screen and design-system generation</strong> (<code>figma-generate-design</code>, <code>figma-generate-library</code>, <code>figma-use</code>).</td>
    </tr>
    <tr>
      <td align="center"><strong>23</strong></td>
      <td><a href="practices/en/03-web-and-mobile-ui-polish.md"><strong><code>client-performance-gate</code></strong></a></td>
      <td><strong>Web / Mobile Web / WebOS Speed &amp; Recovery Gate</strong></td>
      <td>Skill</td>
      <td align="center"><strong>9.0/10</strong></td>
      <td align="center"><code>✅&nbsp;Active</code></td>
      <td align="center">Since&nbsp;<code>2026&#8209;11&#8209;10</code></td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Verifies end-user Web, Mobile Web, and WebOS TV apps across a 4-profile <code>1x/6x CPU × fast/constrained/offline</code> matrix, <code>≤200ms</code> input budget, and reload-free recovery once headroom returns <em>(excludes Admin panels)</em>.</td>
    </tr>
    <tr>
      <td align="center"><strong>24</strong></td>
      <td><a href="practices/en/06-video-figma-and-db-workflows.md"><strong><code>drizzle-relations-v2</code></strong></a></td>
      <td><strong>Drizzle ORM <code>v2</code> Schema &amp; Relations</strong></td>
      <td>Skill</td>
      <td align="center"><strong>8.5/10</strong></td>
      <td align="center"><code>✅&nbsp;Active</code></td>
      <td align="center">Since&nbsp;<code>2026&#8209;11&#8209;05</code></td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Prevents legacy Drizzle <code>v1 relations()</code> hallucinations by enforcing <code>v2 defineRelations</code> syntax and object-based relational <code>where</code> filters.</td>
    </tr>
  </tbody>
</table>

---

## By Category

### 🧠 Local Models

<table width="100%">
  <thead>
    <tr>
      <th align="left" width="22%">Name</th>
      <th align="left" width="27%">Type</th>
      <th align="center" width="10%">Quality</th>
      <th align="center" width="11%">Need</th>
      <th align="center" width="16%">Status</th>
      <th align="center" width="14%">Date</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="reviews/en/local-models/kimi-k3-in-c.md"><strong><code>kimi-k3-in-c</code></strong></a></td>
      <td>C99 CLI Engine (<code>2.78T</code> MoE)</td>
      <td align="center"><strong>8.5/10</strong></td>
      <td align="center"><strong>1.0/10</strong></td>
      <td align="center"><code>⛔&nbsp;Rejected</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000"><strong>Purpose:</strong> C99 experiment streaming the <code>2.78T</code> (<code>~104B</code> active) <code>Kimi K3</code> MoE model straight off NVMe storage without a GPU. <strong>Works for coding?</strong> The base <code>Kimi K3</code> model is a strong coder/reasoner, <strong>but this disk-streaming engine is unusable for coding</strong> (<code>1 token = ~24–33s</code>, <code>500</code> tokens = <code>~3.5h</code> + <code>~50 TB</code> SSD reads). <strong>Specs:</strong> Min: <code>GPU: 0, RAM: 8–16 GB, SSD: ≥1.8 TB NVMe</code>; Smooth: <code>16× H200 (~2.25 TB VRAM)</code>. <strong>If a local coder is needed:</strong> <code>Ollama</code> / <code>MLX</code> (<code>Qwen3-Coder</code>, <code>30–65 tok/s</code> in <code>32–64 GB</code> Mac RAM). 📊 <a href="https://github.com/FareedKhan-dev/kimi-k3-in-c">GitHub Benchmark</a> · <a href="https://artificialanalysis.ai/leaderboards/models">Artificial Analysis</a></td>
    </tr>
    <tr>
      <td><a href="reviews/en/local-models/minimax-m3-1-flash.md"><strong><code>MiniMax-M3.1-Flash</code></strong> <em>(Local)</em></a></td>
      <td>Open-Weight <code>428B</code> MoE (<code>~23B</code> active)</td>
      <td align="center"><strong>8.0/10</strong></td>
      <td align="center"><strong>1.0/10</strong></td>
      <td align="center"><code>⛔&nbsp;Rejected</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000"><strong>Purpose:</strong> Fast multimodal (<code>text + image + video</code>, <code>1M</code> context) model built for chat, <code>OCR</code>/vision/video analysis, and office automation (<code>Automation-Bench: 62.8%</code>). <strong>Works for coding?</strong> Handles simple scripts and UI/automation tasks, but is not a frontier repo coder (<code>Terminal-Bench 4.0: 38.1%</code>). <strong>Specs:</strong> <code>~250–285 GB</code> weights do not fit normal workstations (<code>Min: 512 GB Mac Studio</code>, smooth: <code>8× H100 / 640 GB VRAM</code>). <strong>Alternatives:</strong> Local <code>Ollama</code> / <code>MLX</code> (<code>Qwen3-Coder</code>); or use this model via <a href="reviews/en/external-apis/minimax-m3-1-flash-api.md">🔌 <code>MiniMax M3.1 Flash API</code></a>. 📊 <a href="https://huggingface.co/MiniMaxAI/MiniMax-M3.1-Flash">HuggingFace</a> · <a href="https://openrouter.ai/minimax/minimax-m3.1-flash">OpenRouter Stats</a></td>
    </tr>
  </tbody>
</table>

### 🔌 External APIs

<table width="100%">
  <thead>
    <tr>
      <th align="left" width="22%">Name</th>
      <th align="left" width="27%">Type</th>
      <th align="center" width="10%">Quality</th>
      <th align="center" width="11%">Need</th>
      <th align="center" width="16%">Status</th>
      <th align="center" width="14%">Date</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="reviews/en/external-apis/minimax-m3-1-flash-api.md"><strong><code>MiniMax M3.1 Flash API</code></strong></a></td>
      <td>Cloud Multimodal API (<code>MiniMax</code> / <code>OpenRouter</code>)</td>
      <td align="center"><strong>8.0/10</strong></td>
      <td align="center"><strong>5.0/10</strong></td>
      <td align="center"><code>👍&nbsp;Good&nbsp;Option</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000"><strong>Purpose:</strong> Ultra-low-cost (<code>$0.15 / $0.60</code>, <code>Cached: $0.015</code>), high-speed (<code>170+ tok/s</code>, <code>1M</code> context) multimodal API for high-volume product backend bots, translation, <code>OCR</code>/image/video analysis, and SaaS automation. <strong>Works for coding?</strong> Works for simple scripts and helper automation, not complex multi-file repository architecture (<code>Terminal-Bench 4.0: 38.1%</code>). <em>(Use paid Zero-Retention API keys only; never send private code to <code>:free</code> tiers).</em> 📊 <a href="https://openrouter.ai/minimax/minimax-m3.1-flash">OpenRouter Stats</a> · <a href="https://huggingface.co/MiniMaxAI/MiniMax-M3.1-Flash">HuggingFace Benchmarks</a> · <a href="https://artificialanalysis.ai/leaderboards/models">Artificial Analysis</a></td>
    </tr>
  </tbody>
</table>

### 🌐 Web

<table width="100%">
  <thead>
    <tr>
      <th align="left" width="22%">Name</th>
      <th align="left" width="27%">Type</th>
      <th align="center" width="10%">Quality</th>
      <th align="center" width="11%">Need</th>
      <th align="center" width="16%">Status</th>
      <th align="center" width="14%">Date</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="reviews/en/web/taste-skill.md"><strong><code>taste-skill</code> v2.5</strong></a></td>
      <td>Landing Kit + Hook</td>
      <td align="center"><strong>8.0/10</strong></td>
      <td align="center"><strong>4.0/10</strong></td>
      <td align="center"><code>👍&nbsp;Good&nbsp;Option</code></td>
      <td align="center"><code>2026&#8209;11&#8209;15</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Strong for greenfield promo/landing sites; if installed, its 600s <code>Stop</code> hook must be stripped and scoped strictly to <code>-p</code>.</td>
    </tr>
    <tr>
      <td><a href="reviews/en/web/vercel-ui-sdk.md"><strong><code>vercel-labs/ui</code></strong></a></td>
      <td><code>@ui-sdk/*</code> Library + Skill (<code>Beta</code>)</td>
      <td align="center"><strong>8.0/10</strong></td>
      <td align="center"><strong>2.0/10</strong></td>
      <td align="center"><code>⛔&nbsp;Rejected</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Vercel Labs' Public Beta headless UI primitives and <code>ui-sdk</code> skill: its <em>"screenshot-free 2x faster agent control"</em> (<code>createAgent</code>) works strictly on apps rewritten in <code>@ui-sdk/*</code> (blind to plain <code>&lt;button&gt;</code>/<code>&lt;input&gt;</code> and <code>Shadcn</code>/<code>Radix</code>, no <code>Expo</code> support). <strong>Instead use:</strong> our existing UI stack + <a href="reviews/en/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a> + <a href="reviews/en/developer-tools/agent-desktop.md"><strong><code>agent-desktop</code></strong></a>.</td>
    </tr>
  </tbody>
</table>

### 📱 Mobile

<table width="100%">
  <thead>
    <tr>
      <th align="left" width="22%">Name</th>
      <th align="left" width="27%">Type</th>
      <th align="center" width="10%">Quality</th>
      <th align="center" width="11%">Need</th>
      <th align="center" width="16%">Status</th>
      <th align="center" width="14%">Date</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="reviews/en/mobile/swiftui-agent-skill.md"><strong><code>swiftui-agent-skill</code></strong></a></td>
      <td>Skill (<code>twostraws</code> / <code>AvdLee</code> / <code>apple-design</code>)</td>
      <td align="center"><strong>8.5/10</strong></td>
      <td align="center"><strong>3.0/10</strong></td>
      <td align="center"><code>👍&nbsp;Good&nbsp;Option</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Idiomatic SwiftUI &amp; Apple HIG rules; since our primary stack is Expo / React Native, reserve strictly for <code>-p</code> project installs on pure SwiftUI targets (Widgets / Live Activities). <strong>Instead use:</strong> <a href="reviews/en/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a> (<code>reference/ios.md</code>) + <a href="reviews/en/mobile/animate-expo.md"><strong><code>animate-expo</code></strong></a>.</td>
    </tr>
    <tr>
      <td><a href="reviews/en/mobile/artemis.md"><strong><code>ARTEMIS</code></strong></a></td>
      <td>Python CLI / SDK + MCP (<code>google/artemis</code>)</td>
      <td align="center"><strong>8.5/10</strong></td>
      <td align="center"><strong>2.5/10</strong></td>
      <td align="center"><code>👍&nbsp;Good&nbsp;Option</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Google's autonomous Android QA engine (strong OCR + pixel vision on custom <code>Canvas</code>/game screens), but <strong>paid at runtime</strong> (requires a separate billed per-token LLM API key in <code>.env</code>), Android-only (no <code>iOS</code>/<code>tvOS</code>), and <code>3–40s/step</code>. <strong>Instead use:</strong> <a href="reviews/en/mobile/agent-device.md"><strong><code>agent-device</code></strong></a> (<code>$0</code> extra API cost, <code>iOS + Android + TV</code>, <code>197–888 ms</code>).</td>
    </tr>
    <tr>
      <td><a href="reviews/en/mobile/mobile-mcp.md"><strong><code>mobile-mcp</code></strong></a></td>
      <td>MCP Server (34 tools)</td>
      <td align="center"><strong>7.0/10</strong></td>
      <td align="center"><strong>2.0/10</strong></td>
      <td align="center"><code>⛔&nbsp;Rejected</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Benchmarked live and rejected: <code>~7,580</code> tokens of permanent MCP schema bloat per turn, <code>6.5x–37x</code> slower than <code>agent-device</code> (<code>7.3s</code> iOS, <code>5.8s</code> Android), <code>Scarf</code> + <code>PostHog</code> telemetry, and <code>mobilenext.ai</code> cloud upsell tools. <strong>Instead use:</strong> <a href="reviews/en/mobile/agent-device.md"><strong><code>agent-device</code></strong></a> + <a href="reviews/en/mobile/adb.md"><strong><code>adb</code></strong></a>.</td>
    </tr>
  </tbody>
</table>

### 🎨 UI/UX

<table width="100%">
  <thead>
    <tr>
      <th align="left" width="22%">Name</th>
      <th align="left" width="27%">Type</th>
      <th align="center" width="10%">Quality</th>
      <th align="center" width="11%">Need</th>
      <th align="center" width="16%">Status</th>
      <th align="center" width="14%">Date</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="reviews/en/ui-ux/animate.md"><strong><code>animate</code></strong></a></td>
      <td>Skill (2 files)</td>
      <td align="center"><strong>8.5/10</strong></td>
      <td align="center"><strong>3.0/10</strong></td>
      <td align="center"><code>⛔&nbsp;Rejected</code></td>
      <td align="center"><code>2026&#8209;11&#8209;15</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Emil Kowalski's web animation skill; auto-triggers and rules collide with our existing stack. <strong>Instead use:</strong> <a href="reviews/en/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a> (<code>animate</code>) + <a href="reviews/en/mobile/animate-expo.md"><strong><code>animate-expo</code></strong></a>.</td>
    </tr>
    <tr>
      <td><a href="reviews/en/ui-ux/unslop.md"><strong><code>unslop</code></strong></a></td>
      <td>Skill + Playwright scripts</td>
      <td align="center"><strong>8.5/10</strong></td>
      <td align="center"><strong>2.5/10</strong></td>
      <td align="center"><code>⛔&nbsp;Rejected</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000"><code>@heydamir</code>'s 9-pass cleanup skill for AI/vibecoded web UIs (<code>CC-BY-4.0</code>); Web-only and collides on auto-triggers. <strong>Instead use:</strong> <a href="reviews/en/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a> (<code>craft-floor</code> + <code>polish</code> / <code>quieter</code> / <code>clarify</code>).</td>
    </tr>
    <tr>
      <td><a href="reviews/en/ui-ux/break-ui.md"><strong><code>break-ui</code></strong></a></td>
      <td>Skill (2 files)</td>
      <td align="center"><strong>8.0/10</strong></td>
      <td align="center"><strong>3.0/10</strong></td>
      <td align="center"><code>⛔&nbsp;Rejected</code></td>
      <td align="center"><code>2026&#8209;11&#8209;15</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Worst-case data stress-tester; injects temporary fixtures/toggles into the repo and stops without fixing. <strong>Instead use:</strong> <a href="reviews/en/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a> (<code>harden</code>).</td>
    </tr>
    <tr>
      <td><a href="reviews/en/ui-ux/make-interfaces-feel-better.md"><strong><code>make-interfaces-feel-better</code></strong></a></td>
      <td>Skill (6 files)</td>
      <td align="center"><strong>7.5/10</strong></td>
      <td align="center"><strong>2.5/10</strong></td>
      <td align="center"><code>⛔&nbsp;Rejected</code></td>
      <td align="center"><code>2026&#8209;10&#8209;31 → 2026&#8209;11&#8209;15</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Tested and removed due to auto-trigger overlap and bloated 4-table reports. <strong>Instead use:</strong> <a href="reviews/en/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a> + <a href="reviews/en/mobile/animate-expo.md"><strong><code>animate-expo</code></strong></a>.</td>
    </tr>
    <tr>
      <td><a href="reviews/en/ui-ux/ui-ux-pro-max.md"><strong><code>ui-ux-pro-max</code></strong></a></td>
      <td>Skill + CSV/Python</td>
      <td align="center"><strong>7.0/10</strong></td>
      <td align="center"><strong>3.5/10</strong></td>
      <td align="center"><code>⛔&nbsp;Rejected</code></td>
      <td align="center"><code>2026&#8209;11&#8209;15</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Weaker than <code>impeccable</code> and collides with its auto-trigger. <strong>Instead use:</strong> <a href="reviews/en/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a>.</td>
    </tr>
  </tbody>
</table>

### 🏗️ Architecture & Review

<table width="100%">
  <thead>
    <tr>
      <th align="left" width="22%">Name</th>
      <th align="left" width="27%">Type</th>
      <th align="center" width="10%">Quality</th>
      <th align="center" width="11%">Need</th>
      <th align="center" width="16%">Status</th>
      <th align="center" width="14%">Date</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="reviews/en/architecture/addy-agent-skills.md"><strong><code>addy-agent-skills</code></strong></a></td>
      <td>Plugin (25 skills + 9 commands)</td>
      <td align="center"><strong>8.0/10</strong></td>
      <td align="center"><strong>2.5/10</strong></td>
      <td align="center"><code>⛔&nbsp;Rejected</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Addy Osmani's full SDLC pipeline (<code>/spec -&gt; /ship</code>); mandatory TDD and <code>doubt-driven</code> escalation pauses add unnecessary loops. <strong>Instead use:</strong> <a href="reviews/en/architecture/grill-me.md"><strong><code>grill-me</code></strong></a> + <a href="reviews/en/architecture/ponytail.md"><strong><code>ponytail</code></strong></a> + <a href="reviews/en/architecture/elephant-goldfish-model.md"><strong><code>elephant-goldfish-model</code></strong></a>.</td>
    </tr>
    <tr>
      <td><a href="reviews/en/architecture/agency-agents.md"><strong><code>agency-agents</code></strong></a></td>
      <td>283 persona prompts + installer</td>
      <td align="center"><strong>6.5/10</strong></td>
      <td align="center"><strong>2.5/10</strong></td>
      <td align="center"><code>⛔&nbsp;Rejected</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">283 <code>.md</code> roleplay prompts across 18 divisions (<code>~18.5K</code>-token frontmatter bloat and leftover copy-paste rules). <strong>Instead use:</strong> <a href="reviews/en/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a>, <a href="reviews/en/architecture/ponytail.md"><strong><code>ponytail</code></strong></a>, <a href="reviews/en/architecture/elephant-goldfish-model.md"><strong><code>elephant-goldfish-model</code></strong></a>, <a href="reviews/en/mobile/cross-platform-qa.md"><strong><code>cross-platform-qa</code></strong></a>.</td>
    </tr>
    <tr>
      <td><a href="reviews/en/architecture/superpowers.md"><strong><code>superpowers</code></strong></a></td>
      <td>Plugin (14 skills + hook)</td>
      <td align="center"><strong>6.5/10</strong></td>
      <td align="center"><strong>2.0/10</strong></td>
      <td align="center"><code>⛔&nbsp;Rejected</code></td>
      <td align="center"><code>2026&#8209;04&#8209;04 → 2026&#8209;09&#8209;01</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Tested and removed: causes overthinking (<code>SessionStart</code> hook), noisy <code>brainstorming</code> questions (replaced by <code>grill-me</code>), slow subagent loops, and mandatory TDD that doubles work across Web/Mobile/Backend.</td>
    </tr>
  </tbody>
</table>

### ⚙️ Backend

<table width="100%">
  <thead>
    <tr>
      <th align="left" width="22%">Name</th>
      <th align="left" width="27%">Type</th>
      <th align="center" width="10%">Quality</th>
      <th align="center" width="11%">Need</th>
      <th align="center" width="16%">Status</th>
      <th align="center" width="14%">Date</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="reviews/en/backend/opentelemetry.md"><strong><code>opentelemetry</code></strong></a></td>
      <td>Standard + Collector (<code>SigNoz</code> / <code>Grafana</code>)</td>
      <td align="center"><strong>9.0/10</strong></td>
      <td align="center"><strong>4.0/10</strong></td>
      <td align="center"><code>👍&nbsp;Good&nbsp;Option</code></td>
      <td align="center"><code>2026&#8209;11&#8209;15</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Industry standard for cross-service <code>Traces + Metrics + Logs</code> and host/DB telemetry (requires <code>Collector + SigNoz/Grafana</code>). <strong>Instead use:</strong> <a href="reviews/en/backend/sentry.md"><strong><code>sentry</code></strong></a> (covers errors, replays, and baseline traces in one stack).</td>
    </tr>
    <tr>
      <td><a href="reviews/en/backend/shannon.md"><strong><code>Shannon</code></strong></a></td>
      <td>Standalone CLI + <a href="skills/hacker-test/SKILL.md"><code>hacker-test</code></a></td>
      <td align="center"><strong>8.5/10</strong></td>
      <td align="center"><strong>6.5/10</strong></td>
      <td align="center"><code>👍&nbsp;Good&nbsp;Option</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Autonomous White-Box AI pentester (Auth bypass, IDOR, Injection, XSS, SSRF). Instead of installing its heavy plugin, we trigger <code>npx</code> on demand via our lightweight <a href="skills/hacker-test/SKILL.md"><code>hacker-test</code></a> skill strictly on local/staging (never production).</td>
    </tr>
  </tbody>
</table>

### 🛠️ Developer Tools & Memory

<table width="100%">
  <thead>
    <tr>
      <th align="left" width="22%">Name</th>
      <th align="left" width="27%">Type</th>
      <th align="center" width="10%">Quality</th>
      <th align="center" width="11%">Need</th>
      <th align="center" width="16%">Status</th>
      <th align="center" width="14%">Date</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="reviews/en/developer-tools/skillspector.md"><strong><code>SkillSpector</code></strong></a></td>
      <td>Python CLI + MCP + Skill</td>
      <td align="center"><strong>9.0/10</strong></td>
      <td align="center"><strong>3.5/10</strong></td>
      <td align="center"><code>⛔&nbsp;Rejected</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">NVIDIA's AI skill &amp; MCP security scanner (<code>AST + YARA + OSV + LLM</code>). Not installed to avoid an extra daily loop — <strong>Instead use:</strong> <a href="reviews/en/developer-tools/skillshare.md"><strong><code>skillshare</code></strong></a> (<code>skillshare audit</code> skill-check) + <strong>direct AI agent source-code inspection</strong>.</td>
    </tr>
    <tr>
      <td><a href="reviews/en/developer-tools/caveman.md"><strong><code>caveman</code></strong></a></td>
      <td>Skill <em>(+ optional CLI/Proxy)</em></td>
      <td align="center"><strong>8.0/10</strong></td>
      <td align="center"><strong>3.5/10</strong></td>
      <td align="center"><code>👍&nbsp;Good&nbsp;Option</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000"><code>ASD-STE100</code>-based terse terminal response skill (<code>SKILL.md</code>); if used, take only the sanitized standalone <code>SKILL.md</code> (<code>disable-model-invocation: true</code>) without <code>@caveman-ai/cli</code> telemetry or <code>plugin.json</code> hooks. <strong>Instead use:</strong> <a href="reviews/en/architecture/ponytail.md"><strong><code>ponytail</code></strong></a> (cuts both reply prose and over-engineered code/diffs).</td>
    </tr>
    <tr>
      <td><a href="reviews/en/developer-tools/humanizer-stop-slop.md"><strong><code>humanizer</code> + <code>stop-slop</code></strong></a></td>
      <td>Skill (<code>Markdown</code>)</td>
      <td align="center"><strong>7.5/10</strong></td>
      <td align="center"><strong>2.0/10</strong></td>
      <td align="center"><code>⛔&nbsp;Rejected</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Long-form prose editors that strip AI writing clichés (<code>humanizer</code> is <code>~32 KB</code>); not built for code or product UI. <strong>Instead use:</strong> <a href="reviews/en/architecture/ponytail.md"><strong><code>ponytail</code></strong></a> + <a href="reviews/en/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a> (<code>clarify</code>).</td>
    </tr>
    <tr>
      <td><a href="reviews/en/developer-tools/claude-code-setup.md"><strong><code>claude-code-setup</code></strong></a></td>
      <td>Plugin (Recommender Skill)</td>
      <td align="center"><strong>7.5/10</strong></td>
      <td align="center"><strong>2.0/10</strong></td>
      <td align="center"><code>⛔&nbsp;Rejected</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Anthropic's read-only onboarding recommender for starter <code>CLAUDE.md</code> rules, hooks, and MCP servers. <strong>Instead use:</strong> <a href="reviews/en/developer-tools/skillshare.md"><strong><code>skillshare</code></strong></a>.</td>
    </tr>
    <tr>
      <td><a href="reviews/en/developer-tools/omniroute.md"><strong><code>OmniRoute</code></strong></a></td>
      <td>Local Proxy + 44 Admin Skills</td>
      <td align="center"><strong>7.5/10</strong></td>
      <td align="center"><strong>2.0/10</strong></td>
      <td align="center"><code>⛔&nbsp;Rejected</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Local LLM reverse-proxy (<code>localhost:20128</code>); its 44 bundled skills are proxy admin manuals, default routing breaks long sessions (<code>#7287</code>) and silently downgrades models, and <code>wreq-js</code> TLS-stealth carries subscription ToS ban risk. <strong>Instead use:</strong> <a href="reviews/en/developer-tools/t3-code.md"><strong><code>T3 Code</code></strong></a> + <a href="reviews/en/architecture/ponytail.md"><strong><code>ponytail</code></strong></a>.</td>
    </tr>
  </tbody>
</table>

---

<details>
<summary>Install global <code>tasted-skills</code>, <code>hacker-test</code>, and <code>asset-diet</code> skills</summary>

```bash
skillshare install TursunboyevJahongir/tasted-skills -s tasted-skills -s hacker-test -s asset-diet -g && skillshare sync -g
```

</details>

