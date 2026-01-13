{
  config,
  pkgs,
  myLib,
  ...
}: {
  home.packages = with pkgs; [
    wezterm
  ];

  home.file = myLib.mkDotfileEntry config "wezterm";
}
