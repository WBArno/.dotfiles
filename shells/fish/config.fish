if status is-interactive
    # Commands to run in interactive sessions can go here
    eval "$(/opt/homebrew/bin/brew shellenv)"
    source ~/.iterm2_shell_integration.fish

    # Initialize zOxide
    zoxide init fish | source
    # Set up fzf key bindings
    fzf --fish | source
end

# Export Variables based on hostname
switch (hostname)
    case 'macbookpro.local'
        fish_add_path /Users/will/.nix-profile/bin /run/current-system/sw/bin /etc/profiles/per-user/will/bin /nix/var/nix/profiles/default/bin
    case 'steamdeck.local'
        set -x HOSTNAME steamdeck # Filler for now
    case '*'
        set -x HOSTNAME (hostname) # Filler for now
end


fish_add_path /Users/will/.local/bin #PipX


