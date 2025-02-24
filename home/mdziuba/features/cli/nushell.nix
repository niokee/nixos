{pkgs, ...}: {
  programs.nushell = {
    enable = true;
    plugins = with pkgs; [
      nushellPlugins.query
      nushellPlugins.polars
      nushellPlugins.formats
    ];
  };
}
