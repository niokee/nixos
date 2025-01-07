{pkgs, ...}: {
  imports = [
    ./lf

    ./1password.nix
    ./btop.nix # [v]
    ./bat.nix
    ./direnv.nix
    ./eza.nix
    ./fd.nix # [v]
    ./fzf.nix # [v]
    ./git.nix # [v]
    ./ssh.nix # [v]
    ./thefuck.nix # [v]
    ./zsh.nix # [v]
    ./zoxide.nix # [v]
    ./scripts
  ];
  home.packages = with pkgs; [
    wget
    jq
    lshw
    curl # [v]
    fzf-git-sh # [v]
    unzip # [v]
    zip # [v]
    xclip # [v]
    neofetch
    lsof
    tldr
    shutter # [v]
    ripgrep
    nix-prefetch-github
    age
  ];
}
