{config, ...}: {
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
  };

  home.file."${config.xdg.configHome}/ghostty" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/nixos/home/dotfiles/ghostty";
  };
}
