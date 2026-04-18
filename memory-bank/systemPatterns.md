# System Patterns

## Architecture Pattern
The repository uses a **script + static-config** pattern:
- `setup.sh` orchestrates install/setup actions.
- `config/*` holds versioned configuration artifacts copied or applied to user-space paths.

This is intentionally lightweight and easy to run manually without additional orchestration frameworks.

## Configuration Strategy
- Source-of-truth configs are kept in repo subdirectories:
  - `config/ghostty/config`
  - `config/karabiner/karabiner.json`
  - `config/karabiner/mx_keys_fr_pc_rules.json`
  - `config/starship/starship.toml`
  - `config/VSCode/keybindings.json`
- Runtime user files are created/copied into macOS home library paths by scripts.
- `setup.sh` deploys `config/karabiner/mx_keys_fr_pc_rules.json` to
  `~/.config/karabiner/assets/complex_modifications/mx_keys_fr_pc_rules.json`.
- `setup.sh` copies `config/VSCode/keybindings.json` into `${HOME}/Library/Application Support/Code/User/keybindings.json` with backup support.

## Idempotency Pattern
`setup.sh` follows defensive checks before mutating state:
- Checks `command -v brew` before install path.
- Checks Starship installation with `command -v starship`.
- Uses `grep -Fxq` before appending lines to `~/.zshrc` (`eval "$(starship init zsh)"`, alias `ll`).
- Checks font directory and existing `.ttf` files before re-downloading.
- Checks Ghostty config path existence before copying default config.
- Compares Karabiner rules source/destination with `cmp -s`, skips when identical, and creates timestamped backup before overwriting changes.

Partial non-idempotent areas remain by design:
- When Homebrew already exists, script still runs `brew update && brew upgrade`.
- Cask install command may still trigger package-level updates depending on brew state.

## Environment Assumptions
- Host OS is macOS (paths and app targets are macOS-specific).
- Default shell context supports Bash script execution.
- Operator has permissions/network access to install Homebrew casks and download fonts.
- User home directory conventions (`$HOME`, `~/Library/...`, `~/.config`) are available.

## Risk Areas
- External URLs (Homebrew install script and Nerd Fonts release asset) can change or fail.
- App bundle identifiers and key codes in Karabiner rules may need updates with app/OS changes.
- Running bootstrap on pre-customized machines can create drift between repo templates and local files.
- JSON/TOML config validation is mostly implicit (no CI linter in repo).
