{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../common

    ./firefox.nix
    ./font.nix
    ./pavucontrol.nix
    ./playerctl.nix
    ./zen.nix
  ];

  home.packages = with pkgs; [
    # Packages that don't have custom configs go here
    amphetype
    nautilus
    pavucontrol
    dconf
    gimp
    ffmpeg
    rofi
    feh
    maim
    simple-scan
    picom
  ];

  home.file = {
    "${config.xdg.configHome}/rofi".source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/nix/home/dotfiles/rofi";
    "${config.xdg.configHome}/awesome".source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/nix/home/dotfiles/awesome";
    "${config.xdg.configHome}/picom".source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/nix/home/dotfiles/picom";
  };
}
