{
  config,
  lib,
  ...
}: {
  programs.git = {
    enable = true;
    aliases = {
      amend = "commit --amend --no-edit";
      aaf = ''!f() { git add . && git amend && git push --force; }; f'';
      ll = "log --oneline";
      cm = "commit -m";
      fix = ''!f() { git commit -m "fix: $1"; }; f'';
      feat = ''!f() { git commit -m "feat: $1"; }; f'';
      bc = ''!f() { git commit -m "BREAKING CHANGE: $1"; }; f'';
    };
    delta = {
      enable = true;
      options = {
        line-numbers = true;
        side-by-side = true;
        theme = "kanagawa";
        colorMoved = "default";

        decorations = {
          commit-decoration-style = "bold yellow box ul";
          file-style = "bold yellow ul";
          hunk-header-decoration-style = "yellow box";
        };
      };
    };
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
      push = {
        autoSetupRemote = true;
      };
    };
  };
}
