#!/bin/bash
# Primarily For use in VSCode devcontainers

# Set temporary settings for config locations before linking
#export XDG_CONFIG_HOME=~/.config
#export USER_CONFIG=~/.dotfiles


# Shells
#ln -s ~/.dotfiles/shells/zsh/zshrc ~/.zshrc
#ln -s ~/.dotfiles/shells/zsh ~/.config/zsh
#ln -s ~/.dotfiles/shells/fish/config.fish ~/.config/fish/config.fish
#ln -s ~/.dotfiles/shells/fish/conf.d ~/.config/fish/conf.d

# Terminals
#ln -s ~/.dotfiles/terminals/starship ~/.config/starship
#ln -s ~/.dotfiles/terminals/tmux.conf ~/.tmux.conf

# Utils
#ln -s ~/.dotfiles/utils/aerospace ~/.config/aerospace
#ln -s ~/.dotfiles/utils/nvim ~/.config/nvim
#ln -s ~/.dotfiles/utils/peazip ~/.config/peazip
#ln -s ~/.dotfiles/utils/yazi/keymap.toml ~/.config/yazi/keymap.toml
#ln -s ~/.dotfiles/utils/yazi/package.toml ~/.config/yazi/package.toml
#ln -s ~/.dotfiles/utils/yazi/theme.toml ~/.config/yazi/theme.toml
#ln -s ~/.dotfiles/utils/yazi/yazi.toml ~/.config/yazi/yazi.toml
#ln -s ~/.dotfiles/utils/bat ~/.config/bat

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
  ["$HOME/.dotfiles/terminals/starship"]="$HOME/.config/starship"
  ["$HOME/.dotfiles/terminals/tmux.conf"]="$HOME/.tmux.conf"
  
  # Utils

  ["$HOME/.dotfiles/utils/nvim"]="$HOME/.config/nvim"
  ["$HOME/.dotfiles/utils/peazip"]="$HOME/.config/peazip"
  ["$HOME/.dotfiles/utils/yazi/keymap.toml"]="$HOME/.config/yazi/keymap.toml"
  ["$HOME/.dotfiles/utils/yazi/package.toml"]="$HOME/.config/yazi/package.toml"
  ["$HOME/.dotfiles/utils/yazi/theme.toml"]="$HOME/.config/yazi/theme.toml"
  ["$HOME/.dotfiles/utils/yazi/yazi.toml"]="$HOME/.config/yazi/yazi.toml"
  ["$HOME/.dotfiles/utils/bat"]="$HOME/.config/bat"


  # Environment Variables
  ["$HOME/.dotfiles/shells/environment_variables.sh"]="$HOME/.config/env.sh"
)

# Create symbolic links
for src in "${!links[@]}"; do
  ln -s $src ${links[$src]}
  echo $src
done