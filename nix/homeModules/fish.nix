# Configuration for Fish Shell
{pkgs, ...}:

{
  # Enable Fish Shell
  enable = true;
  generateCompletions = true;
  shellAliases = {
    # Replaces ls with eza
    ls = "eza --icons=auto";
    
    # Replaces cd with zOxide
    cd = "${pkgs.zoxide}/bin/zoxide";

    # Makes aria/wget less annoying
    aria = "${pkgs.aria2}/bin/aria2c";
    wget = "${pkgs.wget2}/bin/wget2";

    # Foreground ClamAV scan
    clamav = "${pkgs.clamav}/bin/clamd --foreground";

    # Normalize VSCode Call
    code = "/usr/local/bin/code-insiders";

    # Use bat instead of cat or man
    cat = "${pkgs.bat}/bin/bat";
    man = "${pkgs.bat-extras.batman}/bin/batman";
    grep = "${pkgs.bat-extras.batgrep}/bin/batgrep";
    diff = "${pkgs.bat-extras.batdiff}/bin/batdiff";
    watch = "${pkgs.bat-extras.batwatch}/bin/batwatch";
    pipe = "${pkgs.bat-extras.batpipe}/bin/batpipe";
    pretty = "${pkgs.bat-extras.prettybat}/bin/prettybat";
  };
}