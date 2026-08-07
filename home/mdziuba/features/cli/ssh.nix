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
    # `settings` takes upstream OpenSSH directive names, unlike the deprecated
    # camelCase `matchBlocks`.
    settings."*" = {
      ForwardAgent = false;
      AddKeysToAgent = "no";
      Compression = false;
      ServerAliveInterval = 0;
      ServerAliveCountMax = 3;
      HashKnownHosts = false;
      UserKnownHostsFile = "~/.ssh/known_hosts";
      ControlMaster = "no";
      ControlPath = "~/.ssh/master-%r@%n:%p";
      ControlPersist = "no";
      IdentityAgent = lib.mkDefault "${config.home.homeDirectory}/.1password/agent.sock";
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
