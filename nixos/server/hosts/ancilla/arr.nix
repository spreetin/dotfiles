{ inputs, ... }:

{
  imports = [
    inputs.nixarr.nixosModules.default
  ];

  nixarr = {
    enable = true;
    mediaDir = "/data/media";
    stateDir = "/data/.state/nixarr";
    mediaUsers = [ "david" ];
    audiobookshelf = {
      enable = true;
      expose.https = {
        enable = true;
        acmeMail = "spreetin@spreetin.eu";
        domainName = "media.spreetin.eu";
      };
      vpn.enable = false;
    };
    bazarr = {
      enable = true;
      vpn.enable = false;
    };
    jellyseerr = {
      enable = true;
      vpn.enable = false;
    };
    lidarr = {
      enable = true;
      vpn.enable = false;
    };
    plex = {
      enable = true;
      vpn.enable = false;
    };
    prowlarr = {
      enable = true;
      vpn.enable = false;
    };
    radarr = {
      enable = true;
      vpn.enable = false;
    };
    readarr-audiobook = {
      enable = true;
      vpn.enable = false;
    };
    sonarr = {
      enable = true;
      vpn.enable = false;
    };
    transmission = {
      enable = true;
      peerPort = 50000;
      privateTrackers = {
        cross-seed = {
          enable = true;
          indexIds = [ ];
        };
        disableDhtPex = true;
      };
      vpn.enable = true;
      flood.enable = true;
    };
    vpn = {
      wgConf = "/data/.secrets/vpn/wg.conf";
    };
  };
}
