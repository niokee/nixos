{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../common/global

    ../common/users/mdziuba

    ../common/optional/_1password.nix
    ../common/optional/bluetooth.nix
    ../common/optional/pipewire.nix
    ../common/optional/systemd-boot.nix
  ];

  system.stateVersion = "25.05";

  services = {
    displayManager.dms-greeter = {
      enable = true;
      compositor.name = "niri";
    };
    printing = {
      enable = true;
      drivers = [pkgs.hplipWithPlugin];
    };
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    devmon.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;
    xserver.videoDrivers = ["nvidia"];
  };
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    sane = {
      enable = true;
      extraBackends = [pkgs.hplipWithPlugin];
    };
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;

      open = false;
      nvidiaSettings = true;

      package = config.boot.kernelPackages.nvidiaPackages.stable;
      forceFullCompositionPipeline = true;
    };
  };
  programs.xwayland.enable = true;
  programs.niri = {
    enable = true;
  };

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1"; # Fixes cursor issues
    NIXOS_OZONE_WL = "1"; # For Electron apps
  };

  networking = {
    hostName = "ganymede";
    networkmanager.enable = true;
  };
  fileSystems."/mnt/archive" = {
    device = "/dev/disk/by-uuid/edbbd4d3-a985-4339-be99-004849e0a385";
    fsType = "ext4";
    options = ["nofail" "x-systemd.automount"];
  };

  fileSystems."/mnt/games" = {
    device = "/dev/disk/by-uuid/83f0bf86-4180-47d7-9704-2a055cb0f8f3";
    fsType = "ext4";
    options = ["nofail" "x-systemd.automount"];
  };

  fileSystems."/mnt/games2" = {
    device = "/dev/disk/by-uuid/beaa416d-c81e-490e-a280-6425ade16362";
    fsType = "ext4";
    options = ["nofail" "x-systemd.automount"];
  };
}
