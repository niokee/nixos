{
  config,
  pkgs,
  myLib,
  ...
}: {
  programs.ghostty = {
    enable = true;
    # nixpkgs' source-built ghostty is linux-only; darwin gets the upstream .app
    package =
      if pkgs.stdenv.hostPlatform.isDarwin
      then pkgs.ghostty-bin
      else pkgs.ghostty;
    enableZshIntegration = true;
  };

  home.file = myLib.mkDotfileEntry config "ghostty";
}
