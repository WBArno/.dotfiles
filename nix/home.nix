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
    ".config/zsh".source = ../shells/zsh;
    ".config/fish".source = ../shells/fish;

    # Utils
    ".config/1Password".source = ../utils/1Password;
    ".config/aerospace".source = ../utils/aerospace;
    ".config/nvim".source = ../utils/nvim;
    ".config/peazip".source = ../utils/peazip;
    ".config/yazi/keymap.toml".source = ../utils/yazi/keymap.toml;
    ".config/yazi/package.toml".source = ../utils/yazi/package.toml;
    ".config/yazi/theme.toml".source = ../utils/yazi/theme.toml;
    ".config/yazi/yazi.toml".source = ../utils/yazi/yazi.toml;
  };
  
  # Environment Variables
  home.sessionVariables = {
    EDITOR = "nvim";
    SSH_AUTH_SOCK = "$HOME/.1password/agent.sock";
  };
}