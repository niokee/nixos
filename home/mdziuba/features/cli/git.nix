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
        # Delete local branches already merged into the remote default branch,
        # drop stale remote-tracking refs, then expire unreachable objects so
        # dead branches stop showing up in `git switch <TAB>` completion.
        tidy = ''!f() { base=$(git symbolic-ref --quiet --short refs/remotes/origin/HEAD 2>/dev/null || echo origin/master); git fetch --prune origin; git branch --merged "$base" --format='%(refname:short)' | grep -vx "''${base#origin/}" | while read -r b; do [ "$b" != "$(git rev-parse --abbrev-ref HEAD)" ] && git branch -d "$b"; done; git reflog expire --expire-unreachable=now --all; git gc --prune=now --quiet; }; f'';
      };
    };
  };
}
