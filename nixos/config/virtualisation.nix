{ config, pkgs, options, ... }:

{
    virtualisation = {
        libvirtd = {
            enable = true;
            qemu.vhostUserPackages = with pkgs; [ virtiofsd ];
        };
        spiceUSBRedirection.enable = true;
    };
}
