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
    package = config.boot.kernelPackages.nvidiaPackages.beta;

    prime = {
    	offload = {
        enable = true;
        enableOffloadCmd = true;
      };
    
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0"; 

    };
    
    powerManagement = {
      enable = true;
      finegrained = true;
    };

    nvidiaPersistenced = true; 

  };

  environment.systemPackages = [
  (pkgs.writeShellScriptBin "nvidia" ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    exec "$@"
  '')
  ];
}
