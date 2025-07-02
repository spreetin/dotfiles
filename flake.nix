{
    description = "My OS config flake";

    inputs = {
        nixpkgs = {
            url = "github:NixOS/nixpkgs/nixos-unstable";
        };
        home-manager = {
            url = "github:nix-community/home-manager/master";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        hyprland.url = "github:hyprwm/Hyprland";
        Hyprspace = {
            url = "github:KZDKM/Hyprspace";
            inputs.hyprland.follows = "hyprland";
        };
        hyprfocus = {
            url = "github:pyt0xic/hyprfocus";
            inputs.hyprland.follows = "hyprland";
        };
    };

    outputs = { self, nixpkgs, home-manager, hyprland, Hyprspace, hyprfocus, ... }: 
        let
            system = "x86_64-linux";
            pkgs = nixpkgs.legacyPackages.${system};
        in {
            nixosConfigurations = {
                chandrasekhar = nixpkgs.lib.nixosSystem {
                    inherit system;
                    modules = [
                        ./nixos/configuration.nix
                        ./nixos/hosts/chandrasekhar-hardware.nix
                        ./nixos/hosts/chandrasekhar.nix
                        home-manager.nixosModules.home-manager {
                            home-manager.useGlobalPkgs = true;
                            home-manager.useUserPackages = true;
                            home-manager.users.david = import ./nixos/home/chandrasekhar.nix;
                        }
                    ];
                };
                meitner = nixpkgs.lib.nixosSystem {
                    inherit system;
                    modules = [
                        ./nixos/configuration.nix
                        ./nixos/hosts/meitner-hardware.nix
                        ./nixos/hosts/meitner.nix
                        home-manager.nixosModules.home-manager {
                            home-manager.useGlobalPkgs = true;
                            home-manager.useUserPackages = true;
                            home-manager.users.david = import ./nixos/home/meitner.nix;
                        }
                    ];
                };
            };
        };
}
