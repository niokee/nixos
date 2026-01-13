{config, myLib, ...}: {
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
  };

  home.file = myLib.mkDotfileEntry config "yazi";
}
