{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./lf

    ./awscli.nix
    ./btop.nix
    ./bat.nix
    ./direnv.nix
    ./eza.nix
    ./fd.nix
    ./fzf.nix
    ./git.nix
    ./gpg.nix
    ./ssh.nix
    ./thefuck.nix
    ./zsh.nix
    ./zoxide.nix
    ./scripts
  ];
  home.packages = with pkgs; [
    wget
    aws-vault
    jq
    curl
    pass
    unzip
    fzf-git-sh
    zip
    xclip
    neofetch
    lsof
    tldr
    ripgrep
    delta
    nix-prefetch-github
    age
  ];
  programs.git = {
    userEmail = "mateusz.dziuba@arx.city";
  };

  programs.zsh = {
    initExtra = lib.mkAfter ''
      source /Users/mateusz/.config/op/plugins.sh
    '';
  };
}
