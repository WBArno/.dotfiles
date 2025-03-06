if status is-interactive
    # Commands to run in interactive sessions can go here
    eval "$(/opt/homebrew/bin/brew shellenv)"

    # Initialize zOxide
    zoxide init fish | source
    # Set up fzf key bindings
    fzf --fish | source
end

source ~/.config/env.sh
fish_add_path /Users/will/.local/bin #PipX
eval (batpipe)