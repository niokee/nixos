{lib, ...}: {
  xdg.configFile."yabai/yabairc" = {
    executable = true;
    text =
      # sh
      ''
        #!/usr/bin/env sh

        # global settings
        yabai -m config mouse_follows_focus          on
        yabai -m config focus_follows_mouse          off
        yabai -m config window_origin_display        default
        yabai -m config window_placement             second_child
        yabai -m config split_ratio                  0.50
        yabai -m config auto_balance                 off
        yabai -m config display_arrangement_order    default

        ## SIP stuff
        # yabai -m config window_topmost               off
        # yabai -m config window_shadow                on
        # yabai -m config window_opacity               off
        # yabai -m config window_opacity_duration      0.0
        # yabai -m config active_window_opacity        1.0
        # yabai -m config normal_window_opacity        0.90
        # yabai -m config window_border                off
        # yabai -m config window_border_width          6
        # yabai -m config active_window_border_color   0xff775759
        # yabai -m config normal_window_border_color   0xff555555
        # yabai -m config insert_feedback_color        0xffd75f5f

        # mouse
        yabai -m config mouse_modifier               cmd
        yabai -m config mouse_action1                move
        yabai -m config mouse_action2                resize
        yabai -m config mouse_drop_action            swap

        # general space settings
        yabai -m config layout                       bsp
        yabai -m config external_bar                 all:40:0
        # yabai -m config top_padding                  40
        yabai -m config bottom_padding               20
        yabai -m config left_padding                 20
        yabai -m config right_padding                20
        yabai -m config window_gap                   15

        # rules
        #yabai -m rule --add app=".*" sub-layer=normal
        yabai -m rule --add app="^System Settings$" sticky=on sub-layer=above manage=off
        yabai -m rule --add app="^1Password$" sticky=on sub-layer=above manage=off
        yabai -m rule --add app='^Archive Utility$' sticky=on sub-layer=above manage=off
        yabai -m rule --add label="Finder" app="^Finder\$" title="(Co(py|nnect)|Move|Info|Pref)" sticky=on sub-layer=above manage=off
        yabai -m rule --add app="^Disk Utility$" sticky=on sub-layer=above manage=off
        yabai -m rule --add app="^System Information$" sticky=on sub-layer=above manage=off
        yabai -m rule --add app="^Activity Monitor$" sticky=on sub-layer=above manage=off
        yabai -m rule --add label="Arc" app="^Arc$" title="^Little Arc.*" sticky=on sub-layer=above manage=off
        yabai -m rule --add subrole="^AXSystemDialog$" sticky=on sub-layer=above mouse_follows_focus=off manage=off

        # need to force refresh simple bar
        osascript -e 'tell application id "tracesOf.Uebersicht" to refresh'

        echo "yabai configuration loaded.."
      '';
    # ${pkgs.yabai}/bin/yabai --restart-service
    onChange = ''
      /opt/homebrew/bin/yabai --restart-service
    '';
  };

  # launchd.agents.yabai = {
  #   enable = true;
  #   config = {
  #     ProgramArguments = [ "${pkgs.skhd}/bin/yabai" ];
  #     EnvironmentVariables = {
  #       "PATH" = "$HOME/.nix-profile/bin:/nix/var/nix/profiles/default/bin:/usr/local/bin:/usr/bin:/usr/sbin:/bin:/sbin:";
  #       "SHELL" = "/bin/sh";
  #     };
  #     KeepAlive = true;
  #     RunAtLoad = true;
  #     ProcessType = "Interactive";
  #     StandardErrorPath = "/tmp/yabai.err.log";
  #     StandardOutPath = "/tmp/yabai.out.log";
  #   };
  # };


}
