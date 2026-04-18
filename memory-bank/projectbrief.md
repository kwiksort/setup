# Project Brief

## Project Summary
This repository (`/Users/julien/Library/Mobile Documents/com~apple~CloudDocs/dev/setup`) is a macOS workstation bootstrap and configuration repo centered on `setup.sh` plus reusable app config assets under `config/`.

## Primary Goals
- Provide a mostly one-command baseline machine setup via `setup.sh`.
- Keep core tool configuration versioned in this repo (`config/ghostty`, `config/karabiner`, `config/starship`, `config/VSCode`).
- Preserve idempotent behavior where possible (skip already-installed tools/config entries rather than breaking existing environments).
- Support a French PC external keyboard workflow on macOS through Karabiner mappings.

## Out of Scope
- Full declarative system management (Nix, Ansible, etc.).
- Cross-platform provisioning (Linux/Windows); this repo is macOS-focused.
- Managing every app preference file on the machine.
- Automated test harness for interactive installer behavior.

## Repository Layout
- `setup.sh`: main bootstrap script (Homebrew, casks, fonts, Ghostty/Starship setup, shell alias/init).
- `config/ghostty/config`: Ghostty user config template used for copy into `~/Library/Application Support/com.mitchellh.ghostty/config`.
- `config/karabiner/karabiner.json`: current Karabiner profile with integrated rule set.
- `config/karabiner/mx_keys_fr_pc_rules.json`: focused MX Keys FR-PC complex modification rule definitions.
- `config/starship/starship.toml`: minimal Starship prompt config (`format = '$all'`).
- `config/VSCode/keybindings.json`: source keybindings applied by `setup.sh` to VS Code user config.

## Operational Context
The repository is used during new machine setup and later for iterative refinement of personal developer environment defaults. Current behavior prioritizes practicality over full strict idempotency; many operations are conditionally skipped, but some install/update actions still execute each run (for example `brew update && brew upgrade` when Homebrew is present).
