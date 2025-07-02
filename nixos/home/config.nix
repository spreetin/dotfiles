{ inputs, config, pkgs, hyprland, Hyprspace, hyprfocus, ... }:

{
    xdg.enable = true;

    home.username = "david";
    home.homeDirectory = "/home/david";
    home.stateVersion = "25.05";

    #home.file.".config/hypr" = {
    #    source = ../../hypr;
    #    recursive = true;
    #    executable = true;
    #};

    # Hyprland
    #home.file.".config/hypr/hyprland.conf".source = ../../hypr/hyprland.conf;
    home.file.".config/hypr/configs".source = ../../hypr/configs;
    home.file.".config/hypr/scripts" = {
        source = ../../hypr/scripts;
        executable = true;
    };
    home.file."config/hypr/wallpaper".source = ../../hypr/wallpaper;
    home.file.".config/hypr/hyprpaper.conf".source = ../../hypr/hyprpaper.conf;
    home.file.".config/hypr/hyprlock.conf".source = ../../hypr/hyprlock.conf;

    # Waybar
    home.file.".config/waybar" = {
        source = ../../waybar;
        recursive = true;
        executable = true;
    };
    home.file.".config/kitty" = {
        source = ../../kitty;
        recursive = true;
    };
    home.file.".config/nvim" = {
        source = ../../neovim;
        recursive = true;
    };
    home.file.".oh-my-zsh/custom" = {
        source = ../../oh-my-zsh/custom;
        recursive = true;
    };
    home.file.".config/wlogout" = {
        source = ../../wlogout;
        recursive = true;
        executable = true;
    };

    programs = {
        git = {
            enable = true;
            userName = "David Falk";
            userEmail = "spreetin@protonmail.com";
        };
        zsh = {
            enable = true;
            syntaxHighlighting.enable = true;
            oh-my-zsh = {
                enable = true;
                theme = "af-magic";
                plugins = [
                    "git"
                    "ssh"
                ];
            };
            shellAliases = {
                rebuild = "sudo nixos-rebuild switch --flake /home/david/dotfiles/";
            };
        };
    };

    wayland.windowManager.hyprland = {
        enable = true;
        plugins = [
            inputs.Hyprspace.packages.${pkgs.system}.Hyprspace
            inputs.hyprfocus.packages.${pkgs.system}.default
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
