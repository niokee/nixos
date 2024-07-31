{pkgs, ...}:
pkgs.writeShellScriptBin "_fzf_opts" ''
  # colors
  export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --color=fg:#cfc9a6,bg:#1f1f28,hl:#c8c093 --color=fg+:#c8c093,bg+:#1f1f28,hl+:#2d4f67 --color=info:#6a9589,prompt:#6a9589,pointer:#e82424 --color=marker:#ff5d62,spinner:#7aa89f,header:#FFA066'

  show_file_or_dir_preview="if [ -d {} ]; then ${pkgs.eza}/bin/eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

  export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
  export FZF_ALT_C_OPTS="--preview '${pkgs.eza}/bin/eza --tree --color=always {} | head -200'"

  export FZF_DEFAULT_COMMAND="${pkgs.fd}/bin/fd . ~/.config/nix ~/projects ~/Obsidian"
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type=d"

  _fzf_compgen_path() {
   ${pkgs.fd}/bin/fd "$1"
  }

  # Use fd to generate the list for directory completion
  _fzf_compgen_dir() {
    ${pkgs.fd}/bin/fd --type=d "$1"
  }

  # Advanced customization of fzf options via _fzf_comprun function
  # - The first argument to the function is the name of the command.
  # - You should make sure to pass the rest of the arguments to fzf.
  _fzf_comprun() {
    local command=$1
    shift

    case "$command" in
      cd)           fzf --preview '${pkgs.eza}/bin/eza --tree --color=always ''\{} | head -200' "$@" ;;
      nvim)         fzf --preview "$show_file_or_dir_preview" ;;
      export|unset) fzf --preview "eval 'echo ''\{}'"         "$@" ;;
      ssh)          fzf --preview 'dig ''\{}'                   "$@" ;;
      *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
    esac
  }
''
