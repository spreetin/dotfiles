{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        lutris
        openmw
        openttd
        protonplus
        protonup-qt
    ];
}
