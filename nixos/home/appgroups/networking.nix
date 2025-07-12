{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        dnsutils
        filezilla
        nettools
        nmap
        protonvpn-gui
        sshfs
        traceroute
        wget
        wireguard-tools
    ];
}
