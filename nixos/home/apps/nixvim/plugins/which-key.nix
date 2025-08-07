{
  options,
  pkgs,
  config,
  ...
}:

{
  programs.nixvim = {
    plugins = {
      which-key = {
        enable = true;
        settings = {
          preset = "modern";
          show_keys = true;
          spec = [
            {
              __unkeyed-1 = "<leader>c";
              group = "Code";
              icon = " ";
              mode = "n";
            }
            {
              __unkeyed-1 = "<leader>g";
              group = "Git/LSP";
              icon = " ";
              mode = "n";
            }
            {
              __unkeyed-1 = "<leader>f";
              group = "Find";
              icon = " ";
              mode = "n";
            }
            {
              __unkeyed-1 = "<leader>s";
              group = "LSP Symbols";
              icon = "󰙲 ";
              mode = "n";
            }
          ];
        };
      };
    };
  };
}
