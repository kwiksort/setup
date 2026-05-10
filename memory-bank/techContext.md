# Tech Context

## Stack
- Bash: `setup.sh`
- JSON: `config/karabiner/karabiner.json`, `config/vscode/keybindings.json`
- TOML: `config/starship/starship.toml`
- Ghostty config: `config/ghostty/config`

## Tools Used by Setup
- `brew`, `curl`, `unzip`, `grep`, `cmp`, `cp`, `mkdir`, `date`

## Platform
- macOS-specific paths in `~/Library/...` and `~/.config/...`
- Shell target: `~/.zshrc`

## Notable Caveat
- `setup.sh` references `config/VSCode/keybindings.json` while repo path is `config/vscode/keybindings.json` (works on default case-insensitive macOS, not case-portable).
