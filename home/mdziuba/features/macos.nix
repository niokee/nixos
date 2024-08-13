{pkgs, ...}: {
  imports = [./cli/1password.nix];
  home.packages = with pkgs; [
    readline
  ];
}
