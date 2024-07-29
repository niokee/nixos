{pkgs, ...}: {
  system.stateVersion = 4;
  services.nix-daemon.enable = true;
  services.skhd.enable = true;
  services.yabai.enable = true;
  services.sketchybar.enable = true;
  nix.settings.experimental-features = "nix-command flakes";
  programs.zsh = {
    enable = true;
    shellInit = ''source ${pkgs.fzf-git-sh}/share/fzf-git-sh/fzf-git.sh'';
  };
  nixpkgs.hostPlatform = "aarch64-darwin";

  users.users.mateusz = {
    name = "mateusz";
    home = "/Users/mateusz";
  };
  fonts.packages = with pkgs; [
    recursive
    (nerdfonts.override {fonts = ["FiraCode"];})
  ];

  homebrew = {
    enable = true;
    taps = [
      "homebrew/bundle"
      "homebrew/services"
    ];
    casks = [
      "spotmenu"
      "protonvpn"
      "firefox"
      "sf-symbols"
      "meetingbar"
    ];
  };
}
