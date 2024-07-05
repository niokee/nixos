{ pkgs, ... }:
pkgs.writeShellScriptBin "fzf-search-for-dir" ''
  if [[ $# -eq 1 ]]; then
      selected=$1
  else
      selected=$(find ~/.config/home-manager ~/projects ~/Obsidian -mindepth 1 -maxdepth 10 -type d | fzf)
  fi

  if [[ -z $selected ]]; then
      exit 0
  fi

  wezterm start --new-tab --cwd "$selected"
''
