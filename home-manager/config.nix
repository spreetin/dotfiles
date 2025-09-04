{
  pkgs,
  ...
}:

{
  #imports = [ inputs.ags.homeManagerModules.default ];

  xdg.enable = true;

  home.username = "david";
  home.homeDirectory = "/home/david";
  home.stateVersion = "25.05";

  home.file.".config/ags".source = ../ags;

  programs = {
    git = {
      enable = true;
      userName = "David Falk";
      userEmail = "spreetin@protonmail.com";
    };
    #ags = {
    #  enable = lib.mkForce true;
    #  extraPackages = with pkgs; [
    #    inputs.astal.packages.${pkgs.system}.battery
    #    fzf
    #  ];
    #};
    #mangohud = {
    #enable = true;
    #enableSessionWide = true;
    #settings = {
    #};
    #};
    yazi = {
      enable = true;
      plugins = {
        # with pkgs.yaziPlugins; {
        git = pkgs.yaziPlugins.git;
        ouch = pkgs.yaziPlugins.ouch;
        glow = pkgs.yaziPlugins.glow;
        mount = pkgs.yaziPlugins.mount;
        chmod = pkgs.yaziPlugins.chmod;
        yatline = pkgs.yaziPlugins.yatline;
        lazygit = pkgs.yaziPlugins.lazygit;
        mediainfo = pkgs.yaziPlugins.mediainfo;
        relative-motions = pkgs.yaziPlugins.relative-motions;
      };
      #flavors = { }
    };
  };
  home.file.".local/bin/flake-update" = {
    source = ../scripts/flake-update;
    executable = true;
  };
}
