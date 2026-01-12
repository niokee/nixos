{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../common

    ./ghostty.nix
    ./font.nix
    ./playerctl.nix
    ./zen.nix
    ./zellij.nix
  ];

  home.packages = with pkgs; [
    nautilus
    dconf
    gimp
    rofi
    feh
    maim
    simple-scan
  ];

  home.file = {
    "${config.xdg.configHome}/rofi".source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/nixos/home/dotfiles/rofi";
  };
}
