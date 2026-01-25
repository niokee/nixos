{
  config,
  pkgs,
  myLib,
  ...
}: {
  imports = [
    ../common

    ./ghostty.nix
    ./font.nix
    ./playerctl.nix
    ./zen.nix
    # ./zellij.nix
  ];

  home.packages = with pkgs; [
    nautilus
    dconf
    gimp
    rofi
    feh
    maim
    simple-scan
    spotify
  ];

  home.file = myLib.mkDotfileEntry config "rofi";
}
