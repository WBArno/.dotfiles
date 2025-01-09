{ pkgs, ... }:

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
    ".zshrc".source = ../shells/zsh/.zshrc;
    ".zshenv".source = ../shells/zsh/.zshenv;
    ".config/zsh".source = ../shells/zsh;
    ".config/fish".source = ../shells/fish;

    # Utils
    
  };
  
  # Environment Variables
  home.sessionVariables = {
    EDITOR = "nvim";
    SSH_AUTH_SOCK = "$HOME/.1password/agent.sock";
  };
}