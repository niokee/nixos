{ config, lib, pkgs, outputs, ... }:
{
  imports = [
    ./font.nix
    ./firefox.nix
    ./pavucontrol.nix
    ./playerctl.nix
  ];

  home.packages = with pkgs; [
    # Packages that don't have custom configs go here
    amphetype
    pavucontrol
    lf
    dconf
    gimp
    thefuck
    ffmpeg
    wezterm
    rofi-wayland
    obsidian
    syncthing
    spotify
  ];


  home.file = {
    "${config.xdg.configHome}/nvim".source = ./../../../../.dotfiles/nvim;
    "${config.xdg.configHome}/rofi" = {
      source = ./../../../../.dotfiles/rofi;
      recursive = true;
    };
    "${config.xdg.configHome}/wezterm" = {
      source = ./../../../../.dotfiles/wezterm;
      recursive = true;
    };
  };
}
