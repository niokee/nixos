{
  imports = [
    ./global
    features/cli
    features/cli/linux.nix
    features/games
    features/desktop/common
    features/desktop/linux
    features/desktop/niri
    features/programming
  ];

  config.monitors = [
    {
      name = "DP-2";
      width = 3440;
      height = 1440;
      x = 0;
      refreshRate = 100;
      workspace = "1";
      primary = true;
    }
  ];
}
