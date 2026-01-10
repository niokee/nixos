{pkgs, ...}: {
  home.packages = [
    pkgs.nerd-fonts.fira-code
  ];
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = ["FiraCode Nerd Font"];
    };
  };
}
