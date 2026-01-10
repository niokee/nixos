{
  pkgs,
  config,
  ...
}: {
  programs.zsh.enable = true;
  users.users.mdziuba = {
    isNormalUser = true;
    description = "Mateusz Dziuba";
    extraGroups =
      ["networkmanager" "wheel"]
      ++ [
        "docker"
        "git"
      ];
    shell = pkgs.zsh;
    packages = [pkgs.home-manager];
  };
  home-manager.users.mdziuba = import ../../../../home/mdziuba/${config.networking.hostName}.nix;
}
