{pkgs, ...}: {
  system = {
    stateVersion = 4;
    primaryUser = "mateusz";
  };

  nix.settings = {
    experimental-features = "nix-command flakes";
    trusted-users = [
      "root"
      "mateusz"
    ];
    substituters = [
      "https://cache.nixos.org"
      "https://devenv.cachix.org"
    ];
  };
  nixpkgs.hostPlatform = "aarch64-darwin";
  services.skhd.enable = true;
  services.yabai = {
    enable = true;
    enableScriptingAddition = true;
  };

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
      "docker-desktop"
      "protonvpn"
      "sf-symbols"
      "logitech-g-hub"
    ];
  };
}
