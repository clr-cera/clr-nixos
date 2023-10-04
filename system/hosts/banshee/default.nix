# This is banshee!
{...}: {
  imports = [
    # Include the results of the hardware scan.
    ./bansheeHardwareConfiguration.nix

    ../../common
    ../../common/bootManager/grub-efi.nix

    ../../studies

    # Users
    ../../users/mee.nix
  ];

  networking.hostName = "banshee";

  # console.keyMap = "br-abnt2";

  system.stateVersion = "23.11";
}
