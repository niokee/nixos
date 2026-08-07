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
    itsycal
    raycast
    sketchybar
    sketchybar-app-font
    dconf
  ];

  home.file = myLib.mkDotfileEntries config ["sketchybar" "skhd" "yabai"];
}
