{
  config,
  pkgs,
  modulesPath,
  ...
}:

{
  imports = [
    (modulesPath + "/profiles/qemu-guest.nix")
    ./hardware-configuration.nix
    ./arr.nix
  ];

  sops.secrets.k0ck3n_passwd.neededForUsers = true;
  users.users.k0ck3n = {
    isNormalUser = true;
    description = "Patrik Isaksson";
    home = "/home/k0ck3n";
    hashedPasswordFile = config.sops.secrets.k0ck3n_passwd.path;
    extraGroups = [
      "k0ck3n"
      "wheel"
      "media"
    ];
    shell = pkgs.bash;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK/j3BPGobnO1rYSvWaHtke6WV9FWLXp0c+BEyCW1how k0ck3n"
    ];
  };
}
