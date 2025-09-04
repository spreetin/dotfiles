{
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    inputs.firefox.firefox
    ./apps/hyprland
    ./apps/isakssons.nix
    ./apps/obs.nix
    ./apps/kitty.nix
    ./appgroups/audiotools.nix
    ./appgroups/browser.nix
    ./appgroups/chat.nix
    ./appgroups/games.nix
    ./appgroups/images.nix
    ./appgroups/latex.nix
    ./appgroups/mediaplayers.nix
    ./appgroups/networking-gui.nix
    ./appgroups/office.nix
  ];
  home.packages = with pkgs; [
    ags
    anki
    astal.battery
    bitwarden-desktop
    calibre
    dia
    ffmpeg
    openrgb-with-all-plugins
    solaar
  ];
}
