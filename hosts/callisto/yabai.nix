{...}: {
  services.yabai = {
    enable = true;
    config = {
      # global settings
      mouse_follows_focus = "off";
      focus_follows_mouse = "off";
      window_origin_display = "default";
      window_placement = "second_child";
      split_ratio = 0.50;
      auto_balance = "off";
      display_arrangement_order = "default";

      ## SIP stuff
      window_topmost = "off";
      window_shadow = "on";
      window_opacity = "off";
      window_opacity_duration = 0.0;
      active_window_opacity = 1.0;
      normal_window_opacity = 0.90;
      window_border = "off";
      window_border_width = 6;
      active_window_border_color = "0xff775759";
      normal_window_border_color = "0xff555555";
      insert_feedback_color = "0xffd75f5f";

      # mouse
      mouse_modifier = "cmd";
      mouse_action1 = "move";
      mouse_action2 = "resize";
      mouse_drop_action = "swap";

      # general space settings
      layout = "bsp";
      external_bar = "all:40:0";
      top_padding = 20;
      bottom_padding = 20;
      left_padding = 20;
      right_padding = 20;
      window_gap = 15;
    };
    extraConfig = ''
      yabai -m space 1 --label code
      yabai -m space 2 --label mail
      yabai -m space 3 --label web
      yabai -m space 4 --label notes
      yabai -m space 5 --label re
      yabai -m space 6 --label media
      yabai -m space 7 --label social
      yabai -m space 8 --label games

      yabai -m rule --add app="^1Password$" sticky=on sub-layer=above manage=off
      yabai -m rule --add app='^Archive Utility$' sticky=on sub-layer=above manage=off
      yabai -m rule --add label="Finder" app="^Finder\$" title="(Co(py|nnect)|Move|Info|Pref)" sticky=on sub-layer=above manage=off
      yabai -m rule --add app="^Disk Utility$" sticky=on sub-layer=above manage=off
      yabai -m rule --add app="^System Information$" sticky=on sub-layer=above manage=off
      yabai -m rule --add app="^Activity Monitor$" sticky=on sub-layer=above manage=off

      # need to force refresh simple bar
      osascript -e 'tell application id "tracesOf.Uebersicht" to refresh'
    '';
  };
}
