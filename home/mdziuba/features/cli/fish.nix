{pkgs, ...}: {
  programs.fish = {
    enable = true;
    functions = {
      fish_greeting = "";
    };
    plugins = [
      {
        name = "fzf";
        src = pkgs.fetchFromGitHub {
          owner = "PatrickF1";
          repo = "fzf.fish";
          rev = "8920367cf85eee5218cc25a11e209d46e2591e7a";
          sha256 = "T8KYLA/r/gOKvAivKRoeqIwE2pINlxFQtZJHpOy9GMM=";
        };
      }
    ];
    shellAliases = {
      ferrisl = "cd ~/Downloads && unzip firmware.zip && cp cradio_left-nice_nano_v2-zmk.uf2 /run/media/mdziuba/NICENANO/. && rm cradio*";
      ferrisr = "cd ~/Downloads && unzip firmware.zip && cp cradio_right-nice_nano_v2-zmk.uf2 /run/media/mdziuba/NICENANO/. && rm cradio*";
      ls = "${pkgs.eza}/bin/eza --icons --long --no-user --no-permissions --no-time --no-filesize --git  -a --git-ignore";
    };
    shellAbbrs = {
      ave = "aws-vault exec mateusz.dziuba -- ";
      vi = "nvim";
      vim = "nvim";
    };
    shellInit = ''
      #!/usr/bin/fish

      source $(which _fzf_opts)

      # Kanagawa Fish shell theme
      # A template was taken and modified from Tokyonight:
      # https://github.com/folke/tokyonight.nvim/blob/main/extras/fish_tokyonight_night.fish
      set -l foreground DCD7BA normal
      set -l selection 2D4F67 brcyan
      set -l comment 727169 brblack
      set -l red C34043 red
      set -l orange FF9E64 brred
      set -l yellow C0A36E yellow
      set -l green 76946A green
      set -l purple 957FB8 magenta
      set -l cyan 7AA89F cyan
      set -l pink D27E99 brmagenta

      # Syntax Highlighting Colors
      set -g fish_color_normal $foreground
      set -g fish_color_command $cyan
      set -g fish_color_keyword $pink
      set -g fish_color_quote $yellow
      set -g fish_color_redirection $foreground
      set -g fish_color_end $orange
      set -g fish_color_error $red
      set -g fish_color_param $purple
      set -g fish_color_comment $comment
      set -g fish_color_selection --background=$selection
      set -g fish_color_search_match --background=$selection
      set -g fish_color_operator $green
      set -g fish_color_escape $pink

            set -g fish_color_autosuggestion $comment
      # Completion Pager Colors
      set -g fish_pager_color_progress $comment
      set -g fish_pager_color_prefix $cyan
      set -g fish_pager_color_completion $foreground
      set -g fish_pager_color_description $comment



      set -gx $EDITOR "nvim" # or "vim", or "code", etc.
      set fzf_directory_opts --bind "ctrl-o:execute($EDITOR {} &> /dev/tty)"


      set -x FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS --color=fg:#cfc9a6,bg:#1f1f28,hl:#c8c093 --color=fg+:#c8c093,bg+:#1f1f28,hl+:#2d4f67 --color=info:#6a9589,prompt:#6a9589,pointer:#e82424 --color=marker:#ff5d62,spinner:#7aa89f,header:#FFA066"
      set -x FZF_COMPLETION_TRIGGER "++"

      # Define the file or directory preview function
      function show_file_or_dir_preview
          if test -d $argv[1]
              ${pkgs.eza}/bin/eza --tree --color=always $argv[1] | head -200;
          else
              ${pkgs.bat}/bin/bat -n --color=always --line-range :500 $argv[1];
          end
      end

      # Set FZF preview options
      set -g FZF_CTRL_T_OPTS "--preview 'show_file_or_dir_preview {}'"
      set -g FZF_ALT_C_OPTS "--preview '${pkgs.eza}/bin/eza --tree --color=always {} | head -200'"

      # Set FZF default search commands
      set -g FZF_DEFAULT_COMMAND "${pkgs.fd}/bin/fd . ~/.config/nix ~/projects ~/Obsidian"
      set -g FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
      set -g FZF_ALT_C_COMMAND "$FZF_DEFAULT_COMMAND --type=d"

      # Define function to use `${pkgs.fd}/bin/fd` for path completion
      function _fzf_compgen_path
          ${pkgs.fd}/bin/fd $argv
      end

      # Define function to use `${pkgs.fd}/bin/fd` for directory completion
      function _fzf_compgen_dir
          ${pkgs.fd}/bin/fd --type=d $argv
      end

      # Define function for advanced FZF completion
      function _fzf_comprun
          set command $argv[1]
          set -e argv[1] # Remove the first argument (command name)
          switch "$command"
              case cd
                  fzf --preview "${pkgs.eza}/bin/eza --tree --color=always {} | head -200" $argv
              case nvim
                  fzf --preview "bash -c 'if [ -d \"{}\" ]; then ${pkgs.eza}/bin/eza --tree --color=always {} | head -200; else ${pkgs.bat}/bin/bat -n --color=always --line-range :500 {}; fi'" $argv
              case export unset
                  fzf --preview "eval echo {}" $argv
              case ssh
                  fzf --preview 'dig {}' $argv
              case '*'
                  fzf --preview "show_file_or_dir_preview {}" $argv
          end
      end
    '';
  };
}
