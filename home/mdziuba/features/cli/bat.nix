{pkgs, ... }:{
    programs.bat = {
        enable = true;
    };

    home.packages = with pkgs; [
      bat-extras.batman
      bat-extras.batgrep
      bat-extras.batpipe
      bat-extras.batdiff
      bat-extras.batwatch
    ];
}
