{ pkgs, inputs }:

{ config, pkgs, ... }:

{
  imports = [
    inputs.hyprland.homeManagerModules.hyprland
    inputs.firefox.firefox
    ./../apps/obs.nix
    ./../apps/kitty.nix
    ./../appgroups/audiotools.nix
    ./../appgroups/browser.nix
    ./../appgroups/chat.nix
    ./../appgroups/games.nix
    ./../appgroups/images.nix
    ./../appgroups/latex.nix
    ./../appgroups/mediaplayers.nix
    ./../appgroups/networking-gui.nix
    ./../appgroups/office.nix
  ];

  home.packages = with pkgs; [
    anki
    bitwarden-desktop
    calibre
    dia
  ];
}
