{ inputs, pkgs, ... }:

{
  imports = [
    ./arr.nix
    ./borg.nix
    ./homepage.nix
  ];
}
