{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./global
    features/cli
    features/games
    features/desktop/linux
    features/programming
  ];

  config.monitors = [
    {
      name = "eDP-1";
      width = 1920;
      height = 1080;
      x = 0;
      refreshRate = 60;
      workspace = "1";
      primary = true;
    }
    {
      name = "HDMI-A-1";
      width = 1920;
      height = 2160;
      x = 0;
      refreshRate = 60;
      workspace = "1";
      primary = false;
    }
  ];
}
