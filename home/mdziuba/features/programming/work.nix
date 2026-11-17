{
  pkgs,
  pkgsUnstable,
  ...
}: {
  imports = [
    ./default.nix
    ./vscode.nix
  ];
  home.packages =
    (with pkgs; [
      aws-vault
      python313Packages.mdformat
      # mdformat-tables archived upstream; mdformat-gfm supersedes it
      python313Packages.mdformat-gfm
      claude-monitor
      dbt
      cookiecutter
      jinja-lsp
      llvm
      lld
      terraform
      tflint
      slack
      terraform-ls
      terragrunt
      typescript-language-server
      tailwindcss-language-server
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
      localstack
      terraform-local
      bun
      eslint
      google-chrome
    ])
    ++ [
      # stable 26.05 ships gdal 3.12.4; 3.13.x carries the security fixes.
      pkgsUnstable.gdalMinimal
      # Not in nixpkgs; packaged from the upstream release tarballs.
      (pkgs.callPackage ./dagger-package.nix {})
    ];
}
