#!/bin/sh
# For use in VSCode devcontainers

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
  ["$HOME/.dotfiles/utils/dev-container/.gitconfig"]="$HOME/.gitconfig"
)

# Create symbolic links
for src in "${!links[@]}"; do
  ln -s $src ${links[$src]}
  echo $src
done