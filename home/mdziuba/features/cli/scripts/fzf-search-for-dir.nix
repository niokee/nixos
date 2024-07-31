{pkgs, ...}:
pkgs.writeShellScriptBin "fzf-search-for-dir" ''
  # colors
  export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --color=fg:#cfc9a6,bg:#1f1f28,hl:#c8c093 --color=fg+:#c8c093,bg+:#1f1f28,hl+:#2d4f67 --color=info:#6a9589,prompt:#6a9589,pointer:#e82424 --color=marker:#ff5d62,spinner:#7aa89f,header:#FFA066'
  if [[ $# -eq 1 ]]; then
      selected=$1
  else
      selected=''\$(${pkgs.fd}/bin/fd . ~/.config/nix ~/projects ~/Obsidian | ${pkgs.fzf}/bin/fzf $color --preview 'if [ -d ''\{} ]; then ${pkgs.eza}/bin/eza --tree --color=always ''\{} | head -200; else bat -n --color=always --line-range :500 ''\{}; fi')
  fi

  if [[ -z $selected ]]; then
      exit 0
  fi

  if [[ "$(whoami)" == "mateusz" ]]; then
     $PATH
     nvim_exec=/etc/profiles/per-user/mateusz/bin/nvim
  else
     nvim_exec=${pkgs.neovim}/bin/nvim
  fi

  ${pkgs.wezterm}/bin/wezterm cli spawn --cwd $(dirname "$selected") $nvim_exec $selected
''
