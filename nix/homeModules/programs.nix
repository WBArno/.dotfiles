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

  # Unconfigured Packages
  aria2.enable = true;
  # atuin.enable = true;
  fastfetch.enable = true;
  fd.enable = true;
  fzf.enable = true;
  git.enable = true;
  ripgrep.enable = true;
  zoxide.enable = true;
}