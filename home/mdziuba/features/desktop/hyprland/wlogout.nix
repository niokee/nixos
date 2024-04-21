{
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "lock";
        action = "sleep 1; hyprlock";
        text = "Lock";
        keybind = "l";
      }
      {
        label = "hibernate";
        action = "sleep 1; systemctl hibernate";
        text = "Hibernate";
        keybind = "h";
      }
      {
        label = "logout";
        action = "sleep 1; killall -9 Hyprland sleep 2";
        text = "Exit";
        keybind = "e";
      }
      {
        label = "shutdown";
        action = "sleep 1; systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
      {
        label = "suspend";
        action = "sleep 1; systemctl suspend";
        text = "Suspend";
        keybind = "u";
      }
      {
        label = "reboot";
        action = "sleep 1; systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
    ];
    style = ''

    * {
        font-family: "Fira Sans Retina";
        background-image: none;
        transition: 20ms;
        box-shadow: none;
    }

    window {
         background: url("/tmp/shot_blurred.jpeg");
         background-size: cover;
    }

    button {
        color: #FFFFFF;
        font-size:20px;

        background-repeat: no-repeat;
        background-position: center;
        background-size: 25%;

        border-style: solid;
        background-color: rgba(50, 50, 50, 0.3);
        border: 1px solid #FFFFFF;

        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    }

    button:hover {
        color: @color11;
        background-color: rgba(30, 30, 30, 0.5);
        border: 1px solid @color11;
    }

    /* 
    ----------------------------------------------------- 
    Buttons
    ----------------------------------------------------- 
    */

    #lock {
        margin: 10px;
        border-radius: 20px;
        background-image: url("/home/mdziuba/.config/home-manager/home/mdziuba/features/desktop/hyprland/icons/lock.png");
    }

   #logout {
        margin: 10px;
        border-radius: 20px;
        background-image: url("/home/mdziuba/.config/home-manager/home/mdziuba/features/desktop/hyprland/icons/logout.png");
    }

   #suspend {
        margin: 10px;
        border-radius: 20px;
        background-image: url("/home/mdziuba/.config/home-manager/home/mdziuba/features/desktop/hyprland/icons/suspend.png");
    }

   #hibernate {
        margin: 10px;
        border-radius: 20px;
        background-image: url("/home/mdziuba/.config/home-manager/home/mdziuba/features/desktop/hyprland/icons/hibernate.png");
    }

   #shutdown {
        margin: 10px;
        border-radius: 20px;
        background-image: url("/home/mdziuba/.config/home-manager/home/mdziuba/features/desktop/hyprland/icons/shutdown.png");
    }

   #reboot {
        margin: 10px;
        border-radius: 20px;
        background-image: url("/home/mdziuba/.config/home-manager/home/mdziuba/features/desktop/hyprland/icons/reboot.png");
    }

  '';
  };
}
