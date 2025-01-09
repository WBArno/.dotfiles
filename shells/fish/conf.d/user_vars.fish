# Fix broken Nix PATH
fish_add_path /Users/will/.nix-profile/bin /run/current-system/sw/bin /etc/profiles/per-user/will/bin /nix/var/nix/profiles/default/bin

# Set the default editor to Neovim
export EDITOR=nvim