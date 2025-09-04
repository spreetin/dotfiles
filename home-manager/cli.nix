{ inputs, pkgs, ... }:
let
  nixvim = inputs.nixvim.legacyPackages.${pkgs.system}.makeNixvimWithModule {
    #system = pkgs.system;
    module = import ./modules/neovim/nixvim.nix;
    extraSpecialArgs = {
      inherit inputs;
    };
  };
in
{
  imports = [
    ./modules/zsh/zsh.nix
    ./apps/optnix.nix
    ./appgroups/compression.nix
    ./appgroups/dev.nix
    ./appgroups/hardware.nix
    ./appgroups/networking.nix
    ./appgroups/tops.nix
  ];

  home.packages = with pkgs; [
    file
    fzf
    gnupg
    gnused
    libsecret
    jq
    mc
    fastfetch
    nix-output-monitor
    ripgrep
    tldr
    which
    nixvim
  ];
}
