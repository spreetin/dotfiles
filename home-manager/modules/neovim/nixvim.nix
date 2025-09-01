{
  pkgs,
  ...
}:

{
  imports = [
    ./config.nix
    ./keybinds.nix
    ./lsp.nix
    ./plugins.nix
  ];

  withRuby = false;
  extraPackages = with pkgs; [
    fzf
    lazygit
    ripgrep
  ];
  colorschemes.catppuccin.enable = true;
  colorscheme = "catppuccin";
}
