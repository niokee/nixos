{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;
    userName = "Mateusz Dziuba";
    userEmail = "mateusz.dziuba97@gmail.com";
  };
}
