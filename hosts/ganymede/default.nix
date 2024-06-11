{ config, pkgs, inputs, ... }: {

  imports = [
    ./hardware-configuration.nix

    ../common/global

    ../common/users/mdziuba

    ../common/optional/pipewire.nix
    ../common/optional/bluetooth.nix
  ];
  
  system.stateVersion = "24.11";

  services = {
    displayManager = {
        autoLogin = {
            enable = true;
            user = "mdziuba";
        };
        sddm = {
            enable = true;
            wayland.enable = true;
            theme = "Sugar Dark for SDDM";
        };
    };
  };
  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
  };

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

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };
  networking = {
    hostName = "ganymede";
    networkmanager.enable = true;
  };

  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;
}
