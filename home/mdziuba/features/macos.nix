{
  lib,
  ...
}:

let
  taps = [
    "homebrew/bundle"
    "homebrew/services"
    "koekeishiya/formulae"
  ];

  brews = [
    "skhd"
    "yabai"
  ];

  casks = [
      "slack"
      "hiddenbar"
      "itsycal"
      "stats"
      "wezterm"
      "firefox"
      "raycast"
    ];
in
{
  home.sessionPath = [ "/opt/homebrew/bin" ];

  home.file.".Brewfile" = {
    text =
      (lib.concatMapStrings (
        tap:
        ''tap "''
        + tap
        + ''
          "
        ''

      ) taps)
      + (lib.concatMapStrings (
        brew:
        ''brew "''
        + brew
        + ''
          "
        ''

      ) brews)
      + (lib.concatMapStrings (
        cask:
        ''cask "''
        + cask
        + ''
          "
        ''

      ) casks);
    onChange = ''
      /opt/homebrew/bin/brew bundle install --cleanup --no-upgrade --force --no-lock --global
    '';
  };
}
