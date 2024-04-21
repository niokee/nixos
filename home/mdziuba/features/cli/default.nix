{ pkgs, ... }:
{
  imports = [
    ./btop.nix
    ./bat.nix
    ./fzf.nix
    ./git.nix
    ./lf.nix
    ./ssh.nix
    ./thefuck.nix
    ./zsh.nix
    ./zoxide.nix
    ./scripts
  ];
  home.packages = with pkgs; [
    wget
    jq
    lshw
    curl
    unzip
    xclip
    lsof
    tldr
    shutter
    taskwarrior
    ripgrep
    delta
  ];
}
