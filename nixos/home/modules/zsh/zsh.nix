{ pkgs, filesource }:

{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    oh-my-zsh
    zsh-syntax-highlighting
  ];

  home.file.".oh-my-zsh/custom" = {
    source = "${filesource}/custom";
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
        startflake = "nix flake init -t github:hercules-ci/flake-parts";
      };
    };
  };
}
