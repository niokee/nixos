{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./dms.nix
  ];
  home.packages = with pkgs; [
    xwayland-satellite
    quickshell
    # qt6Packages.qt6ct
  ];
  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
    config.common.default = "*";
  };

  dconf.enable = true;
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = "Adwaita-dark";
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };

    gtk3.extraConfig = {
      "gtk-application-prefer-dark-theme" = 1;
    };
    gtk4.extraConfig = {
      "gtk-application-prefer-dark-theme" = 1;
    };
  };

  # home.sessionVariables = {
  #   QT_QPA_PLATFORMTHEME = "gtk3";
  # };

  home.file."${config.xdg.configHome}/niri".source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/nixos/home/dotfiles/niri";
}
