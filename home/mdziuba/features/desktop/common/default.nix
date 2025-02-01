{pkgs, ...}: {
  imports = [
    ./syncthing.nix
    ./wezterm.nix
  ];

  home.packages = with pkgs; [
    # Packages that don't have custom configs go here
    obsidian
    spotify
  ];
}
