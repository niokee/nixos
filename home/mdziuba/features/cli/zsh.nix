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
    initContent = ''
      source $(which _fzf_opts)

      [ -f ~/.arx_completion.zsh ] && source ~/.arx_completion.zsh

      bindkey "^[m"   copy-prev-shell-word  # Esc + m
      bindkey ";5D"   backward-word         # Ctrl + Left Arrow
      bindkey ";5C"   forward-word          # Ctrl + Right Arrow
      bindkey "^[[H"  beginning-of-line     # Home
      bindkey "^[[F"  end-of-line           # End
      bindkey "^[[3~" delete-char           # Delete
    '';
    history = {
      extended = true;
      ignoreDups = true;
      ignoreAllDups = true;
      ignoreSpace = true;
      expireDuplicatesFirst = true;
      append = true;
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
