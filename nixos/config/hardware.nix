{ config, pkgs, options, ... }:

{
  powerManagement = {
    enable = true;
    cpuFreqGovernor = "schedutil";
  };
}
