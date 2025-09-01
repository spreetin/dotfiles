{
  config,
  pkgs,
  pkgsStable,
  lib,
  ...
}:

{
  nixpkgs.overlays = [
    (final: prev: {
      pythonPackagesOverlays = (prev.pythonPackagesOverlays or [ ]) ++ [
        (python-final: python-prev: {
          pygls = (./pygls.nix);
        })
      ];

      python3 =
        let
          self = prev.python3.override {
            inherit self;
            packageOverrides = prev.lib.composeManyExtensions final.pythonPackagesOverlays;
          };
        in
        self;
      python3Packages = final.python3.pkgs;
    })
  ];
}
