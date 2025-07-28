{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    jetbrains.webstorm
    jetbrains.clion
    jetbrains.pycharm-community
  ];
}
