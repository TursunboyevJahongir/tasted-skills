# 🧩 Best Practices & Combined Tool Workflows

[🇺🇿 O'zbekcha](../README.md) | **🇬🇧 English** | [🇷🇺 Русский](../ru/README.md)

⬅️ [Back to Main Catalog (`README.en.md`)](../../README.en.md)

This section documents **how to combine individual skills and CLI tools into cohesive workflows**, **why each combination pays off**, and **hidden power features** you can unlock without installing extra bloatware (such as running Maestro `.yaml` E2E suites headlessly without Java, cutting dual-emulator RAM by half, or running independent multi-model code reviews).

---

## 📖 Table of Contents (Combined Workflows)

| # | Practice Guide | Combined Tools (`What + What`) | Core Benefit & Hidden Capabilities |
|---|---|---|---|
| **1** | [**Headless Mobile & TV QA + Maestro E2E Automation**](01-mobile-tv-headless-qa.md) | [**`simslim`**](../../reviews/en/mobile/simslim.md) + [**`avdslim`**](../../reviews/en/mobile/avdslim.md) + [**`agent-device`**](../../reviews/en/mobile/agent-device.md) + [**`adb`**](../../reviews/en/mobile/adb.md) + [**`xcrun simctl`**](../../reviews/en/mobile/ios-simulator-device-hub.md) + [**`cross-platform-qa`**](../../reviews/en/mobile/cross-platform-qa.md) | Runs iOS (`1.16 GB`) and Android (`2.64 GB`, Metal GPU) emulators completely windowlessly (`~3.3 GB` RAM saved), types full UTF-8, and executes **saved Maestro `.yaml` / `.ad` E2E suites (`--maestro`) and self-healing (`healed.ad`) scripts** in the background without installing Java or Maestro CLI. |
| **2** | [**From Spec & Graph to Surgical Code & Independent Review**](02-spec-to-surgical-code.md) | [**`graphify`**](../../reviews/en/architecture/graphify.md) + [**`grill-me`**](../../reviews/en/architecture/grill-me.md) + [**`ponytail`**](../../reviews/en/architecture/ponytail.md) + [**`karpathy-guidelines`**](../../reviews/en/architecture/karpathy-guidelines.md) + [**`T3 Code`**](../../reviews/en/developer-tools/t3-code.md) + [**`elephant-goldfish-model`**](../../reviews/en/architecture/elephant-goldfish-model.md) | Maps large repos in seconds with a `0`-token AST graph, resolves design decisions before coding, writes minimal YAGNI diffs, and runs fresh-context independent reviews (*"let Codex implement and Claude/Argon review"*). |
| **3** | [**Web, Mobile Web & Native UI Design + Verification**](03-web-and-mobile-ui-polish.md) | [**`impeccable`**](../../reviews/en/ui-ux/impeccable.md) + [**`mobile-native`**](../../reviews/en/mobile/mobile-native.md) + [**`animate-expo`**](../../reviews/en/mobile/animate-expo.md) + [**`asset-diet`**](../../reviews/en/developer-tools/assetdiet.md) + [**`agent-desktop`**](../../reviews/en/developer-tools/agent-desktop.md) | Eliminates generic AI UI slop, makes mobile web/PWAs feel native (`dvh`, `safe-area`, `16px` inputs), writes `60/120fps` UI-thread Expo animations, compresses repo media locally, and verifies Chrome in the background without stealing cursor focus. |
| **4** | [**Skill Sanitization, White-Box Pentesting & Error Telemetry**](04-skill-and-security-hygiene.md) | [**`tasted-skills`**](../../skills/tasted-skills/SKILL.md) + [**`skillshare`**](../../reviews/en/developer-tools/skillshare.md) + [**`Shannon` (`hacker-test`)**](../../reviews/en/backend/shannon.md) + [**`sentry`**](../../reviews/en/backend/sentry.md) | Audits and strips risky hooks/telemetry from third-party skills before installation (`skillshare audit`), runs on-demand White-Box AI pentests against local/staging APIs, and investigates production errors/traces via `sentry`. |

---

## 💡 Core Principles Behind These Combinations

1. **Zero Permanent MCP Context Bloat:** Instead of mounting heavy MCP servers (`~7,500+` tokens per turn), we pair `0-token` CLIs (`agent-device`, `agent-desktop`, `simslim`, `avdslim`) with lightweight on-demand skills (`asset-diet`, `hacker-test`).
2. **Protect Host RAM, GPU & SSD:** `simslim` + `avdslim` + headless execution let Web, iOS, and Android checks run concurrently without swap thrashing or stealing window focus.
3. **Zero Hidden API Bills:** Instead of wrappers that make paid sub-LLM calls per tap (`ARTEMIS`, `Caveman Auto`), your active coding agent drives fast, deterministic `@e1` accessibility trees directly.
