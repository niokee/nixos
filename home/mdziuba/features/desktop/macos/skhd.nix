{lib, ...}: {
  xdg.configFile."skhd/skhdrc" = {
    executable = true;
    text = let
      modMask = "shift + alt";
      moveMask = "ctrl + shift + alt";
      focusSpaceLeft = ''
        && osascript -e 'tell app "System Events" to key code "4" using {control down, shift down}'
      '';
      focusSpaceRight = ''
        && osascript -e 'tell app "System Events" to key code "37" using {control down, shift down}'
      '';
    in
      # sh
      ''
        # focus window
        ${modMask} - h : yabai -m window --focus west
        ${modMask} - j : yabai -m window --focus south
        ${modMask} - k : yabai -m window --focus north
        ${modMask} - l : yabai -m window --focus east
        # swap managed window
        ${moveMask} - h : yabai -m window --swap west
        ${moveMask} - j : yabai -m window --swap south
        ${moveMask} - k : yabai -m window --swap north
        ${moveMask} - l : yabai -m window --swap east
        # rotate space
        ${moveMask} - n : yabai -m space --rotate 270
        ${moveMask} - m : yabai -m space --rotate 90
        # send window to space
        ${lib.concatMapStrings (n: moveMask + " - " + n + " : yabai -m window --space " + n + "\n") (
          map toString (lib.range 1 9)
        )}
        # send window to space and follow focus
        ${moveMask} - u : yabai -m window --space prev ${focusSpaceLeft}
        ${moveMask} - i : yabai -m window --space next ${focusSpaceRight}
        # focus monitor
        ${modMask} - w : yabai -m display --focus prev
        ${modMask} - e : yabai -m display --focus next
        ${modMask} - r : yabai -m display --focus recent
        # send window to monitor and follow focus
        ${moveMask} - w : yabai -m window --display prev; yabai -m display --focus prev
        ${moveMask} - e : yabai -m window --display next; yabai -m display --focus next
        ${moveMask} - r : yabai -m window --display recent; yabai -m display --focus recent
        # balance size of windows
        ${modMask} - space : yabai -m space --balance
        # increase window size
        ${modMask} - left : yabai -m window --resize left:-20:0
        ${modMask} - right : yabai -m window --resize right:20:0
        ${modMask} - up : yabai -m window --resize top:-20:0
        ${modMask} - down : yabai -m window --resize bottom:20:0
        # decrease window size
        ${moveMask} - left : yabai -m window --resize left:20:0
        ${moveMask} - right : yabai -m window --resize right:-20:0
        ${moveMask} - up : yabai -m window --resize top:20:0
        ${moveMask} - down : yabai -m window --resize bottom:-20:0
        # float / unfloat window and center on screen
        ${modMask} - t : yabai -m window --toggle float; \
                  yabai -m window --grid 4:4:1:1:2:2

        # unbind hide window shortcut
        cmd - h : skhd -k ""
      '';
    onChange = ''
      /opt/homebrew/bin/skhd --restart-service
    '';
  };
}
