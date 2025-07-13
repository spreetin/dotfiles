{ config, pkgs, options, ... }:

{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
    kernelModules = [ "nct6683" ];
    supportedFilesystems = [ "zfs" "btrfs" ];
    zfs.forceImportRoot = false;
    tmp.useTmpfs = true;
  };
}
