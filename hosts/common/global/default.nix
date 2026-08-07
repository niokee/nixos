{
  inputs,
  outputs,
  personalConfig,
  myLib,
  pkgs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./nix.nix
    ./locale.nix
  ];

  home-manager.extraSpecialArgs = {
    inherit inputs outputs personalConfig myLib;
    pkgsUnstable = import inputs.nixpkgs {
      inherit (pkgs.stdenv.hostPlatform) system;
      config.allowUnfree = true;
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  documentation.man = {
    enable = true;
    cache.enable = true;
  };
}
