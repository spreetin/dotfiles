{
  description = "My OS config flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
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
    neovim = {
      url = "path:./nixos/home/modules/neovim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox = {
      url = "path:./nixos/home/modules/firefox";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zsh = {
      url = "path:./nixos/home/modules/zsh";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dotfiles_hidden = {
      url = "git+ssh://git@github.com/spreetin/dotfiles_hidden";
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
      self,
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
          modules = [
            (import ./nixos { inherit hostname computerType; })
            sops-nix.nixosModules.sops
            catppuccin.nixosModules.catppuccin
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";
              home-manager.extraSpecialArgs = {
                inherit hostname;
              };
              home-manager.users.david = (
                import ./nixos/home {
                  inherit
                    pkgs
                    inputs
                    hostname
                    computerType
                    ;
                }
              );
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
