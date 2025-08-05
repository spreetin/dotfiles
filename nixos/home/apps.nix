{ pkgs, inputs }:

{ lib, config, pkgs, ... }:

{
  imports = [
    # WM
    #inputs.hyprland.homeManagerModules.hyprland
    #(import ./apps/hyprland.nix { inherit pkgs inputs; })

    # Specific apps
    #(import ./apps/zsh.nix { inherit pkgs config; filesource = ../../oh-my-zsh; })
    #(import ./apps/neovim.nix { inherit pkgs inputs; filesource = ../../neovim; })
    inputs.zsh.zsh
    inputs.neovim.neovim
    inputs.neovim.lsp
    #inputs.firefox.firefox
    #./apps/obs.nix
    #./apps/kitty.nix
    ./apps/isakssons.nix
    #(import ./apps/firefox.nix { inherit pkgs inputs; })

    # Package groups
    #./appgroups/audiotools.nix 
    #./appgroups/browser.nix
    #./appgroups/chat.nix
    ./appgroups/compression.nix
    ./appgroups/dev.nix
    #./appgroups/games.nix
    ./appgroups/hardware.nix
    #./appgroups/images.nix
    #./appgroups/latex.nix
    #./appgroups/mediaplayers.nix
    ./appgroups/networking.nix
    #./appgroups/office.nix
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
    #inputs.gophertube.packages.x86_64-linux.default
  ];
}
