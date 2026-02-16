{
  config,
  lib,
  personalConfig,
  ...
}: let
  opAgentSock = personalConfig.onePassword.darwinAgentSock;
in {
  home = {
    username = "mateusz";
    homeDirectory = "/Users/mateusz";
  };

  imports = [
    ./global

    features/cli
    features/cli/1password.nix
    features/cli/awscli.nix

    features/desktop/macos

    features/programming
    features/programming/work.nix
  ];

  programs.git = {
    settings = {
      user.email = personalConfig.user.email.work;
    };
  };
  programs.zsh = {
    initContent = lib.mkAfter ''
      source ${config.xdg.configHome}/op/plugins.sh
      export LIBRARY_PATH="/opt/homebrew/opt/libiconv/lib:''${LIBRARY_PATH}"
      export CPATH="/opt/homebrew/opt/libiconv/include:''${CPATH}"
    '';
  };
  programs.ssh = {
    enableDefaultConfig = false;
    matchBlocks."*" = {
      identityAgent = opAgentSock;
    };
    extraConfig = ''
      Host github-niokee
        HostName github.com
        User git
        IdentitiesOnly yes
        IdentityAgent ${opAgentSock}
        IdentityFile ~/.ssh/niokee.pub

      Host github.com
        HostName github.com
        User git
        IdentitiesOnly yes
        IdentityAgent ${opAgentSock}
        IdentityFile ~/.ssh/m-dziuba.pub
    '';
  };
}
