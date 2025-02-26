{pkgs, ...}: {
  imports = [
    ./1password.nix
    ./btop.nix
    ./bat.nix
    ./direnv.nix
    ./eza.nix
    ./nushell.nix
    ./fd.nix
    ./fzf.nix
    ./git.nix
    ./ssh.nix
    ./starship.nix
    ./thefuck.nix
    ./yazi.nix
    ./zoxide.nix
    ./zsh.nix
    ./scripts
  ];
  home.packages = with pkgs; [
    dust
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
