{pkgs, ...}: {
  imports = [
    ./syncthing.nix
    ./wezterm.nix
  ];

  home.packages = with pkgs; [
    obsidian
    spotifyd
    spotify-player
  ];
}
