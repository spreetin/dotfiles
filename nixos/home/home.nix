{ config, pkgs, ... }:

{
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
        executable = true;
    };
    home.file.".config/nvim" = {
        source = ../../neovim;
        recursive = true;
        executable = true;
    };
    home.file.".oh-my-zsh/custom" = {
        source = ../../oh-my-zsh/custom;
        recursive = true;
        executable = true;
    };
    home.file.".config/wlogout" = {
        source = ../../wlogout;
        recursive = true;
        executable = true;
    };
    home.file.".zshrc" = {
        source = ../../zsh/.zshrc;
    };

    home.packages = with pkgs; [
        btop
        dnsutils
        file
        fzf
        gnupg
        gnused
        gnutar
        iftop
	iotop
        lm_sensors
        lsof
        neofetch
        nix-output-monitor
        nmap
        oh-my-zsh
        p7zip
        pciutils
        unzip
        usbutils
        which
        xz
        zip
    ];

    programs = {
        git = {
            enable = true;
            userName = "David Falk";
            userEmail = "spreetin@protonmail.com";
        };
        zsh = {
            enable = true;
        };
    };
}
