{
  imports = [
    ./plugins/conform.nix
    ./plugins/lint.nix
    ./plugins/snacks.nix
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
    dashboard = {
      enable = true;
    };
    dap.enable = true;
    dap-lldb.enable = true;
    dap-python.enable = true;
    dial = {
      enable = true;
      # TODO: set keybinds
    };
    flash = {
      enable = true;
      # TODO: check that keybinds work
    };
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
    mini = {
      enable = true;
      modules = {
        ai = {
          n_lines = 500;
          search_method = "cover_or_next";
        };
        bufremove = {
          silent = true;
        };
        comment = {
        };
        indentscope = {
        };
        pairs = {
        };
        surround = {
          n_lines = 100;
        };
      };
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
    telescope = {
      enable = true;
      keymaps = {
        "<leader>fg" = "live_grep";
      };
      extensions = {
        fzf-native.enable = true;
        undo.enable = true;
      };
    };
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
    web-devicons.enable = true;
  };
}
