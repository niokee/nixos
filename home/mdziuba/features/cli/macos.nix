{ pkgs, ... }:
{
  imports = [
    ./lf

    ./btop.nix
    ./bat.nix
    ./direnv.nix
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
    curl
    unzip
    zip
    xclip
    neofetch
    lsof
    tldr
    taskwarrior
    ripgrep
    delta
    nix-prefetch-github 
  ];
}
