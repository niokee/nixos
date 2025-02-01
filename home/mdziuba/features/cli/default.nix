{pkgs, ...}: {
  imports = [
    ./1password.nix
    ./btop.nix
    ./bat.nix
    ./direnv.nix
    ./eza.nix
    ./fish.nix
    ./nushell.nix
    ./fd.nix
    ./fzf.nix
    ./git.nix
    ./ssh.nix
    ./starship.nix
    ./thefuck.nix
    ./zoxide.nix
    ./scripts
  ];
  home.packages = with pkgs; [
    wget
    jq
    curl
    fzf-git-sh
    unzip
    zip
    xclip
    neofetch
    lsof
    tldr
    ripgrep
    nix-prefetch-github
    age
  ];
}
