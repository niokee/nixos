{inputs, ...}: {
  home.packages = [
    inputs.zen-browser.packages."${builtins.currentSystem}".default
  ];
}
