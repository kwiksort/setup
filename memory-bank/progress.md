# Progress

## Completed
- Added root Cline configuration: `.clinerules`.
- Added memory bank index: `memory-bank/README.md`.
- Added baseline context files:
  - `memory-bank/projectbrief.md`
  - `memory-bank/productContext.md`
  - `memory-bank/systemPatterns.md`
  - `memory-bank/techContext.md`
  - `memory-bank/activeContext.md`
  - `memory-bank/progress.md`
- Added planning artifact: `implementation_plan.md`.

## In Progress
- None.

## Backlog
- Consider introducing `Brewfile` for clearer dependency intent and easier diffing.
- Add lightweight validation scripts (shellcheck/json lint) for repository safety checks.
- Evaluate whether Ghostty config should support optional overwrite/sync mode.
- Decide whether to keep `config/karabiner/karabiner.json` as handcrafted source of truth or reintroduce modular/generated Karabiner rule workflow.

## Change Log
- 2026-04-18: Initialized Cline for this repo with standard memory-bank files and project-specific content.
- 2026-04-18: Completed cross-file validation and finalized initial memory-bank baseline.
- 2026-04-18: Added Karabiner setup step in `setup.sh` to install `mx_keys_fr_pc_rules.json` into `~/.config/karabiner/assets/complex_modifications/` with backup/skip logic.
- 2026-04-18: Updated `setup.sh` to automatically apply VS Code Windows-style keybindings via `config/VSCode/apply_vscode_windows_shortcuts.sh`.
- 2026-04-18: Replaced missing VS Code script integration by direct copy flow from `config/VSCode/keybindings.json` to `${HOME}/Library/Application Support/Code/User/keybindings.json` with backup/skip logic.
- 2026-04-18: Extended `config/karabiner/mx_keys_fr_pc_rules.json` with function/utility mappings for F6/F7 keyboard backlight, F8/F9/F10 media control, Calculator launch, and Print Screen to selected-area screenshot.
- 2026-04-18: Added consumer-key fallback mappings in `config/karabiner/mx_keys_fr_pc_rules.json` to handle MX top-row keys when emitted as consumer events rather than function key codes.
- 2026-04-18: Pushed updated Karabiner rules file to `/Users/julien/.config/karabiner/assets/complex_modifications/mx_keys_fr_pc_rules.json` with backup of previous destination file.
- 2026-04-18: Restored missing `[MX Keys FR-PC] Function & Utility Keys` block in `config/karabiner/mx_keys_fr_pc_rules.json`, re-validated JSON syntax, and re-deployed to `/Users/julien/.config/karabiner/assets/complex_modifications/mx_keys_fr_pc_rules.json`.
- 2026-04-18: Simplified Karabiner setup in `setup.sh` to direct copy of `config/karabiner/karabiner.json` to `${HOME}/.config/karabiner/karabiner.json`.
- 2026-04-18: Removed `config/karabiner/mx_keys_fr_pc_rules.json` from repository and aligned memory-bank docs to the new single-file Karabiner workflow.
- 2026-04-18: Documented VS Code path casing mismatch (`config/VSCode` vs `config/vscode`) as a macOS case-insensitive compatibility caveat.
