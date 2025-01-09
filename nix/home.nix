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
    ".zshrc".source = ~/.dotfiles/zsh/.zshrc;
    
  };
  
  # Environment Variables
  home.sessionVariables = {
    EDITOR = "nvim";
    SSH_AUTH_SOCK = "$HOME/.1password/agent.sock";
  };
}