{pkgs, ...}:

{
    #
    ## Nix Settings
    #

    # Enable Nix Daemon
    services.nix-daemon.enable = true;

    # Necessary for using flakes on this system; why is this not default?
    nix.settings.experimental-features = "nix-command flakes";

    # FOSS-Only is Overrated
    nixpkgs.config.allowUnfree = true;

    # DO NOT CHANGE
    system.stateVersion = 4;

    # Host Architecture
    nixpkgs.hostPlatform = "aarch64-darwin";

    # Declare the user that will be running `nix-darwin`.
    users.users.will.home = "/Users/will";

    # Add Sudo TouchID Support
    security.pam.enableSudoTouchIdAuth = true;

    # Nix Package Optimization and Garbage Collection
    nix.optimise.automatic = true;
    nix.gc = {
        automatic = true;
        interval = { Weekday = 0; Hour = 0; Minute = 0; };
        options = "--delete-older-than 30d";
    };

    # Nix Shells
    programs.fish.enable = true;
    programs.zsh.enable = true;
    programs.bash.enable = true;

    # Tailscale
    services.tailscale.enable = true;



    #
    ## Environment Variables
    #
    enviroment.variables = {
        HOSTNAME = $(hostname);
        XDG_CONFIG_HOME = "$HOME/.config";

        DOT = "$HOME/.dotfiles";
        DOT.NIX = "$DOTFILES/nix";
        DOT.SHELL = "$DOTFILES/shells";
        DOT.TERMINAL = "$DOTFILES/terminals";
        DOT.UTILS = "$DOTFILES/utils";

        EDITOR = "code-insiders";
        SSH_AUTH_SOCK = "$HOME/.1password/agent.sock";

        NONINTERACTIVE_NIX = true;
    };



    #
    ## System Defaults
    #
    system.defaults = {
        # dock.autohide = true;
        # screencapture.location = "~/Pictures/Screenshots";
    };



    #
    ## System Packages
    #
    environment.systemPackages = with pkgs; [
        # Command-Line Utilities
        aria2 # Better download manager
        fastfetch # NeoFetch but fast (and still updated)
        neovim # Semi-modern iteration of vim
        starship # Cross-Shell Prompt Customization
        aerospace # Window Manager
        bat # Better cat
        zoxide # Better cd
        eza # Better ls
        mas # Mac App Store CLI

        # Terminal Emulators
        wezterm
        # ghostty

        # Development Tools
        arduino-cli # CLI Tools for Arduino
    ];


    homebrew = {
        enable = true;
        # Enable auto-uninstall of packages not listed here
        onActivation.cleanup = "none"; # "uninstall";

        taps = [];
        brews = [

        ];
        casks = [
        "vlc"
        "visual-studio-code@insiders"
        "ghostty"
        "hammerspoon"
        ];
};
}
