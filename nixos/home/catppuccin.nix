{
  config,
  pkgs,
  options,
  ...
}:

{
  catppuccin = {
    bat.enable = true;
    btop.enable = true;
    cursors.enable = true;
    firefox.enable = true;
    fzf.enable = true;
    #gtk.enable = true;
    hyprland.enable = true;
    #hyprlock.enable = true;
    kitty.enable = true;
    lazygit.enable = true;
    librewolf.enable = true;
    mpv.enable = true;
    nvim.enable = true;
    obs.enable = true;
    swaync.enable = true;
    tmux.enable = true;
    wlogout.enable = true;
    yazi.enable = true;
    #zellij.enable = true;
    zsh-syntax-highlighting.enable = true;
  };
}
