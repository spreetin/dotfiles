{ config, pkgs, options, ... }:

{
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
      substituters = [ "https://hyprland.cachix.org" ];
      trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
      download-buffer-size = 524288000;
      cores = 8;
      sandbox = true;
      #max-jobs = "auto";
    };
    #gc = {
    #  automatic = true;
    #  dates = "daily";
    #  options = "--delete-older-than 7d";
    #};
  };
  programs.nh = {
    enable = true;
    flake = "/home/david/code/dotfiles/";
    clean = {
      enable = true;
      extraArgs = "--keep 10 --keep-since 14d";
    };
  };
}
