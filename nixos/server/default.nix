{
  hostname,
  pkgs,
  ...
}:

{
  imports = [
    ./hosts/${hostname}
  ];

  programs = {
  };

  environment.systemPackages = with pkgs; [
  ];

  boot = {
    kernelPackages = pkgs.linuxPackages;
  };

  services = {
  };
}
