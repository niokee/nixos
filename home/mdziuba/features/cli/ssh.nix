{
  config,
  lib,
  personalConfig,
  ...
}: let
  opAgentSock = personalConfig.onePassword.linuxAgentSock;
in {
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks."*" = {
      forwardAgent = false;
      addKeysToAgent = "no";
      compression = false;
      serverAliveInterval = 0;
      serverAliveCountMax = 3;
      hashKnownHosts = false;
      userKnownHostsFile = "~/.ssh/known_hosts";
      controlMaster = "no";
      controlPath = "~/.ssh/master-%r@%n:%p";
      controlPersist = "no";
      identityAgent = lib.mkDefault "${config.home.homeDirectory}/.1password/agent.sock";
    };
    extraConfig = lib.mkDefault ''
      Host github.com
        HostName github.com
        User git
        IdentitiesOnly yes
        IdentityAgent ${opAgentSock}
        IdentityFile ~/.ssh/niokee.pub

      Host github.com-mdziuba
        HostName github.com
        User git
        IdentitiesOnly yes
        IdentityAgent ${opAgentSock}
        IdentityFile ~/.ssh/m-dziuba.pub
    '';
  };
}
