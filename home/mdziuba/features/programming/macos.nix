{pkgs, ...}: {
  imports = [
    ./default.nix
    ./vscode.nix
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
