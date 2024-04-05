{ config, pkgs, ... }:

{
  home.username = "mdziuba";
  home.homeDirectory = "/home/mdziuba";

  home.stateVersion = "23.11"; # Please read the comment before changing.
  fonts.fontconfig.enable = true;
  home.packages = [
    pkgs.lf
    pkgs.pavucontrol 
    pkgs.dconf
    pkgs.zoxide
    pkgs.oh-my-zsh
    pkgs.go
    pkgs.gcc
    (pkgs.nerdfonts.override { fonts = [ "FiraCode"]; })
    pkgs.gnumake
    pkgs.thefuck
    pkgs.redshift
    pkgs.ffmpeg
  ];


  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.file = {
  	"${config.xdg.configHome}/.p10k.zsh".source = .dotfiles/zsh/.p10k.zsh;
  	"${config.xdg.configHome}/nvim".source = .dotfiles/nvim;
    ".tmux.conf".source = .dotfiles/tmux/.tmux.conf;
    ".config/awesome" = {
		source = .dotfiles/awesome;
		recursive = true;
	};
    ".config/kitty" = {
		source = .dotfiles/kitty;
		recursive = true;
	};
    ".config/picom" = {
		source = .dotfiles/picom;
		recursive = true;
	};
    ".config/rofi" = {
		source = .dotfiles/rofi;
		recursive = true;
	};
  };

  programs.home-manager.enable = true;

  programs.git = {
      enable = true;
      userName = "Mateusz Dziuba";
      userEmail = "mateusz.dziuba97@gmail.com";
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
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
        src = .dotfiles/zsh;
        file = ".p10k.zsh";
      }
    ];
  };

}
