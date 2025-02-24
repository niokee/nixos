{pkgs, ...}: {
  nix.enable = true;
  system.stateVersion = 4;
  services.skhd.enable = true;
  services.yabai.enable = true;
  nix.settings = {
    experimental-features = "nix-command flakes";
  };
  nixpkgs.hostPlatform = "aarch64-darwin";

  programs.zsh.enable = true;
  users.users.mateusz = {
    name = "mateusz";
    home = "/Users/mateusz";
    uid = 501;
    shell = pkgs.zsh;
  };
  users.knownUsers = ["mateusz"];
  fonts.packages = with pkgs; [
    recursive
    nerd-fonts.fira-code
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
