{ config, lib, pkgs, modulesPath, ... }:

{
    networking.hostName = "meitner";

    boot.initrd.kernelModules = [ "amdgpu" ];

    hardware.graphics = {
        enable = true;
        enable32Bit = true;
    };

    services.xserver.videoDrivers = [ "amdgpu" ];

    systemd = {
        tmpfiles.rules = [
            "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
        ];
        packages = with pkgs; [ lact ];
        services.lactd.wantedBy = [ "multi-user.target" ];
    };

    hardware.graphics.extraPackages = with pkgs; [
        rocmPackages.clr.icd;
        amdvlk
        driversi686Linux.amdvlk
    ];

    environment.systemPackages = with pkgs; [
        lact
    ];
}
