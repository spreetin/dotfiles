{ inputs, config, pkgs, ... }:

{
    nixpkgs.config = {
        allowUnfree = true;
    };

    programs = {
        firefox.enable = true;
        mtr.enable = true;
	    nix-ld.enable = true;
        hyprland = {
            enable = true;
        };
        xfconf.enable = true;
        gamemode.enable = true;
        waybar.enable = true;
        hyprlock.enable = true;
        git.enable = true;
        nm-applet.indicator = true;
        virt-manager.enable = true;
        xwayland.enable = true;

        zsh = {
            enable = true;
            ohMyZsh = {
                theme = "robbyrussel";
                plugins = [
                    "sudo"
                ];
            };
        };
        gnupg.agent = {
            enable = true;
            enableSSHSupport = true;
        };
        steam = {
            enable = true;
            remotePlay.openFirewall = true;
            dedicatedServer.openFirewall = true;
            localNetworkGameTransfers.openFirewall = true;
            gamescopeSession.enable = true;
        };
        gamescope = {
            enable = true;
            capSysNice = true;
        };
        thunar = {
            enable = true;
            plugins = with pkgs.xfce; [
                mousepad
                tumbler
                thunar-archive-plugin
                thunar-volman
                thunar-vcs-plugin
                thunar-media-tags-plugin
            ];
        };
    };

    environment.systemPackages = with pkgs; [
        age
        baobab
        bash
        bc
        blueman
        brightnessctl
        browsh
        cmake
        cpufrequtils
        dnsmasq
        dosfstools
        elinks
        findutils
        glxinfo
        gnumake
        gparted
        gptfdisk
        hunspell
        hunspellDicts.de_DE
        hunspellDicts.en_GB-ise
        hunspellDicts.sv_SE
        hyphen
        hyphenDicts.de_DE
        hyphenDicts.en_US
        hyprls
        imagemagick
        killall
        kitty
        libappindicator
        libiconv
        libnotify
        libreoffice
        lshw
        lua
        networkmanagerapplet
        nh
        nfs-utils
        ntfs3g
        openssl
        pamixer
        pavucontrol
        pciutils
        playerctl
        rsync
        screen
        vulkan-tools
        wireguard-tools
        xdg-desktop-portal-hyprland
        xdg-user-dirs
        xdg-utils
    ];
}
