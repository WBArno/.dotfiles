{ pkgs, ... }:

{
  # Let HM install itself
  programs.home-manager.enable = true;
  
  # Do not change this!
  home.stateVersion = "23.05";

  # List of packages to be installed/managed by HM
  home.packages = with pkgs; [
    aria2
    fastfetch
  ];

  # ZSH Config
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
  };

  # Environment Variables
  home.sessionVariables = {
    EDITOR = "nvim";
  };
}