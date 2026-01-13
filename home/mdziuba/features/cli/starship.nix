{config, myLib, ...}: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
    enableTransience = true;
  };

  home.file."${config.xdg.configHome}/starship.toml".source =
    myLib.mkDotfileSymlink config "starship/starship.toml";
}
