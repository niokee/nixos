{pkgs, ...}: {
  home.packages = with pkgs; [
    bluetui # bluetooth
    impala # wifi
    wiremix # audio managment
  ];
}
