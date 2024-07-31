{
  services.wlsunset = {
    enable = true;
    latitude = "52.2";
    longitude = "21.0";
    temperature = {
      day = 6500;
      night = 3500;
    };
    systemdTarget = "hyprland-session.target";
  };
}
