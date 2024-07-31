{pkgs, ...}: {
  home.packages = with pkgs; [
    readline
  ];
}
