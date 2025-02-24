{pkgs, ...}: {
  fonts.packages = [
    pkgs.nerd-fonts.fira-code
  ];
  fontProfiles = {
    enable = true;
    monospace = {
      family = "FiraCode Nerd Font";
    };
    regular = {
      family = "Fira Sans";
    };
  };
}
