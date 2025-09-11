{ inputs, ... }:

{
  imports = [
    inputs.nixarr.nixosModules.default
  ];

  nixarr = {
    enable = true;
    mediaDir = "/data/media";
    stateDir = "/data/.state/nixarr";
    mediaUsers = [
      "k0ck3n"
      "david"
    ];
    plex = {
      enable = true;
      vpn.enable = false;
    };
  };
}
