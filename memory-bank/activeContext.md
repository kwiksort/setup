# Active Context

## Current State
- Core automation remains in `setup.sh`.
- Config source-of-truth remains under `config/`.

## Latest Change
- Added RTK install guard in `setup.sh`:
  - if `rtk` exists: skip
  - else: `brew install rtk`

## Open Items
- Evaluate `Brewfile` adoption.
- Decide Ghostty overwrite/sync strategy.
- Decide long-term Karabiner source model (single file vs generated modules).
