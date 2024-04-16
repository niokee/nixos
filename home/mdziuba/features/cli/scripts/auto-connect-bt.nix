{ pkgs, ... }:

pkgs.writeShellScriptBin "auto-connect-bt" ''
  bluetoothctl trust F8:4E:17:7F:1B:A3 > /dev/null
  bluetoothctl disconnect F8:4E:17:7F:1B:A3 > /dev/null
  bluetoothctl connect F8:4E:17:7F:1B:A3 > /dev/null
''
