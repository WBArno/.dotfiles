# Configuration for Fish Shell
{pkgs, ...}:

{
  # Enable Fish Shell
  enable = true;
  plugins = with pkgs.fishPlugins; [
    #tide # P10k for Fish
    #bass # Bash compatibility util
    #pisces # Fish Paired Symbols
    #sponge # Fish history cleaner
  ];
  generateCompletions = true;
  shellAliases = { };
  interactiveShellInit = ''
    # Enable Homebrew Commands
    eval "$(/opt/homebrew/bin/brew shellenv)"
    # Enable Batpipe
    eval (batpipe)
  '';
}