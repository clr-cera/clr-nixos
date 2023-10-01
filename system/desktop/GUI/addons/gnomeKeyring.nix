{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  #Gnome keyring
  services.gnome.gnome-keyring.enable = true;
  services.passSecretService.enable = true;
}
