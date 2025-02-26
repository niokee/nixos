{config, ...}: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
    enableTransience = true;
  };
  home.file."${config.xdg.configHome}/starship.toml".source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/nix/home/dotfiles/starship/starship.toml";
}
