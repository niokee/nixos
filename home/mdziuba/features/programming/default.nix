{
  config,
  pkgs,
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
    ruff
    ruff-lsp
    ## golang
    go
    gopls
    templ
    golangci-lint
    ## rust
    cargo
    rust-analyzer
    rustfmt
    rustc
    ## yaml/json/etc.
    vscode-langservers-extracted
    yaml-language-server
    yamllint
    prettierd
    ## c-tools
    clang-tools
    cmake
    (hiPrio gcc)
    gnumake
    ## misc
    neovim
    gum
    nodejs_22
    vhs
    devenv
    devbox
    github-cli
  ];

  home.file."${config.xdg.configHome}/nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/nix/home/dotfiles/nvim";
}
