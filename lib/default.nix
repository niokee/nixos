# Custom library functions for this NixOS configuration
{lib, ...}: {
  # Helper to create an out-of-store symlink to a dotfile
  # Usage: mkDotfileSymlink config "nvim" -> symlinks to dotfiles/nvim
  mkDotfileSymlink = config: name:
    config.lib.file.mkOutOfStoreSymlink
    "${config.xdg.configHome}/nixos/home/dotfiles/${name}";

  # Helper to create a home.file entry with a dotfile symlink
  # Usage: mkDotfileEntry config "nvim" -> { "~/.config/nvim".source = symlink }
  mkDotfileEntry = config: name: {
    "${config.xdg.configHome}/${name}".source =
      config.lib.file.mkOutOfStoreSymlink
      "${config.xdg.configHome}/nixos/home/dotfiles/${name}";
  };

  # Helper for creating multiple dotfile entries at once
  # Usage: mkDotfileEntries config ["nvim" "rofi" "niri"]
  mkDotfileEntries = config: names:
    lib.foldl' (acc: name: acc // {
      "${config.xdg.configHome}/${name}".source =
        config.lib.file.mkOutOfStoreSymlink
        "${config.xdg.configHome}/nixos/home/dotfiles/${name}";
    }) {} names;
}
