# `AssetDiet` (`assetdiet-mcp`)

[🇺🇿 O'zbekcha](../../developer-tools/assetdiet.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/developer-tools/assetdiet.md)

- **Source:** [092Abdullah/AssetDiet](https://github.com/092Abdullah/AssetDiet) · [npm: assetdiet-mcp](https://www.npmjs.com/package/assetdiet-mcp)
- **Category:** `Developer Tools` *(Local Image, SVG, Video & 3D Asset Optimizer with Import Rewriting)*
- **Type:** `CLI + MCP Server (16 tools)`
- **Quality Score:** **7.5 / 10**
- **Need for Us:** **5.0 / 10** *(useful as an occasional pre-release `npx` CLI pass, not as an always-on MCP server)*
- **Recommended Scope:** `Do not attach as permanent MCP — run on-demand via npx CLI`
- **Reviewed Date:** `2026-11-16`
- **Current Status:** `👀 Reviewed (Not Tested)` *(100% local pipeline; keep in reserve for one-off CLI runs)*

---

## 1. Brief Overview: What It Is and How It Works

A **100% local** asset audit and compression tool with zero cloud uploads:
- **Engines:** `Sharp` (`libvips` for `WebP` / `AVIF`), `SVGO` (SVG cleanup), `FFmpeg` (video), and `@gltf-transform` (`GLB`/`GLTF` 3D assets).
- **Safe migration & rollback:** Detects exact duplicates via SHA-256, rewrites code imports when converting `.png`/`.jpg` to `.webp`/`.avif`, and stores `.assetdiet/backups/<runId>/` snapshots with a write-ahead journal for one-step rollback.

---

## 2. Why We Didn't Attach It as a Global MCP Server

- **16-tool MCP schema overhead:** Keeping 16 asset-optimization tool definitions loaded in every coding turn wastes context when 99% of sessions don't touch media files.
- **Early project maturity:** While the core pipeline is clean and telemetry-free, it is a young solo side-project (e.g., leftover `file:///d:/...` links in docs), so any automated import rewrites should always be verified via `git diff`.

---

## 3. Recommended Usage (On-Demand CLI)

Skip permanent installation and run it ephemerally via `npx` before shipping asset-heavy web or mobile builds:

```bash
npx assetdiet-mcp audit . --policy safe
```

---

## 4. Status & Action History

| Date | Action | Status | Notes |
|---|---|---|---|
| 2026-11-16 | Primary-source audit | `👀 Reviewed (Not Tested)` | Located and audited the canonical repo (`092Abdullah/AssetDiet`) and npm package; recommended strictly as an on-demand `npx` CLI rather than a persistent 16-tool MCP server. |
