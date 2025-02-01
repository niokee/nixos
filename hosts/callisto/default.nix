{pkgs, ...}: {
  system.stateVersion = 4;
  services.nix-daemon.enable = true;
  services.skhd.enable = true;
  services.yabai.enable = true;
  nix.settings = {
    experimental-features = "nix-command flakes";
  };
  nixpkgs.hostPlatform = "aarch64-darwin";

  programs.fish.enable = true;
  users.users.mateusz = {
    name = "mateusz";
    home = "/Users/mateusz";
    uid = 501;
    shell = pkgs.fish;
  };
  users.knownUsers = ["mateusz"];
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
