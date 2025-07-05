{ pkgs, inputs }:

{ config, pkgs, ... }:

{
    imports = [
        (import ./apps/hyprland.nix { inherit pkgs inputs; })
        ./apps/zsh.nix
        (import ./apps/neovim.nix { inherit pkgs inputs; })
        ./apps/games.nix
    ];

    home.packages = with pkgs; [
        anki
        btop
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
        mangohud
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
        openrgb-with-all-plugins
        p7zip
        pciutils
        protonvpn-gui
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
