# Setting aliases for interactive sessions
if status is-interactive
    # Ties tailscale to cli element embedded in .app file
    alias tailscale "/Applications/Tailscale.app/Contents/MacOS/Tailscale"
    
    # Replaces ls with eza
    alias ls "eza --color=auto --icons=auto"
    
    # Replaces cd with zOxide
    alias cd z

    # Makes aria/wget less annoying
    alias aria aria2c
    alias wget wget2

    # Foreground ClamAV scan
    alias clamav '/opt/homebrew/opt/clamav/sbin/clamd --foreground'

    # Normalize VSCode Call
    alias code code-insiders

    # Make nix less annoying to rebuild
    alias nix-rebuild 'darwin-rebuild switch --flake ~/.dotfiles/nix/charon'
    alias nrb nix-rebuild

    # Use bat instead of cat or man
    alias cat bat
    alias man batman
    #alias grep batgrep
    #alias diff batdiff
    #alias watch batwatch
    alias pretty prettybat
end