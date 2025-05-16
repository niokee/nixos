{pkgs, ...}: {
  nix.enable = true;
  system.stateVersion = 4;

  nix.settings = {
    experimental-features = "nix-command flakes";
  };
  nixpkgs.hostPlatform = "aarch64-darwin";
  services.skhd.enable = true;

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
      "flameshot"
      "sf-symbols"
      "logitech-g-hub"
      "1password"
    ];
  };
}
