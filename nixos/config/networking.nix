{ config, pkgs, options, ... }:

{
  networking = {
    networkmanager = {
      enable = true;
    };
    extraHosts = ''
      192.168.0.105 meitner
      192.168.0.106 servus
    '';
    firewall = {
      allowedUDPPorts = [
        5353
      ];
    };
    timeServers = options.networking.timeServers.default ++ [ "pool.ntp.org" ];
  };
}
