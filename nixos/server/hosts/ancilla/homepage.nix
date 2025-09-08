{
  #sops,
  config,
  ...
}:
#let
#  secrets = sops.secrets."../../../../secrets/secrets.yaml";
#in
{
  services.homepage-dashboard = {
    enable = true;
    openFirewall = true;
    allowedHosts = "0.0.0.0:8082,192.168.0.107:8082,ancilla,spreetin.eu";
    widgets = [
      {
        resources = {
          cpu = true;
          uptime = true;
          disk = [
            "/"
            "/data"
          ];
          memory = true;
          network = true;
        };
      }
    ];
    settings = { };
    services = [
      {
        "Video" = [
          {
            "Plex" = {
              description = "Plex Media Player";
              href = "http://192.168.0.107:32400";
              icon = "plex.png";
              #widget = {
              #  type = "plex";
              #  url = "http://192.168.0.107:32400";
              #  key = secrets.plex_token;
              #};
            };
          }
        ];
      }
    ];
  };
}
