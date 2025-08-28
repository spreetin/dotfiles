{ ... }:

{
  imports = [
    #(import ../../home.nix { inherit pkgs inputs; })
    ./apps.nix
    ./configs.nix
  ];

  home.file.".config/hypr/local/local.conf" = {
    source = ../../../../hostfiles/hypr/meitner.conf;
  };

  wayland.windowManager.hyprland = {
    settings = {
      monitor = ",preferred,auto,auto";
    };
  };
}
