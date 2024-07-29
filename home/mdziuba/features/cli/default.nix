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
    lshw
    curl
    fzf-git-sh
    unzip
    zip
    xclip
    neofetch
    lsof
    tldr
    shutter
    taskwarrior
    ripgrep
    nix-prefetch-github
  ];
}
