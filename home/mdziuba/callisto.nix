{...}: {
  imports = [
    ./global/macos.nix
    features/macos.nix
    features/cli/macos.nix
    features/desktop/macos
    features/programming/macos.nix
  ];
}
