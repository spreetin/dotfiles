{ config, pkgs, ... }:

{
    program.neovim = {
        plugins = with pkgs.vimPlugins; [
            which-key-nvim
        ];

        extraLuaConfig = ''
            require("lazy").setup({
                spec = {
                    { import = "plugins" },
                },
            })
        '';
    };

    xdg.configFile."nvim/lua" = {
        recursive = true;
        source = ./lua;
    };
}
