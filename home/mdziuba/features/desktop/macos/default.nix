{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../common
  ];

  home.packages = with pkgs; [
    aerospace
    itsycal
    raycast
    sketchybar
    sketchybar-app-font
    skhd
    dconf
    micromamba
  ];

  home.file = {
    "${config.xdg.configHome}/sketchybar".source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/nix/home/dotfiles/sketchybar";
    "${config.xdg.configHome}/skhd".source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/nix/home/dotfiles/skhd";
    "${config.xdg.configHome}/aerospace".source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/nix/home/dotfiles/aerospace";
  };
}
