{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix")];

  boot = {
    initrd = {
      availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod" ];
      kernelModules = [ ];
    };
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/ee263f9e-58ff-497b-b036-a0d7df7459cf";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/E215-53D0";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };
  };

  swapDevices = [ ];

  networking = {
    useDHCP = lib.mkDefault true;
    #hostname = "chandrasekhar";
    hostId = "2bbbd2df";
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  hardware = {
    cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    graphics.enable = true;
    nvidia = {
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
  };

  services.xserver.videoDrivers = ["nvidia"];
}
