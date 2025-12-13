{pkgs, ...}: {
  programs.bat = {
    enable = true;
    config = {
      theme = "kanagawa";
    };
    themes = {
      kanagawa = {
        src = pkgs.fetchFromGitHub {
          owner = "rebelot";
          repo = "kanagawa.nvim"; # Bat uses sublime syntax for its themes
          rev = "7b411f9e66c6f4f6bd9771f3e5affdc468bcbbd2";
          sha256 = "sha256-kV+hNZ9tgC8bQi4pbVWRcNyQib0+seQrrFnsg7UMdBE=";
        };
        file = "extras/kanagawa.tmTheme";
      };
    };
  };

  home.packages = with pkgs; [
    bat-extras.batman
    bat-extras.batgrep
    bat-extras.batpipe
    bat-extras.batdiff
    bat-extras.batwatch
  ];
}
