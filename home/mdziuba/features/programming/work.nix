{pkgs, ...}: {
  imports = [
    ./default.nix
    ./vscode.nix
  ];
  home.packages = with pkgs; [
    aws-vault
    python313Packages.mdformat
    python313Packages.mdformat-gfm
    python313Packages.mdformat-tables
    claude-code
    claude-monitor
    dbt
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
    docker-client
    markdownlint-cli
    #    nodejs_20
  ];
}
