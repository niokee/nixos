{...}: {
  imports = [
    ./global/macos.nix
    features/macos.nix
    features/cli/macos.nix
    features/desktop/macos
    features/programming/macos.nix
  ];

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
