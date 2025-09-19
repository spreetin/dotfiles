{
  nixarr,
  config,
  ...
}:
let
  mkVHost = host: port: serverPath: {
    sslCertificate = "";
    sslCertificateKey = "";
    locations."/" = {
      proxyPass = "${host}:${port}${serverPath}";
      recommendedProxySettings = true;
    };
    listen = [
      {
        addr = "192.168.0.107";
        port = 443;
        ssl = true;
      }
    ];
  };
in
{
  services.nginx = {
    enable = true;
    virtualHosts = {
      "seer.${config.sops.secrets.mydomain}" = mkVHost "127.0.0.1" nixarr.jellyseerr.port "";
      "abs.${config.sops.secrets.mydomain}" = mkVHost "127.0.0.1" nixarr.audiobookshelf.port "";
      "bazarr.${config.sops.secrets.mydomain}" = mkVHost "127.0.0.1" nixarr.bazarr.port "";
      "lidarr.${config.sops.secrets.mydomain}" = mkVHost "127.0.0.1" nixarr.lidarr.port "";
      "plex.${config.sops.secrets.mydomain}" = mkVHost "127.0.0.1" 32400 "";
      "prowlarr.${config.sops.secrets.mydomain}" = mkVHost "127.0.0.1" nixarr.prowlarr.port "";
      "radarr.${config.sops.secrets.mydomain}" = mkVHost "127.0.0.1" nixarr.radarr.port "";
      "readarr.${config.sops.secrets.mydomain}" = mkVHost "127.0.0.1" nixarr.readarr-audiobook.port "";
      "sonarr.${config.sops.secrets.mydomain}" = mkVHost "127.0.0.1" 8989 "";
      "transmission.${config.sops.secrets.mydomain}" = mkVHost "127.0.0.1" 9091 "";
      "pihole.${config.sops.secrets.mydomain}" = mkVHost "192.168.0.106" 4430 "/admin/";
    };
  };
}
