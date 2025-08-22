{pkgs, ...}: {
  imports = [
    ./global
    features/cli
    features/games
    features/desktop/linux
    features/programming
  ];

  # home.packages = with pkgs; [
  #   shutter
  #   lshw
  # ];
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
    #   {
    #     name = "DP-2";
    #     width = 1920;
    #     height = 1080;
    #     x = 1920;
    #     refreshRate = 60;
    #     workspace = "2";
    #   }
  ];
}
