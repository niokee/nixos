{
  description = "Home Manager configuration of mdziuba";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager-stable = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:lnl7/nix-darwin/nix-darwin-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dms = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";

    sops-nix = {
      url = "github:mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    _1password-shell-plugins.url = "github:1Password/shell-plugins";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        # IMPORTANT: we're using "libgbm" and is only available in unstable so ensure
        # to have it up-to-date or simply don't specify the nixpkgs input
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/3";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-stable,
    nixos-wsl,
    home-manager,
    home-manager-stable,
    darwin,
    nix-homebrew,
    determinate,
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
        modules = [
          ./hosts/ganymede
        ];
        specialArgs = {inherit inputs outputs;};
      };
      europa = lib.nixosSystem {
        modules = [./hosts/europa];
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

    darwinConfigurations = {
      mateuszs-MacBook-Pro-2 = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        pkgs = pkgsFor.aarch64-darwin.stable;
        modules = [
          ./hosts/callisto
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              user = "mateusz";
            };
          }
          home-manager-stable.darwinModules.home-manager
          {
            home-manager = {
              useUserPackages = true;

              users.mateusz = import ./home/mdziuba/callisto.nix;
              extraSpecialArgs = {
                inherit inputs outputs;
                pkgs = pkgsFor.aarch64-darwin.stable;
              };
            };
          }
          # Add the determinate nix-darwin module
          determinate.darwinModules.default
          ({...}: {
            # Let Determinate Nix handle Nix configuration rather than nix-darwin
            nix.enable = false;
          })
        ];
        specialArgs = {inherit inputs outputs;};
      };
    };
  };
}
