{ inputs, lib, config, pkgs, ... }:


{
  #Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true; 
}
