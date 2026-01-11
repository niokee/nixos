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

  services = {
    displayManager = {
      autoLogin = {
        enable = true;
        user = "mdziuba";
      };
      sddm = {
        enable = true;
        # wayland.enable = true;
        theme = "Sugar Dark for SDDM";
      };
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
  };
  hardware.sane = {
    enable = true;
    extraBackends = [pkgs.hplipWithPlugin];
  };
  services.xserver = {
    xkb.layout = "pl";
    enable = true;
    videoDrivers = ["amdgpu"];
    windowManager.awesome = {
      enable = true;
      luaModules = with pkgs.luaPackages; [
        luarocks # is the package manager for Lua modules
        luadbi-mysql # Database abstraction layer
      ];
    };
  };
  # Akceleracja OpenGL/Vulkan i wideo
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true; # 32-bit dla Steam/niektórych gier
    extraPackages = with pkgs; [
      vaapiVdpau # mapuje VA-API -> VDPAU (często poprawia odtwarzanie)
      libvdpau-va-gl # fallback VDPAU przez VA-API
      rocm-opencl-icd # OpenCL (AMD)
      rocm-opencl-runtime
    ];
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
}
