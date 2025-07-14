{ pkgs, inputs, hostname, computerType, ... }:

{
  home-manager.users.david = {
    imports = [
      (import ./hosts/${hostname} { inherit pkgs inputs; })
      ./types/${computerType}.nix
      (import ./home.nix { inherit pkgs inputs; })
    ];
  };
}
