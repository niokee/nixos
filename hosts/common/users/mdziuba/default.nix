{
  pkgs,
  config,
  personalConfig,
  ...
}: {
  programs.zsh.enable = true;
  users.users.mdziuba = {
    isNormalUser = true;
    description = personalConfig.user.name;
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
