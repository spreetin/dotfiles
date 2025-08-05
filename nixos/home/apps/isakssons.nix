{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    teams
    teams-for-linux
  ];
}
