{
  pkgs,
  config,
  ...
}: {
  users.users.mdziuba = {
    isNormalUser = true;
    description = "Matuesz Dziuba";
    extraGroups =
      ["networkmanager" "wheel"]
      ++ [
        "docker"
        "git"
      ];
    shell = pkgs.zsh;
    packages = [pkgs.home-manager];
  };
  programs.zsh.enable = true;
  home-manager.backupFileExtension = "backup";
  home-manager.users.mdziuba = import ../../../../home/mdziuba/${config.networking.hostName}.nix;
}
