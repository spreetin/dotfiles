{
  plugins = {
    telescope = {
      enable = true;
      keymaps = {
        "<leader>fG" = "live_grep";
      };
      extensions = {
        fzf-native.enable = true;
        undo.enable = true;
      };
    };
  };
}
