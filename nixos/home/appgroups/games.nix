{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        bottles
        lutris
        mangohud
        openmw
        openttd
        protonplus
        protonup-qt
        wine
        winetricks
    ];

    programs = {
        mangohud = {
            enable = true;
        };
    };
}
