{ pkgs, inputs }:

{ config, pkgs, ... }:

{
    imports = [
        (import ../home.nix { inherit pkgs inputs; })
        ./meitner/apps.nix
        ./meitner/configs.nix
    ];

    home.file.".config/hypr/local/local.conf" = {
	source = ../../../hypr_host/meitner.conf;
    };
}
