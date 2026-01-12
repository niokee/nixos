{
  config,
  lib,
  ...
}: {
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
      user.email = "mateusz.dziuba@arx.city";
    };
  };
  programs.zsh = {
    initContent = lib.mkAfter ''
      source ${config.xdg.configHome}/op/plugins.sh
    '';
  };
  programs.ssh = {
    enableDefaultConfig = false;
    matchBlocks."*" = {
      identityAgent = "/Users/mateusz/Library/Group\\ Containers/2BUA8C4S2C.com.1password/t/agent.sock";
    };
    extraConfig = ''
      Host github-niokee
        HostName github.com
        User git
        IdentitiesOnly yes
        IdentityAgent /Users/mateusz/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
        IdentityFile ~/.ssh/niokee.pub

      Host github.com
        HostName github.com
        User git
        IdentitiesOnly yes
        IdentityAgent /Users/mateusz/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
        IdentityFile ~/.ssh/m-dziuba.pub
    '';
  };
}
