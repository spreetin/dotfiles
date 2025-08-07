{
  options,
  pkgs,
  config,
  ...
}:

{
  programs.nixvim.lsp = {
    servers = {
      asm_lsp.enable = true;
      bashls.enable = true;
      clangd.enable = true;
      clojure_lsp.enable = true;
      cmake.enable = true;
      cssls.enable = true;
      hls.enable = true;
      java_language_server.enable = true;
      jsonls.enable = true;
      lua_ls.enable = true;
      markdown_oxide.enable = true;
      nixd.enable = true;
      pylsp.enable = true;
      rust_analyzer.enable = true;
      sqls.enable = true;
      ts_ls.enable = true;
      yamlls.enable = true;
      zls.enable = true;
    };
  };
  programs.nixvim.plugins.lsp = {
    keymaps.lspBuf = {
      "<F4>" = "switch_source_header"; # "ClangdSwitchSourceHeader";
    };
  };
}
