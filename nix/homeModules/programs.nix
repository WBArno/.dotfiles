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
      continue = "true";
      max-concurrent-downloads = 8;
      max-connection-per-server = 16;
      split = 10;
      #min-split-size = "2048M";
      uri-selector = "adaptive";
      file-allocation = "falloc";
      max-tries = "10";
      timeout = "600";
    };
  };
yt-dlp = { # YouTube Downloader
    enable = true;
    settings = {
      downloadDir = "/Users/will/Library/Mobile Documents/com~apple~CloudDocs/Downloads";
      downloader = "aria2c";
      format = "bestvideo+bestaudio/best";
      merge-output-format = "mkv";
      output = "%(title)s.%(ext)s";
      sponsorblock-mark = "all";
      sponsorblock-remove = "sponsor, selfpromo, interaction, music_offtopic";
    };
  };
wezterm = { # Terminal Emulator
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    extraConfig = ''
      local wezterm = require 'wezterm'
      local config = wezterm.config_builder()

      require("wuake").setup {
        config = config,
      }
      
      return {
        adjust_window_size_when_changing_font_size = false,
        -- color_scheme = "Nord",
        color_scheme = "Catppuccin Macciatto",
        enable_tab_bar = true,
        font_size = 16.0,
        font = wezterm.font("Operator Mono SSm"),
        macos_window_background_blur = 40,

        window_background_opacity = 0.78,

        window_decorations = 'RESIZE',

        mouse_bindings = {
          -- Ctrl-click will open the link under the mouse cursor
          {
            event = { Up = { streak = 1, button = 'Left' } },
            mods = 'CTRL',
            action = wezterm.action.OpenLinkAtMouseCursor,
          },
        },
      }
  '';
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
  zoxide.enable = true; # Directory Jumper
  tmux.enable = true; # Terminal Multiplexer
}