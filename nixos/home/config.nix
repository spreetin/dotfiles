{ pkgs, inputs }:

{ lib, config, pkgs, ... }:

{
  imports = [ inputs.ags.homeManagerModules.default ];

  xdg.enable = true;

  home.username = "david";
  home.homeDirectory = "/home/david";
  home.stateVersion = "25.05";

  home.file.".config/kitty" = {
    source = ../../kitty;
    recursive = true;
  };
  home.file.".config/ags".source = ../../ags;

  programs = {
    git = {
      enable = true;
      userName = "David Falk";
      userEmail = "spreetin@protonmail.com";
    };
    ags = {
      enable = true;
      extraPackages = with pkgs; [
        inputs.astal.packages.${pkgs.system}.battery
        fzf
      ];
    };
    #mangohud = {
      #enable = true;
      #enableSessionWide = true;
      #settings = {
      #};
    #};
  };
}
