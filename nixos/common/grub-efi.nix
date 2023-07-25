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
  
  boot =
    {
      # Plymouth
      consoleLogLevel = 0;
      initrd.verbose = false;
      plymouth.enable = true;
      kernelParams = [ "quiet" "splash" "rd.systemd.show_status=false" "rd.udev.log_level=3" "udev.log_priority=3" "boot.shell_on_fail" ];
    };
}
