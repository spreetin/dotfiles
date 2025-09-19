{ ... }:

{
  services.radicale = {
    enable = true;
    settings = {
      server = {
        hosts = [
          "0.0.0.0:5232"
          "dav.spreetin.eu:5232"
        ];
        certificate = "/etc/nginx/ssl/fullchain.pem";
        key = "/etc/nginx/ssl/privkey.pem";
      };
      auth = {
        type = "pam";
      };
      rights = {
        type = "owner_only";
        permit_delete_collection = false;
      };
      storage = {
        filesystem_folder = "/data/services/radicale";
      };
      web = "internal";
    };
  };
}
