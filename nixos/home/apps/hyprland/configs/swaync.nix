{ config, ... }:

{
  home.file."${config.xdg.configHome}/swaync" = {
    source = ../../../../../configs/swaync;
    recursive = true;
  };
}
