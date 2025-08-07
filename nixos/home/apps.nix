{ pkgs, inputs }:

{
  lib,
  config,
  pkgs,
  ...
}:

{
  imports = [
    # Specific apps
    inputs.zsh.zsh
    ./apps/isakssons.nix

    # Package groups
    ./appgroups/compression.nix
    ./appgroups/dev.nix
    ./appgroups/hardware.nix
    ./appgroups/networking.nix
    ./appgroups/tops.nix
  ];

  # Packages that isn't grouped
  home.packages = with pkgs; [
    ags
    astal.battery
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
    inputs.neovim.packages.x86_64-linux.default
    #inputs.gophertube.packages.x86_64-linux.default
  ];
}
