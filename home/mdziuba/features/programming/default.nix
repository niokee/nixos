{pkgs, ...}: {
  imports = [
    ./vscode.nix
  ];
  home.packages = with pkgs; [
    efm-langserver
    shfmt
    shellcheck
    gum
    neovim
    alejandra
    lua5_4
    stylua
    lua-language-server
    codeium
    clang-tools
    nixd
    cmake
    python311Packages.pygments
    python3
    cargo
    #    nodePackages.npm
    mypy
    nodejs_22
    luarocks
    pyright
    gopls
    yaml-language-server
    prettierd
    rust-analyzer
    python311Packages.pip
    go
    (hiPrio gcc)
    ruff
    ruff-lsp
    gnumake
  ];
}
