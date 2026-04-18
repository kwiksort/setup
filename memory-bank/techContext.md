# Tech Context

## Languages & Formats
- **Bash**: orchestration script (`setup.sh`).
- **JSON**: Karabiner config/rules (`config/karabiner/*.json`) and VS Code keybindings source (`config/VSCode/keybindings.json`).
- **TOML**: Starship config (`config/starship/starship.toml`).
- **Ghostty config format**: key/value settings in `config/ghostty/config`.
- **Markdown**: project memory-bank and planning docs.

## Tooling
- Homebrew (`brew`) for package/cask management.
- `curl` for remote installer/font downloads.
- `unzip` for Nerd Font archive extraction.
- Standard shell tools used in scripts: `grep`, `cp`, `mkdir`, `cmp`, `mktemp`, `trap`, `date`.

## Platform Constraints
- macOS-only file paths are embedded:
  - `~/Library/Application Support/com.mitchellh.ghostty/config`
  - `${HOME}/Library/Application Support/Code/User/keybindings.json`
  - `${HOME}/.config/karabiner/assets/complex_modifications/mx_keys_fr_pc_rules.json`
- Shell customization targets `~/.zshrc`.
- App selection and keyboard remapping assumptions are macOS app ecosystem specific.

## External Dependencies
- Homebrew install script: `https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh`
- Nerd Fonts IosevkaTerm archive:
  `https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/IosevkaTerm.zip`
- Homebrew casks in `setup.sh`:
  - `1password`, `1password-cli`, `aldente`, `alt-tab`, `betterdisplay`, `chatgpt`, `docker`, `ghostty`, `karabiner-elements`, `mos`, `stats`, `visual-studio-code`

## Known Gaps
- No dependency manifest (`Brewfile`) currently tracks package intent separately from script logic.
- No CI checks for shell linting, JSON validation, or config drift detection.
- `setup.sh` uses `#!/bin/bash` with `~` in paths; behavior is standard on macOS but not portability-oriented.
- No explicit rollback strategy for failed mid-run installation steps.
