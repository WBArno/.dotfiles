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
        # Shells
        nushell
        
        # Command-Line Utilities
        p7zip # 7-Zip Compression
        wget2 # At least it's not curl
        aria2 # Better download manager
        fastfetch # NeoFetch but fast (and still updated)
        neovim # Semi-modern iteration of vim
        starship # Cross-Shell Prompt Customization
        aerospace # Window Manager
        bat # Better cat
        fzf # Fuzzy Finder
        fd # Better find
        zoxide # Better cd
        eza # Better ls
        mas # Mac App Store CLI
        lazygit # Git TUI
        lazydocker # Docker TUI
        yazi # TUI File Manager
        mc # Midnight Commander

        # Terminal Emulators
        wezterm
        # ghostty
        tmux # Terminal Multiplexer
        iterm2 # Terminal Emulator
        meslo-lgs-nf # Nerd Font for Terminal

        # Languages
        python313 # Python 3.13
        pipx # Python Package Manager
        jre # Java Runtime Environment
        dotnet-sdk # .NET SDK

        # Development Tools
        arduino-cli # CLI Tools for Arduino
        docker # Containerization Client
        docker-compose # Containerization Orchestration Tool
        docker-client
        #ghidra

        # Utils
        xquartz # X11 for macOS
        clamav # Antivirus
        arc-browser # Swift Web Browser
        ollama # LLM
        istatmenus # System Monitoring
        bartender # Menu Bar Organizer
        raycast # Spotlight Replacement
        tigervnc # VNC Client
        libreoffice-bin # Office Suite
        #rpi-imager # Raspberry Pi Imager

        # Emu/Virt
        dosbox-x # DOS Emulator
        utm # Virtualization Frontend

        # AV Programs
        # handbrake # Video Transcoder
        imagemagick # Image Manipulation
        mpv # Media Player
        gimp-with-plugins # Image Editor
        vlc-bin # Media Player

        # Games
        discord # Chat for Gamers
        cataclysm-dda-git # Cataclysm: Dark Days Ahead Traditional Roguelike
        shattered-pixel-dungeon # Pixel Dungeon Traditional Roguelike
        crawl # Dungeon Crawl Stone Soup
        prismlauncher # Minecraft launcher
        gogdl # GOG Downloader for Heroic
        moonlight-qt # Game Streaming Client
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
            "balenaetcher"
            "battle-net"
            "betterdiscord-installer"
            "brewlet"
            "crossover"
            "docker"
            "firefox"
            "forklift"
            "fs-uae"
            "fs-uae-launcher"
            "ghidra"
            "ghostty"
            "gog-galaxy"
            "gzdoom"
            "hammerspoon"
            "heroic"
            "iterm2@beta"
            "microsoft-edge"
            "ollama"
            "obsidian"
            "openrct2"
            "playcover-community"
            "powershell@preview"
            "raspberry-pi-imager"
            "remote-desktop-manager"
            "sidequest"
            "steam"
            "termius@beta"
            "ultimaker-cura"
            "visual-studio-code@insiders"
            "vmware-fusion"
            "xiv-on-mac"
        ];
        masApps = {

        };
    };
}
