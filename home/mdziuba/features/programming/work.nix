{
  pkgs,
  pkgsStable,
  ...
}: {
  imports = [
    ./default.nix
    ./vscode.nix
  ];
  home.packages = with pkgs; [
    aws-vault
    terraform
    tflint
    gdal
    slack-term
    terraform-ls
    pkgsStable.terragrunt
    dbeaver-bin
    circleci-cli
    postgresql_17
    libiconv
  ];
}
