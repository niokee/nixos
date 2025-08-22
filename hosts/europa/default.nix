{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../common/global

    ../common/users/mdziuba

    ../common/optional/bluetooth.nix
    ../common/optional/pipewire.nix
    ../common/optional/systemd-boot.nix
  ];

  system.stateVersion = "25.05";
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  services.xserver = {
    xkb.layout = "pl";
    enable = true;
    videoDrivers = ["modesetting"];

    libinput.enable = true;

    displayManager.sddm = {
      enable = true;
      wayland.enable = false;
      theme = "breeze";
    };
    windowManager.awesome.enable = true;
  };
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    # extraPackages = with pkgs; [
    # vappiVdpau
    # libvdpau-va-gl
    # rocm-opencl-icd
    # rocm-opencl-runtime
    # ];
  };
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  networking = {
    hostName = "europa";
    networkmanager.enable = true;
  };

  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  boot.initrd.kernelModules = ["amdgpu"];
  boot.kernelPackages = pkgs.linuxPackages_6_6;
  environment.systemPackages = with pkgs; [xorg.xinit xterm];
}
