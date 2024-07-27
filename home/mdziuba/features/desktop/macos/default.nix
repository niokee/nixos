{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./skhd.nix
    ./yabai.nix
    ../common/syncthing.nix
  ];

  home.packages = with pkgs; [
    lf
    dconf
    thefuck
    ffmpeg
    wezterm
    obsidian
    spotify
  ];

  home.file = {
    "${config.xdg.configHome}/nvim".source = ./../../../../.dotfiles/nvim;
    "${config.xdg.configHome}/wezterm" = {
      source = ./../../../../.dotfiles/wezterm;
      recursive = true;
    };
  };
}
