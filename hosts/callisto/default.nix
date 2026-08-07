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

  determinateNix.customSettings = {
    trusted-users = ["root" "mateusz"];
    extra-substituters = ["https://devenv.cachix.org"];
    extra-trusted-public-keys = [
      "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
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
      "spotify"
    ];
  };
}
