    {lib, ...}: {
  xdg.configFile."skhd/skhdrc" = {
    executable = true;
    text = let
      modMask = "shift + alt";
      moveMask = "ctrl + alt";
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
        ${modMask} - n : yabai -m window --focus west
        ${modMask} - e : yabai -m window --focus south
        ${modMask} - i : yabai -m window --focus north
        ${modMask} - o : yabai -m window --focus east
        # swap managed window
        ${moveMask} - n : yabai -m window --swap west
        ${moveMask} - e : yabai -m window --swap south
        ${moveMask} - i : yabai -m window --swap north
        ${moveMask} - o : yabai -m window --swap east
        # rotate space
        ${moveMask} - j : yabai -m space --rotate 270
        ${moveMask} - ' : yabai -m space --rotate 90
        # send window to space
        ${lib.concatMapStrings (n: moveMask + " - " + n + " : yabai -m window --space " + n + "\n") (
          map toString (lib.range 1 9)
        )}
        # send window to space and follow focus
        ${moveMask} - u : yabai -m window --space prev ${focusSpaceLeft}
        ${moveMask} - y : yabai -m window --space next ${focusSpaceRight}
        # focus monitor
        ${modMask} - h : yabai -m display --focus prev
        ${modMask} - . : yabai -m display --focus next
        ${modMask} - , : yabai -m display --focus recent
        # send window to monitor and follow focus
        ${moveMask} - h : yabai -m window --display prev; yabai -m display --focus prev
        ${moveMask} - . : yabai -m window --display next; yabai -m display --focus next
        ${moveMask} - , : yabai -m window --display recent; yabai -m display --focus recent
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
        cmd - return: wezterm
      '';
    onChange = ''
      /opt/homebrew/bin/skhd --restart-service
    '';
  };
}
