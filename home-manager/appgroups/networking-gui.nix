{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    filezilla
    protonvpn-gui
    wireguard-tools
  ];
}
