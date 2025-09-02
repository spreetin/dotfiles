{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    oh-my-zsh
    zsh-syntax-highlighting
    fd
  ];

  #home.file.".oh-my-zsh/custom" = {
  #  source = "${filesource}/custom";
  #  recursive = true;
  #};

  programs = {
    zsh = {
      enable = true;
      syntaxHighlighting.enable = true;
      oh-my-zsh = {
        enable = true;
        theme = "af-magic";
        plugins = [
          "git"
          "ssh"
          "sudo"
          "web-search"
          "extract"
          "colored-man-pages"
          "compleat"
          "fzf"
          "vi-mode"
        ];
      };
      shellAliases = {
        startflake = "nix flake init -t github:hercules-ci/flake-parts";
        icat = "kitten icat";
        sshk = "kitten ssh";
        ls = "eza";
        cat = "bat";
        p_kina = "ssh -L 8008:10.2.1.3:8006 imetall";
        p_sovjet = "ssh -L 8006:10.2.1.2 imetall";
        p_kuba = "ssh -L 8007:10.2.1.4:8006 imetall";
        p_kvm = "ssh -L 8001:10.2.1.100:443 imetall";
        p_metall = "kitten ssh -L 8006:10.2.1.2:8006 -L 8007:10.2.1.3:8006 -L 8008:10.2.1.4:8006 -L 8001:10.2.1.100:443 imetall";
      };
      shellGlobalAliases = {
        "--help" = "--help 2>&1 | bat --language=help --style=plain";
      };
    };
    zoxide = {
      enable = true;
      enableZshIntegration = true;
      options = [ "--cmd cd" ];
    };
    eza = {
      enable = true;
      enableZshIntegration = true;
      icons = "auto";
      git = true;
      colors = "auto";
      theme = "catppuccin";
    };
    bat = {
      enable = true;
      #config = {
      #  theme = "Catppuccin";
      #};
    };
    tmux = {
      enable = true;
      baseIndex = 1;
      clock24 = true;
      keyMode = "vi";
      mouse = true;
      prefix = "C-a";
      sensibleOnTop = true;
      shell = "${pkgs.zsh}/bin/zsh";
    };
  };
}
