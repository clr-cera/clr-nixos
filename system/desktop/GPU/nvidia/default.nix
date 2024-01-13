{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
#Taken from https://nixos.wiki/wiki/Nvidia
{
  # Make sure opengl is enabled
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # Tell Xorg to use the nvidia driver
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    # Modesetting is needed for most wayland compositors
    modesetting.enable = true;

    # Enable the nvidia settings menu
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    prime = {
    	offload = {
		enable = true;
		enableOffloadCmd = true;
	};


    	intelBusId = "PCI:0:2:0";
	nvidiaBusId = "PCI:1:0:0";

    };
  };
}
