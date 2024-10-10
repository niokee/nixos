{pkgs, ...}: {
  imports = [
    ./default.nix
  ];
  home.packages = with pkgs; [
    terraform
    tflint
    terraform-ls
    terragrunt
    dbeaver-bin
    circleci-cli
  ];
}
