{
  hostname,
  pkgs,
  ...
}:

{
  imports = [
    ./hosts/${hostname}.nix
    ./../apps/gaming.nix
    ./../apps/hyprland.nix
    ./plymouth.nix
  ];

  programs = {
    virt-manager.enable = true;
    xwayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    glxinfo
    sddm-chili-theme
    vulkan-tools
  ];

  boot = {
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
  };

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
          Experimental = true;
        };
      };
    };
    xone.enable = true;
    steam-hardware.enable = true;
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  services = {
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
        theme = "chili";
      };
    };
    xserver = {
      xkb = {
        layout = "se,us";
        variant = "";
        options = "grp:alt_shift:toggle";
      };
    };
    blueman.enable = true;
    gnome.gnome-keyring.enable = true;
  };
}
