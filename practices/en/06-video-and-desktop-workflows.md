# 6. Video Analysis (`video-analyzer`) & Desktop/Graph Additional Capabilities

[🇺🇿 O'zbekcha](../06-video-and-desktop-workflows.md) | **🇬🇧 English** | [🇷🇺 Русский](../ru/06-video-and-desktop-workflows.md)

⬅️ [Back to Practices Table of Contents](README.md)

- **Combined Tools:** [**video-analyzer**](https://github.com/bsisduck/video-analyzer-skill) + [**agent-desktop**](../../reviews/en/developer-tools/agent-desktop.md) (`agent-desktop-ffi`) + [**graphify**](../../reviews/en/architecture/graphify.md)
- **Target Tasks:** Frame-by-frame video bug-report triage, motion/UI cloning from screen recordings, fact-checking demo videos, and high-speed desktop & multimodal graph automation.

---

## 1. `video-analyzer` — Far More Than Video Summaries (3 Power Uses)

Because [`video-analyzer`](https://github.com/bsisduck/video-analyzer-skill) combines **audio transcription (`Whisper`) + `ffmpeg` scene-change frame extraction (`3x5` / `4x4` grids)**, it unlocks three high-leverage engineering workflows:

### 1) Triage QA & Customer Bug-Report Screen Recordings (`.mp4`/`.mov`)
When a tester or user sends a screen recording saying *"the app broke here"*:
- `video-analyzer` extracts every scene-change keyframe with exact timestamps, pinpointing the exact second, screen state, and toast/error text before handing off to `diagnosing-bugs` + `sentry`.

### 2) Clone Reference App Animations & Flows 1:1 (`video-analyzer` + `impeccable` + `animate-expo`)
To recreate a polished transition or onboarding flow from a reference recording:
- Run `video-analyzer` at a dense frame rate (`5fps`) to extract the motion sequence;
- Feed the extracted frames into [**impeccable**](../../reviews/en/ui-ux/impeccable.md) and [**animate-expo**](../../reviews/en/mobile/animate-expo.md) to translate the timing/spring physics directly into `Reanimated` UI-thread code.

### 3) Fact-Check Hype Demo Videos (`video-analyzer` + `tasted-skills`)
When auditing viral tool reels or tutorials with [tasted-skills](../../skills/tasted-skills/SKILL.md):
- `video-analyzer` catches split-second on-screen disclaimers (`SELF-REPORTED`), paid `.env` API keys, and sped-up terminal cuts that the voiceover never mentions.

---

## 2. Non-Obvious Capabilities in `agent-desktop` & `graphify`

### A. `agent-desktop` — Beyond Google Chrome
- **Drive any macOS app in the background:** Controls Postman, Docker Desktop, Finder, Terminal, Telegram Desktop, system sheets/popovers/menus (`Notification Center`, `Menu Bar`), and Electron apps (`launch --cdp`) without moving the cursor.
- **`agent-desktop-ffi` (Direct C-ABI Binding):** When building custom automation in Python (`ctypes`), Go (`cgo`), Node, or Swift, link `libagent_desktop_ffi.dylib` directly (`ad_snapshot` -> `ad_execute_by_ref`) instead of spawning a CLI subprocess per action.

### B. `graphify` — Beyond Source Code
- Drop **PDF specs, Markdown docs, architecture diagrams (images), and recorded meetings** alongside your code: `graphify` links them into the same unified knowledge graph (`graph.json` + Obsidian Vault / Neo4j / interactive HTML).
