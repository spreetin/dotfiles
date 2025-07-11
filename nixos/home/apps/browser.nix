{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        browsh
        elinks
        librewolf
    ];

    programs = {
        firefox.enable = true;
    };
}
