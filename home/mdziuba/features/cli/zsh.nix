{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    historySubstringSearch.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    autocd = true;
    initExtra = lib.mkDefault ''
      source ${pkgs.fzf-git-sh}/share/fzf-git-sh/fzf-git.sh
      source $(which _fzf_opts)
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
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
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
        src = ./../../../dotfiles/zsh;
        file = ".p10k.zsh";
      }
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

        nr = "nixos-rebuild --flake .";
        nrs = "nixos-rebuild --flake . switch";
        snr = "sudo nixos-rebuild --flake .";
        snrs = "sudo nixos-rebuild --flake . switch";
        hm = "home-manager --flake .";
        hms = "home-manager --flake . switch";
        drs = "darwin-rebuild --flake /Users/mateusz/.config/nix switch";
      };
    };
  };
}
