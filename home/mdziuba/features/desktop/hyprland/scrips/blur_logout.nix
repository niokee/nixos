{ pkgs, ... }:
pkgs.writeShellScriptBin "blur_logout" ''
grim -t jpeg /tmp/shot.jpeg &&
magick /tmp/shot.jpeg -scale 10% -blur 0x2.5 -resize 1000% /tmp/shot_blurred.jpeg &&
wlogout --protocol layer-shell
''

