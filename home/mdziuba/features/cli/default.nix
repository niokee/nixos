{pkgs, ...}: {
  imports = [
    ./1password.nix
    ./btop.nix
    ./bat.nix
    ./direnv.nix
    ./eza.nix
    # ./delta.nix
    ./fd.nix
    ./fzf.nix
    ./git.nix
    ./lazygit.nix
    ./nushell.nix
    ./ssh.nix
    ./starship.nix
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
    p7zip
    poppler
    ffmpeg
    imagemagick
    xclip
    neofetch
    lsof
    tldr
    ripgrep
    nix-prefetch-github
    age
  ];
}
