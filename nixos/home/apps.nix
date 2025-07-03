{ pkgs, inputs }:

{ config, pkgs, ... }:

{
    imports = [
        (import ./apps/hyprland.nix { inherit pkgs inputs; })
        ./apps/zsh.nix
        (import ./apps/neovim.nix { inherit pkgs inputs; })
    ];

    home.packages = with pkgs; [
        adwaita-icon-theme
        anki
        bitwarden-desktop
        bottles
        btop
        calibre
        cava
        cloc
        cppcheck
        dnsutils
        dia
        discord
        electron
        ffmpeg
        file
        filezilla
        fzf
        gimp3-with-plugins
        git-crypt
        gnupg
        gnused
        gnutar
        iftop
	    iotop
        jq
        lazygit
        librewolf
        lm_sensors
        lsof
        lutris
        ncdu
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
        openmw
        openrgb-with-all-plugins
        openttd
        p7zip
        pciutils
        protonplus
        protonvpn-gui
        protonup-qt
        ripgrep
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
        yt-dlp
        zip
        zoom-us
    ];
}
