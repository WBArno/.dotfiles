# Packages to be Installed and Managed by Home Manager
{ pkgs, ... }:

{
  # Allow Home Manager to Install Itself
  home-manager.enable = true;

  # Configured Packages
  fish = import ./fish.nix { inherit pkgs; }; # Fish Shell
  zsh = import ./zsh.nix { inherit pkgs; }; # Zsh Shell
  eza = { # Better ls
    enable = true;
    colors = "auto";
    enableNushellIntegration = true;
    icons = "auto";
  };
  bat = { # Better Cat
    enable = true;
    extraPackages = with pkgs.bat-extras; [
      batdiff # Diff with bat
      batman # Man with bat
      batpipe # Pipe with bat
      batgrep # Grep with bat
      batwatch # Watch with bat
      prettybat # Pretty print with bat
    ];
    config = {
      theme = "Nord";
    };
  };
  gh = { # Github CLI
      enable = true;
      gitCredentialHelper.enable = true;
      settings.editor = "code-insiders";
      extensions = with pkgs; [
        gh-copilot
        gh-notify
        gh-screensaver
        gh-dash
      ];
    };
  yazi = { # Another Terminal File Browser
    enable = true;
    #flavors = pkgs.catppuccin;
  };
  aria2 = { # Aria2 Download Manager
    enable = true;
    settings = {
      # downloadDir = "/Users/will/Library/Mobile Documents/com~apple~CloudDocs/Downloads";
      max-concurrent-downloads = 16;
      max-connection-per-server = 4;
      split = 16;
      uri-selector = "adaptive";
      file-allocation = "falloc";
    };
  };
  # Unconfigured Packages
  # atuin.enable = true;
  btop.enable = true; # Better Top
  fastfetch.enable = true; # NeoFetch 2.0
  fd.enable = true; # Find CLI
  fzf.enable = true; # Fuzzy Finder
  git.enable = true; # Git CLI
  lazygit.enable = true; # Git TUI
  navi.enable = true; # Interactive Cheatsheet
  ripgrep.enable = true; # Better Grep
  thefuck.enable = true; # Correct Mistyped Commands
  yt-dlp.enable = true; # YouTube Downloader
  zoxide.enable = true; # Directory Jumper
}