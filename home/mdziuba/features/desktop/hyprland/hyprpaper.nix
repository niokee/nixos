{config, ...}: {
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = true;
      splash = false;
      preload = "~/.config/nix/home/dotfiles/darksky2.jpg";
      wallpaper = ",~/.config/nix/home/dotfiles/darksky2.jpg";
    };
  };
}
