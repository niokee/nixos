{
  config,
  pkgsUnstable,
  myLib,
  ...
}: {
  # Also ships dotfiles/herdr/ghostty.conf, which ghostty includes optionally
  # to auto-start herdr; hosts without this module get a plain ghostty shell.
  home.packages = [pkgsUnstable.herdr];

  home.file = myLib.mkDotfileEntry config "herdr";
}
