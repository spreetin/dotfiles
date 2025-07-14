{ config, pkgs, options, ... }:

{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
    supportedFilesystems = [ "zfs" "btrfs" ];
    zfs.forceImportRoot = false;
    tmp.useTmpfs = true;
  };
}
