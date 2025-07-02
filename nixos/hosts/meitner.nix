{ config, lib, pkgs, modulesPath, ... }:

{
    imports = [
        ./meitner-hardware.nix
    ];
    networking = {
        hostName = "meitner";
        hostId = "fcfbd6fb";
    };

    boot = {
        initrd.kernelModules = [ "amdgpu" ];
        zfs.extraPools = [ "storage" ];
    };

    hardware.graphics = {
        enable = true;
        enable32Bit = true;
        extraPackages = with pkgs;  [
            rocmPackages.clr.icd
            amdvlk
            driversi686Linux.amdvlk
        ];
    };

    services.xserver.videoDrivers = [ "amdgpu" ];

    systemd = {
        tmpfiles.rules = [
            "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
        ];
        packages = with pkgs; [ lact ];
        services.lactd.wantedBy = [ "multi-user.target" ];
    };

    environment.systemPackages = with pkgs; [
        lact
    ];
}
