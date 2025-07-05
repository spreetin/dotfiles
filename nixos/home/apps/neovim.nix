{ inputs, pkgs }:

{ lib, config, pkgs, ... }:

{
    imports = [
        inputs.nixvim.homeModules.nixvim
    ];

    home.sessionVariables.EDITOR = "nvim";

    programs.nixvim = {
        enable = true;
        colorschemes.tokyonight.enable = true;
	    colorscheme = "tokyonight";
        opts = {
	    # Line numbers 
        number = true;
        relativenumber = true;

	    # Tab/indent
        shiftwidth = 4;
	    tabstop = 4;
	    softtabstop = 4;
	    expandtab = true;

	    # UI
	    splitbelow = true;
	    splitright = true;
	    termguicolors = true;

	    # Search
	    incsearch = true;
	    hlsearch = true;
	    ignorecase = true;
	    smartcase = true;
        };
        lsp.servers.clangd.enable = true;
        plugins = {
            luasnip.enable = true;
            schemastore.enable = true;
            blink-cmp.enable = true;
            bufferline.enable = true;
            clangd-extensions.enable = true;
            cmake-tools.enable = true;
            conform-nvim.enable = true;
            dial.enable = true;
            flash.enable = true;
            friendly-snippets.enable = true;
            gitsigns.enable = true;
            grug-far.enable = true;
            inc-rename.enable = true;
            lazydev.enable = true;
            lazygit.enable = true;
            lualine.enable = true;
            lsp = {
                servers = {
                    asm_lsp.enable = true;
                    autotools_ls.enable = true;
                    bashls.enable = true;
                    clangd.enable = true;
                    cmake.enable = true;
                    docker_compose_language_service.enable = true;
                    hls = {
                        enable = true;
                        installGhc = true;
                    };
                    jsonls.enable = true;
                    lua_ls.enable = true;
                    nginx_language_server.enable = true;
                    nixd.enable = true;
                    sqls.enable = true;
                    systemd_ls.enable = true;
                    ts_ls.enable = true;
                    yamlls.enable = true;
                };
            };
            markdown-preview.enable = true;
            mini = {
                enable = true;
                modules = {
                    icons.enable = true;
                };
            };
            mini-icons.enable = true;
            mini-pairs.enable = true;
            mini-surround.enable = true;
            neotest = {
                enable = true;
            };
            noice.enable = true;
            nui.enable = true;
            lint.enable = true;
            lspconfig.enable = true;
            treesitter.enable = true;
            treesitter-textobjects.enable = true;
            ts-autotag.enable = true;
            ts-context-commentstring.enable = true;
            ts-comments.enable = true;
            persistence.enable = true;
            project-nvim.enable = true;
            render-markdown.enable = true;
            snacks.enable = true;
            telescope.enable = true;
            todo-comments.enable = true;
            trouble.enable = true;
            undotree.enable = true;
            vim-dadbod.enable = true;
            vim-dadbod-completion.enable = true;
            vim-dadbod-ui.enable = true;
            web-devicons.enable = true;
            which-key.enable = true;
            yanky.enable = true;
        };
    };
}
