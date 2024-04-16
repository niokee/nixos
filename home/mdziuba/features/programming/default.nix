{ pkgs, ... }: {
  home.packages = with pkgs; [
    neovim
    lua
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
