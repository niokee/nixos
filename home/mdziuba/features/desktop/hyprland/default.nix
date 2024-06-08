{ lib
, config
, pkgs
, inputs
, ...
}:
let
  hyprland = pkgs.hyprland.override { wrapRuntimeDeps = false; };
  xdph = pkgs.hyprland.xdh-desktop-portal.hyprland.override { inherit hyprland; };
in
{
  imports = [
    ./basic-binds.nix
    ./waybar.nix
    ./wlsunset.nix
    ./wlogout.nix
  ];


  xdg.portal = {
    extraPortals = [ xdph ];
    configPackages = [ hyprland ];
  };

  wayland.windowManager.hyprland = {
    enable = true;
    package = hyprland;
    systemd = {
      enable = true;
      # Same as default, but stop graphical-session too
      extraCommands = lib.mkBefore [

        "systemctl --user stop graphical-session.target"
        "systemctl --user start hyprland-session.target"
      ];
    };

    settings =
       let
         active = "rgb(C8C093)";
         inactive = "rgb(727169)";
       in
      {
        general = {
          allow_tearing = true;
          gaps_in = 15;
          gaps_out = 20;
          border_size = 2;
            "col.active_border" = active;
            "col.inactive_border" = inactive;
        };
        group = {
          "col.border_active" = active;
          "col.border_inactive" = inactive;
          groupbar.font_size = 11;
        };
        binds = {
          movefocus_cycles_fullscreen = false;
        };
        input = {
          kb_layout = "pl,us";
          touchpad.disable_while_typing = false;
        };
        dwindle = {
          split_width_multiplier = 1.35;
          pseudotile = true;
        };
        misc = {
          vfr = true;
          close_special_on_empty = true;
          focus_on_activate = true;
          # Unfullscreen when opening something
          new_window_takes_over_fullscreen = 2;
        };
        windowrulev2 =
          let
            steam = "title:^()$,class:^(steam)$";
          in
          [
            "stayfocused, ${steam}"
            "minsize 1 1, ${steam}"
            "immediate, ${steam}"
          ];
        layerrule = [
          "blur,waybar"
          "ignorezero,waybar"
          "blur,notifications"
          "ignorezero,notifications"
          "blur,rofi"
          "ignorezero,rofi"
          "noanim,wallpaper"
          "noanim,selection"
        ];

        decoration = {
          active_opacity = 0.97;
          inactive_opacity = 0.77;
          fullscreen_opacity = 1.0;
          rounding = 7;
          blur = {
            size = 5;
            passes = 3;
            new_optimizations = true;
            ignore_opacity = true;
            popups = true;
          };
          drop_shadow = true;
          shadow_range = 12;
          shadow_offset = "3 3";
          "col.shadow" = "0x44000000";
          "col.shadow_inactive" = "0x66000000";
        };
        animations = {
          enabled = true;
          bezier = [
            "easein,0.11, 0, 0.5, 0"
            "easeout,0.5, 1, 0.89, 1"
            "easeinout,0.45, 0, 0.55, 1"
            "easeinback,0.36, 0, 0.66, -0.56"
            "easeoutback,0.34, 1.56, 0.64, 1"
            "easeinoutback,0.68, -0.6, 0.32, 1.6"
          ];

            animation = [
              "border,1,3,easeout"
              "workspaces,1,2,easeoutback,slide"
              "windowsIn,1,3,easeoutback,slide"
              "windowsOut,1,3,easeinback,slide"
              "windowsMove,1,3,easeoutback"
              "fadeIn,1,3,easeout"
              "fadeOut,1,3,easein"
              "fadeSwitch,1,3,easeinout"
              "fadeShadow,1,3,easeinout"
              "fadeDim,1,3,easeinout"
              "fadeLayers,1,3,easeoutback"
              "layers,1,3,easeoutback,slide"
            ];
        };

        exec = [ "${pkgs.swaybg}/bin/swaybg -i /home/mdziuba/.config/home-manager/home/.dotfiles/darksky2.png --mode fill" ];

        bind =
          let
            grim = lib.getExe pkgs.grim;
            slurp = lib.getExe pkgs.slurp;
            wl-clipboard = lib.getExe pkgs.wl-clipboard;
            tesseract = lib.getExe pkgs.tesseract;
            pactl = lib.getExe' pkgs.pulseaudio "pactl";
            notify-send = lib.getExe' pkgs.libnotify "notify-send";
            terminal = "wezterm";
            defaultApp = type: "${lib.getExe' pkgs.gtk3 "gtk-launch"} $(${lib.getExe' pkgs.xdg-utils "xdg-mime"} query default ${type})";
            browser = defaultApp "x-scheme-handler/https";
            editor = "wezterm -e nvim";
          in
          [
            # Program bindings
            "SUPER,Return,exec,${terminal}"
            "SUPER,r,exec,/home/mdziuba/.config/rofi/scripts/launcher_t7"
            "SUPER,e,exec,${editor}"
            "SUPER,v,exec,${editor}"
            "SUPER,b,exec,${browser}"
            "SUPERSHIFT,b,exec,auto-connect-bt"
            # Brightness control (only works if the system has lightd)
            ",XF86MonBrightnessUp,exec,light -A 10"
            ",XF86MonBrightnessDown,exec,light -U 10"
            ",XF86AudioRaiseVolume,exec,${pactl} set-sink-volume @DEFAULT_SINK@ +5%"
            ",XF86AudioLowerVolume,exec,${pactl} set-sink-volume @DEFAULT_SINK@ -5%"
            ",XF86AudioMute,exec,${pactl} set-sink-mute @DEFAULT_SINK@ toggle"
            "SHIFT,XF86AudioMute,exec,${pactl} set-source-mute @DEFAULT_SOURCE@ toggle"
            ",XF86AudioMicMute,exec,${pactl} set-source-mute @DEFAULT_SOURCE@ toggle"
            # Screenshotting
            ''SUPER,s,exec,${grim} -g $(hyprctl monitors -j | jq -r '.[] | select(.focused == true)' | jq -r '.name') "$(${slurp} -b 00000000 -c DCD7BA)"''
            ''SUPERSHIFT,s,exec,${grim} -g "$(${slurp} -b 00000040 -c DCD7BA)" - | wl-copy''
            ''SUPERCONTROLALT,s,exec,${grim} -g "$(${slurp} -b 00000040 -c DCD7BA)"''
          ]
          ++ (
            let
              playerctl = lib.getExe' config.services.playerctld.package "playerctl";
              playerctld = lib.getExe' config.services.playerctld.package "playerctld";
            in
            lib.optionals config.services.playerctld.enable [
              # Media control
              ",XF86AudioNext,exec,${playerctl} next"
              ",XF86AudioPrev,exec,${playerctl} previous"
              ",XF86AudioPlay,exec,${playerctl} play-pause"
              "ALT,XF86AudioNext,exec,${playerctld} shift"
              "ALT,XF86AudioPrev,exec,${playerctld} unshift"
              "ALT,XF86AudioPlay,exec,systemctl --user restart playerctld"
            ]
          )
          ++
          # Screen lock
          (
            let
              swaylock = lib.getExe config.programs.swaylock.package;
            in
            lib.optionals config.programs.swaylock.enable [
              ",XF86Launch5,exec,${swaylock} -S --grace 2"
              ",XF86Launch4,exec,${swaylock} -S --grace 2"
              "SUPER,backspace,exec,${swaylock} -S --grace 2"
            ]
          )
          ++
          # Notification manager
          (
            let
              makoctl = lib.getExe' config.services.mako.package "makoctl";
            in
            lib.optionals config.services.mako.enable [ "SUPER,w,exec,${makoctl} dismiss" ]
          );
        
        monitor = map
          (
            m:
            let
              resolution = "${toString m.width}x${toString m.height}@${toString m.refreshRate}";
              position = "${toString m.x}x${toString m.y}";
            in
            "${m.name},${
           if m.enabled
           then "${resolution},${position},1"
           else "disable"
         }"
          )
          (config.monitors);
        workspace = [
          "HDMI-A-2,1"
          "HDMI-A-2,2"
          "HDMI-A-2,3"
          "HDMI-A-2,4"
          "HDMI-A-2,5"
          "DP-2,6"
          "DP-2,7"
          "DP-2,8"
          "DP-2,9"
          "DP-2,10"

        ];
      };
  };
}
