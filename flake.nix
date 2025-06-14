{
  description = "Home Manager configuration of mdziuba";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
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
    _1password-shell-plugins.url = "github:1Password/shell-plugins";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-stable,
    nixos-wsl,
    home-manager,
    darwin,
    nix-homebrew,
    ...
  } @ inputs: let
    inherit (self) outputs;
    lib = nixpkgs.lib // home-manager.lib;
    systems = [
      "x86_64-linux"
      "aarch64-darwin"
    ];
    forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});
    pkgsFor = lib.genAttrs systems (system: {
      unstable = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      stable = import nixpkgs-stable {
        inherit system;
        config.allowUnfree = true;
      };
    });
  in {
    inherit lib;
    nix.settings.experimental-features = ["nix-command" "flakes"];

    # Custom modules to enable special functionality for nixos or home-manager oriented configs.
    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home-manager;

    # Custom modifications/overrides to upstream packages.
    overlays = import ./overlays {inherit inputs outputs;};

    # Nix formatter available through 'nix fmt' https://nix-community.github.io/nixpkgs-fmt
    formatter = forEachSystem (pkgs: pkgs.nixpkgs-fmt);

    # Shell configured with packages that are typically only needed when working on or with nix-config.
    devShells = forEachSystem (pkgs: import ./shell.nix {inherit pkgs;});

    nixosConfigurations = {
      ganymede = lib.nixosSystem {
        modules = [./hosts/ganymede];
        specialArgs = {inherit inputs outputs;};
      };
      io = lib.nixosSystem {
        modules = [
          nixos-wsl.nixosModules.default
          {
            system.stateVersion = "25.05";
            wsl.enable = true;
          }
          ./hosts/io
        ];
        specialArgs = {inherit inputs outputs;};
      };
    };

    homeConfigurations = {
      "mdziuba@ganymede" = lib.homeManagerConfiguration {
        modules = [./home/mdziuba/ganymede.nix];
        pkgs = pkgsFor.x86_64-linux.unstable;
        extraSpecialArgs = {inherit inputs outputs;};
      };
      "mdziuba@io" = lib.homeManagerConfiguration {
        modules = [./home/mdziuba/io.nix];
        pkgs = pkgsFor.x86_64-linux.unstable;
        extraSpecialArgs = {inherit inputs outputs;};
      };
    };

    darwinConfigurations = {
      mateuszs-MacBook-Pro = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        pkgs = pkgsFor.aarch64-darwin.unstable;
        modules = [
          ./hosts/callisto
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              user = "mateusz";
            };
          }
          home-manager.darwinModules.home-manager
          {
            home-manager.useUserPackages = true;
            home-manager.users.mateusz = import ./home/mdziuba/callisto.nix;
            home-manager.extraSpecialArgs = {
              inherit inputs outputs;
              pkgs = pkgsFor.aarch64-darwin.unstable;
              pkgsStable = pkgsFor.aarch64-darwin.stable;
            };
          }
        ];
        specialArgs = {inherit inputs outputs;};
      };
    };
  };
}
