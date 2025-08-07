{
  options,
  pkgs,
  config,
  ...
}:

{
  programs.nixvim.plugins.lint = {
    enable = true;
    lintersByFt = {
      c = [ "cppheck" ];
      clojure = [ "clj-kondo" ];
      cmake = [ "cmakelint" ];
      cpp = [ "cppcheck" ];
      #css = [];
      go = [ "golangcilint" ];
      haskell = [ "hlint" ];
      html = [ "tidy" ];
      javascript = [ "jshint" ];
      json = [ "jsonlint" ];
      lua = [ "luacheck" ];
      markdown = [ "markdownlint" ];
      nix = [ "nix" ];
      python = [ "pylint" ];
      #rust = [];
      yaml = [ "yamllint" ];
    };
  };
}
