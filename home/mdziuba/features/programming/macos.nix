{pkgs, ...}: {
  imports = [
    ./default.nix
  ];
  home.packages = with pkgs; [
        terraform
        dbeaver-bin
        ];
}
