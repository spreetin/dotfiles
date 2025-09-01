{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    cloc
    code-cursor
    cppcheck
    git-crypt
    lazygit
  ];
}
