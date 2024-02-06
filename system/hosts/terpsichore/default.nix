# This is muse!
{...}: {
  imports = [
    # Include the results of the hardware scan.
    ./terpsichoreHardwareConfiguration.nix

    # Services

    ../../common
    ../../common/bootManager/grub-efi.nix

    ../../play

    ../../studies

    ../../desktop
    ../../desktop/GPU/nvidia # GPU
    ../../desktop/GUI/windowManager/awesome.nix # Graphical Interface
    ../../desktop/GUI/windowManager/hyprland.nix
    ../../desktop/GUI/displayManager/gdm.nix

    # Users
    ../../users/mee.nix
  ];

  networking.hostName = "terpsichore";

  # Keyboard stuff
  services.xserver = {
    layout = "br";
    xkbVariant = "";
  };

  console.keyMap = "br-abnt2";

  system.stateVersion = "23.11";
}
