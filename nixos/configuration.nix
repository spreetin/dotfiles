# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, options, ... }:

{
  imports = [ 
    ./applications.nix
    ./config/boot.nix
    ./config/fonts.nix
    ./config/gui.nix
    ./config/hardware.nix
    ./config/localisation.nix
    ./config/networking.nix
    ./config/nix.nix
    ./config/services.nix
    ./config/users.nix
    ./config/virtualisation.nix
  ];

  security = {
    rtkit.enable = true;
  };

  system = {
    stateVersion = "25.05";
  };
}
