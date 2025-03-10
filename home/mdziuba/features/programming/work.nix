{pkgs, ...}: {
  imports = [
    ./default.nix
    ./vscode.nix
  ];
  home.packages = with pkgs; [
    aws-vault
    terraform
    tflint
    slack-term
    terraform-ls
    terragrunt
    dbeaver-bin
    circleci-cli
  ];
}
