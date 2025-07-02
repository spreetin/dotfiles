{ inputs, config, pkgs, ... }:

{
    imports = [
        ./home.nix
        ./chandrasekhar/apps.nix
        ./chandrasekhar/configs.nix
    ];

    home.file.".config/hypr/local/local.conf" = {
        source = ../../hypr_host/chandrasekhar.conf;
    };
}
