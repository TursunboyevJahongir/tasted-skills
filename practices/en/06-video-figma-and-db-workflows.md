# 6. Video Analysis (`watch`), Two-Way Figma Bridge (`figma`) & Non-Obvious Capabilities

[🇺🇿 O'zbekcha](../06-video-figma-and-db-workflows.md) | **🇬🇧 English** | [🇷🇺 Русский](../ru/06-video-figma-and-db-workflows.md)

⬅️ [Back to Practices Table of Contents](README.md)

- **Combined Tools:** `watch` (`video-analyzer`) + `figma` (`figma-implement-design`, `figma-generate-design`, `figma-use`) + [**`agent-desktop`**](../../reviews/en/developer-tools/agent-desktop.md) (`agent-desktop-ffi`) + [**`graphify`**](../../reviews/en/architecture/graphify.md) + `drizzle-relations-v2`
- **Target Tasks:** Video bug-report triage, motion/UI cloning from screen recordings, two-way Code <-> Figma sync, and high-speed desktop automation.

---

## 1. `watch` (`video-analyzer`) — Far More Than YouTube Summaries (3 Power Uses)

Because `watch` combines **audio transcription (`Whisper`/subtitles) + `ffmpeg` scene-change frame extraction**, it unlocks three high-leverage engineering workflows:

### 1) Triage QA & Customer Bug-Report Screen Recordings (`.mp4`/`.mov`)
When a tester or user sends a screen recording saying *"the app broke here"*:
- `watch` extracts every scene-change frame (`frames-selected/`) with exact timestamps (`scene_index.csv`), pinpointing the exact second, screen state, and toast/error text before handing off to `diagnosing-bugs` + `sentry`.

### 2) Clone Reference App Animations & Flows 1:1 (`watch` + `impeccable` + `animate-expo`)
To recreate a polished transition or onboarding flow from a reference recording:
- Run `watch` at a dense frame rate (`5fps`) to extract the motion sequence;
- Feed the extracted frames into [**`impeccable`**](../../reviews/en/ui-ux/impeccable.md) and [**`animate-expo`**](../../reviews/en/mobile/animate-expo.md) to translate the timing/spring physics directly into `Reanimated` UI-thread code.

### 3) Fact-Check Hype Demo Videos (`watch` + `tasted-skills`)
When auditing viral tool reels or tutorials with [`tasted-skills`](../../skills/tasted-skills/SKILL.md):
- `watch` catches split-second on-screen disclaimers (`SELF-REPORTED`), paid `.env` API keys, and sped-up terminal cuts that the voiceover never mentions.

---

## 2. The `figma` Skill Suite — A Two-Way Bridge (`Figma ↔ Code`)

Our 5 installed Figma skills (`figma`, `figma-implement-design`, `figma-generate-design`, `figma-generate-library`, `figma-use`) work **in both directions**:

1. **Figma -> Production Code (`figma-implement-design` + `impeccable` + `asset-diet`):**
   - Reads node tokens, auto-layout, and variables (not just screenshots) for 1:1 implementation, then compresses exported assets locally via `asset-diet`.
2. **Production Code -> Figma Screens (`figma-generate-design` + `figma-use`):**
   - Built a screen directly in code without a Figma mockup? Your agent can read the live page/component code and assemble editable, token-bound auto-layout screens inside Figma section by section.
3. **Codebase -> Figma Design System (`figma-generate-library` + `figma-use`):**
   - Extracts CSS/Tailwind or React Native tokens from your repo to build Figma Variables (`Light/Dark` modes) and component variants automatically.

---

## 3. Non-Obvious Capabilities in `agent-desktop`, `graphify` & `drizzle-relations-v2`

### A. `agent-desktop` — Beyond Google Chrome
- **Drive any macOS app in the background:** Controls Postman, Docker Desktop, Finder, Terminal, Telegram Desktop, system sheets/popovers/menus (`Notification Center`, `Menu Bar`), and Electron apps (`launch --cdp`) without moving the cursor.
- **`agent-desktop-ffi` (Direct C-ABI Binding):** When building custom automation in Python (`ctypes`), Go (`cgo`), Node, or Swift, link `libagent_desktop_ffi.dylib` directly (`ad_snapshot` -> `ad_execute_by_ref`) instead of spawning a CLI subprocess per action.

### B. `graphify` — Beyond Source Code
- Drop **PDF specs, Markdown docs, architecture diagrams (images), and recorded meetings** alongside your code: `graphify` links them into the same unified knowledge graph (`graph.json` + Obsidian Vault / Neo4j / interactive HTML).

### C. `drizzle-relations-v2` — Zero-Mistake Drizzle v2 Queries
- Prevents LLMs from generating deprecated Drizzle ORM `v1` relational syntax, enforcing clean `v2` `defineRelations` and filter patterns automatically.
