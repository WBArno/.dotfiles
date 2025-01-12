#!/bin/bash
# Primarily For use in VSCode devcontainers

# Set temporary settings for config locations before linking
#export XDG_CONFIG_HOME=~/.config
#export USER_CONFIG=~/.dotfiles


# Shells
#ln -s $USER_CONFIG/shells/zsh/zshrc ~/.zshrc
#ln -s $USER_CONFIG/shells/zsh $XDG_CONFIG_HOME/zsh
#ln -s $USER_CONFIG/shells/fish/config.fish $XDG_CONFIG_HOME/fish/config.fish
#ln -s $USER_CONFIG/shells/fish/conf.d $XDG_CONFIG_HOME/fish/conf.d

# Terminals
#ln -s $USER_CONFIG/terminals/starship $XDG_CONFIG_HOME/starship
#ln -s $USER_CONFIG/terminals/tmux.conf ~/.tmux.conf

# Utils
#ln -s $USER_CONFIG/utils/aerospace $XDG_CONFIG_HOME/aerospace
#ln -s $USER_CONFIG/utils/nvim $XDG_CONFIG_HOME/nvim
#ln -s $USER_CONFIG/utils/peazip $XDG_CONFIG_HOME/peazip
#ln -s $USER_CONFIG/utils/yazi/keymap.toml $XDG_CONFIG_HOME/yazi/keymap.toml
#ln -s $USER_CONFIG/utils/yazi/package.toml $XDG_CONFIG_HOME/yazi/package.toml
#ln -s $USER_CONFIG/utils/yazi/theme.toml $XDG_CONFIG_HOME/yazi/theme.toml
#ln -s $USER_CONFIG/utils/yazi/yazi.toml $XDG_CONFIG_HOME/yazi/yazi.toml
#ln -s $USER_CONFIG/utils/bat $XDG_CONFIG_HOME/bat

#!/bin/bash
# Primarily For use in VSCode devcontainers

# Set temporary settings for config locations before linking
export XDG_CONFIG_HOME=~/.config
export USER_CONFIG=~/.dotfiles

# Find hostname for conditional exports
export HOSTNAME=$(hostname)


# Declare an associative array for the links
declare -A links=(
  # Shells
  ["$USER_CONFIG/shells/zsh/zshrc"]="~/.zshrc"
  ["$USER_CONFIG/shells/zsh"]="$XDG_CONFIG_HOME/zsh"
  ["$USER_CONFIG/shells/fish/config.fish"]="$XDG_CONFIG_HOME/fish/config.fish"
  ["$USER_CONFIG/shells/fish/conf.d"]="$XDG_CONFIG_HOME/fish/conf.d"
  
  # Terminals
  ["$USER_CONFIG/terminals/starship"]="$XDG_CONFIG_HOME/starship"
  ["$USER_CONFIG/terminals/tmux.conf"]="~/.tmux.conf"
  
  # Utils
  ["$USER_CONFIG/utils/aerospace"]="$XDG_CONFIG_HOME/aerospace"
  ["$USER_CONFIG/utils/nvim"]="$XDG_CONFIG_HOME/nvim"
  ["$USER_CONFIG/utils/peazip"]="$XDG_CONFIG_HOME/peazip"
  ["$USER_CONFIG/utils/yazi/keymap.toml"]="$XDG_CONFIG_HOME/yazi/keymap.toml"
  ["$USER_CONFIG/utils/yazi/package.toml"]="$XDG_CONFIG_HOME/yazi/package.toml"
  ["$USER_CONFIG/utils/yazi/theme.toml"]="$XDG_CONFIG_HOME/yazi/theme.toml"
  ["$USER_CONFIG/utils/yazi/yazi.toml"]="$XDG_CONFIG_HOME/yazi/yazi.toml"
  ["$USER_CONFIG/utils/bat"]="$XDG_CONFIG_HOME/bat"

  # Environment Variables
  ["$USER_CONFIG/shells/environment_variables.sh"]="$XDG_CONFIG_HOME/env.zsh"
)

# Create symbolic links
for src in "${!links[@]}"; do
  ln -s "$src" "${links[$src]}"
done