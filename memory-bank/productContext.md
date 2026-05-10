# Product Context

Operator: single developer maintaining a personal macOS setup.

## Main Workflows
- Run `setup.sh` for machine bootstrap (Homebrew, casks, fonts, shell/tool setup).
- Apply keyboard mappings via `config/karabiner/karabiner.json`.
- Apply VS Code keybindings from `config/vscode/keybindings.json`.
- Keep repo configs as source of truth for re-install/refresh.

## Success Signals
- `setup.sh` runs on macOS without manual recovery steps.
- Re-runs are mostly safe (guards for Starship init, alias, fonts, RTK).
- Terminal/editor/keyboard behavior is consistent across machines.

## Known Friction
- Network + installer variability (`brew`, `curl`, `unzip`).
- Not fully deterministic (`brew update && brew upgrade`).
