# This is muse!
{...}: {
  imports = [
    # Include the results of the hardware scan.
    ./muse-hardware-configuration.nix

    # Services
    ./museServices.nix

    ../../common
    ../../common/bootManager/grub-efi.nix

    ../../play

    ../../studies

    ../../desktop
    ../../desktop/GPU/nvidia # GPU
    ../../desktop/GPU/nvidia/nvidiaScalePatch.nix
    ../../desktop/GUI/windowManager/awesome.nix # Graphical Interface
    ../../desktop/GUI/displayManager/lightdm.nix

    # Users
    ../../users/mee.nix
  ];
  
  networking.hostName = "muse";

  # Keyboard stuff
  services.xserver = {
    layout = "br";
    xkbVariant = "";
  };

  console.keyMap = "br-abnt2";

  system.stateVersion = "23.11";
}
