{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.git = {
    enable = true;
    aliases = {
      amend = "commit --amend --no-edit";
      ll = "log --oneline";
      cm = "commit -m";
      fix = ''!f() { git commit -m "fix: $1"; }; f'';
      feat = ''!f() { git commit -m "feat: $1"; }; f'';
      bc = ''!f() { git commit -m "BREAKING CHANGE: $1"; }; f'';
    };
    delta.enable = true;
    package = pkgs.gitAndTools.gitFull;
    userName = "Mateusz Dziuba";
    userEmail = lib.mkDefault "mateusz.dziuba97@gmail.com";
    extraConfig = {
      url = {
        "git@github.com:" = {
          insteadOf = [
            "https://github.com/"
          ];
        };
      };
      init = {
        templatedir = "${config.home.homeDirectory}/.git-templates";
      };
    };
  };
}
