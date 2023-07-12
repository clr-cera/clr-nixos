{ inputs, lib, config, pkgs, ... }:

{
  # Bootloader.
  boot.loader = {
	efi.canTouchEfiVariables = true;
	efi.efiSysMountPoint = "/boot";
	
	grub = {
	  devices = [ "nodev" ];
	  efiSupport = true;
	  enable = true;
	  useOSProber = true;
	  configurationLimit = 5;
	  splashImage = ./Wallpapers/wallpaper.png;
    };
  };
}
