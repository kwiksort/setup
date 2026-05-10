# Project Brief

macOS bootstrap repo driven by `setup.sh` + versioned config files in `config/`.

## Goals
- One-command baseline machine setup (`setup.sh`).
- Keep terminal/editor/keyboard configs in git (`config/ghostty`, `config/karabiner`, `config/starship`, `config/vscode`).
- Prefer idempotent checks when possible (skip if already installed/configured).

## Scope Boundaries
- macOS only.
- No full infra management (Nix/Ansible) and no full test harness.

## Key Files
- `setup.sh`
- `config/ghostty/config`
- `config/karabiner/karabiner.json`
- `config/starship/starship.toml`
- `config/vscode/keybindings.json`
