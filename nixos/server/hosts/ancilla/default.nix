{ inputs, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./arr.nix
    ./blocky.nix
    #./borg.nix
    ./homepage.nix
    ./immich.nix
    ./navidrome.nix
    ./nfs.nix
    ./radicale.nix
  ];

  environment.systemPackages = with pkgs; [
    unrar
  ];
}
