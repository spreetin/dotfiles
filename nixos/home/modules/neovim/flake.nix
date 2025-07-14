{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs: let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      neovim = import ./neovim.nix { inherit inputs pkgs; filesource = ../../../../neovim; };
      lsp = import ./lsp.nix { inherit pkgs; };
    };
}
