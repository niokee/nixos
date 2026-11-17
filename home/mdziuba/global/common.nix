{
  lib,
  pkgs,
  ...
}: {
  xdg.enable = true;

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

  # Building `man home-configuration.nix` runs option declaration paths through
  # `toString`, which drops store-path context and warns on every eval. The
  # rendered page is on the web anyway, so skip it.
  manual.manpages.enable = false;

  home = {
    stateVersion = lib.mkDefault "25.05";
    sessionPath = [
      "$HOME/.local/scripts"
      # claude-code native installer target (self-updating)
      "$HOME/.local/bin"
    ];
    sessionVariables = {
      FLAKE = "$HOME/.config/home-manager";
      SHELL = "zsh";
      TERMINAL = lib.mkDefault "wezterm";
      EDITOR = "nvim";
      MANPAGER = "batman";
    };
  };
}
