{
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs._1password-shell-plugins.hmModules.default];
  home.packages = with pkgs; [
    _1password-cli
  ];

  programs._1password-shell-plugins = {
    enable = true;
    plugins = with pkgs; [gh awscli2];
  };
}
