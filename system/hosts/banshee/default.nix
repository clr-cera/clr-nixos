# This is banshee!
{...}: {
  imports = [
    # Include the results of the hardware scan.
    ./bansheeHardwareConfiguration.nix

    ../../common

    ../../studies

    # Users
    ../../users/mee.nix

    # Mail
    ../../server/mail.nix
  ];

  networking.hostName = "banshee";

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [9999 80];
  };

  system.stateVersion = "23.11";
}
