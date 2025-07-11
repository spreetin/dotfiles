{ config, pkgs, options, ... }:

{
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
        xone.enable = true;
        steam-hardware.enable = true;
        graphics = {
            enable = true;
            enable32Bit = true;
        };
    };

    powerManagement = {
        enable = true;
        cpuFreqGovernor = "schedutil";
    };
}
