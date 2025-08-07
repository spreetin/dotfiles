#{ inputs, pkgs, hostname, computerType }:

{
  pkgs,
  inputs,
  hostname,
  computerType,
  ...
}:

{
  imports = [
    #./david.nix
    (import ./hosts/${hostname} { inherit pkgs inputs; })
    (import ./types/${computerType}.nix { inherit pkgs inputs hostname; })
    (import ./home.nix { inherit pkgs inputs; })
    inputs.catppuccin.homeModules.catppuccin
    #inputs.nixvim.homeModules.nixvim
    ./catppuccin.nix
  ];
}
