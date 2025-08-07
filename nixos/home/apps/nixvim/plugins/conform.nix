{
  options,
  pkgs,
  config,
  ...
}:

{
  programs.nixvim.plugins.conform-nvim = {
    enable = true;
    settings = {
      lsp_format = "fallback";
      formatters_by_ft = {
        c = [ "clang_format" ];
        clojure = [ "zprint" ];
        cmake = [ "cmake_format" ];
        cpp = [ "clang_format" ];
        css = [ "prettierd" ];
        go = [ "gofumpt" ];
        #haskell = [ "hlindent" ];
        html = [ "prettierd" ];
        javascript = [ "prettierd" ];
        json = [ "prettierd" ];
        lua = [ "stylua" ];
        markdown = [ "prettierd" ];
        nix = [ "nixfmt" ];
        python = [ "black" ];
        rust = [ "rustfmt" ];
        yaml = [ "prettierd" ];
        #zig = [ "zigfmt" ];
      };
      format_on_save = ''
        {
          timeout_ms = 200,
          lsp_fallback = true
        }
      '';
    };
  };
}
