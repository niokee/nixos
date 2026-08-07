{
  pkgs,
  pkgsUnstable,
  ...
}: {
  imports = [
    ./syncthing.nix
    ./wezterm.nix
  ];

  home.packages =
    (with pkgs; [
      spotifyd
      spotify-player
    ])
    ++ [
      # stable's obsidian 1.13.4 fails to unpack its DMG on darwin
      # ("chmod: cannot access 'Obsidian.app'"); unstable's 1.9.10 builds.
      (
        if pkgs.stdenv.hostPlatform.isDarwin
        then pkgsUnstable.obsidian
        else pkgs.obsidian
      )
    ];
}
