{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      charliermarsh.ruff
      ms-python.python
      ms-python.vscode-pylance
      njpwerner.autodocstring
      eamodio.gitlens
      catppuccin.catppuccin-vsc
      ms-toolsai.jupyter
      asvetliakov.vscode-neovim
      ban.spellright
      mkhl.direnv
    ];
  };
}
