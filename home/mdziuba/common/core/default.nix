{ config, lib, pkgs, outputs, ... }:
{
  imports = [
    ./ssh.nix
    ./zsh.nix
    ./hyprland  
  ] ++ (builtins.attrValues outputs.homeManagerModules);

  fonts.fontconfig.enable = true;
  home = {
    username = lib.mkDefault "mdziuba";
    homeDirectory = "/home/mdziuba";
    stateVersion = lib.mkDefault "23.11";
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
  programs.git = {
    enable = true;
    userName = "Mateusz Dziuba";
    userEmail = "mateusz.dziuba97@gmail.com";
  };


  home.packages = with pkgs; [
    # Packages that don't have custom configs go here
    amphetype
    lolcat
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
    wezterm
    lua
    ruff
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
      experimental-features = [
        "nix-command"
        "flakes"
        "repl-flake"
      ];
      warn-dirty = false;
    };
  };

  programs = {
    home-manager.enable = true;
  };


  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
  home.file = {
    "${config.xdg.configHome}/.p10k.zsh".source = ./../../../.dotfiles/zsh/.p10k.zsh;
    "${config.xdg.configHome}/nvim".source = ./../../../.dotfiles/nvim;
    ".tmux.conf".source = ./../../../.dotfiles/tmux/.tmux.conf;
    "${config.xdg.configHome}/awesome" = {
      source = ./../../../.dotfiles/awesome;
      recursive = true;
    };
    "${config.xdg.configHome}/picom" = {
      source = ./../../../.dotfiles/picom;
      recursive = true;
    };
    "${config.xdg.configHome}/rofi" = {
      source = ./../../../.dotfiles/rofi;
      recursive = true;
    };
    "${config.xdg.configHome}/wezterm" = {
      source = ./../../../.dotfiles/wezterm;
      recursive = true;
    };
  };
}
