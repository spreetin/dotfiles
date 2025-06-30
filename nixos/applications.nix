{ config, pkgs, ... }:

{
  nixpkgs.config = {
    allowUnfree = true;
  };
  #nixpkgs.config.allowUnfree = true;

  programs = {
    firefox.enable = true;
    mtr.enable = true;
    hyprland.enable = true;
    xfconf.enable = true;
    gamemode.enable = true;
    waybar.enable = true;
    hyprlock.enable = true;
    git.enable = true;
    nm-applet.indicator = true;
    virt-manager.enable = true;
    xwayland.enable = true;
    home-manager.enable = true;

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    neovim = {
      enable = true;
      defaultEditor = true;
    };
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
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
    baobab
    bash-language-server
    bc
    blueman
    brightnessctl
    cmake-language-server
    copilot-language-server
    cpufrequtils
    discord
    dnsmasq
    docker-language-server
    ffmpeg
    filezilla
    findutils
    gcc
    gimp3-with-plugins
    git
    glib
    haskell-language-server
    hunspell
    hunspellDicts.de_DE
    hunspellDicts.en_GB-ise
    hunspellDicts.sv_SE
    hyphen
    hyphenDicts.de_DE
    hyphenDicts.en_US
    hyprls
    hyprpaper
    imagemagick
    killall
    kitty
    lua-language-server
    libappindicator
    libnotify
    libreoffice
    librewolf
    lshw
    lua
    lutris
    mpv
    networkmanagerapplet
    openssl
    pamixer
    pavucontrol
    pciutils
    playerctl
    rofi
    rsync
    spotify
    swaynotificationcenter
    swww
    unzip
    waybar
    wget
    wine
    winetricks
    wl-clipboard
    wlogout
    xdg-user-dirs
    xdg-utils
    yaml-language-server
    yt-dlp
    zoom-us
    zsh
  ];
}
