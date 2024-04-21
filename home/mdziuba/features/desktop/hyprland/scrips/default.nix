{ pkgs, ... }:
{
  home.packages = [
    (import ./blur_logout.nix { inherit pkgs; })
  ];
}
