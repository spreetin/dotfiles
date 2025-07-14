{ hostname, computerType }:

{ config, pkgs, options, ... }:

{
  imports = [
    (import ./${computerType} { inherit hostname; })
    ./configuration.nix
  ];

  #networking.hostName = hostname;
}
