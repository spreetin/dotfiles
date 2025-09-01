{
  options,
  pkgs,
  config,
  ...
}:

{
  extraPackages = with pkgs; [
    clj-kondo
    cmake-lint
    cppcheck
    golangci-lint
    hlint
    html-tidy
    luajitPackages.luacheck
    markdownlint-cli
    nodePackages.jshint
    nodePackages.jsonlint
    pylint
    yamllint
  ];
  plugins.lint = {
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
