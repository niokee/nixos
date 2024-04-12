{ pkgs, ... }:
{
  imports = [
    ./btop.nix
    ./bat.nix
    ./git.nix
    ./lf.nix
    ./ssh.nix
    ./thefuck.nix
    ./zsh.nix
  ];
  home.packager = with pkgs; [
    wget
    jq
    lshw
    curl
    unzip
    fzf
    xclip
    lsof
    tldr
    shutter
    taskwarrior
    ripgrep
    delta
  ];
}
