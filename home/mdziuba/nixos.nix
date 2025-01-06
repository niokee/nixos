{
  imports = [
    ./global
    features/cli
    features/programming
  ];

  home = {
    sessionVariables = {
      TERM = "xterm-256color";
      TERMINAL = "xterm-256color";
    };
  };
  programs.git.extraConfig.core = {
    autocrlf = true;
    sshCommand = "ssh.exe";
  };
}
