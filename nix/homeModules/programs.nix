# Packages to be Installed and Managed by Home Manager
{ pkgs, config, ... }:

{
  # Allow Home Manager to Install Itself
  home-manager.enable = true;

  # Configured Packages
  fish = import ./fish.nix { inherit pkgs config; };

  # Unconfigured Packages
  aria2.enable = true;
  atuin.enable = true;
  bat.enable = true;
  fastfetch.enable = true;
  fd.enable = true;
  fzf.enable = true;
  git.enable = true;
  zoxide.enable = true;
}