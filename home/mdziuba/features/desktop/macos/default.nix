{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../common/syncthing.nix
    ../common/wezterm.nix
  ];

  home.packages = with pkgs; [
    yabai
    itsycal
    slack
    raycast
    sketchybar
    skhd
    dconf
    thefuck
    ffmpeg
    obsidian
    spotify
    github-cli
  ];

  home.file = {
    "${config.xdg.configHome}/sketchybar".source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/nix/home/dotfiles/sketchybar";
    "${config.xdg.configHome}/skhd".source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/nix/home/dotfiles/skhd";
    "${config.xdg.configHome}/yabai".source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/nix/home/dotfiles/yabai";
  };
}
