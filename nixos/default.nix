{ hostname, computerType }:

{ config, pkgs, options, ... }:

{
  imports = [
    (import ./${computerType} { inherit hostname; })
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

    ./apps/fs.nix
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  security = {
    rtkit.enable = true;
  };

  system = {
    stateVersion = "25.05";
  };

  programs = {
    mtr.enable = true;
    nix-ld.enable = true;
    git.enable = true;
    zsh.enable = true;
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
    killall
    openssl
    rsync
    screen
    tree
    xdg-user-dirs
    xdg-utils
  ];

  #networking.hostName = hostname;
}
