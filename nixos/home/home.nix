{
  inputs,
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./config.nix
    ./apps.nix
  ];
  home.file."${config.xdg.configHome}/scripts" = {
    source = ../../scripts;
    recursive = true;
    executable = true;
  };
}
