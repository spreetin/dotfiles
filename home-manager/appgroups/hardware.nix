{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    lm_sensors
    lshw
    pciutils
    usbutils
  ];
}
