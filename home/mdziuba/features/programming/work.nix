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
    maturin
    cookiecutter
    clickhouse
    clickhouse-cli
    llvm
    lld
    terraform
    tflint
    gdal
    slack-term
    terraform-ls
    pkgsStable.terragrunt
    typescript-language-server
    dbeaver-bin
    circleci-cli
    postgresql_17
    libiconv
    gitstats
    zig
    flameshot
    betterdisplay
  ];
}
