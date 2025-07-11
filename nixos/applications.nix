{ inputs, config, pkgs, ... }:

{
    imports = [
        ./apps/fs.nix
        ./apps/gaming.nix
        ./apps/hyprland.nix
    ];

    nixpkgs.config = {
        allowUnfree = true;
    };

    programs = {
        mtr.enable = true;
	    nix-ld.enable = true;
        git.enable = true;
        virt-manager.enable = true;
        xwayland.enable = true;

        zsh = {
            enable = true;
        };
        gnupg.agent = {
            enable = true;
            enableSSHSupport = true;
        };
    };

    environment.systemPackages = with pkgs; [
        age
        bash
        bc
        cpufrequtils
        dnsmasq
        findutils
        glxinfo
        killall
        nh
        openssl
        rsync
        screen
        vulkan-tools
        xdg-user-dirs
        xdg-utils
    ];
}
