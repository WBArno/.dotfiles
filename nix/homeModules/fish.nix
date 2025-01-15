# Configuration for Fish Shell
{ ... }:

{
  # Enable Fish Shell
  enable = true;
  generateCompletions = true;
  shellAliases = { };
  interactiveShellInit = ''
    # Enable Homebrew Commands
    eval "$(/opt/homebrew/bin/brew shellenv)"
    # Enable Batpipe
    eval (batpipe)
  '';
}