{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    historySubstringSearch.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    autocd = true;
    history = {
      extended = true;
      ignoreDups = true;
      ignoreSpace = true;
      save = 10000;
      size = 10000;
      share = true;
      path = "${config.xdg.dataHome}/zsh/zsh_history";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "ripgrep"
        "thefuck"
      ];
    };
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = ./../../../.dotfiles/zsh;
        file = ".p10k.zsh";
      }
    ];
  };
}
