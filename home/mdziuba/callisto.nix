{...}: {
  imports = [
    ./global/macos.nix
    features/macos.nix
    features/cli/macos.nix
    features/desktop/macos
    features/programming/macos.nix
  ];
  
    programs.ssh.extraConfig = ''
    # Arx account
    Host github.com-arx
    HostName github.com
      User git
      IdentityFile ~/.ssh/m-dziuba

    # Personal account
    Host github.com--personal
      HostName github.com
      User git
      IdentityFile ~/.ssh/niokee
  '';

}
