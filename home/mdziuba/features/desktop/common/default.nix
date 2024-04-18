{ config, lib, pkgs, outputs, ... }:
{
  imports = [
    ./font.nix
    ./firefox.nix
    ./pavucontrol.nix
  ];

  home.packages = with pkgs; [
    # Packages that don't have custom configs go here
    amphetype
    pavucontrol
    lf
    dconf
    tmux
    gimp
    thefuck
    ffmpeg
    wezterm
    feh
    rofi-wayland
    picom
    obsidian
    syncthing
    maim
    spotify
  ];


  home.file = {
    "${config.xdg.configHome}/.p10k.zsh".source = ./../../../../.dotfiles/zsh/.p10k.zsh;
    "${config.xdg.configHome}/nvim".source = ./../../../../.dotfiles/nvim;
    ".tmux.conf".source = ./../../../../.dotfiles/tmux/.tmux.conf;
    "${config.xdg.configHome}/picom" = {
      source = ./../../../../.dotfiles/picom;
      recursive = true;
    };
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
