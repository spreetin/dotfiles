{ pkgs, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/profiles/qemu-guest.nix")
    ./hardware-configuration.nix
    ./arr.nix
  ];

  users.users.k0ck3n = {
    isNormalUser = true;
    description = "Patrik Isaksson";
    home = "/home/k0ck3n";
    hashedPassword = "$y$j9T$a8CwoxhGA/0oWAT9XTiOU1$YTunLMmwf0AJ4FKK8jIGahsQOqAdQ3r1lYQkMPdOMo8";
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
