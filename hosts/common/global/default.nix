{
  inputs,
  outputs,
  personalConfig,
  myLib,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./nix.nix
    ./locale.nix
  ];

  home-manager.extraSpecialArgs = {
    inherit inputs outputs personalConfig myLib;
  };

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
    };
  };

  documentation.man = {
    enable = true;
    generateCaches = true;
  };
}
