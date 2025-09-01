{ pkgs, inputs, ... }:

let
  be-better = pkgs.vimUtils.buildVimPlugin {
    pname = "vim-be-better";
    version = "2025-08-09";
    src = inputs.vim-be-better;
    meta.homepage = "https://github.com/szymonwilczek/vim-be-better";
  };
in
{
  extraPlugins = [ be-better ];
}
