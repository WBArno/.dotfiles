export HOSTNAME=$(hostname)
export XDG_CONFIG_HOME=$HOME/.config # XDG Config
export XDG_DATA_HOME=$HOME/.local/share # XDG Data
export XDG_CACHE_HOME=$HOME/.cache # XDG Cache
export DOTFILES=$HOME/.dotfiles
export CONFIG=$HOME/.config

# Volumes
export VOLUMES_DIR=/Volumes
export CACHE=$VOLUMES_DIR/Cache
export DATA=$VOLUMES_DIR/Data
export DEVELOPER=$VOLUMES_DIR/Developer

# SubDotfiles
export DOT_SHELL=$DOTFILES/shells
export DOT_TERMINAL=$DOTFILES/terminals
export DOT_UTILS=$DOTFILES/utils

export SSH_AUTH_SOCK=$HOME/.1password/agent.sock # 1Password SSH Agent
export EDITOR=code-insiders # Default Editor