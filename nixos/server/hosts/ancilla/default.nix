{ inputs, pkgs, ... }:

{
  imports = [
    ./arr.nix
    ./blocky.nix
    ./borg.nix
    ./homepage.nix
  ];
}
