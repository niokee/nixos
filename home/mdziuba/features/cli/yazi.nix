{
  config,
  myLib,
  ...
}: {
  programs.yazi = {
    enable = true;
    # Upstream default flipped "yy" -> "y" at stateVersion 26.05; pin the old
    # name explicitly so the wrapper does not rename out from under us.
    shellWrapperName = "yy";
    enableZshIntegration = true;
    enableNushellIntegration = true;
  };

  home.file = myLib.mkDotfileEntry config "yazi";
}
