{ config, pkgs, lib, ... }:

let
  # You can generate these manually as described earlier
  secretKeyPath = "/etc/nix/cache-priv-key.pem";
  publicKey = "my-local-cache:$(cat /etc/nix/cache-pub-key.pem)";
in
{
  services.nix-serve = {
    enable = true;
    port = 5000;
    secretKeyFile = secretKeyPath;
  };

  networking.firewall.allowedTCPPorts = [ 5000 ];

  # Ensure your signing key exists
  environment.etc."nix/cache-priv-key.pem".source = /path/to/secret.key;
  environment.etc."nix/cache-pub-key.pem".source = /path/to/public.key;

  nix.settings = {
    trusted-users = [ "root" "@wheel" ];
    secret-key-files = [ secretKeyPath ];
  };

  system.stateVersion = "25.05"; # or your actual system version
}
