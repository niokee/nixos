{
  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "eza --icons --long --no-user --no-permissions --no-time --no-filesize --git  -a --git-ignore";
    };
    shellAbbrs = {
      vi = "nvim";
      vim = "nvim";
    };
  };
}
