# For use in VSCode devcontainers

ln -s ~/.dotfiles/shells/zsh/zshrc ~/.zshrc
ln -s ~/.config/zsh ~/.dotfiles/shells/zsh
ln -s ~/.config/fish/config.fish ~/.dotfiles/shells/fish/config.fish
ln -s ~/.config/fish/conf.d ~/.dotfiles/shells/fish/conf.d

ln -s ~/.config/starship ~/.dotfiles/terminals/starship
ln -s ~/.dotfiles/terminals/tmux.conf ~/.tmux.conf
# MACOS Only
# "Library/Application Support/com.mitchellh.ghostty/config".source = ../terminals/ghostty.conf;
    ".config/starship".source = ../terminals/starship;

ln -s ~/.config/aerospace ~/.dotfiles/utils/aerospace
ln -s ~/.config/nvim ~/.dotfiles/utils/nvim
ln -s ~/.config/peazip ~/.dotfiles/utils/peazip
ln -s ~/.config/yazi/keymap.toml ~/.dotfiles/utils/yazi/keymap.toml
ln -s ~/.config/yazi/package.toml ~/.dotfiles/utils/yazi/package.toml
ln -s ~/.config/yazi/theme.toml ~/.dotfiles/utils/yazi/theme.toml
ln -s ~/.config/yazi/yazi.toml ~/.dotfiles/utils/yazi/yazi.toml
ln -s ~/.config/bat ~/.dotfiles/utils/bat