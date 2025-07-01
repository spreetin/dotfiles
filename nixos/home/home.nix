{ config, pkgs, ... }:

{
    #imports = [
    #    .apps/kitty.nix
    #];

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
        anki
        bash-language-server
        bitwarden-desktop
        btop
        calibre
        cava
        cliphist
        cloc
        cmake-language-server
        copilot-language-server
        cppcheck
        dnsutils
        docker-language-server
        discord
        electron
        ffmpeg
        file
        filezilla
        fzf
        gimp3-with-plugins
        gnupg
        gnused
        gnutar
        haskell-language-server
        hyprpaper
        hyprpicker
        hyprshot
        iftop
	    iotop
        jq
        lazygit
        librewolf
        lm_sensors
        lsof
        lua-language-server
        lutris
        neofetch
        nix-output-monitor
        nmap
        nvtopPackages.full
        nwg-displays
        mc
        mpv
        mpvScripts.mpris
        obs-studio
        obs-studio-plugins.obs-mute-filter
        obs-studio-plugins.obs-pipewire-audio-capture
        oh-my-zsh
        openmw
        openttd
        p7zip
        pciutils
        protonvpn-gui
        protonup-qt
        signal-desktop
        sshfs
        slurp
        solaar
        spotify
        swappy
        texstudio
        tldr
        traceroute
        unzip
        usbutils
        vlc
        wget
        wine
        winetricks
        wireguard-tools
        which
        xz
        yaml-language-server
        yt-dlp
        zip
        zoom-us
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
