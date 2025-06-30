{ config, pkgs, ... }:

{
    imports = [
        ./home.nix
    ];

    home.file.".config/hypr/local/local.conf" = {
        source = ../../hypr_host/chandrasekhar.conf;
    };
}
