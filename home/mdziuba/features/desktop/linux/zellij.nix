{config, myLib, ...}: {
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
  };

  home.file = myLib.mkDotfileEntry config "zellij";
}
