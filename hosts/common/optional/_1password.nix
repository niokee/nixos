{lib, ...}: {
  # Enable the unfree 1Password packages
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "1password-gui"
      "1password"

      "onepassword-password-manager"
      "onetab"
    ];

  programs._1password.enable = true;
  programs._1password-gui = {
    polkitPolicyOwners = ["mdziuba"];
    enable = true;
  };
}
