{ inputs, pkgs, ... }:

{
  imports = [
    ./arr.nix
    ./borg.nix
  ];

  users = {
    users.borg = {
      isNormalUser = true;
      description = "Backup user";
    };
  };
}
