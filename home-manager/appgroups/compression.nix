{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    gnutar
    p7zip
    unzip
    xz
    zip
  ];
}
