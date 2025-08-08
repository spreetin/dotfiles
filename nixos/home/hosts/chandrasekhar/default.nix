{ pkgs, inputs }:

{ config, pkgs, ... }:

{
  imports = [
    #(import ../../home.nix { inherit pkgs inputs; })
    ./apps.nix
    ./configs.nix
  ];

  home.file.".config/hypr/local/local.conf" = {
    source = ../../../../hostfiles/hypr/chandrasekhar.conf;
  };
  wayland.windowManager.hyprland = {
    settings = {
      monitor = "eDP-1,1920x1080@120,0x0,1";
    };
  };
}
