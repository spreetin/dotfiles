{ pkgs, ... }:

{
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      on_force_close = "quit";
      default_shell = "${pkgs.zsh}/bin/zsh";
      pane_frames = false;
      pane_viewport_serialization = true;
      scrollback_lines_to_serialize = 1000;
    };
  };
}
