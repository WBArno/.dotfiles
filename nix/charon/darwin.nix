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

    nix.extraOptions = ''
        extra-platforms = x86_64-darwin aarch64-darwin
    '';

    # Set hostname
    networking.hostName = "charon";

    # Set User Home Directory
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



    #
    ## System Defaults
    #
    system.defaults = {
        dock.autohide = true;
        screencapture.location = "~/Pictures/Screenshots";
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

        # Fish Plugins


        fishPlugins.fzf # Fuzzy Finder Keybinds
        fishPlugins.z # ZSH's Z for Fish
    ];


    homebrew = {
        enable = true;
        # Enable auto-uninstall of packages not listed here
        onActivation.cleanup = "none"; # "uninstall";

        taps = [];
        brews = [

        ];
        casks = [
        "1password-cli@beta"
        "1password@beta"
        "arc"
        "balenaetcher"
        "bartender"
        "battle-net"
        "betterdiscord-installer"
        "brewlet"
        "crossover"
        "discord"
        "docker"
        "double-commander"
        "firefox"
        "font-meslo-lg-nerd-font"
        "font-symbols-only-nerd-font"
        "forklift"
        "fs-uae"
        "fs-uae-launcher"
        "ghidra"
        "ghostty"
        "gog-galaxy"
        "gzdoom"
        "hammerspoon"
        "istat-menus"
        "iterm2@beta"
        "libreoffice"
        "microsoft-edge"
        "moonlight"
        "obs"
        "ollama"
        "playcover-community"
        "powershell@preview"
        "prismlauncher"
        "raspberry-pi-imager"
        "raycast"
        "remote-desktop-manager"
        "shattered-pixel-dungeon"
        "sidequest"
        "steam"
        "termius@beta"
        "tigervnc-viewer"
        "ultimaker-cura"
        "utm"
        "visual-studio-code@insiders"
        "vlc"
        "vmware-fusion"
        "xiv-on-mac"
        "xquartz"
        ];
    };
}
