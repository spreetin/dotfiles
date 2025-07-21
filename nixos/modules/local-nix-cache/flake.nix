{
  description = "Nix client config for local binary cache";

  outputs = { self, ... }: {
    nixosModules.default = { config, lib, ... }: {
      nix.settings = {
        substituters = lib.mkBefore [
          "http://my-nix-cache.local:5000"
        ];
        trusted-public-keys = lib.mkBefore [
          "my-local-cache:xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
        ];
      };
    };

    # Optional: expose as Home Manager module
    homeModules.default = { config, lib, ... }: {
      nix.settings = {
        substituters = lib.mkBefore [
          "http://my-nix-cache.local:5000"
        ];
        trusted-public-keys = lib.mkBefore [
          "my-local-cache:xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
        ];
      };
    };
  };
}
