{ pkgs, ... }:
{
  imports = [
#    ./lf

    ./btop.nix
    ./bat.nix
    ./fzf.nix
    ./git.nix
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
    neofetch
    lsof
    tldr
    shutter
    taskwarrior
    ripgrep
    delta
    nix-prefetch-github 
  ];
}
