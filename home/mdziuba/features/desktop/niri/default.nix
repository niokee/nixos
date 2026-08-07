{
  config,
  pkgs,
  myLib,
  ...
}: {
  imports = [
    ./dms.nix
  ];
  home.packages = with pkgs; [
    xwayland-satellite
    quickshell
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
    # Upstream stopped defaulting gtk4 to `gtk.theme` at stateVersion 26.05;
    # keep GTK4 apps on Adwaita-dark rather than falling back to unthemed.
    gtk4.theme = config.gtk.theme;
    gtk4.extraConfig = {
      "gtk-application-prefer-dark-theme" = 1;
    };
  };

  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "gtk3";
  };

  home.file = myLib.mkDotfileEntry config "niri";
}
