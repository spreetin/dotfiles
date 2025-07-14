{ config, lib, pkgs, modulesPath, ... }:

{
  imports =[ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
      kernelModules = [ ];
    };
    kernelModules = [ "kvm-amd" "amdgpu" "nct6683" ];
    extraModulePackages = [ ];
    zfs.extraPools = [ "storage" ];
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/4efd6ec5-6d4b-4547-800f-da03c6efac16";
      fsType = "btrfs";
      options = [ "subvol=root" ];
    };
    "/home" = {
      device = "/dev/disk/by-uuid/4efd6ec5-6d4b-4547-800f-da03c6efac16";
      fsType = "btrfs";
      options = [ "subvol=home" ];
    };
    "/nix" = {
      device = "/dev/disk/by-uuid/4efd6ec5-6d4b-4547-800f-da03c6efac16";
      fsType = "btrfs";
      options = [ "subvol=nix" ];
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/508A-9EDF";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };
  };

  swapDevices = [ ];

  networking = {
    useDHCP = lib.mkDefault true;
    #hostName = "meitner";
    hostId = "fcfbd6fb";
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  hardware = {
    cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs;  [
        rocmPackages.clr.icd
        amdvlk
        driversi686Linux.amdvlk
      ];
    };
    amdgpu.amdvlk = {
      enable = true;
      support32Bit.enable = true;
    };
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
