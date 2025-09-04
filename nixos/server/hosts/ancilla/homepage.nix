{
  ...
}:

{
  services.homepage-dashboard = {
    enable = true;
    openFirewall = true;
    allowedHosts = "0.0.0.0:8082";
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
    services = [ ];
  };
}
