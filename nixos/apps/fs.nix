{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    dosfstools
    gparted
    gptfdisk
    nfs-utils
    ntfs3g
  ];
}
