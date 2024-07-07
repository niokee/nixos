{pkgs, ...}: {
  imports = [
      ./vscode.nix
  ];
  home.packages = with pkgs; [
    neovim
    alejandra
    lua
    stylua
    lua-language-server
    codeium
    clang-tools
    nixd
    cmake
    python311Packages.pygments
    python3
    cargo
    nodePackages.npm
    luarocks
    pyright
    gopls
    rust-analyzer
    python311Packages.pip
    go
    (hiPrio gcc)
    ruff
    ruff-lsp
    gnumake
  ];
}
