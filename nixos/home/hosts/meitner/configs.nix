{ configs, pkgs, ... }:

{
    home.file.".config/waybar/temperature".source = ../../../../waybar/hostmodules/temperature.meitner;
}
