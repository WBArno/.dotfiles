#_:
{pkgs, ...}:

{
# FOSS-Only is Overrated
nixpkgs.config.allowUnfree = true;

services.nix-daemon.enable = true;
# Necessary for using flakes on this system.
nix.settings.experimental-features = "nix-command flakes";
# nix.extraOptions.auto-optimise-store = true;

#system.configurationRevision = self.rev or self.dirtyRev or null;

# Used for backwards compatibility. please read the changelog
# before changing: `darwin-rebuild changelog`.
system.stateVersion = 4;

# The platform the configuration will be used on.
# If you're on an Intel system, replace with "x86_64-darwin"
nixpkgs.hostPlatform = "aarch64-darwin";

# Declare the user that will be running `nix-darwin`.
users.users.will = {
    name = "will";
    home = "/Users/will";
};

# Create /etc/zshrc that loads the nix-darwin environment.
#programs.zsh.enable = true;

environment.systemPackages = with pkgs; [
    aerospace
];

homebrew = {
    enable = true;
    # onActivation.cleanup = "uninstall";

    taps = [];
    brews = [

    ];
    casks = [
      "vlc"
    ];
};

# Add Sudo TouchID Support
security.pam.enableSudoTouchIdAuth = true;
}
