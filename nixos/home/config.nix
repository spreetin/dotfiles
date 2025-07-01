{ config, ... }:

{
    xdg.enable = true;

    home.username = "david";
    home.homeDirectory = "/home/david";
    home.stateVersion = "25.05";

    home.file.".config/hypr" = {
        source = ../../hypr;
        recursive = true;
        executable = true;
    };
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
}
