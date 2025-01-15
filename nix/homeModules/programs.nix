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

  # Unconfigured Packages
  aria2.enable = true;
  # atuin.enable = true;
  bat.enable = true;
  fastfetch.enable = true;
  fd.enable = true;
  fzf.enable = true;
  git.enable = true;
  zoxide.enable = true;
}