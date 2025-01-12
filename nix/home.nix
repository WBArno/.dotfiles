{ pkgs, config, ... }:

{
  # Let HM install itself
  programs.home-manager.enable = true;
  
  # Do not change this!
  home.stateVersion = "23.05";

  # List of packages to be installed/managed by HM
  home.packages = with pkgs; [];
  
  # Dotfile Management
  home.file = {
    # Shells
    ".zshrc".source = config.lib.file.mkOutOfStoreSymlink ../shells/zsh/zshrc;
    ".config/zsh".source = config.lib.file.mkOutOfStoreSymlink ../shells/zsh;
    ".config/fish/config.fish".source = config.lib.file.mkOutOfStoreSymlink ../shells/fish/config.fish;
    ".config/fish/conf.d".source = config.lib.file.mkOutOfStoreSymlink ../shells/fish/conf.d;
    ".bashrc".source = config.lib.file.mkOutOfStoreSymlink ../shells/bash/bashrc;
    ".bash_profile".source = config.lib.file.mkOutOfStoreSymlink ../shells/bash/bash_profile;
    ".config/nushell".source = config.lib.file.mkOutOfStoreSymlink ../shells/nushell;
    ".config/env.sh".source = config.lib.file.mkOutOfStoreSymlink ../shells/environment_variables.sh;


    # Terminals
    ".wezterm.lua".source = ../terminals/wezterm.lua;
    ".tmux.conf".source = ../terminals/tmux.conf;
    ".config/ghostty".source = ../terminals/ghostty;
    ".config/starship".source = ../terminals/starship;

    # Utils
    ".config/1Password".source = ../utils/1Password;
    ".config/aerospace".source = ../utils/aerospace;
    ".config/nvim".source = ../utils/nvim;
    ".config/peazip".source = ../utils/peazip;
    ".config/yazi/keymap.toml".source = ../utils/yazi/keymap.toml;
    ".config/yazi/package.toml".source = ../utils/yazi/package.toml;
    ".config/yazi/theme.toml".source = ../utils/yazi/theme.toml;
    ".config/yazi/yazi.toml".source = ../utils/yazi/yazi.toml;
    ".config/bat".source = ../utils/bat;
  };
  
  # Environment Variables
  home.sessionVariables = { };
}