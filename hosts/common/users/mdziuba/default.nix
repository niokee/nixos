{ pkgs, ... }: {

  users.users.mdziuba = {
    isNormalUser = true;
    description = "Matuesz Dziuba";
    extraGroups = [ "networkmanager" "wheel" ] ++ [
      "docker"
      "git"
    ];
    shell = pkgs.zsh;
  };
}
