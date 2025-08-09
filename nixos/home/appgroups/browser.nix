{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    browsh
    elinks
    librewolf
    chromium
  ];
}
