# `ui-ux-pro-max` (NextLevelBuilder)

[🇺🇿 O'zbekcha](../../ui-ux/ui-ux-pro-max.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/ui-ux/ui-ux-pro-max.md)

- **Source:** [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill)
- **Category:** `UI/UX` *(Design templates, palette, and font search)*
- **Type:** `Skill + Python CLI / CSV database`
- **Quality Score:** **7.0 / 10**
- **Relevance to Us:** **3.5 / 10**
- **Recommended Scope:** `Do Not Install` *(not needed as a primary UI skill)*
- **Reviewed Date:** `2026-11-15`
- 🔄 **Better Alternative:** [impeccable](impeccable.md) (with `APCA` contrast)

---

## 1. What It Is & How It Works

> [!IMPORTANT]
> **In Plain Words (Main Job & Value):** Picks generic color/font templates from static CSV files — far weaker than `impeccable` and collides with its auto-trigger.

A UI/UX reference system built on top of local CSV/JSON tables and a Python BM25 search script (`scripts/search.py`):
- Contains 80 UI styles (`styles.csv`), 192 industry/product palettes (`products.csv`, `colors.csv`), 74 font pairings (`typography.csv`, `google-fonts.csv`), 120 UX rules, 25 chart types, 17 GSAP animation templates, and guidelines for 22 frameworks.
- When building a page or component, the agent runs `python search.py "<industry and keywords>" --design-system` in the terminal, retrieves a preset color/font/section template, and creates `design-system/<slug>/MASTER.md` inside the project.
- The repo also bundles `slides`, `banner-design`, `brand`, and `design-system` skills (freemium model — upselling a paid platform).

---

## 2. Strengths & Weaknesses

### Strengths
- Convenient for beginners or rapid greenfield MVP prototyping: quickly outputs hex palettes, Google Fonts pairings, GSAP scroll-animation presets, and chart recommendations.
- Solid `Pre-Delivery Checklist` (`4.5:1` contrast, `44x44px` touch target, SVG icons instead of emoji, `reduced-motion`).

### Weaknesses & Cost
- **Paint-by-numbers design:** BM25 search picks the most generic industry cliche from CSV tables, pulling existing products toward cookie-cutter category templates instead of their own identity.
- **Extra CLI step on every UI task:** Repeatedly spawning Python search scripts wastes time and context.
- **Heavy footprint and freemium upsells:** Ships several megabytes of CSV/JSON catalogs and promotional links to a paid tier.

---

## 3. Security & Pre-Install Sanitization

- **Risk Level:** `Medium` *(primarily due to aggressive auto-triggering and architectural collision rather than malware)*
- **Audited Points:** `search.py` reads local CSV files without installing external packages, but `SKILL.md` hardcodes `${CLAUDE_PLUGIN_ROOT}` paths and uses an overly broad auto-trigger description.
- **If a specific sub-skill (e.g. `slides`) is ever installed, you must:**
  1. Never install the main `ui-ux-pro-max` skill globally (`-g`); if needed, add `disable-model-invocation: true` so it only runs when explicitly invoked.
  2. Replace `${CLAUDE_PLUGIN_ROOT}` paths with the real skill directory path (otherwise scripts fail in Codex and Antigravity).
  3. Strip unneeded extra skills (`brand`, `banner-design`) and promotional links.

---

## 4. Relevance & Compatibility with Our Existing Tools

Our global environment already runs a **much stronger UI system ([impeccable](impeccable.md))**, and enabling both causes a **direct head-on collision**:
- `impeccable` stores product context in `PRODUCT.md` and `DESIGN.md` and explicitly bans *"picking template colors/themes by industry category"*.
- `ui-ux-pro-max` does the exact opposite — picking CSV templates by industry category and creating a competing `design-system/<slug>/MASTER.md` file.
- Because both have nearly identical trigger conditions, the agent would receive contradictory instructions on every frontend request.

---

## 5. Best Use Cases

- **When to use:** Only in environments without `impeccable` for quick prototype palette/font lookup, or studying its standalone `slides` sub-skill for HTML slide decks.
- **When not to use:** On existing products or in any global environment where `impeccable` is installed.

---

## 6. Status & Action History

| Date | Action | Status | Notes |
|---|---|---|---|
| 2026-11-15 | Audited `SKILL.md`, `pro-rules.md`, and CSV/BM25 architecture | 🔄 **Better Alternative:** [impeccable](impeccable.md) | Skipped because it is weaker than and directly conflicts with [impeccable](impeccable.md). |
