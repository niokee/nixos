{config, myLib, ...}: {
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
  };

  home.file = myLib.mkDotfileEntry config "ghostty";
}
