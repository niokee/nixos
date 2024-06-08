{
  description = "Home Manager configuration of mdziuba";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    hyprwm-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    
    sops-nix = {
      url = "github:mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      inherit (self) outputs;
      lib = nixpkgs.lib // home-manager.lib;
      systems = [
        "x86_64-linux"
      ];
      forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});
      pkgsFor = lib.genAttrs systems (system: import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      });
    in
    {
      inherit lib;
      nix.settings.experimental-features = ["nix-command" "flakes"];

      # Custom modules to enable special functionality for nixos or home-manager oriented configs.
      nixosModules = import ./modules/nixos;
      homeManagerModules = import ./modules/home-manager;

      # Custom modifications/overrides to upstream packages.
      overlays = import ./overlays { inherit inputs outputs; };

      # Nix formatter available through 'nix fmt' https://nix-community.github.io/nixpkgs-fmt
      formatter = forEachSystem (pkgs: pkgs.nixpkgs-fmt);

      # Shell configured with packages that are typically only needed when working on or with nix-config.
      devShells = forEachSystem (pkgs: import ./shell.nix { inherit pkgs; });

      nixosConfigurations = {
          ganymede = lib.nixosSystem {
              modules = [ ./hosts/ganymede ];
              specialArgs = { inherit inputs outputs; };
          };
      };

      homeConfigurations = {
        "mdziuba@ganymede" = lib.homeManagerConfiguration {
          modules = [ ./home/mdziuba/ganymede.nix ];
          pkgs = pkgsFor.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs; };
        };
      };
    };
}
