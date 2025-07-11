{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        cloc
        cppcheck
        git-crypt
        lazygit
    ];
}
