{ config, pkgs, ... }:

{
    imports = [
        ./config.nix
        ./apps.nix
    ];
}
