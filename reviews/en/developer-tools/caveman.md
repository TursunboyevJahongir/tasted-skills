# `caveman` (Julius Brussee)

[🇺🇿 O'zbekcha](../../developer-tools/caveman.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/developer-tools/caveman.md)

- **Source:** [JuliusBrussee/caveman](https://github.com/JuliusBrussee/caveman/blob/main/skills/caveman/SKILL.md)
- **Category:** `Developer Tools` *(Terse Output Mode & Token Compression)*
- **Type:** `Skill` *(repo also bundles an optional `CLI / Local Proxy / Cloud Router`)*
- **Quality Score:** **8.0 / 10**
- **Need for Us:** **3.5 / 10** *(both concise replies and minimal code diffs are already covered by our active `ponytail` skill)*
- **Recommended Scope:** `Sanitized standalone SKILL.md only (-p or manual /caveman)` — skip the full plugin/CLI
- **Instead Use (Alternative):** [**`ponytail`**](../architecture/ponytail.md) *(cuts both prose bloat and over-engineered code/diffs)* + [**`karpathy-guidelines`**](../architecture/karpathy-guidelines.md) + [**`T3 Code`**](t3-code.md)
- **Reviewed Date:** `2026-11-16`
- **Current Status:** `👍 Good Option`

---

## 1. What It Is and How It Works

`JuliusBrussee/caveman` (`v4.1.0`, `Apache-2.0`) contains two distinct layers:

1. **Standalone Response Skill (`skills/caveman/SKILL.md`, `89 lines`, `4.68 KB`):** Pure Markdown output-style rules grounded in `ASD-STE100` controlled English (`<=20` words per sentence, active voice). Strips greetings, hedging, recaps, and optional articles (`a/an/the`) while keeping negations (`not/never/no/only`), code blocks, CLI commands, file paths, and exact error strings verbatim. Automatically drops back to plain prose for security warnings, irreversible confirmations, and confused users. Accompanied by sibling skills `ultracave` (stripped grammar fragments) and `megacave` (Classical Chinese — 文言文).
2. **Full `v4.0+` Ecosystem (`@caveman-ai/cli`):** Expanded into `23` skills, `4` lifecycle hooks, a Go/TS local proxy (`Read less` input log compressor, `Blocks`), a `caveman.so` cloud `Auto` model router, and commercial `Caveman Code` / `Caveman Cloud` offerings.

---

## 2. Strengths and Weaknesses

### Strengths
- **Well-engineered brevity guardrails:** Unlike naive "be brief" prompts, it explicitly protects negations, verbatim technical payloads, and safety confirmations (`When to break the rules`), preventing destructive misunderstandings.
- **Unusually honest benchmarks (`docs/HONEST-NUMBERS.md`):** Documents real A/B measurements and failure cases transparently; cuts reading time noticeably in chatty Q&A sessions (`JetBrains` measured `-8.5%` output tokens across 86 coding tasks with no quality loss, `p = 0.82`).

### Weaknesses and Cost (Context / Tokens / Complexity)
- **"Cuts 65% of tokens" headline does not hold for real coding sessions:** As documented in `docs/HONEST-NUMBERS.md`:
  - Against a simple `Answer concisely.` baseline, `caveman` saves **only `3%` median output tokens** (`4,334 -> 4,119`, inside noise) while adding **`~1,160–1,532` input tokens** of rule overhead (`ultracave` cuts `35%`).
  - Across `662` real Claude Code sessions (`#733`), output tokens accounted for **only `0.3%`** of total session tokens (`99.7%` is input context and cache reads, untouched by an output skill), leaving the net bill within **`±0.2%`**; short Q&A (`#145`) can be net-negative, and per-request plans (`#506`) save `0` credits.
- **Multilingual & formatting friction:** Dropping articles/fragments (`Rule 4`) and banning layout tables (`Rule 9: No decorative tables`) degrades readability in inflected languages (`uz`/`ru`) and structured architecture reviews.

---

## 3. Security & Pre-Install Sanitization

- **Risk Level:** `Low` for standalone `SKILL.md`; `Medium–High` for the full Plugin / CLI (`@caveman-ai/cli`).
- **Inspected Surface:**
  - Standalone `skills/caveman/SKILL.md` has zero scripts, hooks, or network calls. `skillshare audit` reported `0 CRITICAL` and `1 HIGH` false positive at `SKILL.md:19` (static regex matched `` `<mode>` `` next to `. Example:` as an encoded-subdomain pattern).
  - `.claude-plugin/plugin.json` registers **4 lifecycle hooks** (`SessionStart`, `SubagentStart`, `UserPromptSubmit` with `30s` timeouts, `SessionEnd` `5s`) running Node scripts (`caveman-activate.js`, `caveman-mode-tracker.js`, `caveman-stats.js`) on every prompt and subagent spawn, hardcoded to `${CLAUDE_PLUGIN_ROOT}`.
  - `@caveman-ai/cli` enables **opt-out telemetry by default** (`SECURITY.md` lines 106–115), sending usage counts and **sender IP address** (retained for `90` days) to a Supabase Edge Function unless `DO_NOT_TRACK=1` is set.
  - Signing into `Auto` routing (`caveman login`) sends the **raw last `128 KiB + 16 KiB + 16 KiB` of prompts/replies** (including `CLAUDE.md`, `@`-mentioned files, and `!` shell output) to `Caveman Cloud` (which may retain Free-tier data to improve routing) and drops Anthropic `thinking` blocks (`drop_block`) on model switches.
- **Parts that must be stripped before installing:**
  1. **Never install** `@caveman-ai/cli`, the local proxy, or `.claude-plugin/plugin.json` hooks — take only `skills/caveman/SKILL.md`.
  2. Add `disable-model-invocation: true` to `SKILL.md` frontmatter and remove broad phrases (`"be brief"`, `"less tokens"`) so it activates only on explicit `/caveman`.
  3. Delete line `19` of `SKILL.md` (`ultracave`/`megacave` alias dispatch + `Caveman mode: <mode>` hook relay) so `skillshare audit` passes with `0 findings`.

---

## 4. Fit & Compatibility with Our Existing Stack (Alternative)

- **Our primary alternative — [**`ponytail`**](../architecture/ponytail.md) (`9.5/10`, `#3` active global essential):**
  - `caveman` only compresses chat prose while leaving generated code untouched.
  - [**`ponytail`**](../architecture/ponytail.md) solves **both halves** at once: concise replies a developer reads in one pass **plus** the smallest working code change (YAGNI), cutting the actual source of token bloat in engineering sessions.
- The repo's extra workflow skills (`surgical-patch`, `lean-build`, `cavecrew`) and `Auto` router are already covered more cleanly by [**`karpathy-guidelines`**](../architecture/karpathy-guidelines.md), [**`elephant-goldfish-model`**](../architecture/elephant-goldfish-model.md), and [**`T3 Code`**](t3-code.md).

---

## 5. When to Use (and When Not To)

- **When to use:** In environments without `ponytail` where you specifically want ultra-terse English terminal replies (`/caveman` or `/ultracave`) — strictly as a sanitized single-file `SKILL.md`.
- **When not to use:** Alongside active `ponytail` sessions, during multilingual (`uz`/`ru`) explanations or table-heavy architecture audits, or as a proxy/cloud-router wrapper over official AI subscriptions.

---

## 6. Status & Action History

| Date | Action | Status | Notes |
|---|---|---|---|
| 2026-11-16 | Primary-source audit of `v4.1.0` (`SKILL.md`, `plugin.json`, `HONEST-NUMBERS.md`, `SECURITY.md`) + `skillshare audit` | `👍 Good Option` | Standalone `SKILL.md` is well-crafted (`8.0/10`), but CLI/proxy telemetry is undesirable and our active [**`ponytail`**](../architecture/ponytail.md) is a stronger daily alternative; kept as a vetted on-demand option. |
