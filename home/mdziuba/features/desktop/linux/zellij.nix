{config, ...}: {
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
  };

  home.file."${config.xdg.configHome}/zellij" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/nixos/home/dotfiles/zellij";
  };
}
