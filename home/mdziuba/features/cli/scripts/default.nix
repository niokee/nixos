{ pkgs, ... }:
{
  home.packages = [
    (import ./auto-connect-bt.nix { inherit pkgs; })
    (import ./cht.nix { inherit pkgs; })
    (import ./tmux-sessionizer.nix { inherit pkgs; })
  ];
}
