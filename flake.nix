{
  description = "My OS config flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    Hyprspace = {
      url = "github:KZDKM/Hyprspace";
      inputs.hyprland.follows = "hyprland";
    };
    #astal = {
    #  url = "github:aylur/astal";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
    #ags = {
    #  url = "github:aylur/ags";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #  inputs.astal.follows = "astal";
    #};
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = {
      url = "github:nix-community/nur-combined?dir=repos/rycee/pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, sops-nix, ... }@inputs: 
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      createHost = { hostname, computerType} : nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          (import ./nixos { inherit hostname computerType; })
          sops-nix.nixosModules.sops
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.david = (import ./nixos/home {
              inherit pkgs inputs hostname computerType;
            });
          }
          ({ ... }: { networking.hostName = hostname; })
          #(import ./nixos/home { inherit pkgs inputs hostname computerType; })
        ];
      };
      hosts = {
        chandrasekhar = { hostname = "chandrasekhar"; computerType = "desktop"; };
        meitner = { hostname = "meitner"; computerType = "desktop"; };
      };
    in {
      nixosConfigurations = nixpkgs.lib.mapAttrs (_: cfg: createHost cfg) hosts;
    };
}
