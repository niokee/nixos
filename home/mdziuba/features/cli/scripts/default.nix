{pkgs, ...}: {
  home.packages = [
    (import ./auto-connect-bt.nix {inherit pkgs;})
    (import ./cht.nix {inherit pkgs;})
    (import ./fzf-search-for-dir.nix {inherit pkgs;})
    (import ./fzf-opts.nix {inherit pkgs;})
    (import ./tmux-sessionizer.nix {inherit pkgs;})
  ];
}
