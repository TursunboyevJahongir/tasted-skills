# `claude-code-setup` (Anthropic)

[🇺🇿 O'zbekcha](../../developer-tools/claude-code-setup.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/developer-tools/claude-code-setup.md)

- **Source:** [anthropics/claude-plugins-official (`claude-code-setup`)](https://github.com/anthropics/claude-plugins-official/tree/main/plugins/claude-code-setup)
- **Category:** `Developer Tools` *(Starter Claude Code Configuration Recommender)*
- **Type:** `Plugin (Read-Only Recommender Skill)`
- **Quality Score:** **7.5 / 10**
- **How Often Needed:** **2.0 / 10** *(built for newcomers starting from zero; redundant in our curated multi-agent setup)*
- **Recommended Scope:** `Do Not Install`
- **Instead Use:** [**`skillshare`**](skillshare.md) + this **`tasted-skills`** registry
- **Reviewed Date:** `2026-11-16`
- **Current Status:** `🔄 Better Alternative`

---

## 1. Brief Overview: What It Is and How It Works

> [!IMPORTANT]
> **In Plain Words (Main Job & Value):** Starter recommender plugin for brand-new Claude Code setups; unnecessary once all agents are already unified through `skillshare`.

An official read-only plugin inside `anthropics/claude-plugins-official` that inspects a repository (`package.json`, CI configs, frameworks) and suggests starter `CLAUDE.md` rules, lint hooks, subagents, and MCP servers (such as Playwright) without modifying files automatically.

---

## 2. Why We Didn't Install It

- **Onboarding tool for blank setups:** Helpful for developers configuring Claude Code for the first time, but adds zero leverage once you already maintain a vetted skill architecture.
- **Single-vendor & generic MCP suggestions:** Targets Claude Code only and routinely recommends heavy MCP servers that we intentionally avoid in favor of zero-context CLIs (`agent-desktop`, `agent-device`) managed across all agents via [**`skillshare`**](skillshare.md).

---

## 3. Status & Action History

| Date | Action | Status | Notes |
|---|---|---|---|
| 2026-11-16 | Primary-source audit | `🔄 Better Alternative` | Safe read-only onboarding recommender (`7.5/10`), skipped because `skillshare` + `tasted-skills` already govern our multi-agent stack. |
