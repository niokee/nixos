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
    git = {
      enable = true;
      extraConfig = {
        url = {
          "git@github.com:" = {
            insteadOf = [
              "https://github.com/"
            ];
          };
        };
      };
    };
  };

  home = {
    stateVersion = lib.mkDefault "24.05";
    sessionPath = [
      "$HOME/.local/scripts"
    ];
    sessionVariables = {
      FLAKE = "$HOME/.config/home-manager";
      SHELL = "zsh";
      TERM = "wezterm";
      TERMINAL = "wezterm";
      EDITOR = "nvim";
      MANPAGER = "batman";
    };
  };
}
