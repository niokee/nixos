{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./font.nix
    ./firefox.nix
    ./pavucontrol.nix
    ./playerctl.nix
    ./syncthing.nix
    ./wezterm.nix
    ./zen.nix
  ];

  home.packages = with pkgs; [
    # Packages that don't have custom configs go here
    amphetype
    nautilus
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
    simple-scan
    picom
    obsidian
    spotify
  ];

  home.file = {
    "${config.xdg.configHome}/rofi".source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/nix/home/dotfiles/rofi";
    "${config.xdg.configHome}/awesome".source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/nix/home/dotfiles/awesome";
    "${config.xdg.configHome}/picom".source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/nix/home/dotfiles/picom";
  };
}
