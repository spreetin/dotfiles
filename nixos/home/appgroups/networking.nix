{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        dnsutils
        filezilla
        nmap
        protonvpn-gui
        sshfs
        traceroute
        wget
        wireguard-tools
    ];
}
