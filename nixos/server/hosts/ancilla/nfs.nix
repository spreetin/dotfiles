{ ... }:

{
  fileSystems."/export/Documents" = {
    device = "/data/shared/Documents";
    options = [ "bind" ];
  };
  fileSystems."/export/Pictures" = {
    device = "/data/shared/Pictures";
    options = [ "bind" ];
  };
  fileSystems."/export/Videos" = {
    device = "/data/shared/Videos";
    options = [ "bind" ];
  };
  services.nfs.server = {
    enable = true;
    exports = ''
      /export           192.168.0.105(rw,fsid=0,no_subtree_check)
      /export/Documents 192.168.0.105(rw,nohide,insecure,sync,no_subtree_check,no_root_squash)
      /export/Pictures  192.168.0.105(rw,nohide,insecure,sync,no_subtree_check,no_root_squash)
      /export/Videos    192.168.0.105(rw,nohide,insecure,sync,no_subtree_check,no_root_sqush)
    '';
  };
  networking.firewall.allowedTCPPorts = [ 2049 ];
}
