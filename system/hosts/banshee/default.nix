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

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [25 465 587 110 995 143 993 9999];
  };

  system.stateVersion = "23.11";
}
