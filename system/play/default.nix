{pkgs, ...}: {
  services.joycond.enable = true;
  hardware.steam-hardware.enable = true;

  environment.systemPackages = with pkgs; [
    xboxdrv
  ];
}
