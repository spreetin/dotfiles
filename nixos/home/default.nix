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
    ./hosts/${hostname}
    ./types/${computerType}.nix
    ./home.nix
    inputs.catppuccin.homeModules.catppuccin
    #inputs.nixvim.homeModules.nixvim
    ./catppuccin.nix
  ];
}
