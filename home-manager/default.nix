#{ inputs, pkgs, hostname, computerType }:

{
  pkgs,
  inputs,
  hostname,
  computerType,
  options,
  nixosOptions,
  lib,
  config,
  ...
}:
let
  optnixLib = inputs.optnix.mkLib pkgs;
in
{
  imports = [
    ./hosts/${hostname}
    ./types/${computerType}.nix
    ./config.nix
    ./apps.nix
    inputs.optnix.homeModules.optnix
    ./catppuccin.nix
  ];

  home.file."${config.xdg.configHome}/scripts" = {
    source = ../scripts;
    recursive = true;
    executable = true;
  };

  programs.optnix = {
    enable = true;
    settings = {
      min_score = 3;
      scopes = {
        desktop = {
          description = "NixOS config for desktop";
          options-list-file = optnixLib.mkOptionsList { options = nixosOptions; };
          evaluator = "nix eval /home/david/dotfiles/#nixosConfigurations.meitner.config.{{ .Option }}";
        };
        home-manager = {
          description = "home-manager config";
          options-list-file = optnixLib.mkOptionsList {
            inherit options;
            transform =
              o:
              o
              // {
                name = lib.removePrefix "home-manager.users.${config.home.username}." o.name;
              };
          };
        };
        #evaluator = "";
      };
    };
  };
}
