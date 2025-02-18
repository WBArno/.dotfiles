# Main Home Manager Config
{ pkgs, config, ... }:

{
  # Home Manager Program Management 
  programs = import ./homeModules/programs.nix { inherit pkgs; };
  
  # Do not change this!
  home = {
    stateVersion = "23.05";

    # List of packages to be installed/managed by HM
    packages = with pkgs; [ 
        # Fish Plugins
        fishPlugins.tide # P10k-Style Shell
        fishPlugins.bass # Bash Wrapper for Fish
        fishPlugins.autopair # Paired Symbols
        fishPlugins.sponge # History Cleaning
        fishPlugins.fifc # FZF Completion
        fishPlugins.puffer # Text Expansions
        fishPlugins.github-copilot-cli-fish # Copilot Aliases
        babelfish # Bash translator utility

        # Zsh Plugins
        zsh-powerlevel10k

        # Utilities
        wget2
        nixd
        devenv

        # Fun
        cmatrix
    ];

    # Dotfile Management
    file = {
      # Terminals
      #".config/iterm2".source = config.lib.file.mkOutOfStoreSymlink ../terminals/iterm2;
      #".config/ghostty".source = config.lib.file.mkOutOfStoreSymlink ../terminals/ghostty;
      ".config/wezterm/wuake.lua".source =  ../terminals/wezterm/wuake.lua;
      
      # Utils
      #".config/1Password".source = config.lib.file.mkOutOfStoreSymlink ../utils/1Password;
      #".config/nvim".source = config.lib.file.mkOutOfStoreSymlink ../utils/nvim;
      #".config/peazip".source = config.lib.file.mkOutOfStoreSymlink ../utils/peazip;
    };

    # Directories to add to PATH
    sessionPath = [
      #"$HOME/.rd/bin" # Rancher Desktop
    ];

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

      EDITOR="code-insiders"; # Default Editor
    };

    # Shell Aliases
    shellAliases = {
      # Replaces ls with eza
      ls = "${pkgs.eza}/bin/eza --color=auto --icons=auto";
    
      # Replaces cd with zOxide
      cd = "z";

      # Makes aria/wget less annoying
      aria = "${pkgs.aria2}/bin/aria2c";
      wget = "${pkgs.wget2}/bin/wget2";

      # Foreground ClamAV scan
      clamav = "${pkgs.clamav}/bin/clamd --foreground";

      # Normalize VSCode Call
      code = "/usr/local/bin/code-insiders";

      # Use bat instead of cat or man
      cat = "${pkgs.bat}/bin/bat";
      man = "${pkgs.bat-extras.batman}/bin/batman";
      grep = "${pkgs.bat-extras.batgrep}/bin/batgrep";
      diff = "${pkgs.bat-extras.batdiff}/bin/batdiff";
      watch = "${pkgs.bat-extras.batwatch}/bin/batwatch";
      pretty = "${pkgs.bat-extras.prettybat}/bin/prettybat";
    };
  };
}