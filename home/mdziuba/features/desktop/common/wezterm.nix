{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    wezterm
  ];

  home.file."${config.xdg.configHome}/wezterm" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/nix/home/dotfiles/wezterm";
  };
}
