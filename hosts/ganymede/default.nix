{
  pkgs,
  config,
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
  };
  programs.xwayland.enable = true;
  programs.niri.enable = true;
  environment.etc."niri/config.kdl".source = ../../home/dotfiles/niri/config.kdl;
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
  networking = {
    hostName = "ganymede";
    networkmanager.enable = true;
  };
  boot.initrd.kernelModules = ["amdgpu"];
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
