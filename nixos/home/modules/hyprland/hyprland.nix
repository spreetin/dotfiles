{ pkgs, inputs, filesource }:

{ config, pkgs, ... }:
{
  programs = {
    waybar = {
      enable = true;
    };
    hyprlock.enable = true;
  };

  home.packages = with pkgs; [
    brightnessctl
    cliphist
    hyprcursor
    hypridle
    hyprlock
    hyprpaper
    hyprpicker
    hyprshot
    libappindicator
    libiconv
    libnotify
    networkmanagerapplet
    nwg-displays
    pamixer
    pavucontrol
    playerctl
    rofi-wayland
    rose-pine-hyprcursor
    slurp
    swappy
    swaynotificationcenter
    swww
    wl-clipboard
    wlogout
  ];

  # Hyprland
  home.file.".config/hypr/configs".source = "${filesource}/hypr/configs";
  home.file.".config/hypr/scripts" = {
    source = "${filesource}/hypr/scripts";
    executable = true;
  };
  home.file.".config/hypr/wallpaper".source = "${filesource}/hypr/wallpaper";
  home.file.".config/hypr/hyprpaper.conf".source = "${filesource}/hypr/hyprpaper.conf";
  home.file.".config/hypr/hyprlock.conf".source = "${filesource}/hypr/hyprlock.conf";
  home.file.".config/hypr/wallust".source = "${filesource}/hypr/wallust";
  home.file.".config/hypr/hypridle.conf".source = "${filesource}/hypr/hypridle.conf";

  # Waybar
  home.file.".config/waybar/config".source = "${filesource}/waybar/config";
  home.file.".config/waybar/style.css".source = "${filesource}/waybar/style.css";
  home.file.".config/waybar/modules".source = "${filesource}/waybar/modules";
  
  home.file.".config/wlogout" = {
    source = "${filesource}/wlogout";
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
