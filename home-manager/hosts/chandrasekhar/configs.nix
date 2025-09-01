{ configs, pkgs, ... }:

{
  home.file.".config/waybar/temperature".source = ../../../hostfiles/waybar/temperature.chandrasekhar;
}
