{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        obs-studio
        obs-studio-plugins.obs-mute-filter
        obs-studio-plugins.obs-pipewire-audio-capture
    ];
}
