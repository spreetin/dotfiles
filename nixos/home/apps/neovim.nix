{ inputs, pkgs }:

{ lib, config, pkgs, ... }:

{
    imports = [
        #./neovim/plugins.nix
	inputs.LazyVim.homeManagerModules.default
    ];

    home = {
    	packages = with pkgs; [
	    lazygit
	];
        #packages = with pkgs; [
        #    bash-language-server
        #    cmake-language-server
        #    copilot-language-server
        #    docker-language-server
        #    haskell-language-server
        #    lua-language-server
        #    yaml-language-server
        #];
        #file.".config/nvim" = {
        #    source = ../../neovim;
        #    recursive = true;
        #};
        sessionVariables = {
            EDITOR = "nvim";
        };
    };

    programs.lazyvim = {
	enable = true;
	pluginsFile = { 
	    "lazyConfig.lua".source = ./neovim/lua/plugins/config.lua;
	};
	extras = {
	    coding = {
	    	blink.enable = true;
		#mini-comment.enable = true;
		mini-surround.enable = true;
		yanky.enable = true;
	    };
	    dap = {
	    	core.enable = true;
	    };
	    editor = {
	    	dial.enable = true;
		fzf.enable = true;
		inc-rename.enable = true;
	    };
	    lang = {
	    	#clangd.enable = true;
		#cmake.enable = true;
		#haskell.enable = true;
		json.enable = true;
		markdown.enable = true;
		nix.enable = true;
		python.enable = true;
		#sql.enable = true;
		#yaml.enable = true;
	    };
	    test = {
	    	core.enable = true;
	    };
	    #ui = {
	    #	mini-indentscope.enable = true;
	    #};
	    util = {
	    	dot.enable = true;
		#gitui.enable = true;
		mini-hipatterns.enable = true;
		#project.enable = true;
	    };
	};
    };
    programs.neovim = {
        enable = true;
        vimAlias = true;
        vimdiffAlias = true;

        extraPackages = with pkgs; [
            bash-language-server
            cmake-language-server
            copilot-language-server
            docker-language-server
            haskell-language-server
            lua-language-server
            yaml-language-server
        ];

        #plugins = with pkgs.vimPlugins; [
        #    lazy-nvim
        #];

        #extraLuaConfig = 
        #    let
        #        plugins = with pkgs.vimPlugins; [
        #            LazyVim
        #            SchemaStore-nvim
        #            bufferline-nvim
        #            cmp-buffer
        #            cmp-nvim-lsp
        #            cmp-path
        #            cmp_luasnip
        #            cmake-tools-nvim
        #            conform-nvim
        #            dial-nvim
        #            flash-nvim
        #            friendly-snippets
        #            gitsigns-nvim
        #            grug-far-nvim
        #            indent-blankline-nvim
        #            lualine-nvim
        #            neotest
        #            neotest-haskell
        #            neotest-python
        #            neotest-bash
        #            noice-nvim
        #            nui-nvim
        #            nvim-cmp
        #            nvim-lint
        #            nvim-lspconfig
        #            nvim-notify
        #            nvim-nio
        #            nvim-treesitter
        #            nvim-treesitter-context
        #            nvim-treesitter-textobjects
        #            nvim-ts-autotag
        #            nvim-ts-context-commentstring
        #            persistence-nvim
        #            plenary-nvim
        #            project-nvim
        #            render-markdown-nvim
        #            snacks-nvim
        #            telescope-nvim
        #            telescope_hoogle
        #            telescope-fzf-native-nvim
        #            todo-comments-nvim
        #            tokyonight-nvim
        #            trouble-nvim
        #            ts-comments-nvim
        #            undotree
        #            vim-dadbod
        #            vim-dadbod-ui
        #            vim-dadbod-completion
        #            vim-illuminate
        #            vim-startuptime
        #            which-key-nvim
        #            yanky-nvim

        #            { name = "LuaSnip"; path = luasnip; }
        #            { name = "catppuccin"; path = catppuccin-nvim; }
        #            { name = "mini.ai"; path = mini-nvim; }
        #            { name = "mini.bufremove"; path = mini-nvim; }
        #            { name = "mini.comment"; path = mini-nvim; }
        #            { name = "mini.files"; path = mini-nvim; }
        #            { name = "mini.icons"; path = mini-nvim; }
        #            { name = "mini.indentscope"; path = mini-nvim; }
        #            { name = "mini.pairs"; path = mini-nvim; }
        #            { name = "mini.surround"; path = mini-nvim; }
        #        ];
        #        mkEntryFromDrv = drv:
        #            if lib.isDerivation drv then
        #            { name = "${lib.getName drv}"; path = drv;}
        #            else
        #                drv;
        #            lazyPath = pkgs.linkFarm "lazy-plugins" (builtins.map mkEntryFromDrv plugins);
        #    in ''
        #        require("lazy").setup({
        #            defaults = {
        #                lazy = true,
        #            },
        #            dev = {
        #                -- reuse files from pkgs.vimPlugins.*
        #                path = "${lazyPath}",
        #                patterns = { "" },
        #                -- fallback to download
        #                fallback = true,
        #            },
        #            spec = {
        #                { "LazyVim/LazyVim", import = "lazyvim.plugins" },
        #                -- The following configs are needed for fixing lazyvim on nix
        #                -- force enable telescope-fzf-native.nvim
        #                { "nvim-telescope/telescope-fzf-native.nvim", enabled = true },
        #                -- disable mason.nvim, use programs.neovim.extraPackages
        #                { "williamboman/mason-lspconfig.nvim", enabled = false },
        #                { "williamboman/mason.nvim", enabled = false },
        #                -- import/override with your plugins
        #                --{ import = "plugins" },
        #                -- treesitter handled by xdg.configFile."nvim/parser", put this line at the end of spec to clear ensure_installed
        #                { "nvim-treesitter/nvim-treesitter", opts = { ensure_installed = {} } },
        #            },
        #        })
        #    '';
            #extraLuaConfig = ''
            #    vim.g.mapleader = " ";
            #    require("lazy").setup({
            #        performance = {
            #            reset_packpath = false,
            #            rtp = {
            #                reset = false,
            #            },
            #        }
            #        dev = {
            #            path = "${pkgs.vimUtils.packDir config.home-manager.users.david.programs.neovim.finalPackage.passthru.packpathDirs}/pack/myNeovimPackages/start",
            #        },
            #        install = {
            #            missing = false,
            #        },
            #    })
            #'';
    };

    #xdg.configFile."nvim/parser".source =
    #    let
	#    parsers = pkgs.symlinkJoin {
	#    	name = "treesitter-parsers";
#		paths = (pkgs.vimPlugins.nvim-treesitter.withPlugins (plugins: with plugins; [
#		    c
#		    lua
#		])).dependencies;
#	    };
#	in
#	    "${parsers}/parser";
    #xdg.configFile."nvim/lua".source = ./neovim/lua;

}
