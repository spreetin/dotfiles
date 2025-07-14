{ inputs, pkgs, filesource }:

{ lib, config, pkgs, ... }:

{
  #imports = [
      #inputs.nixvim.homeModules.nixvim
  #];

  home.sessionVariables.EDITOR = "nvim";

  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      nixd
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
      stylua
      ripgrep
    ];
    plugins = with pkgs.vimPlugins; [
      lazy-nvim
    ];
    extraLuaConfig =
      let
        plugins = with pkgs.vimPlugins; [
          LazyVim
          blink-cmp
          bufferline-nvim
          clangd_extensions-nvim
          cmake-tools-nvim
          cmp-buffer
          cmp-nvim-lsp
          cmp-path
          cmp_luasnip
          conform-nvim
          dashboard-nvim
          dial-nvim
          dressing-nvim
          flash-nvim
          friendly-snippets
          gitsigns-nvim
          grug-far-nvim
          inc-rename-nvim
          indent-blankline-nvim
          lazygit-nvim
          lualine-nvim
          neo-tree-nvim
          neoconf-nvim
          neodev-nvim
          noice-nvim
          nui-nvim
          nvim-cmp
          nvim-lint
          nvim-lspconfig
          nvim-notify
          nvim-spectre
          nvim-treesitter
          nvim-treesitter-context
          nvim-treesitter-textobjects
          nvim-ts-autotag
          nvim-ts-context-commentstring
          nvim-web-devicons
          persistence-nvim
          plenary-nvim
          telescope-fzf-native-nvim
          telescope-nvim
          todo-comments-nvim
          toggleterm-nvim
          tokyonight-nvim
          trouble-nvim
          vim-illuminate
          vim-startuptime
          which-key-nvim
          { name = "LuaSnip"; path = luasnip; }
          { name = "catppuccin"; path = catppuccin-nvim; }
          { name = "mini.ai"; path = mini-nvim; }
          { name = "mini.bufremove"; path = mini-nvim; }
          { name = "mini.comment"; path = mini-nvim; }
          { name = "mini.indentscope"; path = mini-nvim; }
          { name = "mini.pairs"; path = mini-nvim; }
          { name = "mini.surround"; path = mini-nvim; }
        ];
        mkEntryFromDrv = drv:
          if lib.isDerivation drv then
            {name = "${lib.getName drv}"; path = drv;}
          else
            drv;
        lazyPath = pkgs.linkFarm "lazy-plugins" (builtins.map mkEntryFromDrv plugins);
      in
      ''
        require("lazy").setup({
          defaults = {
            lazy = true,
          },
          dev = {
            -- reuse files from pkgs.vimPlugins.*
            path = "${lazyPath}",
            patterns = { "" },
            -- fallback to download
            fallback = true,
          },
          spec = {
            { "LazyVim/LazyVim", import = "lazyvim.plugins" },
            -- The following configs are needed for fixing lazyvim on nix
            -- force enable telescope-fzf-native.nvim
            { "nvim-telescope/telescope-fzf-native.nvim", enabled = true },
            -- disable mason.nvim, use programs.neovim.extraPackages
            { "williamboman/mason-lspconfig.nvim", enabled = false },
            { "williamboman/mason.nvim", enabled = false },
            -- import/override with your plugins
            { import = "plugins" },
            -- treesitter handled by xdg.configFile."nvim/parser", put this line at the end of spec to clear ensure_installed
            --{ "nvim-treesitter/nvim-treesitter", opts = { ensure_installed = {} } },
            { "nvim-treesitter/nvim-treesitter", opts = function(_, opts) opts.ensure_installed = {} end,},
          },
        })
       '';
  };

  xdg.configFile."nvim/parser".source =
  let
    parsers = pkgs.symlinkJoin {
      name = "treesitter-parsers";
      paths = (pkgs.vimPlugins.nvim-treesitter.withPlugins (plugins: with plugins; [
        arduino
        asm
        awk
        bash
        c
        c_sharp
        cmake
        cpp
        css
        csv
        desktop
        dockerfile
        doxygen
        gitignore
        haskell
        html
        java
        javadoc
        javascript
        json
        latex
        lua
        make
        markdown
        matlab
        nginx
        nix
        perl
        python
        regex
        ruby
        rust
        sql
        sway
        typescript
        vala
        vim
        udev
        xml
        yaml
      ])).dependencies;
    };
  in
  "${parsers}/parser";

  # Normal LazyVim config here, see https://github.com/LazyVim/starter/tree/main/lua
  xdg.configFile."nvim/lua".source = "${filesource}/lua";
   #};
}
