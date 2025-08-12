{
  pkgs,
  inputs,
  filesource,
  hostname,
}:

{ config, pkgs, ... }:
{
  imports = [
    ./configs/hyprland.nix
    ./configs/hypridle.nix
    ./configs/hyprlock.nix
    ./configs/hyprpaper.nix
    (import ./configs/waybar.nix { inherit hostname; })
    ./configs/wlogout.nix
    ./configs/swaync.nix
  ];

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
  home.file."${config.xdg.configHome}/hypr/scripts" = {
    source = ../../../../scripts/hypr;
    executable = true;
  };
  home.file."${config.xdg.configHome}/hypr/wallpaper".source = ../../../../assets/wallpaper;

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
    #settings.exec-once = [
    #  "hyprctl plugin load ${inputs.Hyprspace.packages.${pkgs.system}.Hyprspace}/lib/libHyperspace.so"
    #];
  };
}
