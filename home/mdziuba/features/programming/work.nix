{pkgs, ...}: {
  imports = [
    ./default.nix
    ./vscode.nix
  ];
  home.packages = with pkgs; [
    aws-vault
    dbt
    maturin
    cookiecutter
    jinja-lsp
    llvm
    lld
    terraform
    tflint
    gdal
    slack
    terraform-ls
    terragrunt
    typescript-language-server
    dbeaver-bin
    circleci-cli
    postgresql_17
    libiconv
    gitstats
    zig
    flameshot
    betterdisplay
    pandoc
    libiconv
  ];
}
