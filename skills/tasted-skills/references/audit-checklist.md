# Security, Sanitization & Quality Audit Checklist

Run every candidate AI skill, plugin, MCP server, CLI, or memory/automation tool through these five gates before recommending installation.

## 1. Hype vs. Actual Mechanism

- Read the actual implementation files (`SKILL.md`, `plugin.json`, `.claude-plugin/`, `.codex-plugin/`, scripts, MCP schema, CLI entrypoints), not just `README.md` badges or social/video demos.
- Identify what physically executes:
  - Pure Markdown guidance?
  - Local helper scripts (Python, Node, Bash) and static datasets?
  - Subagent fan-out (`invoke_subagent`, `Agent`, `spawn_agent`)?
  - Persistent daemon, browser/desktop bridge, or external SaaS API?
- Measure context & quota cost: line count loaded per turn, extra CLI calls per task, and number of spawned subagents.

## 2. Security & Sanitization ("What to Strip Before Installing")

Check every file in the candidate package and list exact lines/files to strip or rewrite if installed:

1. **Lifecycle Hooks (`hooks:` in frontmatter or plugin config):**
   - Inspect `Stop`, `PreToolUse`, `PostToolUse`, `UserPromptSubmit`, and `SessionStart` hooks.
   - Flag long timeouts, turn-blocking gates, or commands that run automatically outside target projects. Strip `hooks:` before global installation unless explicitly desired.
2. **Executable Scripts & Binaries:**
   - Check `scripts/`, `install.sh`, `postinstall`, and prebuilt binaries.
   - Flag remote code download/execution, unpinned `npx`/`uvx` fetches, filesystem writes outside the workspace, or credential/env reads (`process.env`, `os.environ`, `~/.ssh`, keychain, browser profiles).
3. **Network, Telemetry & Commercial Bloat:**
   - Flag analytics pings, sponsor banners, freemium upsell prompts, or external API calls that could leak code/prompts.
4. **Prompt & Trigger Hygiene:**
   - **Overbroad `description:` frontmatter:** If a specialized tool claims "use whenever building or reviewing any UI/code", narrow its `description` or set `disable-model-invocation: true` so it does not hijack unrelated tasks.
   - **Forced greeting / persona hijack:** Strip rules like *"When first invoked without a question, respond only with..."* if they interfere with normal task execution.
   - **Single-agent path variables:** Check for Claude-only `CLAUDE_PLUGIN_ROOT` references or single-agent paths that fail in Codex or Antigravity; note portable replacements.

## 3. Overlap & Conflict Check

Compare against already-installed skills and tools:
- **Complementary (Gap filler):** Solves a distinct layer no current skill covers -> strong candidate.
- **Redundant:** Duplicates an installed skill of equal or higher quality -> skip to save context budget.
- **Conflicting:** Shares the same auto-trigger domain as an installed skill while prescribing opposite workflows, file layouts (for example competing `DESIGN.md` vs `MASTER.md`), or styling systems -> reject global install (`-g`); allow at most isolated project scope (`-p`) if uniquely useful.

## 4. Scope Classification

Pick the narrowest scope that delivers the value:
- **Global Skill (`-g`):** Safe, lightweight, conflict-free, broadly useful across projects.
- **Full Plugin:** Multi-component bundle (`skills/` + `agents/` + `resources/`) where copying `SKILL.md` alone would break runtime references; prefer `disable-model-invocation: true` for heavy workflows.
- **Project-Only (`-p`):** Opinionated kits, starter generators, or domain-specific workflows meant for one repository.
- **Standalone CLI / MCP / App:** External developer tool (memory store, desktop/browser driver) configured on demand.
- **Skip / Reject:** Fails quality, security, or conflict checks.

## 5. Status Labels (Used in `README*.md` and Review Logs)

- `✅ Ishlatyapman` (`✅ Using` / `✅ Использую`) — Tested and actively used daily (top essentials go in `⭐ Eng keraklilari`).
- `👍 Yaxshi variant` (`👍 Good Option` / `👍 Хороший вариант`) — Vetted and worth using when the right task/project arises (on-demand CLI or `-p` project scope).
- `⛔ Rad etildi` (`⛔ Rejected` / `⛔ Отклонено`) — Not needed (covered by a stronger active tool), conflicting, bloated, or unsafe.
