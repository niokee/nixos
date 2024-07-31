{
  pkgs,
  config,
  ...
}: {
  imports = [
    ../common/syncthing.nix
    ../common/wezterm.nix
  ];

  home.packages = with pkgs; [
    lf
    yabai
    itsycal
    slack
    karabiner-elements
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
    "${config.xdg.configHome}/nvim".source = ./../../../../dotfiles/nvim;
    "${config.xdg.configHome}/sketchybar".source = ./../../../../dotfiles/sketchybar;
    "${config.xdg.configHome}/skhd".source = ./../../../../dotfiles/skhd;
    "${config.xdg.configHome}/yabai".source = ./../../../../dotfiles/yabai;
    "${config.xdg.configHome}/wezterm" = {
      source = ./../../../../dotfiles/wezterm;
      recursive = true;
    };
  };
}
