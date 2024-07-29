{pkgs, ...}: {
  imports = [
    ./lf

    ./btop.nix
    ./bat.nix
    ./direnv.nix
    ./eza.nix
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
  ];
}
