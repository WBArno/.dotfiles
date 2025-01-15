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

    # Mac-Specific Fish Configuration
    programs.fish.enable = true;
    programs.zsh.enable = true; #= {
        #enable = true;
        # Enable Powerlevel10k Theme
        #promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme && source ~/.config/zsh/p10k.zsh";
    #};

    environment.variables = {
        CHARON_FLAKE_DIR = "$HOME/.dotfiles/nix/charon";
        SSH_AUTH_SOCK="$HOME/.1password/agent.sock"; # 1Password SSH Agent
        STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"; # Starship

        # Volumes
        VOLUMES_DIR="/Volumes";
        CACHE="$VOLUMES_DIR/Cache";
        DATA="$VOLUMES_DIR/Data";
        DEVELOPER="$VOLUMES_DIR/Developer";
    };

    environment.shellAliases = {
        # Ties Tailscale to CLI in .app
        tailscale = "/Applications/Tailscale.app/Contents/MacOS/Tailscale";
            
        # Rebuild Nix
        nix-rebuild = "darwin-rebuild switch --flake ~/.dotfiles/nix/charon";
        nrb = "nix-rebuild";

        # Update Nix
        nix-update = "nix flake update --commit-lock-file --flake ~/.dotfiles/nix/charon";
        nup = "nix-update";
    };

    # Extra commands to run on init regardless of shell
    environment.extraInit = ''
    
    '';



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
        # starship # Cross-Shell Prompt Customization
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
        ripgrep # Better grep
        m-cli # macOS Command Line Tools
        nh # Nix Helper
        coreutils # GNU Core Utilities

        # Terminal Emulators
        wezterm
        # ghostty
        tmux # Terminal Multiplexer
        #iterm2 # Terminal Emulator
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
        #ghidra
        devbox # Development Environment
        exercism # Code Practice

        # Utils
        xquartz # X11 for macOS
        clamav # Antivirus
        arc-browser # Swift Web Browser
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
        cataclysm-dda-git # Cataclysm: Dark Days Ahead Traditional Roguelike
        crawl # Dungeon Crawl Stone Soup
        prismlauncher # Minecraft launcher
        gogdl # GOG Downloader for Heroic
        moonlight-qt # Game Streaming Client
    ];


    homebrew = {
        enable = true;
        # Enable auto-uninstall of packages not listed here
        onActivation.cleanup = "uninstall"; # "none";

        taps = [];
        brews = [
            "brew-cask-completion" # Fish completion for Homebrew Casks
            "docker-completion" # Shell completion for Docker
        ];
        casks = [
            "1password-cli@beta" # Password Manager CLI
            "1password@beta" # Password Manager
            "balenaetcher" # USB Flashing Tool
            "battle-net" # Blizzard Game Client
            "betterdiscord-installer" # Discord Plugins
            "brewlet" # Homebrew Dock Icon
            "crossover" # Windows Emulator
            "discord" # Chat Client
            "docker" # Containerization Desktop Client
            "firefox" # Web Browser
            "forklift" # SFTP File Manager
            "fs-uae" # Amiga Emulator
            "fs-uae-launcher" # Amiga Emulator Frontend
            "ghidra" # Reverse Engineering Tool
            "ghostty" # Terminal Emulator
            "gog-galaxy" # Good Old Games Client
            "gzdoom" # Doom Source Port
            "hammerspoon" # MacOS Automation Tool
            "heroic" # Epic Games Store Downloader
            "iterm2@beta" # Terminal Emulator
            "microsoft-edge" # Web Browser
            "obs" # Screen Recording Software
            "obsidian" # Markdown-based Note-Taking App
            "ollama" # Large Language Model Server
            "openrct2" # RollerCoaster Tycoon 2 Reimplementation
            "playcover-community" # Unsupported iOS Game Launcher
            "powershell@preview" # PowerShell Core
            "raspberry-pi-imager" # Raspberry Pi OS Imager
            "remote-desktop-manager" # Remote Desktop Manager
            "shattered-pixel-dungeon" # Pixel Dungeon Traditional Roguelike
            "sidequest" # Oculus Quest Sideloading Manager
            "steam" # Game Client
            "termius@beta" # SSH Client
            "ultimaker-cura" # 3D Printer Slicer
            "visual-studio-code@insiders" # Code Editor
            "vmware-fusion" # Virtualization
            "xiv-on-mac" # Final Fantasy XIV Launcher
        ];
        masApps = { # Mac App Store Apps
            # Productivity
            Enchanted = 6474268307; # Enchanted Ollama UI
            Pages = 409201541; # Pages Word Processor
            "Adobe Lightroom" = 1451544217; # Adobe Lightroom Photo Editor
            iMovie = 408981434; # iMovie Video Editor
            Numbers = 409203825; # Numbers Spreadsheet
            Keynote = 409183694; # Keynote Presentation Software

            # Development
            # Xcode = 497799835; # Xcode IDE
            Playgrounds = 1496833156; # Swift Playgrounds
            Developer = 640199958; # Apple Developer News

            # Network Utilities
            Speedtest = 1153157709; # Speedtest by Ookla
            Tailscale = 1475387142; # Tailscale VPN
            "Windows App" = 1295203466; # Windows Remote Desktop
            Surfshark = 1437809329; # Surfshark VPN

            # Utils
            TestFlight = 899247664; # TestFlight Beta Testing
            # CrystalFetch = 6454431289; # CrystalFetch Image Downloader
            # "Home Assistant" = 1099568401; # Home Automation - USING TF BUILD
            # "Okta Verify" = 490179405; # Okta 2FA

            # Safari Extensions
            Wipr = 1662217862; # Wipr Ad Blocker
            "Baking Soda" = 1601151613; # Baking Soda Video Extractor
            DeArrow = 6451469297; # YouTube De-Clickbait Extension
            Vinegar = 1591303229; # Vinegar Video Extractor
            Hush = 1544743900; # Hush Nag Blocker
            SponsorBlock = 1573461917; # YouTube Sponsor Segment Blocker

            # Games
            # "Football Manager 2024" = 1626267810; # Football Manager 2024
            "Steam Link" = 1246969117; # Steam Link Game Streaming
            "Balatro+" = 6502451661; # Balatro
            # "Snake.io+" = 6443553808; # Snake.io
            # "WHAT THE GOLF" = 1474771319; # WHAT THE GOLF
            "BloonsTD6+" = 1584423325; # Bloons TD 6
            "Mini Motorways" = 1456188526; # Mini Motorways
            # AngryBirdsReloaded = 1539172625; # Angry Birds

            # Media
            "Manabi Reader" = 1247286380; # Manabi Reader Language Learning
            Kindle = 302584613; # Kindle E-Reader
            # Infuse = 1136220934; # Infuse Media Player
        };
    };
}
