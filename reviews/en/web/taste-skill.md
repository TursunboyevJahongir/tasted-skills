# `taste-skill` v2.5 (`design-taste-frontend`)

[🇺🇿 O'zbekcha](../../web/taste-skill.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/web/taste-skill.md)

- **Source:** [Leonxlnx/taste-skill](https://github.com/Leonxlnx/taste-skill) *(legacy lightweight versions: [Leonxlnx/taste-skill-classics](https://github.com/Leonxlnx/taste-skill-classics))*
- **Category:** `Web` *(Marketing Websites & Company Landing Pages)*
- **Type:** `Skill + Landing Kit + Headless Chrome Gate + Stop Hook`
- **Quality Score:** **8.0 / 10** *(strong for promo/landing sites)*
- **How Often Needed:** **4.0 / 10** *(low for global setup; useful only when building greenfield promo landing pages)*
- **Recommended Scope:** `Project Only (-p)` *(sanitized; never install globally)*
- **Reviewed Date:** `2026-11-15`
- **Current Status:** `👍 Good Option`

---

## 1. What It Is and How It Works

> [!IMPORTANT]
> **In Plain Words (Main Job & Value):** Good kit for building bold marketing/promo landing pages from scratch, provided you strip its 600s `Stop` hook and scope it strictly to `-p`. For daily app UI, `impeccable` is our primary tool.

Unlike its lightweight v1 ruleset, `tasteskill 2.5.1` (`design-taste-frontend`) is a heavy **landing-page engine built to produce `figma.com`- and `x.ai`-grade marketing sites**:
- Ships with prebuilt **`system.css`, `system.js`, `starter.html`**, WebGL/shader custom elements (`fx-globe`, `fx-dither-object`, `fx-feature-card`), a curated photography fetcher (`photos.mjs`), and Node 22+ scripts.
- Classifies sites into 6 business archetypes (`software`, `tech`, `gaming`, `product`, `service`, `place`), enabling WebGL shaders for tech/gaming while enforcing real photography and typography for service/place sites.
- **`consistency.mjs` & `gate.mjs`:** Renders the page in headless Chrome across `1440`, `1024`, `820`, `768`, and `390` px viewports, lints copy for AI-slop phrases, and blocks completion on layout/visual errors.

---

## 2. Strengths and Weaknesses

### Strengths
- Produces cohesive, photography-backed, multi-viewport-verified startup landing pages and promo sites from scratch instead of generic AI card grids.
- Caps WebGL contexts (max 4) and enforces mobile/reduced-motion fallbacks.

### Weaknesses and Cost
- **Landing-page mold, not for functional web apps:** Mandates rigid rules like *"every section must be exactly 100vh (`1440x900`)"*, *"inject my `system.css` and `system.js` into `public/`"*, and *"use `static export` for Next.js"* — which breaks existing dashboards, real-time map apps, media catalogs, and admin panels.
- **Heavy footprint (~130+ MB repo/assets)** plus Node 22+ and Chrome dependencies.

---

## 3. Security & Pre-Install Sanitization

- **Risk Level:** `Medium–High` *(blocks agent turns and injects opinionated runtime files if installed globally)*
- **Inspected surface:**
  1. **`Stop` lifecycle hook:** `SKILL.md` frontmatter defines a `hooks: Stop:` command with a **`timeout: 600` seconds** that runs `node scripts/gate.mjs --hook claude` whenever the agent finishes a turn.
  2. **Network & filesystem writes:** `photos.mjs` and `icons.mjs` fetch external assets and create `.taste-skill/` in the project root.
  3. **Overbroad auto-trigger:** Claims any React/Next.js/Vue/Tailwind page design request, colliding directly with [`impeccable`](../ui-ux/impeccable.md).
- **Mandatory sanitization if ever installed into an isolated landing project (`-p`):**
  1. **Strip the entire `hooks: Stop:` block** from `SKILL.md` frontmatter (run `consistency.mjs` and `gate.mjs` manually when needed).
  2. Never install globally (`-g`) — scope strictly to a dedicated greenfield landing repository (`-p`) or add `disable-model-invocation: true`.

---

## 4. Fit & Compatibility with Our Existing Stack

- For daily web applications and product interfaces, our installed [**`impeccable`**](../ui-ux/impeccable.md) (`Operate` and `Persuade` modes) + [**`mobile-native`**](../mobile/mobile-native.md) stack is far safer because it respects each project's own framework and design tokens without injecting foreign `system.css` files.

---

## 5. When to Use (and When Not To)

- **When to use:** Only when building a standalone marketing/promo website in a fresh repository (`-p` mode after stripping the `Stop` hook).
- **When not to use:** Existing React/Next.js web apps, SaaS dashboards, real-time map/player products, and admin panels.

---

## 6. Status & Action History

| Date | Action | Status | Notes |
|---|---|---|---|
| 2026-11-15 | Full audit of `tasteskill 2.5.1` source, scripts, and `Stop` hook | `👍 Good Option` | Global installation rejected due to the 600s `Stop` hook and incompatibility with functional web apps. Documented with sanitization steps for isolated landing projects. |
