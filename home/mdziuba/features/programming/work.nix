{pkgs, ...}: {
  imports = [
    ./default.nix
    ./vscode.nix
  ];
  home.packages = with pkgs; [
    aws-vault
    terraform
    tflint
    terraform-ls
    terragrunt
    dbeaver-bin
    circleci-cli
  ];
}
