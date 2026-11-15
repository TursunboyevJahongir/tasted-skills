---
name: asset-diet
description: >
  Audit, compress, deduplicate, and roll back local repository media assets
  (PNG/JPG/WebP/AVIF via Sharp, SVG via SVGO, MP4/WebM via FFmpeg, GLB/GLTF 3D
  via glTF-Transform) on demand via `npx assetdiet-mcp@0.1.4` CLI with zero
  permanent MCP overhead. Trigger ONLY when the user explicitly asks to audit,
  compress, deduplicate, or slim down images, SVGs, videos, or 3D assets
  ("asset-diet", "assetdiet", "rasmlarni siqib ber", "media optimizatsiya",
  "og'ir rasmlarni tekshir").
license: MIT
---

# AssetDiet (On-Demand Local Media Audit & Compression)

Use [092Abdullah/AssetDiet](https://github.com/092Abdullah/AssetDiet) (`npm: assetdiet-mcp`) strictly as an **ephemeral 100% local CLI** via `npx assetdiet-mcp@0.1.4` — zero cloud uploads and **zero permanent 16-tool MCP schema bloat** in chat sessions.

## 1. Non-Negotiable Guardrails

1. **NEVER register the MCP server:** Never run `assetdiet setup` or `assetdiet mcp`. Always invoke CLI subcommands directly (`audit`, `scan`, `optimize`, `restore`, `doctor`).
2. **Pin the audited version (`assetdiet-mcp@0.1.4`):** Avoid unpinned `@latest` in automated runs so supply-chain behavior matches the audited release.
3. **Read-only audit before writes:** Always run `audit` first and show potential savings + duplicate groups before mutating repository assets (unless the user explicitly asked to apply `--policy safe` immediately).
4. **Expo / React Native & App Icon protection:** In Expo / React Native projects (`app.json` / `app.config.ts`), native app icons, splash screens, notification icons, and static `require('./foo.png')` assets often require `.png` extensions — keep `--policy safe` (same extension, lossless/SSIM ≥ 0.98) unless targeting a pure web folder (`public/`, `static/`) with explicit user approval for `.webp` conversion.

## 2. Step-by-Step Workflow

### Step 1: Read-Only Audit (Zero File Changes)

```bash
# Quick 3-line scorecard summary (total size, savings, SHA-256 duplicate groups)
npx assetdiet-mcp@0.1.4 audit <targetPath> --policy safe --summary

# Full per-file breakdown (or add --json for structured filtering)
npx assetdiet-mcp@0.1.4 audit <targetPath> --policy safe
```

### Step 2: Optimize Safely with Atomic Journal & Backup

- **`safe` policy (Default — Recommended):** Compresses in-place (`Sharp` lossless/85, `SVGO` keeping `viewBox`), keeps the exact file extensions, never touches source code imports, and removes duplicate byte copies **only** when they have `0` code references:
  ```bash
  # Optional dry-run preview
  npx assetdiet-mcp@0.1.4 optimize <targetPath> --policy safe --dry-run

  # Execute with atomic backup (.assetdiet/backups/<runId>/)
  npx assetdiet-mcp@0.1.4 optimize <targetPath> --policy safe
  ```
- **`balanced` policy (Web-only `.png`/`.jpg` → `.webp` + code reference migration — ask confirmation first):**
  ```bash
  npx assetdiet-mcp@0.1.4 optimize <targetPath> --policy balanced --dry-run
  npx assetdiet-mcp@0.1.4 optimize <targetPath> --policy balanced
  ```
  After `balanced`, immediately inspect `git status` and `git diff` on all modified `.ts`/`.tsx`/`.jsx`/`.css`/`.html` imports and run the project's build/typecheck.

### Step 3: Instant Rollback & `.assetdiet/` Git Hygiene

1. Save the `Run ID` printed by `optimize`. If any asset looks degraded or an import breaks, restore byte-for-byte originals in one command:
   ```bash
   npx assetdiet-mcp@0.1.4 restore --run <runId> --path <targetPath>
   ```
2. **Never commit `.assetdiet/` backups to Git:** Ensure `.assetdiet/` is listed in `.gitignore` (or delete `.assetdiet/` once visual/build verification passes and the user confirms).
