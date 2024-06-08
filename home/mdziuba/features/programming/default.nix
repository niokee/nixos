{ pkgs, ... }: {
  home.packages = with pkgs; [
    neovim
    alejandra
    lua
    stylua
    lua-language-server
    codeium
    clang
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
    gnumake
  ];
}
