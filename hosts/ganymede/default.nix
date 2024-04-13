{ config, pkgs, inputs, ... }: {

  imports = [
    ./hardware-configuration.nix

    ../common/global

    ../common/users/mdziuba

    ../common/optional/pipewire.nix
    ../common/optional/bluetooth.nix
  ];
    
  system.stateVersion = "24.05";

  services.xserver.enable = true;
  services.xserver.displayManager.sddm = {
      enable = true;
      wayland = {
          enable = true;
          compositor = "weston";
      };
  };
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "mdziuba";
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    xwayland.enable = true;

  };
  environment.sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL = "1";
  };

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
  networking = {
    hostName = "ganymede";
    networkmanager.enable = true;
  };
  # Bootloader.
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];

}
