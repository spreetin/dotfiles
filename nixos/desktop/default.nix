{ hostname }:

{ config, pkgs, ... }:

{
  imports = [
    ./hosts/${hostname}.nix
  ]; 
}
