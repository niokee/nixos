{pkgs, ...}: {
  services.blueman.enable = true;
  hardware.firmware = [ pkgs.rtl8761b-firmware ];
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true;
      };
    };
  };

  systemd.services.connect-headphones = {
    description = "Auto-connect Bluetooth headphones";
    after = ["multi-user.target"];
    requires = ["multi-user.target"];
    script = ''
      ${pkgs.bluez}/bin/bluetoothctl power on
      ${pkgs.bluez}/bin/bluetoothctl agent on
      ${pkgs.bluez}/bin/bluetoothctl connect F8:4E:17:7F:1B:A3
    '';
  };
}
