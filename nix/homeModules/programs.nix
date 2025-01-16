# Packages to be Installed and Managed by Home Manager
{ pkgs, ... }:

{
  # Allow Home Manager to Install Itself
  home-manager.enable = true;

  # Configured Packages
  fish = import ./fish.nix { inherit pkgs; };
  zsh = import ./zsh.nix { inherit pkgs; };
  eza = {
    enable = true;
    colors = "auto";
    enableNushellIntegration = true;
    icons = "auto";
  };
  bat = {
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
  yazi = {
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