#!/bin/bash
# Primarily For use in VSCode devcontainers

# Set temporary settings for config locations before linking
export XDG_CONFIG_HOME=$HOME/.config
export USER_CONFIG=$HOME/.dotfiles

# Find hostname for conditional exports
HOSTNAME=$(hostname)
# Using Switch for easier expandability to other hosts
case "$HOSTNAME" in
    'charon') # Macbook Pro
        ln -s "$HOME/.dotfiles/utils/vscode/insiders-user-settings.json" "$HOME/Library/Application Support/Code - Insiders/User/settings.json"
        ln -s "$HOME/.dotfiles/utils/aerospace" "$HOME/.config/aerospace"
        ln -s "$HOME/.dotfiles/utils/1Password" "$HOME/.config/1Password"
        ;;
    *) # Linux
        ln -s "$HOME/.dotfiles/utils/vscode/insiders-user-settings.json" "$HOME/.config/Code - Insiders/User/settings.json"
        ;;
esac


# Declare an associative array for the links
declare -A links=(
  # Shells
  ["$HOME/.dotfiles/shells/zsh/zshrc"]="$HOME/.zshrc"
  ["$HOME/.dotfiles/shells/zsh"]="$HOME/.config/zsh"
  ["$HOME/.dotfiles/shells/fish/config.fish"]="$HOME/.config/fish/config.fish"
  ["$HOME/.dotfiles/shells/fish/conf.d"]="$HOME/.config/fish/conf.d"
  
  # Terminals
  ["$HOME/.dotfiles/terminals/tmux.conf"]="$HOME/.tmux.conf"
  
  # Utils
  ["$HOME/.dotfiles/utils/nvim"]="$HOME/.config/nvim"
  ["$HOME/.dotfiles/utils/peazip"]="$HOME/.config/peazip"
)

# Create symbolic links
for src in "${!links[@]}"; do
  ln -s $src ${links[$src]}
  echo $src
done