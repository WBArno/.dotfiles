# Configuration for Zsh Shell
{pkgs, ... }:

{
  # Enable Zsh Shell
  enable = true;
  enableCompletion = true;
  autosuggestion.enable = true;
  syntaxHighlighting.enable = true;
  shellAliases = { };
  initExtra = ''
    # Enable Homebrew Commands
    eval "$(/opt/homebrew/bin/brew shellenv)"
    # Enable Batpipe
    eval "$(batpipe)"
    # Enable Powerlevel10k Theme
    source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
    source ~/.dotfiles/shells/zsh/p10k.zsh
    # Enable Copilot Aliases
    eval "$(gh copilot alias -- zsh)"
    '';
}
    