# Main Home Manager Config
{ pkgs, config, ... }:

{
  # Home Manager Program Management 
  programs = import ./homeModules/programs.nix { inherit pkgs config; };
  
  # Do not change this!
  home = {
    stateVersion = "23.05";

    # List of packages to be installed/managed by HM
    packages = with pkgs; [ 
        # Fish Plugins
        fishPlugins.tide
        fishPlugins.bass
        fishPlugins.pisces
        fishPlugins.sponge

        # Bat Extras
        bat-extras.batgrep
        bat-extras.batdiff
        bat-extras.batman
        bat-extras.batpipe
        bat-extras.batwatch
        bat-extras.prettybat

        # Utilities
        wget2
    ];
    
    # Dotfile Management
    file = {
      # Shells
      #".zshrc".source = config.lib.file.mkOutOfStoreSymlink ../shells/zsh/zshrc;
      #".config/zsh".source = config.lib.file.mkOutOfStoreSymlink ../shells/zsh;
      #".config/fish/config.fish".source = config.lib.file.mkOutOfStoreSymlink ../shells/fish/config.fish;
      #".config/fish/conf.d".source = config.lib.file.mkOutOfStoreSymlink ../shells/fish/conf.d;
      #".bashrc".source = config.lib.file.mkOutOfStoreSymlink ../shells/bash/bashrc;
      #".bash_profile".source = config.lib.file.mkOutOfStoreSymlink ../shells/bash/bash_profile;
      #".config/nushell".source = config.lib.file.mkOutOfStoreSymlink ../shells/nushell;
      #".config/env.sh".source = config.lib.file.mkOutOfStoreSymlink ../shells/environment_variables.sh;


      # Terminals
      #".wezterm.lua".source = ../terminals/wezterm.lua;
      #".tmux.conf".source = ../terminals/tmux.conf;
      #".config/ghostty".source = ../terminals/ghostty;
      #".config/starship".source = ../terminals/starship;

      # Utils
      #".config/1Password".source = ../utils/1Password;
      #".config/aerospace".source = ../utils/aerospace;
      #".config/nvim".source = ../utils/nvim;
      #".config/peazip".source = ../utils/peazip;
      #".config/yazi/keymap.toml".source = ../utils/yazi/keymap.toml;
      #".config/yazi/package.toml".source = ../utils/yazi/package.toml;
      #".config/yazi/theme.toml".source = ../utils/yazi/theme.toml;
      #".config/yazi/yazi.toml".source = ../utils/yazi/yazi.toml;
      #".config/bat".source = ../utils/bat;
    };

    # Environment Variables
    sessionVariables = { 
      HOSTNAME="$(hostname)";
      XDG_CONFIG_HOME="$HOME/.config"; # XDG Config
      XDG_DATA_HOME="$HOME/.local/share"; # XDG Data
      XDG_CACHE_HOME="$HOME/.cache"; # XDG Cache
      CONFIG="$HOME/.config";

      # Dotfiles
      DOTFILES="$HOME/.dotfiles";
      DOT_NIX="$DOTFILES/nix";
      DOT_SHELL="$DOTFILES/shells";
      DOT_TERMINAL="$DOTFILES/terminals";
      DOT_UTILS="$DOTFILES/utils";

      #EDITOR=code-insiders;
    };
  };
}