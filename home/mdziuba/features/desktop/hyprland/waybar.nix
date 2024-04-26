{ pkgs
, ...
}:
let
  wlogoutScript = ''${pkgs.grim}/bin/grim -t jpeg /tmp/shot.jpeg && \
    ${pkgs.imagemagick}/bin/magick /tmp/shot.jpeg -scale 10% -blur 0x2.5 -resize 1000% /tmp/shot_blurred.jpeg && \
    ${pkgs.wlogout}/bin/wlogout --protocol layer-shell'';
in
{

  programs.waybar = {
    enable = true;
    systemd.enable = true;
    systemd.target = "hyprland-session.target";
    style = ''
      * {
          border: none;
          font-family: Font Awesome, Roboto, Arial, sans-serif;
          font-size: 13px;
          color: #DCD7BA;
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
      	background-color: rgba(31,31,40,0.85);
          margin: 2px 10px 0 0;
      }
      .modules-center {
      	background-color: rgba(31,31,40,0.85);
          margin: 2px 0 0 0;

      }
      .modules-left {
          margin: 2px 0 0 5px;
      	background-color: rgba(31,31,40,0.85);
      }
      /*-----modules indv----*/
      #workspaces button {
          padding: 1px 5px;
          background-color: transparent;
      }
      #workspaces button:hover {
          box-shadow: inherit;
      	background-color: rgba(200,192,147,1);
        color: #2D4F67;
      }

      #workspaces button.focused {
      	background-color: rgba(200,192,147,1);
        color: #2D4F67;
      }

      #clock,
      #pulseaudio {
      	background-color: rgba(31,31,40,0.85);
          border-radius: 100px;
          margin: 5px 5px;
          padding: 1px 6px 1px 6px;
      }
      #custom-power {
      	background-color: rgba(31,31,40,0.85);
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
        on-click = "${pkgs.gnome.gnome-calendar}/bin/gnome-calendar";
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
        on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
      };
      "custom/power" = {
        format = " ";
        on-click = wlogoutScript;
      };
    }];
  };
}
