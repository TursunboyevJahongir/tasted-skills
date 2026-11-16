# `AssetDiet` (`assetdiet-mcp` + `asset-diet` skill)

[🇺🇿 O'zbekcha](../../developer-tools/assetdiet.md) | **🇬🇧 English** | [🇷🇺 Русский](../../ru/developer-tools/assetdiet.md)

- **Source:** [092Abdullah/AssetDiet](https://github.com/092Abdullah/AssetDiet) · [npm: assetdiet-mcp](https://www.npmjs.com/package/assetdiet-mcp)
- **Category:** `Developer Tools` *(Local Image, SVG, Video & 3D Asset Optimizer with Import Rewriting)*
- **Type:** `Standalone CLI` + custom lightweight [`asset-diet`](../../../skills/asset-diet/SKILL.md) on-demand skill
- **Quality Score:** **7.5 / 10**
- **Need for Us:** **6.5 / 10** *(via our on-demand [`asset-diet`](../../../skills/asset-diet/SKILL.md) `npx` CLI wrapper, with zero permanent 16-tool MCP overhead)*
- **Recommended Scope:** `On-Demand npx CLI + Global lightweight asset-diet skill (-g)`
- **Reviewed Date:** `2026-11-16`
- **Current Status:** `👍 Good Option` *(packaged [`skills/asset-diet`](../../../skills/asset-diet/SKILL.md), verified live on a real 214-asset repo, and synced globally across all 5 agent targets without MCP bloat)*

---

## 1. Brief Overview: What It Is and How It Works

> [!IMPORTANT]
> **In Plain Words (Main Job & Value):** Finds and compresses heavy images, SVGs, videos, and 3D assets locally on your machine without uploading anything to the cloud, complete with 1-command rollback (`0` idle MCP token cost).

A **100% local** media audit and compression pipeline with zero cloud uploads:
- **Native engines:** `Sharp v0.35` (`libvips` for `WebP` / `AVIF`), `SVGO 3.x` (SVG cleanup), `FFmpeg` (video), and `@gltf-transform` (`GLB`/`GLTF` 3D assets).
- **Safe migration & rollback:** Detects exact duplicates via SHA-256, compresses losslessly in-place under `safe` (or converts `.png`/`.jpg -> .webp` with import rewriting under `balanced`), and stores `.assetdiet/backups/<runId>/` snapshots with a write-ahead journal for instant `restore`.
- **Live verification:** On a `214`-asset (`150.5 MB`) mobile/web repo, read-only `audit --policy safe` finished in `3.6s`, identifying `-15.55 MB (-10.3%)` in lossless savings across `148` files plus `18` SHA-256 duplicate groups.

---

## 2. Why Via Our `asset-diet` Skill Instead of Permanent MCP

- **Zero MCP context bloat:** Registering its 16 MCP tools globally wastes context in 99% of non-media coding sessions; [`skills/asset-diet`](../../../skills/asset-diet/SKILL.md) activates strictly when requested and forbids `assetdiet setup` / `mcp`.
- **Expo / React Native & Git guardrails:** Defaults to `--policy safe` so native app icons (`app.json`) and static `.png` `require()` calls are never broken by blind `.webp` conversion, and ensures `.assetdiet/` backup folders are never committed to Git.

---

## 3. On-Demand CLI Commands

```bash
# 1. Read-only audit (zero file modifications)
npx assetdiet-mcp@0.1.4 audit . --policy safe --summary

# 2. Lossless in-place compression with atomic backup journal
npx assetdiet-mcp@0.1.4 optimize . --policy safe

# 3. Instant byte-for-byte rollback if needed
npx assetdiet-mcp@0.1.4 restore --run <runId>
```

---

## 4. Status & Action History

| Date | Action | Status | Notes |
|---|---|---|---|
| 2026-11-16 | Primary-source audit, live `doctor`/`audit` verification, and global `asset-diet` skill sync | `👍 Good Option` | Verified `v0.1.4` with all 5 local engines (`Sharp`, `SVGO`, `FFmpeg`, `glTF-Transform`, `Font`); synced [`skills/asset-diet`](../../../skills/asset-diet/SKILL.md) across all 5 agent environments instead of attaching a 16-tool MCP server. |
