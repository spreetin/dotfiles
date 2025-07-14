#{ inputs, pkgs, hostname, computerType }:

{ pkgs, inputs, hostname, computerType, ... }:

{
  imports = [
    #./david.nix
    (import ./hosts/${hostname} { inherit pkgs inputs; })
    ./types/${computerType}.nix
    (import ./home.nix { inherit pkgs inputs; })
  ];
}
