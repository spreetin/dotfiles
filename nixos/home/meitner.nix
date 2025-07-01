{ config, pkgs, ... }:

{
    imports = [
        ./home.nix
        ./meitner/apps.nix
        ./meitner/configs.nix
    ];

    home.file.".config/hypr/local/local.conf" = {
	source = ../../hypr_host/meitner.conf;
    };
}
