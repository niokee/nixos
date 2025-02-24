{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../common
  ];

  home.packages = with pkgs; [
    yabai
    itsycal
    raycast
    slack
    sketchybar
    skhd
    dconf
  ];

  home.file = {
    "${config.xdg.configHome}/sketchybar".source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/nix/home/dotfiles/sketchybar";
    "${config.xdg.configHome}/skhd".source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/nix/home/dotfiles/skhd";
    "${config.xdg.configHome}/yabai".source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/nix/home/dotfiles/yabai";
  };
}
