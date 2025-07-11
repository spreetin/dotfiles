{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        discord
        signal-desktop
        zoom-us
    ];
}
