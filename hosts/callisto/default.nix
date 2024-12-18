{pkgs, ...}: {
  system.stateVersion = 4;
  services.nix-daemon.enable = true;
  services.skhd.enable = true;
  services.yabai.enable = true;
  nix.settings = {
    experimental-features = "nix-command flakes";
  };
  programs.zsh.enable = true;
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
    casks = [
      "betterdisplay"
      "docker"
      "protonvpn"
      "firefox"
      "flameshot"
      "sf-symbols"
      "logitech-g-hub"
    ];
  };
}
