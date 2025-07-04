{
    description = "My OS config flake";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager/master";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        hyprland.url = "github:hyprwm/Hyprland";
        Hyprspace = {
            url = "github:KZDKM/Hyprspace";
            inputs.hyprland.follows = "hyprland";
        };
        astal.url = "github:aylur/astal";
        ags.url = "github:aylur/ags";
        nixvim = {
            url = "github:nix-community/nixvim";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, home-manager, ... }@inputs: 
        let
            system = "x86_64-linux";
	    profile = "desktop";
	    timezone = "Europe/Stockholm";
	    locale = "sv_SE.UTF-8";

            pkgs = nixpkgs.legacyPackages.${system};
        in {
            nixosConfigurations = {
                chandrasekhar = nixpkgs.lib.nixosSystem {
                    inherit system;
                    modules = [
                        ./nixos/configuration.nix
                        ./nixos/hosts/chandrasekhar
                        home-manager.nixosModules.home-manager {
                            home-manager.useGlobalPkgs = true;
                            home-manager.useUserPackages = true;
                            home-manager.backupFileExtension = "backup";
                            home-manager.users.david = import ./nixos/home/hosts/chandrasekhar { inherit pkgs inputs; };
                        }
                    ];
                };
                meitner = nixpkgs.lib.nixosSystem {
                    inherit system;
                    modules = [
                        ./nixos/configuration.nix
                        ./nixos/hosts/meitner
                        home-manager.nixosModules.home-manager {
                            home-manager.useGlobalPkgs = true;
                            home-manager.useUserPackages = true;
                            home-manager.backupFileExtension = "backup";
                            home-manager.users.david = import ./nixos/home/hosts/meitner { inherit pkgs inputs; };
                        }
                    ];
                };
            };
        };
}
