{
  pkgs,
  ...
}: {
  system.stateVersion = 4;
  services.nix-daemon.enable = true;
  nix.settings.experimental-features = "nix-command flakes";
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
}
