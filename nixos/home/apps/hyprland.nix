{ pkgs, inputs }:

{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        cliphist
        hyprcursor
	hyprlock
        hyprpaper
        hyprpicker
        hyprshot
        rofi-wayland
        rose-pine-hyprcursor
        swaynotificationcenter
        swww
        wl-clipboard
        wlogout
    ];

    # Hyprland
    home.file.".config/hypr/configs".source = ../../../hypr/configs;
    home.file.".config/hypr/scripts" = {
        source = ../../../hypr/scripts;
        executable = true;
    };
    home.file.".config/hypr/wallpaper".source = ../../../hypr/wallpaper;
    home.file.".config/hypr/hyprpaper.conf".source = ../../../hypr/hyprpaper.conf;
    home.file.".config/hypr/hyprlock.conf".source = ../../../hypr/hyprlock.conf;
    home.file.".config/hypr/wallust".source = ../../../hypr/wallust;
    home.file.".config/hypr/hypridle.conf".source = ../../../hypr/hypridle.conf;

    # Waybar
    home.file.".config/waybar" = {
        source = ../../../waybar;
        recursive = true;
        executable = true;
    };
    
    home.file.".config/wlogout" = {
        source = ../../../wlogout;
        recursive = true;
        executable = true;
    };

    gtk = {
        enable = true;

        theme = {
            package = pkgs.flat-remix-gtk;
            name = "Flat-Remix-GTK-Grey-Darkest";
        };

        iconTheme = {
            package = pkgs.adwaita-icon-theme;
            name = "Adwaita";
        };

        font = {
            name = "Sans";
            size = 12;
        };
    };

    wayland.windowManager.hyprland = {
        enable = true;
        plugins = [
            #inputs.Hyprspace.packages.${pkgs.system}.Hyprspace
            #inputs.hyprfocus.packages.${pkgs.system}.default
        ];
        settings = {
            source = [
                "~/.config/hypr/configs/general.conf"
                "~/.config/hypr/configs/apps.conf"
                "~/.config/hypr/configs/theme.conf"
                "~/.config/hypr/configs/keybindings.conf"
                "~/.config/hypr/configs/windows.conf"
            ];
        };
    };
}
