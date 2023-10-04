# This is banshee!
{...}: {
  imports = [
    # Include the results of the hardware scan.
    ./bansheeHardwareConfiguration.nix

    ../../common

    ../../studies

    # Users
    ../../users/mee.nix
  ];

  networking.hostName = "banshee";

  # console.keyMap = "br-abnt2";

  system.stateVersion = "23.11";
}
