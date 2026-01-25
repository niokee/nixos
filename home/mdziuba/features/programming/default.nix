{
  config,
  pkgs,
  myLib,
  ...
}: {
  home.packages = with pkgs; [
    ## bash
    efm-langserver
    shfmt
    shellcheck
    ## nix
    nixd
    alejandra
    ## lua
    lua5_1
    stylua
    lua-language-server
    luarocks
    ## python
    duckdb
    python3
    uv
    python313Packages.pip
    python313Packages.debugpy
    python313Packages.pygments
    pyright
    pyrefly
    ruff
    ## golang
    go
    gopls
    templ
    golangci-lint
    ## rust
    rustup
    rustlings
    maturin
    ## yaml/json/etc.
    vscode-langservers-extracted
    yaml-language-server
    yamllint
    prettierd
    taplo # toml
    ## c-tools
    clang-tools
    cmake
    (lib.hiPrio gcc)
    gnumake
    ## misc
    docker-language-server
    neovim
    tree-sitter
    gum
    nodejs_22
    vhs
    devenv
    github-cli
    hyperfine
  ];

  home.file = myLib.mkDotfileEntry config "nvim";
}
