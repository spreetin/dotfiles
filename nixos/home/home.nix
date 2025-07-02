{ pkgs, inputs }:

{ config, pkgs, ... }:

{
    imports = [
        (import ./config.nix { inherit pkgs inputs; })
        ./apps.nix
    ];
}
