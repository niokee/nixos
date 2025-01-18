{pkgs, ...}: {
  home.packages = with pkgs; [
    nvidia-docker
  ];
}
