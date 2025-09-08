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
        domainName = "abs.spreetin.eu";
      };
      vpn.enable = false;
      port = 13378;
    };
    bazarr = {
      enable = true;
      vpn.enable = false;
    };
    jellyseerr = {
      enable = true;
      vpn.enable = false;
      expose.https = {
        enable = true;
        acmeMail = "spreetin@spreetin.eu";
        domainName = "seer.spreetin.eu";
      };
    };
    lidarr = {
      enable = true;
      vpn.enable = false;
    };
    plex = {
      enable = true;
      vpn.enable = false;
      expose.https = {
        enable = true;
        acmeMail = "spreetin@spreetin.eu";
        domainName = "media.spreetin.eu";
      };
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
      peerPort = 33729;
      privateTrackers = {
        cross-seed = {
          enable = true;
          indexIds = [
            1
            2
            3
            4
            5
          ];
        };
        disableDhtPex = true;
      };
      vpn.enable = true;
      flood.enable = true;
    };
    vpn = {
      enable = true;
      wgConf = "/data/.secrets/vpn/wg.conf";
    };
  };
  #util-nixarr.services.cross-seed = {
  #enable = true;

  #};
}
