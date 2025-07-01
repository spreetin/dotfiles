# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, options, ... }:

{
    imports = [ 
        ./hardware-configuration.nix
        ./applications.nix
    ];

    nix = {
        settings = {
            auto-optimise-store = true;
            experimental-features = ["nix-command" "flakes"];
            substituters = [ "https://hyprland.cachix.org" ];
            trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
            download-buffer-size = 524288000;
        };
        gc = {
            automatic = true;
            dates = "daily";
            options = "--delete-older-than 7d";
        };
    };

    boot = {
        loader = {
            systemd-boot.enable = true;
            efi.canTouchEfiVariables = true;
        };
        kernelPackages = pkgs.linuxPackages_latest;
        supportedFilesystems = [ "zfs" "btrfs" ];
        zfs.forceImportRoot = false;
    };

    hardware = {
        bluetooth = {
            enable = true;
            powerOnBoot = true;
            settings = {
                General = {
                    Enable = "Source,Sink,Media,Socket";
                    Experimental = true;
                };
            };
        };
    };

    networking = {
        networkmanager = {
            enable = true;
        };
        extraHosts = ''
            192.168.0.105 meitner
            192.168.0.106 servus
        '';
        firewall = {
            allowedUDPPorts = [
                5353
            ];
        };
        timeServers = options.networking.timeServers.default ++ [ "pool.ntp.org" ];
    };

    virtualisation = {
        libvirtd = {
            enable = true;
            qemu.vhostUserPackages = with pkgs; [ virtiofsd ];
        };
        spiceUSBRedirection.enable = true;
    };

    time.timeZone = "Europe/Stockholm";

    i18n = {
        defaultLocale = "en_US.UTF-8";
        extraLocaleSettings = {
            LC_ADDRESS = "sv_SE.UTF-8";
            LC_IDENTIFICATION = "sv_SE.UTF-8";
            LC_MEASUREMENT = "sv_SE.UTF-8";
            LC_MONETARY = "sv_SE.UTF-8";
            LC_NAME = "sv_SE.UTF-8";
            LC_NUMERIC = "sv_SE.UTF-8";
            LC_PAPER = "sv_SE.UTF-8";
            LC_TELEPHONE = "sv_SE.UTF-8";
            LC_TIME = "sv_SE.UTF-8";
        };
    };

    services = {
        displayManager = {
            sddm = {
                enable = true;
	            wayland.enable = true;
            };
        };
        xserver.xkb = {
            layout = "se";
            variant = "";
        };
        printing.enable = true;
        pulseaudio.enable = false;
        pipewire = {
            enable = true;
            alsa = {
                enable = true;
	            support32Bit = true;
            };
            pulse.enable = true;
            jack.enable = true;
        };
        openssh.enable = true;
        gvfs.enable = true;
        tumbler.enable = true;
        flatpak.enable = true;
        blueman.enable = true;
        fwupd.enable = true;
        upower.enable = true;
        fstrim.enable = true;
        gnome.gnome-keyring.enable = true;
    };

    systemd.services.flatpak-repo = {
        path = [ pkgs.flatpak ];
        script = ''
            flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
        '';
    };

    powerManagement = {
        enable = true;
        cpuFreqGovernor = "schedutil";
    };

    console.keyMap = "sv-latin1";

    security = {
        rtkit.enable = true;
        polkit = {
            enable = true;
            extraConfig = ''
                polkit.addRule(function(action, subject) {
	                if (
	                subject.isInGroup("users")
	                && (
	                    action.id == "org.freedesktop.login1.reboot" ||
		                action.id == "org.freedesktop.login1.reboot-multiple-sessions" ||
		                action.id == "org.freedesktop.login1.power-off" ||
		                action.id == "org.freedesktop.login1.power-off-multiple-sessions"
	                )
	                )
	                {
	                    return polkit.Result.YES;
	                }
	                })
                '';
        };
    };
    #security.rtkit.enable = true;

    users.users.david = {
        isNormalUser = true;
        description = "David Falk";
        extraGroups = [ "networkmanager" "wheel" "video" "users" "libvirtd" ];
        shell = pkgs.zsh;
    };

    environment = {
        sessionVariables = rec {
            NIXOS_OZONE_WL = "1";
            XDG_CACHE_HOME = "$HOME/.cache";
            XDG_CONFIG_HOME = "$HOME/.config";
            XDG_DATA_HOME = "$HOME/.local/share";
            XDG_STATE_HOME = "$HOME/.local/state";
            XDG_MUSIC_DIR = "$HOME/Music";
            XDG_DESKTOP_DIR = "$HOME/Desktop";
            XDG_DOCUMENTS_DIR = "$HOME/Documents";
            XDG_DOWNLOAD_DIR = "$HOME/Downloads";
            XDG_PICTURES_DIR = "$HOME/Pictures";
            XDG_VIDEOS_DIR = "$HOME/Videos";
            XDG_BIN_HOME = "$HOME/.local/bin";
            PATH = [
                "${XDG_BIN_HOME}"
            ];
        };
        pathsToLink = [
            "/share/xdg-desktop-portal"
            "/share/applications"
        ];
    };

    fonts = {
        packages = with pkgs; [
            font-awesome fira roboto liberation_ttf
            nerd-fonts.liberation nerd-fonts.jetbrains-mono nerd-fonts.symbols-only
            openttd-ttf
        ];
        fontDir.enable = true;
    };

    system = {
        stateVersion = "25.05";
    };

    xdg = {
        portal = {
            enable = true;
            wlr.enable = true;
        };
    };
}
