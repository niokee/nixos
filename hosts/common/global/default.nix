{ inputs
, outputs
, ...
}: {
  imports = [
    ./nix.nix
    ./locale.nix
    ./systemd-boot.nix
  ];

  home-manager.extraSpecialArgs = {
    inherit inputs outputs;
  };

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
    };
  };
}
