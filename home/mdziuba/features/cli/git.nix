{
  config,
  lib,
  personalConfig,
  ...
}: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        email = lib.mkDefault personalConfig.user.email.personal;
        name = personalConfig.user.name;
      };
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
      alias = {
        amend = "commit --amend --no-edit";
        aaf = ''!f() { git add . && git amend && git push --force; }; f'';
        ll = "log --oneline";
        cm = "commit -m";
        fix = ''!f() { git commit -m "fix: $1"; }; f'';
        feat = ''!f() { git commit -m "feat: $1"; }; f'';
        bc = ''!f() { git commit -m "BREAKING CHANGE: $1"; }; f'';
      };
    };
  };
}
