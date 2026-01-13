{
  config,
  pkgs,
  myLib,
  ...
}: {
  imports = [
    ../common
  ];

  home.packages = with pkgs; [
    yabai
    itsycal
    raycast
    sketchybar
    sketchybar-app-font
    skhd
    dconf
  ];

  home.file = myLib.mkDotfileEntries config ["sketchybar" "skhd" "yabai"];
}
