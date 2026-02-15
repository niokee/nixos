{pkgs, ...}: {
  hardware.firmware = [pkgs.rtl8761b-firmware];
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true; # Ensure BT is on at boot
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
        Experimental = true; # Enables better device reconnection
        AutoEnable = true;
      };
      Policy = {
        AutoEnable = true;
        ReconnectAttempts = 7;
        ReconnectIntervals = "1,2,4,8,16,32,64";
      };
    };
  };
}
