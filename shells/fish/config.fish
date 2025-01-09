if status is-interactive
    # Commands to run in interactive sessions can go here
    eval "$(/opt/homebrew/bin/brew shellenv)"
    source ~/.iterm2_shell_integration.fish

    # Initialize zOxide
    zoxide init fish | source
    # Set up fzf key bindings
    fzf --fish | source
end

# Created by `pipx` on 2024-06-09 20:06:53
set PATH $PATH /Users/will/.local/bin

export EDITOR=nvim
