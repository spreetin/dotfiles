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
        ];
      };
      shellAliases = {
        startflake = "nix flake init -t github:hercules-ci/flake-parts";
        icat = "kitten icat";
        sshk = "kitten ssh";
        p_kina = "ssh -L 8008:192.168.1.195:8006 imetall";
        p_sovjet = "ssh -L 8006:192.168.1.61:8006 imetall";
        p_kuba = "ssh -L 8007:192.168.1.12:8006 imetall";
        p_kvm = "ssh -L 8001:192.168.1.60:443 imetall";
        p_metall = "ssh -L 8006:192.168.1.61:8006 imetall & ssh -L 8007:192.168.1.12:8006 imetall & ssh -L 8001:192.168.1.60:80 imetall & ssh -L 8008:192.168.1.195:8006 imetall &";
      };
    };
    zoxide = {
      enable = true;
      enableZshIntegration = true;
      options = [ "--cmd cd" ];
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
