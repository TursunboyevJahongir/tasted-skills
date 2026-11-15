# `unslop` (Damir Sokolovsky — `@heydamir`)

[🇺🇿 O'zbekcha](../../ui-ux/unslop.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/ui-ux/unslop.md)

- **Source:** [heydamir/unslop](https://github.com/heydamir/unslop)
- **Category:** `UI/UX` *(Redline cleanup for AI-generated / vibecoded web interfaces)*
- **Type:** `Skill + Node/Playwright Scripts` *(`SKILL.md`, 6 reference `.md` files, `snapshot.mjs`, `story.mjs`, `CC-BY-4.0`)*
- **Quality Score:** **8.5 / 10**
- **Relevance to Us:** **2.5 / 10**
- **Recommended Scope:** `Do Not Install`
- **Used Instead:** [**`impeccable`**](impeccable.md) (`craft-floor` + `polish` / `quieter` / `clarify` / `harden` — across Web and Native Mobile) + [**`animate-expo`**](../mobile/animate-expo.md)
- **Reviewed Date:** `2026-11-16`
- **Current Status:** `⛔ Rejected`

---

## 1. What It Is & How It Works

A web UI "unslopping" skill created by Damir Sokolovsky (`@heydamir`) from his X redline series:
1. **Slop audit (`references/signs.md`):** Flags common AI-generated UI tells — purple-to-blue gradients, gradient text, colored glows/halos, `New ✨` emoji badges, wide-tracked uppercase labels (`NAVIGATION`), arbitrary Tailwind spacing (`mt-[13px]`), and shouty copy (`Welcome back! 👋`, `!!`).
2. **5-line `Direction` gate:** Writes `Product`, `Character`, `World`, `Moments`, and `Signature` and pauses for user confirmation before editing.
3. **9 sequential passes (`tokens.md`, `rtl.md`, `visuals.md`):** `Spacing` (4px grid) → `Color` (single tinted neutral ramp + 1 accent) → `Icons` (`lucide` 16–18px) → `Copy` → `Type` (weights `400–600` only) → `Layout` → `Details` (nested radius math, `tabular-nums`) → `Visuals` → `Motion`.
4. **Bundled scripts:** `snapshot.mjs` captures a live URL into standalone HTML; `story.mjs` uses `Playwright` + `ffmpeg` to render a 10-second square social-media showcase `.mp4` morphing from slop to clean UI (watermarked `unslop by @heydamir`).

---

## 2. Why We Didn't Install It (Comparison with Our Existing Stack)

### Strengths
- `signs.md`, `tokens.md`, and especially `rtl.md` (Arabic/Hebrew bidirectional layout rules) are tasteful, concrete, and concise.
- Clean `skillshare audit` result (`0 CRITICAL/HIGH` — only `LOW` `CC-BY-4.0` attribution links and `1.3 MB` of `.webp` reference frames).

### Weaknesses & Why We Already Have It Covered
- **Already covered — and exceeded — by [`impeccable`](impeccable.md):** `impeccable`'s `craft-floor.md` alongside `polish`, `quieter`, `distill`, `clarify`, `typeset`, `layout`, and `harden` already enforces the same anti-slop craft rules (banning gradient text, colored halos, emoji icons, fake sparklines, uniform icon-card grids, and low contrast) while also supporting **4 surface modes**, durable `PRODUCT.md`/`DESIGN.md` context, and **native iOS & Android** (`unslop` is Web/HTML/CSS-only).
- **Direct `auto-trigger` and rule collision:** Its frontmatter triggers on *"polish, clean up or redesign a screen... dashboards, apps and landing pages"*, colliding directly with `impeccable`. Worse, rigid rules in `unslop` (banning `700–900` weights across the board, restricting motion strictly to `transform/opacity`, and forcing a mandatory approval stop on Step 4) conflict with `impeccable`'s brand-preserving refinement rules on real production apps.
- **Unneeded extras:** Offers to connect external paid image MCP servers (`fal`, `Replicate`, `OpenAI`, `Higgsfield`), and we don't need social-media redline `.mp4` showcase rendering in product engineering.

---

## 3. Status & Action History

| Date | Action | Status | Notes |
|---|---|---|---|
| 2026-11-16 | Primary-source & `skillshare audit` review | `⛔ Rejected` | Tasteful anti-slop skill (`8.5/10`), skipped because [`impeccable`](impeccable.md) already covers and extends its scope across Web + Native Mobile without trigger conflicts. |
