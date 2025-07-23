{ config, pkgs, options, ... }:

{
  services = {
    printing.enable = true;
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
	      support32Bit = true;
      };
      pulse.enable = true;
      jack.enable = true;
    };
    openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
        PermitRootLogin = "no";
        AllowUsers = [ "david" ];
      };
    };
    gvfs.enable = true;
    tumbler.enable = true;
    flatpak.enable = true;
    fwupd.enable = true;
    upower.enable = true;
    fstrim.enable = true;
    
    hardware = {
      openrgb.enable = true;
    };
  };

  systemd.services.flatpak-repo = {
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };
}
