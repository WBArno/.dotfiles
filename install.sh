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
export XDG_CONFIG_HOME=~/.config
export USER_CONFIG=~/.dotfiles

# Find hostname for conditional exports
HOSTNAME=$(hostname)
# Using Switch for easier expandability to other hosts
case "$HOSTNAME" in
    'MacBookPro.local') # Macbook Pro
        ln -s "~/.dotfiles/utils/vscode/insiders-user-settings.json" "~/Library/Application Support/Code - Insiders/User/settings.json"
        ln -s "~/.dotfiles/utils/aerospace" "~/.config/aerospace"
        ;;
    *) # Linux
        ln -s "~/.dotfiles/utils/vscode/insiders-user-settings.json" "~/.config/Code - Insiders/User/settings.json"
        ;;
esac


# Declare an associative array for the links
declare -A links=(
  # Shells
  ["~/.dotfiles/shells/zsh/zshrc"]="~/.zshrc"
  ["~/.dotfiles/shells/zsh"]="~/.config/zsh"
  ["~/.dotfiles/shells/fish/config.fish"]="~/.config/fish/config.fish"
  ["~/.dotfiles/shells/fish/conf.d"]="~/.config/fish/conf.d"
  
  # Terminals
  ["~/.dotfiles/terminals/starship"]="~/.config/starship"
  ["~/.dotfiles/terminals/tmux.conf"]="~/.tmux.conf"
  
  # Utils

  ["~/.dotfiles/utils/nvim"]="~/.config/nvim"
  ["~/.dotfiles/utils/peazip"]="~/.config/peazip"
  ["~/.dotfiles/utils/yazi/keymap.toml"]="~/.config/yazi/keymap.toml"
  ["~/.dotfiles/utils/yazi/package.toml"]="~/.config/yazi/package.toml"
  ["~/.dotfiles/utils/yazi/theme.toml"]="~/.config/yazi/theme.toml"
  ["~/.dotfiles/utils/yazi/yazi.toml"]="~/.config/yazi/yazi.toml"
  ["~/.dotfiles/utils/bat"]="~/.config/bat"


  # Environment Variables
  ["~/.dotfiles/shells/environment_variables.sh"]="~/.config/env.sh"
)

# Create symbolic links
for src in "${!links[@]}"; do
  ln -s "$src" "${links[$src]}"
done