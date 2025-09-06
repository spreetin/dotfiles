{ inputs, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./arr.nix
    ./blocky.nix
    #./borg.nix
    ./homepage.nix
    ./navidrome.nix
  ];
}
