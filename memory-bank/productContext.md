# Product Context

## User/Operator
Primary operator is a developer maintaining a personal macOS environment and reusing this repository to bootstrap fresh machines quickly with consistent terminal, editor, and keyboard behavior.

## Core Workflows
1. **Initial machine bootstrap**
   - Run `setup.sh` to install/update Homebrew and install key GUI apps (`1password`, `docker`, `ghostty`, `karabiner-elements`, `visual-studio-code`, etc.).
2. **Terminal baseline setup**
   - Ensure Starship is installed and initialized in `~/.zshrc` from `setup.sh` and `config/starship/starship.toml`.
3. **Keyboard behavior standardization**
   - Use `config/karabiner/karabiner.json` for MX Keys FR-PC mappings on macOS.
4. **VS Code shortcuts alignment**
   - `setup.sh` copies `config/vscode/keybindings.json` to VS Code user settings path automatically to align keybindings with Windows muscle memory.
5. **Config synchronization**
   - Keep repo-stored configs as source of truth; copy/apply them when rebuilding or refining setup.

## Success Criteria
- Running `setup.sh` on macOS results in required apps and baseline shell/tooling available without manual deep debugging.
- Re-running setup is safe enough for iterative updates (especially for Starship init and alias lines in `~/.zshrc`).
- Keyboard mappings support expected MX Keys FR-PC behavior for navigation and common shortcuts.
- VS Code keybindings can be applied reproducibly with backup support.

## Pain Points
- Some steps are network-dependent and interactive (`Homebrew` install path, `curl` + `unzip` for fonts).
- Setup is mostly idempotent but not strictly deterministic due to `brew update && brew upgrade` side effects.
- Ghostty config copy logic in `setup.sh` is existence-based and does not merge/refresh changed templates automatically.
- No automated verification suite currently checks end-to-end setup outcomes.

## Usage Frequency
- High during new machine onboarding.
- Medium for occasional environment refreshes and config tweaks.
- Low for day-to-day runtime (most files are static once applied).
