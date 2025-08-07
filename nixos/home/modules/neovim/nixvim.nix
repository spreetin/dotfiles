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
    black
    clj-kondo
    cmake-format
    cmake-lint
    golangci-lint
    cppcheck
    fzf
    gofumpt
    hlint
    lazygit
    luajitPackages.luacheck
    markdownlint-cli
    nixfmt-rfc-style
    nodePackages.jshint
    nodePackages.jsonlint
    pylint
    ripgrep
    rustfmt
    stylua
    html-tidy
    vimPlugins.vim-clang-format
    yamllint
    zprint
  ];
  colorschemes.catppuccin.enable = true;
  colorscheme = "catppuccin";
}
