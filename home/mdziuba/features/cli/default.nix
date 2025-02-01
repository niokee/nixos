{pkgs, ...}: {
  imports = [
    ./lf

    ./1password.nix
    ./btop.nix
    ./bat.nix
    ./direnv.nix
    ./eza.nix
    ./fd.nix
    ./fzf.nix
    ./git.nix
    ./ssh.nix
    ./starship.nix
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
    ripgrep
    nix-prefetch-github
    age
  ];
}
