{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    lm_sensors
    lshw
    openrgb-with-all-plugins
    pciutils
    solaar
    usbutils
  ];
}
