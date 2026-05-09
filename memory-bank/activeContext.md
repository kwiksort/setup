# Active Context

## Current Snapshot
- Cline initialization is complete for this repository.
- Foundational docs exist: `implementation_plan.md`, `.clinerules`, and `memory-bank/README.md`.
- Standard memory-bank files are populated from current repository state (`setup.sh` and `config/*`).

## Open Decisions
- Whether to add a dedicated `Brewfile` and split install declarations out of `setup.sh`.
- Whether to make Ghostty config sync opt-in overwrite (instead of copy-on-missing behavior only).
- Whether to keep full Karabiner profile (`config/karabiner/karabiner.json`) as source of truth or generate from modular rules.

## Immediate Next Actions
1. Keep this file and `memory-bank/progress.md` updated after each meaningful repository change.
2. Decide whether to introduce a `Brewfile` and optional validation tooling.
3. Revisit config synchronization strategy for Ghostty and Karabiner modularization.

## Recent Discoveries
- Repository has no existing README/docs besides configs and scripts.
- Automation is centered on macOS and shell scripting; there is no app codebase with classes/functions in typed languages.
- `setup.sh` includes several idempotency checks (Starship init line, alias guard, font install guard, Ghostty config existence guard).
- Homebrew cask selection in `setup.sh` now uses `mos` (replacing `mac-mouse-fix`).
- `setup.sh` now applies Karabiner config by directly copying `config/karabiner/karabiner.json` to `$HOME/.config/karabiner/karabiner.json`.
- `config/karabiner/mx_keys_fr_pc_rules.json` was removed from the repository and is no longer referenced by `setup.sh`.
- `setup.sh` applies VS Code keybindings with backup/skip logic, but currently references `config/VSCode/keybindings.json` while the repo path is `config/vscode/keybindings.json` (case-sensitive portability risk).
- Fixed MX Keys Ctrl+C behavior in terminal apps by correcting Karabiner app exclusion bundle ID from typo `com.ghotty.*` to exact `com.mitchellh.ghostty` in `config/karabiner/karabiner.json`.
- Added MX Keys Ctrl+Z terminal passthrough behavior by ensuring `Ctrl+Z -> Cmd+Z` remap is excluded in Ghostty and Terminal via `frontmost_application_unless` conditions in `config/karabiner/karabiner.json`.
- `setup.sh` now enforces terminal-safe Ctrl+C/Ctrl+Z Karabiner conditions post-copy using an inline Python patch step against `~/.config/karabiner/karabiner.json` (idempotent cleanup of typo `com.ghotty.*` included).
- Added browser refresh mapping in `config/karabiner/karabiner.json`: `f5` now sends `command+r` for the MX Keys FR-PC device rule set.
- Added delete-word style mapping in `config/karabiner/karabiner.json`: `shift+delete_forward` (Shift+Suppr) now sends `command+delete_or_backspace`.
- Added global MX Keys shortcut in `config/karabiner/karabiner.json`: `left_command+e` now opens Finder (`com.apple.finder`) and sends `command+n` to create a new Finder window from any frontmost app (Windows+E style).
