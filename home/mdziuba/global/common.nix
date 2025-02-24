{
  lib,
  pkgs,
  ...
}: {
  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      warn-dirty = false;
    };
  };

  programs = {
    home-manager.enable = true;
  };

  home = {
    stateVersion = lib.mkDefault "25.05";
    sessionPath = [
      "$HOME/.local/scripts"
    ];
    sessionVariables = {
      FLAKE = "$HOME/.config/home-manager";
      SHELL = "zsh";
      TERM = lib.mkDefault "wezterm";
      TERMINAL = lib.mkDefault "wezterm";
      EDITOR = "nvim";
      MANPAGER = "batman";
    };
  };
}
