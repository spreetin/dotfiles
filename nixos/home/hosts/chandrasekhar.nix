{ pkgs, inputs }:

{ config, pkgs, ... }:

{
    imports = [
        (import ../home.nix { inherit pkgs inputs; })
        ./chandrasekhar/apps.nix
        ./chandrasekhar/configs.nix
    ];

    home.file.".config/hypr/local/local.conf" = {
        source = ../../../hypr_host/chandrasekhar.conf;
    };
    wayland.windowManager.hyprland = {
        settings = {
            monitor = "eDP-1,1920x1080@120,0x0,1";
        };
    };
}
