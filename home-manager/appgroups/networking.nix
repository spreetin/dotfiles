{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    dnsutils
    nettools
    nmap
    sshfs
    traceroute
    wget
  ];
}
