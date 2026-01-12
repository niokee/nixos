{pkgs, ...}: {
  imports = [
    ./btop.nix
    ./bat.nix
    ./direnv.nix
    ./eza.nix
    ./delta.nix
    ./fd.nix
    ./fzf.nix
    ./git.nix
    ./nushell.nix
    ./ssh.nix
    ./starship.nix
    ./yazi.nix
    ./zoxide.nix
    ./zsh.nix
    ./scripts
  ];
  home.packages = with pkgs; [
    dust # disk usage
    wget # download files
    jq # json parsing tool
    curl # http requests
    fzf-git-sh # fzf git bindings
    p7zip # 7zip
    ffmpeg # multimedia processing
    imagemagick # image managment tool
    tldr # tldr man
    ripgrep # better grep
    age # file encryption
  ];
}
