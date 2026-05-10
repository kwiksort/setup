# System Patterns

## Pattern
- Lightweight **script + static-config** repo.
- `setup.sh` orchestrates installs/copies.
- `config/*` stores source-of-truth files.

## Idempotency Conventions (in `setup.sh`)
- `command -v` guards (brew, starship, rtk).
- `grep -Fxq` guards for `~/.zshrc` lines.
- Existence/content checks before overwrite (fonts, Ghostty default config, VS Code keybindings via `cmp -s` + backup).

## Current Non-Strict Areas
- `brew update && brew upgrade` always runs when brew exists.
- Karabiner main config copy is unconditional.

## macOS Assumptions
- Uses macOS paths under `~/Library/...` and `~/.config/...`.
