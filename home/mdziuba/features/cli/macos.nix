{pkgs, lib, ...}: {
  imports = [
    ./lf

    ./btop.nix
    ./bat.nix
    ./direnv.nix
    ./eza.nix
    ./fd.nix
    ./fzf.nix
    ./git.nix
    ./ssh.nix
    ./thefuck.nix
    ./zsh.nix
    ./zoxide.nix
    ./scripts
  ];
  programs.git = {
    userEmail = "mateusz.dziuba@arx.city";
  };
  home.packages = with pkgs; [
    wget
    jq
    curl
    unzip
    fzf-git-sh
    zip
    xclip
    neofetch
    lsof
    tldr
    taskwarrior
    ripgrep
    delta
    nix-prefetch-github
    age
  ];
}
