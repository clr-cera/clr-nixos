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

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 9999 ];
  };

  system.stateVersion = "23.11";
}
