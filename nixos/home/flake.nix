{
  description = "My home-manager setup";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" ];
      forAllSystems = f: nixpkgs.lib.genAttrs supportedSystems (system: f system);
  in
  {
    homeConfigurations = forAllSystems (system: {
      mkHome = { computerType, hostname ? null }:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

        extraModules = 
          [ ./types/${computerType}.nix ] ++
          (if hostname != null && builtins.pathExists (./hosts + "/${hostname}")
           then [ (import ./hosts/${hostname} { inherit pkgs inputs; }) ]
           else []);
      in
      {
        home-manager.lib.homeManagerConfiguration = {
          inherit pkgs;
          modules = [
            (import ./home.nix { inherit pkgs inputs; })
          ] ++ extraModules;
        };
      };
    });
  };
}
