{
  config,
  pkgs,
  inputs,
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

  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  system.stateVersion = "25.05";
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "breeze";
  };

  programs.hyprland = {
    enable = true;
    # set the flake package
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # make sure to also set the portal package, so that they are in sync
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };
  # services.xserver = {
  #   xkb.layout = "pl";
  #   enable = true;
  #   videoDrivers = ["modesetting"];
  #
  #   libinput.enable = true;
  #
  #   windowManager.awesome.enable = true;
  # };
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
  hardware.xone.enable = true;

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
  environment.systemPackages = with pkgs; [
    xorg.xinit
    xterm
    linuxKernel.packages.linux_zen.xone
  ];
}
