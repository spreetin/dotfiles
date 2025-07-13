{ pkgs, inputs }:

{ config, pkgs, ... }:

{
  imports = [
    # WM
    (import ./apps/hyprland.nix { inherit pkgs inputs; })

    # Specific apps
    ./apps/zsh.nix
    (import ./apps/neovim.nix { inherit pkgs inputs; })
    ./apps/obs.nix
    ./apps/kitty.nix
    (import ./apps/firefox.nix { inherit pkgs inputs; })

    # Package groups
    ./appgroups/audiotools.nix 
    ./appgroups/browser.nix
    ./appgroups/chat.nix
    ./appgroups/compression.nix
    ./appgroups/dev.nix
    ./appgroups/games.nix
    ./appgroups/hardware.nix
    ./appgroups/images.nix
    ./appgroups/latex.nix
    ./appgroups/mediaplayers.nix
    ./appgroups/networking.nix
    ./appgroups/office.nix
    ./appgroups/tops.nix
  ];

  # Packages that isn't grouped
  home.packages = with pkgs; [
    anki
    bitwarden-desktop
    calibre
    dia
    ffmpeg
    file
    fzf
    gnupg
    gnused
    jq
    mc
    neofetch
    nix-output-monitor
    ripgrep
    tldr
    which
  ];
}
