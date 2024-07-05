{ config, lib, pkgs, outputs, ... }:
{
  imports = [
    ./font.nix
    ./firefox.nix
    ./pavucontrol.nix
    ./playerctl.nix
    ./syncthing.nix
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
    rofi
    feh
    maim
    gnome.simple-scan   
    picom
    obsidian
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
    "${config.xdg.configHome}/awesome" = {
      source = ./../../../../.dotfiles/awesome;
      recursive = true;
    };
    "${config.xdg.configHome}/picom" = {
      source = ./../../../../.dotfiles/picom;
      recursive = true;
    };
  };
}
