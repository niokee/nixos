{...}: {
  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      line-numbers = true;
      side-by-side = true;
      theme = "kanagawa";
      colorMoved = "default";

      decorations = {
        commit-decoration-style = "bold yellow box ul";
        file-style = "bold yellow ul";
        hunk-header-decoration-style = "yellow box";
      };
    };
  };
}
