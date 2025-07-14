{ pkgs }:

{ config, pkgs, ... }:

{
  programs.neovim = {
    extraPackages = with pkgs; [
      bash-language-server
      cmake-language-server
      docker-language-server
      haskell-language-server
      java-language-server
      lua-language-server
      systemd-language-server
      typescript-language-server
      yaml-language-server
      clang-tools
    ];
  };
}
