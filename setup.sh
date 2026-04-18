#!/bin/bash

mkdir -p ~/.config

# Setup Homebrew
if command -v brew >/dev/null 2>&1; then
  echo "Homebrew is already installed. Updating to the latest version..."
  brew update && brew upgrade
else
  echo "Homebrew is not installed. Installing..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Setup Casks
brew install --cask \
    1password 1password-cli \
    aldente \
    alt-tab \
    betterdisplay \
    chatgpt \
    docker \
    ghostty \
    karabiner-elements \
    mos \
    stats \
    visual-studio-code

# Setup Karabiner
cp config/karabiner/karabiner.json $HOME/.config/karabiner/karabiner.json

# Setup VS Code keybindings
VSCODE_KEYBINDINGS_SRC="config/VSCode/keybindings.json"
VSCODE_KEYBINDINGS_DEST="$HOME/Library/Application Support/Code/User/keybindings.json"
VSCODE_KEYBINDINGS_DIR="$(dirname "$VSCODE_KEYBINDINGS_DEST")"

if [ -f "$VSCODE_KEYBINDINGS_SRC" ]; then
  mkdir -p "$VSCODE_KEYBINDINGS_DIR"

  if [ -f "$VSCODE_KEYBINDINGS_DEST" ] && cmp -s "$VSCODE_KEYBINDINGS_SRC" "$VSCODE_KEYBINDINGS_DEST"; then
    echo "VS Code keybindings already up to date. Skipping copy."
  else
    if [ -f "$VSCODE_KEYBINDINGS_DEST" ]; then
      VSCODE_KEYBINDINGS_BACKUP="${VSCODE_KEYBINDINGS_DEST}.backup.$(date +%Y%m%d-%H%M%S)"
      cp "$VSCODE_KEYBINDINGS_DEST" "$VSCODE_KEYBINDINGS_BACKUP"
      echo "VS Code keybindings backup created: $VSCODE_KEYBINDINGS_BACKUP"
    fi

    cp "$VSCODE_KEYBINDINGS_SRC" "$VSCODE_KEYBINDINGS_DEST"
    echo "Installed VS Code keybindings to: $VSCODE_KEYBINDINGS_DEST"
  fi
else
  echo "VS Code keybindings source not found: $VSCODE_KEYBINDINGS_SRC"
fi

# Setup fonts
FONT_DIR=~/Library/Fonts/IosevkaTerm
ZIP_FILE=/tmp/IosevkaTerm.zip

if [ -d "$FONT_DIR" ] && ls "$FONT_DIR"/*.ttf >/dev/null 2>&1; then
  echo "IosevkaTerm fonts already installed. Skipping download and installation."
else
  echo "Installing IosevkaTerm fonts..."
  mkdir -p "$FONT_DIR"
  curl -L https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/IosevkaTerm.zip -o "$ZIP_FILE"
  unzip -o "$ZIP_FILE" -d "$FONT_DIR"
  echo "Installation complete."
fi

# Setup Ghostty
GHOSTTY_CONFIG_DIR=~/Library/Application\ Support/com.mitchellh.ghostty
GHOSTTY_CONFIG=config/ghostty/config
if [ -d "$GHOSTTY_CONFIG_DIR" ] && ls "$GHOSTTY_CONFIG_DIR"/config >/dev/null 2>&1; then
  echo "Ghostty config already exist. Skipping creation of the default config."
else
    mkdir -p "$GHOSTTY_CONFIG_DIR"
    cp "$GHOSTTY_CONFIG" "$GHOSTTY_CONFIG_DIR/config"
fi

# Setup Starship
if command -v starship >/dev/null 2>&1; then
  echo "Starship is already installed. Skipping installation."
else
  echo "Installing Starship prompt..."
  curl -sS https://starship.rs/install.sh | sh
  cp config/starship/starship.toml ~/.config/starship.toml
fi

ZSHRC="$HOME/.zshrc"
INIT_LINE='eval "$(starship init zsh)"'

if grep -Fxq "$INIT_LINE" "$ZSHRC"; then
  echo "Starship is already initialized in $ZSHRC. Skipping."
else
  echo "Adding Starship init to $ZSHRC..."
  echo -e "\n# Initialize Starship prompt\n$INIT_LINE" >> "$ZSHRC"
  echo "Done. Please restart your terminal or run: source $ZSHRC"
fi

ALIAS_LINE="alias ll='ls -laG'"

if grep -Fxq "$ALIAS_LINE" "$ZSHRC"; then
  echo "Alias 'll' already defined in $ZSHRC. Skipping."
else
  echo "Adding alias 'll' to $ZSHRC..."
  echo -e "\n# Add ll alias\n$ALIAS_LINE" >> "$ZSHRC"
  echo "Done. Please restart your terminal or run: source $ZSHRC"
fi
