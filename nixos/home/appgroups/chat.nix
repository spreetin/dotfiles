{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    discord
    discordo
    gurk-rs
    signal-desktop
    zoom-us
  ];
}
