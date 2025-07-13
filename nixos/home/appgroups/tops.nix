{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    baobab
    btop
    iftop
    iotop
    lsof
    ncdu
    nvtopPackages.full
  ];
}
