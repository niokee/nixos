{config, ...}: {
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
  };

  home.file."${config.xdg.configHome}/yazi".source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/nix/home/dotfiles/yazi";
}
