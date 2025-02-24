{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./global

    features/cli
    features/cli/awscli.nix

    features/desktop/macos

    features/programming
    features/programming/work.nix
  ];

  home.file."Applications/home-manager".source = let
    apps = pkgs.buildEnv {
      name = "home-manager-applications";
      paths = config.home.packages;
      pathsToLink = "/Applications";
    };
  in
    lib.mkIf pkgs.stdenv.targetPlatform.isDarwin "${apps}/Applications";

  programs.git = {
    userEmail = "mateusz.dziuba@arx.city";
  };

  programs.zsh = {
    initExtra = lib.mkAfter ''
      source ${config.xdg.configHome}/op/plugins.sh
    '';
  };
  programs.ssh.extraConfig = ''
    # 1Password SSH agent
    Host *
      IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"

    # Arx account
    Host github.com
    HostName github.com
      User git
      IdentityFile ~/.ssh/m-dziuba

    # Personal account
    Host github.com-personal
      HostName github.com
      User git
      IdentityFile ~/.ssh/niokee
  '';
}
