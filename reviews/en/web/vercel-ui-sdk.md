# `vercel-labs/ui` (`@ui-sdk/*` + `ui-sdk` Skill)

[🇺🇿 O'zbekcha](../../web/vercel-ui-sdk.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/web/vercel-ui-sdk.md)

- **Source:** [vercel-labs/ui](https://github.com/vercel-labs/ui)
- **Category:** `Web` *(Headless UI Behavior Primitives + `WebMCP` Agent Bridge — Public Beta)*
- **Type:** `NPM Framework Library` (`@ui-sdk/*`) + `Skill` (`packages/core/skills/ui-sdk`)
- **Quality Score:** **8.0 / 10** *(clean multi-framework headless behavior architecture)*
- **Need for Us:** **2.0 / 10** *(does not fit our existing React/Shadcn/Radix web and Expo mobile stacks)*
- **Recommended Scope:** `Do Not Install` *(install locally `-p` only if starting a dedicated greenfield `@ui-sdk/*` web app)*
- **Reviewed Date:** `2026-11-16`
- **Current Status:** `⛔ Rejected` *(instead use: our existing UI stack + [**`impeccable`**](../ui-ux/impeccable.md) + [**`agent-desktop`**](../developer-tools/agent-desktop.md))*

---

## 1. What It Is and How It Works (Video Hype vs. Reality)

Social-media clips pitch `vercel-labs/ui` as *"an interactive UI library that lets AI agents read pages and operate controls directly without screenshots — over 2x faster at half the cost."*

**What primary-source inspection (`packages/` and `packages/core/skills/ui-sdk/`) actually shows:**
1. **Not a general browser automation tool — it is a custom NPM component framework (`Apache-2.0`, Public Beta):**
   - `@ui-sdk/core` implements headless UI behaviors (keyboard navigation, focus recovery, selection, popups, drag-and-drop, ARIA via `definePrimitive`), paired with adapters for `@ui-sdk/react`, `@ui-sdk/vue`, `@ui-sdk/svelte`, `@ui-sdk/solid`, and `@ui-sdk/web`.
2. **Hard limitation of "screenshot-free agent control" (`createAgent` / `WebMCP`, `references/agent-ready.md` line 15):**
   - The bridge **only works inside web pages built end-to-end with `@ui-sdk/*` components**!
   - `agent.snapshot()` cannot see plain HTML `<button>`, `<input>`, `<textarea>`, `<select>`, or existing `Radix` / `Shadcn` / `MUI` components (*"These are invisible, so an agent can't fill or press them"*). Adopting it would require rewriting an app's entire UI layer onto `@ui-sdk/*`.
3. **The bundled `ui-sdk` skill (`SKILL.md` + 7 reference files, `~76 KB`):**
   - Purely teaches coding agents how to read `node_modules/@ui-sdk/<framework>/docs/llms.txt` and `docs/core.md` (`300+ KB`) when authoring `@ui-sdk` components.

---

## 2. Strengths and Weaknesses

### Strengths
- Clean cross-framework design: a single `definePrimitive` behavior renders across `React`, `Vue`, `Svelte`, `Solid`, and `Web Components` via `createParts` with built-in RTL and ARIA handling.
- Thoughtful in-app agent safety attributes (`data-agent-confirm`, `data-agent-secret`, `data-agent-hidden`).

### Weaknesses and Cost
- **Zero utility in non-`@ui-sdk` codebases:** Useless in projects that do not install `@ui-sdk/*`, and Web-only (no React Native / Expo support).
- **Public Beta instability:** `README.md` (line 195) explicitly notes that `UI SDK` is governed by the **Vercel Public Beta Agreement** and its APIs and behavior may change before general availability.
- **Legacy contrast rule:** `SKILL.md` (line 45) hardcodes `WCAG 4.5:1` without perceptual `APCA` awareness.

---

## 3. Security & Pre-Install Sanitization

- **Risk Level:** `Low–Medium`
- **Inspected Surface (`skillshare audit` & source code):**
  1. **Blocked at `CRITICAL` by `skillshare audit`:** `references/web-components.md:47` (`root: {`) triggers a static `prompt-injection-1 (SYSTEM: prompt override)` block unless forced.
  2. **External CDN script guidance (`SKILL.md` line 21):** Instructs loading live `https://ui-sdk.dev/web.js` and `web.css` tags on buildless pages (undesirable under strict CSP policies).
  3. No hidden telemetry or lifecycle hooks (`Stop`, `SessionStart`) exist in the repository.

---

## 4. Fit & Compatibility with Our Existing Stack

We do not need either the library or its global skill because both jobs are already covered more broadly in our active stack:
1. **UI components, accessibility & visual craft:** Our established `React` (`Radix` / `Shadcn`) web stack and `Expo` mobile stack paired with [**`impeccable`**](../ui-ux/impeccable.md) (`craft-floor` + `APCA` contrast + keyboard/focus auditing) are production-stable without migrating to a beta SDK.
2. **Fast screenshot-free browser control:** [**`agent-desktop`**](../developer-tools/agent-desktop.md) already drives **any** web app (`<button>`, `<input>`, `Radix`, `Shadcn`, or third-party sites — with zero `@ui-sdk` code changes!) headlessly and without screenshots via macOS Accessibility (`AX`).

---

## 5. When to Use (and When Not To)

- **When to use:** Only as a project-scoped (`-p`) install if building a greenfield experimental web app specifically on `@ui-sdk/*` with an embedded `WebMCP` assistant.
- **When not to use:** Globally (`-g`), on existing `React` / `Radix` / `Shadcn` web repositories, or on any `Expo` / `React Native` mobile project.

---

## 6. Status & Action History

| Date | Action | Status | Notes (where tested, what was sanitized, outcome) |
|---|---|---|---|
| 2026-11-16 | Audited `@githubradar` video claim, `vercel-labs/ui` source (`SKILL.md`, `agent-ready.md`), and `skillshare audit` | `⛔ Rejected` | Rejected because `createAgent` works only on apps rewritten in beta `@ui-sdk/*` parts (blind to standard HTML/Shadcn). Instead use our existing UI stack + `impeccable` + `agent-desktop`. |
