{
  lib,
  outputs,
  ...
}: {
  imports =
    (builtins.attrValues outputs.homeManagerModules)
    ++ [
      ./common.nix
    ];

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  systemd.user.startServices = "sd-switch";

  home = {
    username = lib.mkDefault "mdziuba";
    homeDirectory = "/home/mdziuba";
  };
}
