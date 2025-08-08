{ pkgs, inputs }:

{ config, pkgs, ... }:

{
  imports = [
    (import ./config.nix { inherit pkgs inputs; })
    (import ./apps.nix { inherit pkgs inputs; })
  ];
  home.file."${config.xdg.configHome}/scripts" = {
    source = ../../scripts;
    recursive = true;
    executable = true;
  };
}
