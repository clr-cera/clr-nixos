# This is muse!

{ ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./muse-hardware-configuration.nix
      
      ../../common
      ../../common/bootManager/grub-efi.nix

      ../../play      

      ../../desktop
      ../../desktop/GPU/nvidia # GPU
      ../../desktop/GPU/nvidia/nvidiaScalePatch.nix
      ../../desktop/GUI/windowManager/awesome.nix # Graphical Interface
      ../../desktop/GUI/displayManager/lightdm.nix
     
      # Users
      ../../users/mee.nix
    ];

  
   
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  
  # Networking
  networking = {
    hostName = "muse";
    firewall.allowedTCPPorts = [ 9998 9999 ];
  };
  
  networking.networkmanager.enable = true;

  # Keyboard stuff
  services.xserver = {
    layout = "br";
    xkbVariant = "";
  };

  console.keyMap = "br-abnt2";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
