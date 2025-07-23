{ config, pkgs, options, ... }:

{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    supportedFilesystems = [ "zfs" "btrfs" ];
    zfs.forceImportRoot = false;
    tmp.useTmpfs = true;
  };
}
