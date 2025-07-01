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
    home.file.".zshrc" = {
        source = ../../zsh/.zshrc;
    };
}
