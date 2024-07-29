{
  pkgs,
  config,
  ...
}: {
  imports = [
    ../common/syncthing.nix
  ];

  home.packages = with pkgs; [
    lf
    yabai
    readline
    itsycal
    slack
    sketchybar
    wezterm
    hidden-bar
    karabiner-elements
    raycast
    stats
    skhd
    dconf
    thefuck
    ffmpeg
    wezterm
    obsidian
    spotify
    github-cli
  ];

  home.file = {
    "${config.xdg.configHome}/nvim".source = ./../../../../dotfiles/nvim;
    "${config.xdg.configHome}/sketchybar".source = ./../../../../dotfiles/sketchybar;
    "${config.xdg.configHome}/skhd".source = ./../../../../dotfiles/skhd;
    "${config.xdg.configHome}/yabai".source = ./../../../../dotfiles/yabai;
    "${config.xdg.configHome}/wezterm" = {
      source = ./../../../../.dotfiles/wezterm;
      recursive = true;
    };
  };
}
