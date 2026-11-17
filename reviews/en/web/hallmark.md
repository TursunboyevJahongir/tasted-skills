# `Hallmark v2` (`Nutlope/hallmark` — Anti-Slop Web & Landing Design Engine)

[🇺🇿 O'zbekcha](../../web/hallmark.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/web/hallmark.md)

- **Source:** [Nutlope/hallmark](https://github.com/Nutlope/hallmark) · [usehallmark.com](https://www.usehallmark.com)
- **Category:** `Web` *(Greenfield Landing Pages, Promo Sites & Lossless Web Redesign Engine)*
- **Type:** `Skill + Node.js Linter/CLI Scripts (50 themes + sloplint + capture)`
- **Quality Score:** **9.0 / 10**
- **How Often Needed:** **4.5 / 10** *(because we don't build marketing landing pages every day — best used on demand via project-scoped `-p` or explicit `/hallmark` invocation)*
- **Recommended Scope:** `On-demand Project Scope (-p) or Auto-Trigger Disabled (/hallmark only)`
- **Reviewed Date:** `2026-11-17`
- **Current Status:** `👍 Good Option` *(top-tier choice for landing pages and marketing sites — stronger than `taste-skill` and equipped with 5 landing-page capabilities `impeccable` does not bundle)*

---

## 1. What It Is and How It Works

> [!IMPORTANT]
> **In Plain Words (Main Job & Value):** A standout choice whenever you need to **build a new landing page or marketing site from scratch** or completely redesign a web page without losing a single link or form input. Keep it off auto-trigger in daily app work and invoke it **specifically when building landing pages**.

An open-source (`MIT`) web design and mechanical verification system created by Together AI (Hassan El Mghari / `Nutlope`, `7.1 MB`, `7,571` lines of zero-dependency Node.js `.mjs` scripts):

1. **50 Browsable Material Themes (`references/themes/` + [usehallmark.com](https://www.usehallmark.com)):** Each theme (`Cobalt`, `Dusk`, `Atelier`, `Studio`, `Terminal`, `Ribbon`, etc.) ships concrete typography, OKLCH color tokens, surfaces, and component grammar; `theme.mjs deal/scaffold` rotates choices so consecutive sites never look alike (or runs `custom` from scratch).
2. **`sloplint.mjs` (`4,426` lines) + `sloplint-render.mjs` (`1,283` lines):** Lints `.html`, `.css`, and `.jsx/.tsx/.vue` statically and across **8 real Chrome viewport widths (`320px` to `1920px`)**:
   - bans purple-to-blue gradients, emoji icons, nested cards, and `transition: all`;
   - catches tracked-uppercase eyebrows above headings and lone italic words in headings;
   - fails **invented metrics** (*"10,000+ users", "99.9% uptime"*), fake testimonials, and **dead forms** that thank the user without submitting anywhere (`sloplint.mjs:3166`);
   - verifies pixel-by-pixel that the Hero fits inside `1280x800` without scrolling.
3. **755 Licensed Real Photos (`photos.json`) & Product Auto-Capture (`capture.mjs`):** Captures live desktop + mobile screenshots straight from your running app (`localhost` or Electron `--cdp`), or selects real openly licensed `Wikimedia Commons` (`CC0 / CC-BY`) photography with automatic footer credits.
4. **Lossless Redesign Guard (`sloplint --before` & `--kept`):** Snapshots every link, input field, event handler, and heading before a redesign, fails the build if anything was dropped, and generates a side-by-side `Before / After` (`compare.html`) view.

---

## 2. Comparison: Why `impeccable` Cannot Replace It (and Why We Use `Hallmark` Only When Needed)

`impeccable` and `Hallmark v2` shine in **two different jobs**:

| Dimension | 🏆 **`Hallmark v2`** *(Wins on Landing & Promo Sites)* | 🏆 [**impeccable**](../ui-ux/impeccable.md) *(Wins on Daily App & Mobile UI)* | [**taste-skill v2.5**](taste-skill.md) |
|---|---|---|---|
| **Pre-built browsable theme catalog** | ✅ **50 ready themes** (`usehallmark.com` + instant `tokens.css` scaffold) | ❌ No browse-and-pick theme catalog (derives abstract concepts each run) | ⚠️ Dial numbers (`1–10`) only |
| **Curated real photo library** | ✅ **755 licensed real photos** (`Wikimedia Commons`) | ❌ None (placeholders or AI image generation) | ❌ None |
| **Auto-screenshot live product** | ✅ **`capture.mjs`** (`localhost` & Electron `--cdp`) | ❌ None | ❌ None |
| **Lossless redesign link/form diff** | ✅ **Mechanical `sloplint --before` / `--kept` gate** | ⚠️ Prose instruction only (no mechanical diff gate) | ❌ None |
| **Dead-form & fake-metric linter** | ✅ **Mechanical `sloplint` across `8` widths** | ⚠️ Visual anti-pattern detector (`impeccable detect`) | ❌ None |
| **Native `iOS` / `Android` / `Expo` support** | ❌ **None (Web HTML/CSS/JSX only)** | ✅ **Full (`ios.md`, `android.md`, `adapt.native.md`)** | ❌ None (Web only) |
| **Brand button contrast math** | ⚠️ Legacy **`WCAG 2`** (fails crisp white text on blue/orange buttons) | ✅ **`APCA` (`\|Lc\| ≥ 60`)** (preserves crisp white button text) | ⚠️ `WCAG 2` |
| **Speed on everyday app edits** | ⚠️ Heavy 7-step landing pipeline (2 subagent reviews + Chrome) | ✅ Fast and lightweight on dashboards, apps, and mobile screens | ⚠️ Has blocking 600s `Stop` hook |

**Why use it on-demand rather than leaving it auto-triggered globally?**
1. **Web-only:** Does not cover native `Expo / React Native / iOS / Android` screens.
2. **Global auto-trigger collision:** Its `SKILL.md` rule (*"Use when the user asks to build or design something new"*) collides with `impeccable` on ordinary web-app components, stamping `/* Hallmark */` into CSS and creating `.hallmark/` folders.
3. **Legacy `WCAG 2` contrast gate (`sloplint-render.mjs:15-20`):** Flags white text on saturated orange, blue, or green brand buttons as a hard `FAIL`.

---

## 3. Security & Clean On-Demand Setup (Sanitization)

- **Risk Level:** `Low` *(clean `MIT` source code, zero hidden telemetry or ads)*
- **`skillshare audit` notes:** Static warnings triggered by `skillshare audit` were verified in source as false positives (the font name `"Host Grotesk"` matching `Host` and `<prompt>` matching XML tag syntax). Network access occurs only when saving `upload.wikimedia.org` photos or when you explicitly set `TOGETHER_API_KEY` for `imagegen.mjs`.
- **Recommended setup when needed:**
  1. **Install per-project (`-p`) on landing-page repos:** `npx skills add nutlope/hallmark` (without `-g`).
  2. **If kept globally:** Set `disable-model-invocation: true` in `SKILL.md` (and `allow_implicit_invocation: false` in `agents/openai.yaml`) so it never fires uninvited and runs strictly on `/hallmark` or `$hallmark`.
  3. Install `puppeteer-core` only when you want the 8-width Chrome render check (`sloplint --render`); static `sloplint` works out of the box.

---

## 4. When to Use (and When Not To)

- **When to use:** Building a new **Landing Page, SaaS marketing site, product launch page, or portfolio** from scratch, or running a full **Redesign** of an existing web page with `--before / --kept` safety.
- **When not to use:** Everyday product dashboards, admin panels, internal web-app tweaks, or native `iOS`/`Android`/`Expo` mobile apps (use [**impeccable**](../ui-ux/impeccable.md) + [**mobile-native**](../mobile/mobile-native.md) + [**animate-expo**](../mobile/animate-expo.md)).

---

## 5. Status & Action History

| Date | Action | Status | Notes |
|---|---|---|---|
| 2026-11-17 | Audited `Nutlope/hallmark` (`v2.0.0`) source (`SKILL.md`, `7,571` lines of `.mjs`, 50 themes), ran `skillshare audit`, and compared side-by-side with `impeccable` | `👍 Good Option` | Added to the Web catalog as our top on-demand choice for building landing pages and full site redesigns (`-p` or explicit `/hallmark` invocation). |
