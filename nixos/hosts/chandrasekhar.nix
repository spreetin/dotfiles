{ config, lib, pkgs, modulesPath, ... }:

{
    networking.hostName = "chandrasekhar";

    hardware.graphics = {
        enable = true;
    };

    hardware.nvidia = {
        prime = {
            sync.enable = true;
            intelBusId = "PCI:0:2:0";
            nvidiaBusId = "PCI:1:0:0";
        };
        modesetting.enable = true;
        powerManagement = {
            enable = true;
            finegrained = false;
        };
        open = true;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

    services.xserver.videoDrivers = ["nvidia"];
}
