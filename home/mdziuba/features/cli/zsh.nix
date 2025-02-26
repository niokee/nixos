{
  config,
  pkgs,
  ...
}: let
  nixHome = "${config.xdg.configHome}/nix";
in {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    historySubstringSearch.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    autocd = true;
    initExtra = ''
      #!/bin/bash

      bindkey "^[m" copy-prev-shell-word # Esc + m
      bindkey ";5D" backward-word  # Ctrl + Left Arrow
      bindkey ";5C" forward-word   # Ctrl + Right Arrow

      bindkey "^[[H"   beginning-of-line
      bindkey "^[[F"    end-of-line
      bindkey "^[[3~" delete-char

      export FZF_DIRECTORY_OPTS="--bind 'enter:execute($EDITOR {} &> /dev/tty)'"

      # Set FZF colors
      export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --color=fg:#cfc9a6,bg:#1f1f28,hl:#c8c093 --color=fg+:#c8c093,bg+:#1f1f28,hl+:#2d4f67 --color=info:#6a9589,prompt:#6a9589,pointer:#e82424 --color=marker:#ff5d62,spinner:#7aa89f,header:#FFA066"
      export FZF_COMPLETION_TRIGGER="**"

      # Define the file or directory preview function
      show_file_or_dir_preview() {
          if [[ -d "$1" ]]; then
              ${pkgs.eza}/bin/eza --tree --color=always "$1" | head -200
          else
              ${pkgs.bat}/bin/bat -n --color=always --line-range :500 "$1"
          fi
      }

      # Set FZF preview options
      export FZF_CTRL_T_OPTS="--preview 'zsh -c \"show_file_or_dir_preview {}\"'"
      export FZF_ALT_C_OPTS="--preview '${pkgs.eza}/bin/eza --tree --color=always {} | head -200'"

      # Set FZF default search commands
      export FZF_DEFAULT_COMMAND="${pkgs.fd}/bin/fd . ~/.config/nix ~/projects ~/Obsidian"
      export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
      export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type=d"

      # Define function to use `${pkgs.fd}/bin/fd` for path completion
      _fzf_compgen_path() {
          ${pkgs.fd}/bin/fd "$@"
      }

      # Define function to use `${pkgs.fd}/bin/fd` for directory completion
      _fzf_compgen_dir() {
          ${pkgs.fd}/bin/fd --type=d "$@"
      }

      # Define function for advanced FZF completion
      _fzf_comprun() {
          local command="$1"
          shift # Remove the first argument (command name)

          case "$command" in
              cd)
                  fzf --preview "${pkgs.eza}/bin/eza --tree --color=always {} | head -200" "$@"
                  ;;
              nvim)
                  fzf --preview "bash -c 'if [ -d \"{}\" ]; then ${pkgs.eza}/bin/eza --tree --color=always {} | head -200; else ${pkgs.bat}/bin/bat -n --color=always --line-range :500 {}; fi'" "$@"
                  ;;
              export | unset)
                  fzf --preview "eval echo {}" "$@"
                  ;;
              ssh)
                  fzf --preview "dig {}" "$@"
                  ;;
              *)
                  fzf --preview "show_file_or_dir_preview {}" "$@"
                  ;;
          esac
      }
    '';
    history = {
      extended = true;
      ignoreDups = true;
      ignoreSpace = true;
      save = 10000;
      size = 10000;
      share = true;
      path = "${config.xdg.dataHome}/zsh/zsh_history";
    };
    plugins = [
      {
        name = "fzf-tab";
        src = pkgs.fetchFromGitHub {
          owner = "Aloxaf";
          repo = "fzf-tab";
          rev = "bf3ef5588af6d3bf7cc60f2ad2c1c95bca216241";
          hash = "sha256-0/YOL1/G2SWncbLNaclSYUz7VyfWu+OB8TYJYm4NYkM=";
        };
      }
    ];
    shellAliases = {
      ferrisl = "cd ~/Downloads && unzip firmware.zip && cp cradio_left-nice_nano_v2-zmk.uf2 /run/media/mdziuba/NICENANO/. && rm cradio*";
      ferrisr = "cd ~/Downloads && unzip firmware.zip && cp cradio_right-nice_nano_v2-zmk.uf2 /run/media/mdziuba/NICENANO/. && rm cradio*";
      ls = "eza --icons --long --no-user --no-permissions --no-time --no-filesize --git  -a --git-ignore";
    };
    zsh-abbr = {
      enable = true;
      abbreviations = {
        ave = "aws-vault exec mateusz.dziuba --";
        vi = "nvim";
        vim = "nvim";
        hibarnate = "systemctl hibarnate";

        n = "nix";
        nd = "nix develop -c $SHELL";
        ns = "nix shell";
        nsn = "nix shell nixpkgs#";
        nb = "nix build";
        nbn = "nix build nixpkgs#";
        nf = "nix flake";

        nr = "nixos-rebuild --flake ${nixHome}";
        nrs = "nixos-rebuild --flake ${nixHome} switch";
        snr = "sudo nixos-rebuild --flake ${nixHome}";
        snrs = "sudo nixos-rebuild --flake ${nixHome} switch";
        hm = "home-manager --flake ${nixHome}";
        hms = "home-manager --flake ${nixHome} switch";
        drs = "darwin-rebuild --flake ${nixHome} switch";
      };
    };
  };
}
