{pkgs, ...}: {
  imports = [
    ./default.nix
  ];
  home.packages = with pkgs; [
        terraform
        terraform-ls
        terragrunt
        dbeaver-bin
        ];
}
