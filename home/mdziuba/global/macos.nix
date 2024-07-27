{
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    ./common.nix
  ]; # Install MacOS applications to the user environment if the targetPlatform is Darwin
  home.file."Applications/home-manager".source = let
    apps = pkgs.buildEnv {
      name = "home-manager-applications";
      paths = config.home.packages;
      pathsToLink = "/Applications";
    };
  in
    lib.mkIf pkgs.stdenv.targetPlatform.isDarwin "${apps}/Applications";
}
