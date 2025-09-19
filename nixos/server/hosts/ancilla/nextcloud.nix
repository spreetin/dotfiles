{ config, pkgs, ... }:

{
  sops.secrets.nextcloud_dbpass.neededForUsers = true;
  sops.secrets.nextcloud_adminpass.neededForUsers = true;
  sops.secrets.nextcloud_hashedpasswd.neededForUsers = true;
  services.nextcloud = {
    enable = true;
    #package = pkgs.nextcloud31;
    home = "/data/services/nextcloud";
    hostName = "cloud.spreetin.eu";
    https = true;
    database.createLocally = true;
    config = {
      dbtype = "mysql";
      adminpassFile = config.sops.secrets.nextcloud_adminpass.path;
      #dbpassFile = config.sops.secrets.nextcloud_dbpass.path;
    };
  };
  #services.mysql = {
  #  enable = true;
  #  package = pkgs.mariadb;
  #  ensureUsers = [
  #    {
  #      name = config.services.nextcloud.config.dbuser;
  #      ensurePermissions = {
  #        "nextcloud.*" = "ALL PRIVILEGES";
  #      };
  #    }
  #  ];
  #};
  #users.users."${config.services.nextcloud.config.dbuser}" = {
  #  hashedPasswordFile = config.sops.secrets.nextcloud_hashedpasswd.path;
  #};
}
