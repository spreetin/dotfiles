{
  imports = [
    ./plugins/conform.nix
    ./plugins/dap.nix
    ./plugins/lint.nix
    ./plugins/mini.nix
    ./plugins/snacks.nix
    ./plugins/telescope.nix
    ./plugins/which-key.nix
  ];

  plugins = {
    actions-preview.enable = true;
    blink-cmp.enable = true;
    bufferline.enable = true;
    clangd-extensions.enable = true;
    cmake-tools.enable = true;
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings.sources = [
        { name = "buffer"; }
        { name = "nvim_lsp"; }
        { name = "treesitter"; }
      ];
    };
    dashboard.enable = true;
    dial.enable = true;
    flash.enable = true;
    friendly-snippets.enable = true;
    gitsigns.enable = true;
    grug-far.enable = true;
    illuminate.enable = true;
    inc-rename.enable = true;
    indent-blankline.enable = true;
    lazygit.enable = true;
    lspconfig.enable = true;
    lualine.enable = true;
    lz-n = {
      enable = true;
      autoLoad = true;
    };
    neo-tree.enable = true;
    nix-develop.enable = true;
    nix.enable = true;
    noice.enable = true;
    notify.enable = true;
    nui.enable = true;
    nvim-autopairs.enable = true;
    nvim-snippets.enable = true;
    nvim-surround.enable = true;
    persistence.enable = true;
    spectre.enable = true;
    treesitter = {
      enable = true;
      settings = {
        indent.enable = true;
        highlight.enable = true;
      };
    };
    treesitter-context.enable = true;
    treesitter-textobjects.enable = true;
    treesitter-refactor.enable = true;
    trouble.enable = true;
    ts-autotag.enable = true;
    ts-context-commentstring.enable = true;
    undotree.enable = true;
    web-devicons.enable = true;
  };
}
