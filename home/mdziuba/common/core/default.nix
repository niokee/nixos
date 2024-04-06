{ config, lib, pkgs, outputs, ... }:
{
  imports = [
    ./ssh.nix
    ./zsh.nix
  ] ++ (builtins.attrValues outputs.homeManagerModules);

  fonts.fontconfig.enable = true;
  home = {
    username = lib.mkDefault "mdziuba";
    homeDirectory = "/home/${config.home.username}";
    stateVersion = lib.mkDefault "23.11";
    sessionPath = [
      "$HOME/.local/scripts"
    ];
    sessionVariables = {
      FLAKE = "$HOME/.config/home-manager";
      SHELL = "zsh";
      TERM = "kitty";
      TERMINAL = "kitty";
      EDITOR = "nvim";
      MANPAGER = "batman";
    };
  };
  programs.git = {
      enable = true;
      userName = "Mateusz Dziuba";
      userEmail = "mateusz.dziuba97@gmail.com";
  };


  home.package = with pkgs; [
      # Packages that don't have custom configs go here
      
      btop
      pavucontrol
      lf
      dconf
      zoxide
      oh-my-zsh
      go
      gcc
      (nerdfonts.override { fonts = [ "FiraCode" ]; })
      gnumake
      thefuck
      redshift
      ffmpeg
  ];
  
  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
    };
  };

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" "repl-flake" ];
      warn-dirty = false;
    };
  };

  programs = {
    home-manager.enable = true;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
