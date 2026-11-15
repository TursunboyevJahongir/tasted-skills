# `agency-agents` (The Agency — 283 Persona Prompts)

[🇺🇿 O'zbekcha](../../architecture/agency-agents.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/architecture/agency-agents.md)

- **Source:** [msitarzewski/agency-agents](https://github.com/msitarzewski/agency-agents)
- **Category:** `Architecture` *(Multi-role persona prompt collection: Engineering, Design, QA, Security, Marketing, etc.)*
- **Type:** `Agent / Skill Collection` *(18 divisions, 283 Markdown files + `convert.sh` / `install.sh`)*
- **Quality Score:** **6.5 / 10**
- **Relevance to Us:** **2.5 / 10**
- **Recommended Scope:** `Do Not Install` *(global install severely bloats context)*
- **Used Instead:** [**`impeccable`**](../ui-ux/impeccable.md) + [**`ponytail`**](ponytail.md) + [**`karpathy-guidelines`**](karpathy-guidelines.md) + [**`elephant-goldfish-model`**](elephant-goldfish-model.md) + [**`cross-platform-qa`**](../mobile/cross-platform-qa.md)
- **Reviewed Date:** `2026-11-16`
- **Current Status:** `⛔ Rejected` *(not needed — our existing focused skills are much cleaner and stronger)*

---

## 1. What It Is & How It Works

Marketed as *"a complete AI agency at your fingertips"*, this repository contains **no subagent orchestrator, MCP server, or verification runtime**.

What actually ships inside:
- **`283` pure Markdown persona-prompt files across 18 divisions (`divisions.json`:** `engineering`, `design`, `testing`, `security`, `gis`, `marketing`, `product`, `game-development`, `specialized`, etc.**)** totaling `~3.98 MB` (averaging `14.1 KB` / ~250 lines per file).
- **`scripts/convert.sh` and `scripts/install.sh`:** Shell converters that repackage those 283 `.md` files into 17 tool formats (`Claude Code` `~/.claude/agents/`, `Codex` `~/.codex/agents/*.toml`, `Antigravity` `~/.gemini/config/skills/agency-*/SKILL.md`, `Cursor`, `ZCode`, etc.).

---

## 2. Strengths & Weaknesses

### Strengths
- Clean, well-tested Bash installer (`--division`, `--agent`, `--dry-run`) with zero hidden hooks or telemetry (`MIT` license).
- A handful of narrow specialist prompts contain genuinely solid checklists (for example: `security-ai-generated-code-auditor.md` covering `NEXT_PUBLIC_` secret leaks, fake `RLS USING (true)` policies, and LLM prompt-injection sinks; `gis-web-gis-developer.md` covering `MapLibre` and vector tiles).

### Weaknesses & Why We Don't Need It
1. **Severe Context Bloat (`~18,500 tokens` of permanent overhead):**
   Measuring the `name + description` frontmatter alone across all 283 agents totals **`72.3 KB` (`~18,504 tokens`)**. Installing the full roster burns `~18.5K` tokens on every single turn before doing any work and confuses skill routing.
2. **85% Generic Roleplay Boilerplate and Leftover Copy-Paste Artifacts:**
   - Most files follow a repetitive *"🧠 Your Identity & Memory: You remember..."* roleplay wrapper padded with textbook snippets and verbose Markdown report templates.
   - Several core engineering/QA agents contain hardcoded leftovers from unrelated projects:
     - `Frontend Developer` unexpectedly mandates building VS Code editor extensions (*"Build editor extensions with openAt, reveal, peek"*);
     - `UI Designer` teaches the `transition: all` CSS anti-pattern;
     - `Senior Developer` is hardcoded around `Laravel/Livewire`;
     - `Reality Checker` mandates running a nonexistent `./qa-playwright-capture.sh http://localhost:8000` script and checking `*.blade.php` views (`"NEVER SKIP"`).
3. **Auto-Trigger Collisions & Bypassing `skillshare`:**
   - `convert.sh` omits `disable-model-invocation: true` and writes directly into `~/.gemini/config/skills/`, bypassing [`skillshare`](../developer-tools/skillshare.md) and colliding head-on with our core UI and engineering skills on every prompt.

---

## 3. Security & Sanitization

- **Risk Level:** `Low` *(no malicious scripts, network calls, or `Stop` hooks, though context bloat and auto-trigger noise are high)*
- Even if adapting a single niche checklist in the future, never run `install.sh` globally — strip the persona roleplay (`Identity & Memory`) and report templates, add `disable-model-invocation: true`, and manage via [`skillshare`](../developer-tools/skillshare.md).

---

## 4. What We Use Instead

Every core domain in `agency-agents` is already covered much more cleanly by our active toolset:

| Division in `agency-agents` | Our Cleaner, Stronger Replacement |
|---|---|
| `Frontend Developer`, `UI Designer`, `UX Architect` | [**`impeccable`**](../ui-ux/impeccable.md) + [**`mobile-native`**](../mobile/mobile-native.md) + [**`animate-expo`**](../mobile/animate-expo.md) |
| `Minimal Change Engineer` (207 lines + verbose report) | [**`ponytail`**](ponytail.md) + [**`karpathy-guidelines`**](karpathy-guidelines.md) (`2.5–3.5 KB`, zero report bloat) |
| `Software Architect`, `Code Reviewer` | [**`elephant-goldfish-model`**](elephant-goldfish-model.md) (true `fresh-context` Goldfish subagents) + [**`grill-me`**](grill-me.md) |
| `Reality Checker`, `Evidence Collector` | [**`cross-platform-qa`**](../mobile/cross-platform-qa.md) ([`agent-desktop`](../developer-tools/agent-desktop.md) + [`Device Hub`](../mobile/ios-simulator-device-hub.md) + [`adb`](../mobile/adb.md)) |

---

## 5. Best Use Cases

- **When to use:** Do not install — at most browse individual niche files (`security-ai-generated-code-auditor`, etc.) on GitHub as passive reading material.
- **When not to use:** Installing globally (`-g`) via `install.sh`.

---

## 6. Status & Action History

| Date | Action | Status | Notes |
|---|---|---|---|
| 2026-11-16 | Audited all 283 agent files, `convert.sh` / `install.sh`, and context footprint | `⛔ Rejected` | Skipped due to `~18.5K`-token frontmatter bloat, generic roleplay/copy-paste artifacts, and full coverage by our stronger existing skills (`impeccable`, `ponytail`, `elephant-goldfish-model`, `cross-platform-qa`). |
