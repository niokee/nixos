{pkgs}: {
  programs.vscode = {
    extensions = with pkgs.vscode-extensions; [
      charliermarslh.ruff
      ms-python.python
      ms-python.vscode-pylance
      njpwnerner.autodocstring
      eamodio.gitlens
      catppuccin.catppuccin-vsc
      ms-toolsai.jupyter
      asvetliakov.vscode-neovim
      ban.spellright
    ];
  };
}
