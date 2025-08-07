{ config, ... }:
let
  xdg = config.xdg;
in 
{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      preload = "${xdg.configHome}/hypr/wallpaper/wallpaper.jpg";
      wallpaper = ", ${xdg.configHome}/hypr/wallpaper/wallpaper.jpg";
    };
  };
}
