{ modulesPath, ... }:

{
  imports = [
    (modulesPath + "/profiles/qemu-guest.nix")
  ];

  services = {
    plex = {
      enable = true;
      dataDir = "/data/.state/plex";
      openFirewall = true;
    };
  };
}
