{
  inputs,
  pkgs,
  ...
}:

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
    # Specific apps
    #inputs.zsh.zsh
    ./modules/zsh/zsh.nix
    ./apps/isakssons.nix
    ./apps/zellij.nix

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
    fastfetch
    nix-output-monitor
    ripgrep
    tldr
    which
    nixvim
    #inputs.neovim.packages.x86_64-linux.default
    #inputs.gophertube.packages.x86_64-linux.default
  ];
}
