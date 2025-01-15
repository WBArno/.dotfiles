# Configuration for Zsh Shell
{pkgs, ... }:

{
  # Enable Zsh Shell
  enable = true;
  enableCompletion = true;
  autosuggestion.enable = true;
  syntaxHighlighting.enable = true;
  plugins = with pkgs; [ 
    # zsh-powerlevel10k # Powerline Theme for Zsh
  ];
  shellAliases = { };
  initExtra = ''
    # Enable Homebrew Commands
    eval "$(/opt/homebrew/bin/brew shellenv)"
    # Enable Batpipe
    eval "$(batpipe)"
    # Enable Powerlevel10k Theme
    source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
    source ~/.dotfiles/shells/zsh/p10k.zsh
    # Enable iTerm2 Shell Integration
    source ~/.iterm2_shell_integration.zsh
    '';
}
    