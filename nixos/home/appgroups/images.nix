{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    gimp3-with-plugins
    imagemagick
    image-roll
  ];
}
