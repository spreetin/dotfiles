{
  pkgs,
  ...
}:

{
  imports = [
    ./../cli.nix
    ./../gui.nix
  ];

  home.packages = with pkgs; [
    distrobox
    distrobox-tui
    distroshelf
  ];
}
