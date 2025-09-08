{
  ...
}:

{
  services.blocky = {
    enable = true;
    settings = {
      ports.dns = 53;
      upstreams.groups.default = [
        "8.8.4.4"
        "8.8.8.8"
        "9.9.9.9"
      ];
      blocking = {
        denylists = {
          ads = [ "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts" ];
        };
        clientGroupsBlock = {
          default = [ "ads" ];
        };

      };
      customDNS = {
        customTTL = "1h";
        mapping = {
          "servus" = "192.168.0.106";
          "ancilla" = "192.168.0.107";
          "chandrasekhar" = "192.168.0.112";
          "meitner" = "192.168.0.105";
          "thomson" = "192.168.0.114";
          "spreetin.eu" = "192.168.0.107";
        };
      };
    };
  };
}
