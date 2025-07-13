{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    oh-my-zsh
    zsh-syntax-highlighting
  ];

  home.file.".oh-my-zsh/custom" = {
    source = ../../../oh-my-zsh/custom;
    recursive = true;
  };

  programs = {
    zsh = {
      enable = true;
      syntaxHighlighting.enable = true;
      oh-my-zsh = {
        enable = true;
        theme = "af-magic";
        plugins = [
          "git"
          "ssh"
          "sudo"
      ];
      };
      shellAliases = {
        rebuild = "sudo nixos-rebuild switch --flake /home/david/dotfiles/";
        startflake = "nix flake init -t github:hercules-ci/flake-parts";
      };
    };
  };
}
