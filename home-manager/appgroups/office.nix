{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    libreoffice
    hunspell
    hunspellDicts.de_DE
    hunspellDicts.en_GB-ise
    hunspellDicts.sv_SE
    hyphen
    hyphenDicts.de_DE
    hyphenDicts.en_US
    onlyoffice-desktopeditors
  ];
}
