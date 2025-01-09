#
## Aliases
#

alias ls="eza --icons=always" # Eza (Better ls)
alias cd=z                    # ZOxide (Better cd)
alias code=code-insiders      # VSCode (Standardizing)
alias aria=aria2c
alias wget=wget2
alias 7z=7zz                  # 7Zip (Standardizing)
# Ties tailscale to cli element embedded in .app file
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
# Foreground ClamAV scan
alias clamav="/opt/homebrew/opt/clamav/sbin/clamd --foreground"
# Make nix less annoying to rebuild
alias nix-rebuild='darwin-rebuild switch --flake ~/.dotfiles/nix/charon'
alias nrb=nix-rebuild