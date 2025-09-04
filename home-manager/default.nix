{
  hostname,
  computerType,
  config,
  ...
}:

{
  imports = [
    ./hosts/${hostname}
    ./types/${computerType}.nix
    ./config.nix
    ./apps.nix
    ./catppuccin.nix
  ];

  home.file."${config.xdg.configHome}/scripts" = {
    source = ../scripts;
    recursive = true;
    executable = true;
  };

}
