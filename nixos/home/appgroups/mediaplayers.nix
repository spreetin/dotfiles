{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        mpv
        mpvScripts.mpris
        plexamp
        plex-desktop
        spotify
        vlc
        yt-dlp
    ];
}
