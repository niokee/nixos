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
    python3
    uv
    python311Packages.pip
    python311Packages.debugpy
    python311Packages.pygments
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
    ## yaml/json/etc.
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
  ];

  home.file."${config.xdg.configHome}/nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/nix/home/dotfiles/nvim";
}
