{
  description = "My OS config flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    #nixpkgslib.url = "github:nix-community/nixpkgs.lib";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
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
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    vim-be-better = {
      url = "github:szymonwilczek/vim-be-better";
      flake = false;
    };
    firefox-addons = {
      url = "github:nix-community/nur-combined?dir=repos/rycee/pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox = {
      url = "path:./nixos/home/modules/firefox";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.firefox-addons.follows = "nixpkgs";
    };
    dotfiles_hidden = {
      url = "git+ssh://git@github.com/spreetin/dotfiles_hidden";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    optnix = {
      url = "github:water-sucks/optnix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";
    #gophertube = {
    #  url = "github:/KrishnaSSH/GopherTube";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      catppuccin,
      sops-nix,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      createHost =
        { hostname, computerType }:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit hostname inputs computerType;
          };
          modules = [
            ./nixos
            sops-nix.nixosModules.sops
            catppuccin.nixosModules.catppuccin
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";
              home-manager.extraSpecialArgs = {
                inherit hostname inputs computerType;
              };
              home-manager.users.david = ./nixos/home;
            }
            (
              { ... }:
              {
                networking.hostName = hostname;
              }
            )
            #(import ./nixos/home { inherit pkgs inputs hostname computerType; })
          ];
        };
      hosts = {
        chandrasekhar = {
          hostname = "chandrasekhar";
          computerType = "desktop";
        };
        meitner = {
          hostname = "meitner";
          computerType = "desktop";
        };
      };
    in
    {
      nixosConfigurations = nixpkgs.lib.mapAttrs (_: cfg: createHost cfg) hosts;
    };
}
