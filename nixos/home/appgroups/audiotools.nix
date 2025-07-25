{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    kdePackages.audex
    cuetools
    easytag
    flac
    flacon
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-ugly
    gst_all_1.gst-plugins-bad
    lame
    libogg
    shntool
    soundconverter
    sound-juicer
    vorbis-tools
  ];
}
