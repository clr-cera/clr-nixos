{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ../addons/gnomeKeyring.nix
  ];

  services.xserver = {
    enable = true;
    excludePackages = with pkgs; [
      xterm
    ];

    displayManager.gdm.enable = true;
  };

  #GnomeKeyring auto login
  security.pam.services.gdm.enableGnomeKeyring = true;
}
