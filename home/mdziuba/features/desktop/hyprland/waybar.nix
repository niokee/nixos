{ pkgs
, ...
}:
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = ''
      * {
          border: none;
          font-family: Font Awesome, Roboto, Arial, sans-serif;
          font-size: 13px;
          color: #ffffff;
          border-radius: 20px;
      }

      window {
      	/*font-weight: bold;*/
      }
      window#waybar {
          background: rgba(0, 0, 0, 0);
      }
      /*-----module groups----*/
      .modules-right {
      	background-color: rgba(0,43,51,0.85);
          margin: 2px 10px 0 0;
      }
      .modules-center {
      	background-color: rgba(0,43,51,0.85);
          margin: 2px 0 0 0;
      }
      .modules-left {
          margin: 2px 0 0 5px;
      	background-color: rgba(0,119,179,0.6);
      }
      /*-----modules indv----*/
      #workspaces button {
          padding: 1px 5px;
          background-color: transparent;
      }
      #workspaces button:hover {
          box-shadow: inherit;
      	background-color: rgba(0,153,153,1);
      }

      #workspaces button.focused {
      	background-color: rgba(0,43,51,0.85);
      }

      #clock,
      #pulseaudio,
      #custom-power {
          background-color: rgba(0,119,179,0.6);
          border-radius: 100px;
          margin: 5px 5px;
          padding: 1px 1px 1px 6px;
      }
    '';
    settings = [{
      modules-left = [ "hyprland/workspaces" ];
      modules-center = [ "clock" ];
      modules-right = [ "tray" "pulseaudio" "custom/power" ];

      clock = {
        on-click = "gnome-calendar";
      };
      pulseaudio = {
        format = "{volume}% {icon} ";
        format-bluetooth = "{volume}% {icon}  {format_source}";
        format-bluetooth-muted = " {icon}  {format_source}";
        format-muted = "0% {icon} ";
        format-source = "{volume}% ";
        format-source-muted = "";
        format-icons = {
          headphone = "";
          hands-free = "";
          headset = "";
          phone = "";
          portable = "";
          car = "";
          default = [ "" "" "" ];
        };
        on-click = "pavucontrol";
      };
      "custom/power" = {
        format = " ";
        # on-click = "swaynag -t warning -m 'Power Menu Options' -b 'Logout' 'swaymsg exit' -b 'Restart' 'shutdown -r now' -b 'Shutdown'  'shutdown -h now' --background=#005566 --button-background=#009999 --button-border=#002b33 --border-bottom=#002b33"
      };
    }];
  };
}
